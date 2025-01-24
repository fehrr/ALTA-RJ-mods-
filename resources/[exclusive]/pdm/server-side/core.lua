-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("pdm",Creative)
vCLIENT = Tunnel.getInterface("pdm")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Buy(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if not Active[Passport] and Passport then
		Active[Passport] = true
		if VehicleMode(Name) ~= "Work" then
			local Price = VehiclePrice(Name)
			local Gemstone = VehicleGemstone(Name)
			
			local MaxVehicles = 3
			if vRP.HasGroup(Passport,"Magnata") then
				MaxVehicles = MaxVehicles + 20
			elseif vRP.HasGroup(Passport,"Foguetao") then
				MaxVehicles = MaxVehicles + 15
			elseif vRP.HasGroup(Passport,"Metralha") then
				MaxVehicles = MaxVehicles + 10
			elseif vRP.HasGroup(Passport,"Infinity") then
				MaxVehicles = MaxVehicles + 7
			elseif vRP.HasGroup(Passport,"Favela") then
				MaxVehicles = MaxVehicles + 5
			elseif vRP.HasGroup(Passport,"Platina") then
				MaxVehicles = MaxVehicles + 5
			elseif vRP.HasGroup(Passport,"Ouro") then
				MaxVehicles = MaxVehicles + 4
			elseif vRP.HasGroup(Passport,"Prata") then
				MaxVehicles = MaxVehicles + 2
			elseif vRP.HasGroup(Passport,"Bronze") then
				MaxVehicles = MaxVehicles + 1
			end

			local Vehicles = exports["oxmysql"]:query_async("SELECT vehicle, COUNT(vehicle) AS countVehicle FROM vehicles WHERE work = 'false' AND Passport = @Passport GROUP BY vehicle ORDER BY countVehicle DESC;",{ Passport = Passport })
			if #Vehicles >= MaxVehicles then
				TriggerClientEvent("Notify",source,"azul","Atingiu o número máximo de veículos em sua garagem.",8000)
			else
				if VehicleMode(Name) == "Rental" then
					if parseInt(Gemstone) > 0 then
						if vRP.Request(source,"Alugar o veículo <b>"..VehicleName(Name).."</b> por <b>"..parseFormat(Gemstone).."</b> Gemas?","Sim, concluír aluguel","Não, mudei de ideia") then
							if vRP.PaymentGems(Passport,Gemstone) then
								local vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
								if vehicle[1] then
									if vehicle[1]["rental"] <= os.time() then
										vRP.Query("vehicles/rentalVehiclesUpdate",{ Passport = Passport, vehicle = Name })
										TriggerClientEvent("Notify",source,"verde","Aluguel do veículo <b>"..VehicleName(Name).."</b> atualizado.",5000)
									else
										vRP.Query("vehicles/rentalVehiclesDays",{ Passport = Passport, vehicle = Name })
										TriggerClientEvent("Notify",source,"verde","Adicionado <b>30 Dias</b> de aluguel no veículo <b>"..VehicleName(Name).."</b>.",5000)
									end
								else
									vRP.Query("vehicles/rentalVehicles",{ Passport = Passport, vehicle = Name, plate = vRP.GeneratePlate(), work = "false" })
									TriggerClientEvent("Notify",source,"verde","Aluguel do veículo <b>"..VehicleName(Name).."</b> concluído.",5000)
								end
								TriggerEvent("Discord","RentalVehicle","**Passaporte:** "..Passport.."\n**Veículo:** "..VehicleName(Name).."\n**Gemas:** "..Gemstone,3553599)
							else
								TriggerClientEvent("Notify",source,"vermelho","<b>Gemas</b> insuficientes.",5000)
							end
						end
					else
						if parseInt(Price) > 0 then
							if vRP.Request(source,"Alugar o veículo <b>"..VehicleName(Name).."</b> por <b>$"..parseFormat(Price).."</b> dólares?","Sim, concluír aluguel","Não, mudei de ideia") then
								if vRP.PaymentFull(Passport,parseInt(Price),"Aluguel de "..VehicleName(Name)) then
									local vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
									if vehicle[1] then
										if vehicle[1]["rental"] <= os.time() then
											vRP.Query("vehicles/rentalVehiclesUpdate",{ Passport = Passport, vehicle = Name })
											TriggerClientEvent("Notify",source,"verde","Aluguel do veículo <b>"..VehicleName(Name).."</b> atualizado.",5000)
										else
											vRP.Query("vehicles/rentalVehiclesDays",{ Passport = Passport, vehicle = Name })
											TriggerClientEvent("Notify",source,"verde","Adicionado <b>30 Dias</b> de aluguel no veículo <b>"..VehicleName(Name).."</b>.",5000)
										end
									else
										vRP.Query("vehicles/rentalVehicles",{ Passport = Passport, vehicle = Name, plate = vRP.GeneratePlate(), work = "false" })
										TriggerClientEvent("Notify",source,"verde","Aluguel do veículo <b>"..VehicleName(Name).."</b> concluído.",5000)
									end
									TriggerEvent("Discord","RentalVehicle","**Passaporte:** "..Passport.."\n**Veículo:** "..VehicleName(Name).."\n**Dólares:** "..Price,3553599)
								else
									TriggerClientEvent("Notify",source,"vermelho","<b>Gemas</b> insuficientes.",5000)
								end
							end
						end
					end
				else
					local vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
					if vehicle[1] then
						TriggerClientEvent("Notify",source,"amarelo","Já possui um <b>"..VehicleName(Name).."</b>.",3000)
					else
						if parseInt(Gemstone) > 0 then
							if vRP.Request(source,"Veiculos","Comprar <b>"..VehicleName(Name).."</b> por <b>$"..parseFormat(Gemstone).."</b> Gemas?","Sim, concluír pagamento","Não, mudei de ideia") then
								if vRP.PaymentGems(Passport,parseInt(Gemstone)) then
									vRP.Query("vehicles/addVehicles",{ Passport = Passport, vehicle = Name, plate = vRP.GeneratePlate(), work = "false" })
									TriggerClientEvent("Notify",source,"verde","Compra do veículo <b>"..VehicleName(Name).."</b> concluído.",5000)
									TriggerEvent("Discord","BuyVehicle","**Passaporte:** "..Passport.."\n**Veículo:** "..VehicleName(Name).."\n**Gemas:** "..Gemstone,3553599)
								else
									TriggerClientEvent("Notify",source,"vermelho","<b>Gemas</b> insuficientes.",5000)
								end
							end			
						else
							if parseInt(Price) > 0 then
								if vRP.Request(source,"Veiculos","Comprar <b>"..VehicleName(Name).."</b> por <b>$"..parseFormat(Price).."</b> dólares?","Sim, concluír pagamento","Não, mudei de ideia") then
									if vRP.PaymentFull(Passport,Price,"Comprar de "..VehicleName(Name)) then
										vRP.Query("vehicles/addVehicles",{ Passport = Passport, vehicle = Name, plate = vRP.GeneratePlate(), work = "false" })
										TriggerClientEvent("Notify",source,"verde","Compra do veículo <b>"..VehicleName(Name).."</b> concluído.",5000)
										TriggerEvent("Discord","BuyVehicle","**Passaporte:** "..Passport.."\n**Veículo:** "..VehicleName(Name).."\n**Dólares:** "..Price,3553599)
									end
								end
							end
						end
					end
				end

			end
		end
		Active[Passport] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKDRIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CheckDrive(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not Active[Passport] then
			Active[Passport] = true
			if not exports["hud"]:Wanted(Passport) then
				if vRP.Request(source,"Veiculos","Iniciar o teste por <b>$100</b> dólares?","Sim, iniciar o teste","Não, volto depois") then
					if vRP.PaymentFull(Passport,100,"Teste-Driver") then
						TriggerEvent("vRP:BucketServer",source,"Enter",Passport)
						TriggerEvent("Discord","TestDriver","**Passaporte:** "..Passport.."\n**Veículo:** "..VehicleName(Name),3553599)
						Active[Passport] = nil
						return true
					end
				else
					TriggerClientEvent("Notify",source,"vermelho","<b>Negado</b>.",5000)	
				end
			end
			Active[Passport] = nil
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEDRIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RemoveDrive()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		TriggerEvent("vRP:BucketServer",source,"Exit")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Active[Passport] then
		Active[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local ShowroomVehicles = {
		--[[ {
			Coords = vector4(-45.65, -1093.66, 25.44, 69.5), -- where the vehicle will spawn on display
			Vehicle = 'ardent',                        -- Same as default but is dynamically changed when swapping vehicles
		},
		{
			Coords = vector4(-48.27, -1101.86, 25.44, 294.5),
			Vehicle = 'schafter2'
		},
		{
			Coords = vector4(-39.6, -1096.01, 25.44, 66.5),
			Vehicle = 'coquette'
		},
		{
			Coords = vector4(-40.18, -1104.13, 25.44, 338.5),
			Vehicle = 'rhapsody',
		},
		{
			Coords = vector4(-50.66, -1093.05, 25.44, 222.5),
			Vehicle = 'bati'
		},
		{
			Coords = vector4(-44.28, -1102.47, 25.44, 298.5),
			Vehicle = 'bati'
		} ]]
		{ Coords = vector4(-319.43,-1360.41,31.19,212.6), Vehicle = 'ardent' },
		{ Coords = vector4(-319.89,-1381.95,31.19,320.32), Vehicle = 'schafter2' },
		{ Coords = vector4(-332.09,-1380.44,31.19,323.15), Vehicle = 'coquette' },
		{ Coords = vector4(-333.04,-1357.96,31.19,223.94), Vehicle = 'panto' },
		{ Coords = vector4(-326.34,-1369.97,31.80,317.49), Vehicle = 'sultan' },
	}
	for Index,Value in pairs(ShowroomVehicles) do
		local Vehicle = CreateVehicleServerSetter(GetHashKey(Value.Vehicle),"automobile",Value.Coords)
		if DoesEntityExist(Vehicle) then
			FreezeEntityPosition(Vehicle,true)
			SetEntityCoords(Vehicle,Value.Coords)
			SetVehicleDoorsLocked(Vehicle,2)
			SetVehicleNumberPlateText(Vehicle,"PDMSPORT")
		end
	end
end)