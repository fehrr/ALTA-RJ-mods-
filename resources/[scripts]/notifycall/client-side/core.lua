-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local showBlips = {}
local timeBlips = {}
local numberBlips = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("enterNotifys",function()
	if not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not IsPauseMenuActive() then
		SendNUIMessage({ name = "Open" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("enterNotifys","Consultar as notificações.","keyboard","F2")
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFYPUSH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("NotifyPush")
AddEventHandler("NotifyPush",function(data)
	data["street"] = GetStreetNameFromHashKey(GetStreetNameAtCoord(data["x"],data["y"],data["z"]))

	SendNUIMessage({ name = "New", payload = data })

	numberBlips = numberBlips + 1

	timeBlips[numberBlips] = 60
	showBlips[numberBlips] = AddBlipForCoord(data["x"],data["y"],data["z"])

	SetBlipSprite(showBlips[numberBlips],270)
	SetBlipDisplay(showBlips[numberBlips],4)
	SetBlipAsShortRange(showBlips[numberBlips],true)
	SetBlipColour(showBlips[numberBlips],data["blipColor"])
	SetBlipScale(showBlips[numberBlips],0.9)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(data["title"])
	EndTextCommandSetBlipName(showBlips[numberBlips])

	if parseInt(data["code"]) == 4 then
		TriggerEvent("sounds:Private","deathcop",0.7)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		for k,v in pairs(timeBlips) do
			if timeBlips[k] > 0 then
				timeBlips[k] = timeBlips[k] - 1

				if timeBlips[k] <= 0 then
					RemoveBlip(showBlips[k])
					showBlips[k] = nil
					timeBlips[k] = nil
				end
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FOCUSON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("focusOn",function(Data,Callback)
	SetNuiFocus(true,true)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FOCUSOFF
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("focusOff",function(Data,Callback)
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Waypoint
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Waypoint",function(Data,Callback)
	SetNewWaypoint(Data["x"] + 0.0001,Data["y"] + 0.0001,Data["z"] + 0.0001)
	SendNUIMessage({ name = "Waypoint" })

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PhoneCall
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Phone",function(Data,Callback)
	exports.smartphone:callPlayer(Data["phone"])
	SendNUIMessage({ name = "Phone" })

	Callback("Ok")
end)