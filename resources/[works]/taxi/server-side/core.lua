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
Tunnel.bindInterface("taxi",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUFFS
-----------------------------------------------------------------------------------------------------------------------------------------
Buffs = {
	["Dexterity"] = {}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PED
-----------------------------------------------------------------------------------------------------------------------------------------
local Entity = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Payment(Taximeter)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Experience = vRP.GetExperience(Passport,"Taxi")
		local Level = ClassCategory(Experience)
		local Valuation = parseInt(Taximeter * 0.1)

		if Level == 2 or Level == 3 or Level == 5 then
			Valuation = Valuation + 10
		elseif Level == 6 or Level == 7 or Level == 8 then
			Valuation = Valuation + 15
		elseif Level == 9 or Level == 10 then
			Valuation = Valuation + 20
		end

		if Buffs["Dexterity"][Passport] then
			if Buffs["Dexterity"][Passport] > os.time() then
				Valuation = Valuation + (Valuation * 0.1)
			end
		end

		vRP.PutExperience(Passport,"Taxi",1)
		vRP.GenerateItem(Passport,"dollars",Valuation,true)
		TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",Valuation)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SALARY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Salary()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Experience = vRP.GetExperience(Passport,"Taxi")
		local Level = ClassCategory(Experience)
		local Valuation = 1000

		if Level == 2 or Level == 3 or Level == 5 then
			Valuation = Valuation + 10
		elseif Level == 6 or Level == 7 or Level == 8 then
			Valuation = Valuation + 15
		elseif Level == 9 or Level == 10 then
			Valuation = Valuation + 20
		end

		if Buffs["Dexterity"][Passport] then
			if Buffs["Dexterity"][Passport] > os.time() then
				Valuation = Valuation + (Valuation * 0.1)
			end
		end

		vRP.GiveBank(Passport, Valuation)
		vRP.PutExperience(Passport,"Taxi",1)
		TriggerClientEvent("sounds:Private",source,"coins",0.25)
		TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",Valuation)
		TriggerClientEvent("Notify",source,"verde","Recebeu <b>$"..parseFormat(1200).."</b> em sua conta bancária.",5000,"Salário Taxista")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.insuranceUnemployment(Amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Amount >= 30 then
			local Experience = vRP.GetExperience(Passport,"Taxi")
			local Level = ClassCategory(Experience)
			local Valuation = 500*Amount
	
			if Level == 2 or Level == 3 or Level == 5 then
				Valuation = Valuation + 10
			elseif Level == 6 or Level == 7 or Level == 8 then
				Valuation = Valuation + 15
			elseif Level == 9 or Level == 10 then
				Valuation = Valuation + 20
			end
	
			if Buffs["Dexterity"][Passport] then
				if Buffs["Dexterity"][Passport] > os.time() then
					Valuation = Valuation + (Valuation * 0.1)
				end
			end
	
			vRP.GiveBank(Passport, Valuation)
			TriggerClientEvent("sounds:Private",source,"coins",0.25)
			TriggerClientEvent("Notify",source,"verde","Recebeu <b>$"..parseFormat(1200).."</b> em sua conta bancária.",5000,"Seguro-Desemprego")
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEPED
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CreatePed(Model,x,y,z)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Entity[Passport] then
			DeleteEntity(Entity[Passport])
		end
		Entity[Passport] = CreatePed(4,GetHashKey(Model),x,y,z,3374176)
		return Entity[Passport],NetworkGetNetworkIdFromEntity(Entity[Passport])
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEPED
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.DeletePed()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Entity[Passport] then
			DeleteEntity(Entity[Passport])
			Entity[Passport] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect", function(Passport)
	if Entity[Passport] then
		DeleteEntity(Entity[Passport])
		Entity[Passport] = nil
	end
end)