-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTS
-----------------------------------------------------------------------------------------------------------------------------------------
local Chests = {
	{ ["Name"] = "Police", ["Coords"] = vec3(-322.98,-263.64,32.07), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Police", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Paramedic", ["Coords"] = vec3(342.4,-572.18,48.16), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Paramedic", ["Logs"] = true, ["Mode"] = "2" },
	
	{ ["Name"] = "BurgerShot", ["Coords"] = vec3(-1195.76,-895.97,13.88), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "BurgerShot", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "CluckinBell", ["Coords"] = vec3(-518.61,-699.83,33.18), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "CluckinBell", ["Logs"] = true, ["Mode"] = "2" },

	{ ["Name"] = "AutoSport-2", ["Coords"] = vec3(-1304.9,-297.78,40.73), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "AutoSport", ["Coords"] = vec3(-1296.38,-285.81,40.73), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "EastCustoms-2", ["Coords"] = vec3(886.16,-2097.45,34.88), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "EastCustoms", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "EastCustoms", ["Coords"] = vec3(898.42,-2099.94,34.88), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "EastCustoms", ["Logs"] = true, ["Mode"] = "2" },

	{ ["Name"] = "Smuggling-2", ["Coords"] = vec3(345.17,-2708.79,1.7), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Smuggling", ["Coords"] = vec3(346.3,-2730.26,1.7), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Smuggling2-2", ["Coords"] = vec3(137.25,-1709.9,33.24), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Smuggling2", ["Coords"] = vec3(131.49,-1709.92,33.24), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },

	{ ["Name"] = "Weapons-2", ["Coords"] = vec3(1391.52,1158.85,114.33), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Weapons", ["Coords"] = vec3(387.61,-9.86,86.68), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Weapons2-2", ["Coords"] = vec3(409.38,0.37,84.92), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Weapons2", ["Coords"] = vec3(1400.02,1139.68,114.33), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },

	{ ["Name"] = "Ammos-2", ["Coords"] = vec3(-1884.38,2070.1,145.57), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Ammos", ["Coords"] = vec3(-1886.43,2062.32,140.98), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Ammos2-2", ["Coords"] = vec3(-1519.78,115.67,50.04), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Ammos2", ["Coords"] = vec3(-1511.15,102.2,52.23), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },

	{ ["Name"] = "MoneyLaundry-2", ["Coords"] = vec3(294.23,358.07,106.56), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "MoneyLaundry", ["Coords"] = vec3(290.25,354.45,106.56), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "MoneyLaundry2-2", ["Coords"] = vec3(425.11,-1510.12,33.8), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "MoneyLaundry2", ["Coords"] = vec3(415.71,-1508.84,33.8), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Mechanic", ["Logs"] = true, ["Mode"] = "2" },

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LABELS
-----------------------------------------------------------------------------------------------------------------------------------------
local Labels = {
	["1"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		}
	},
	["2"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		}
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINIT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Name,v in pairs(Chests) do
		exports["target"]:AddCircleZone("Chest:"..Name,v["Coords"],1.0,{
			name = "Chest:"..Name,
			useZ = true
		},{
			Distance = 0.75,
			shop = v["Name"],
			options = Labels[v["Mode"]]
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Open")
AddEventHandler("chest:Open",function(Name,Mode)
	if GetEntityHealth(PlayerPedId()) > 100 then
		if vSERVER.Permissions(Name,Mode) then
			if Mode == "Tray" then
				vRP.playAnim(true,{ "pickup_object", "putdown_low" }, false)
			else
				if Mode ~= "Tray" and Mode ~= "Item" and Mode ~= "Glove" and Mode ~= "Fridge" and Mode ~= "Warehouse" then
					vRP.playAnim(false,{"amb@prop_human_bum_bin@base","base"},true)
					TriggerEvent("sounds:Private","chest",0.35)
				end
			end
			SetNuiFocus(true,true)
			SendNUIMessage({ Action = "Open", Mode = Mode })
		else
			vRP.playAnim(true,{ "pickup_object", "putdown_low" }, false)
			TriggerEvent("Notify","amarelo","Trancado.",3000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:OPENTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("chest:openTrunk",function(Selected,te)
	if vSERVER.Permissions(Selected[1]..":"..Selected[2],"Trunk") and GetEntityHealth(PlayerPedId()) > 100 then

		Vehicle = Selected[3]

		TaskTurnPedToFaceEntity(PlayerPedId(), Selected[3], 1.0);
        --[[ while 20 < math.abs(math.floor(GetEntityHeading(PlayerPedId())) - math.floor(GetEntityHeading(Selected[3]))) do
            Citizen.Wait(0)
        end ]]

		FreezeEntityPosition(PlayerPedId(),true)
		SetEntityCollision(PlayerPedId(),false)
		

		vRP.playAnim(true,{ "pickup_object", "putdown_low" }, false)
		Wait(1000)
		TriggerServerEvent("player:TrunkDoor",VehToNet(Selected[3]),"open")
		Wait(1000)
		vRP.playAnim(false,{"amb@prop_human_bum_bin@base","base"},true)
		
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
	if Vehicle then
		--[[ if GetVehicleClass(Vehicle) == 0 and GetVehicleClass(Vehicle) == 1 and GetVehicleClass(Vehicle) == 3 then
			vRP.playAnim(true, { "anim@heists@fleeca_bank@scope_out@return_case", "trevor_action" }, true)
			Wait(1000)
		end ]]
		vRP.playAnim(true, { "anim@heists@fleeca_bank@scope_out@return_case", "trevor_action" }, false)
		TriggerServerEvent("player:TrunkDoor",VehToNet(Vehicle),"close")
		Wait(1000)
		SetEntityCollision(PlayerPedId(),true)
		FreezeEntityPosition(PlayerPedId(),false)
		Vehicle = nil
	end
	vRP.removeObjects()
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Take",function(Data,Callback)
	if MumbleIsConnected() then
		PlaySoundFrontend(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 1)
		vSERVER.Take(Data["item"],Data["slot"],Data["amount"],Data["target"])
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Store",function(Data,Callback)
	if MumbleIsConnected() and not exports["hud"]:Wanted() then
		PlaySoundFrontend(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 1)
		vSERVER.Store(Data["item"],Data["slot"],Data["amount"],Data["target"])
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	if MumbleIsConnected() then
		PlaySoundFrontend(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 1)
		vSERVER.Update(Data["slot"],Data["target"],Data["amount"])
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Chest",function(Data,Callback)
	local Inventory,Chest,InvPeso,InvMaxPeso,ChestPeso,ChestMaxPeso,Slots = vSERVER.Chest()
	if Inventory then
		Callback({ Inventory = Inventory, Chest = Chest, invPeso = InvPeso, invMaxpeso = InvMaxPeso, chestPeso = ChestPeso, chestMaxpeso = ChestMaxPeso, Slots = Slots })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Update")
AddEventHandler("chest:Update",function(Action,invPeso,invMaxpeso,chestPeso,chestMaxpeso)
	SendNUIMessage({ Action = Action, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Close")
AddEventHandler("inventory:Close",function()
	SetNuiFocus(false,false)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ Action = "Close" })
	if Vehicle then
		--[[ if GetVehicleClass(Vehicle) == 0 and GetVehicleClass(Vehicle) == 1 and GetVehicleClass(Vehicle) == 3 then
			vRP.playAnim(true, { "anim@heists@fleeca_bank@scope_out@return_case", "trevor_action" }, true)
			Wait(1000)
		end ]]
		vRP.playAnim(true, { "anim@heists@fleeca_bank@scope_out@return_case", "trevor_action" }, true)
		TriggerServerEvent("player:TrunkDoor",VehToNet(Vehicle),"close")
		Wait(1000)
		SetEntityCollision(PlayerPedId(),true)
		FreezeEntityPosition(PlayerPedId(),false)
		Vehicle = nil
		vRP.removeObjects()
	end
end)