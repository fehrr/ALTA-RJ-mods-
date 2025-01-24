-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Previous = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAIRS
-----------------------------------------------------------------------------------------------------------------------------------------
local Chairs = {
	-- BurgerShot
	{ ["Coords"] = vec3(-1182.80,-898.57,13.45), ["Heading"] = 127.56 },
	{ ["Coords"] = vec3(-1183.42,-897.79,13.45), ["Heading"] = 127.56 },

	{ ["Coords"] = vec3(-1179.98,-896.63,13.45), ["Heading"] = 127.56 },
	{ ["Coords"] = vec3(-1180.52,-895.84,13.45), ["Heading"] = 127.56 },

	{ ["Coords"] = vec3(-1177.06,-894.69,13.45), ["Heading"] = 127.56 },
	{ ["Coords"] = vec3(-1177.63,-893.85,13.45), ["Heading"] = 127.56 },

	-- CluckinBell
	{ ["Coords"] = vec3(-523.14,-688.14,32.65), ["Heading"] = 277.8 },
	{ ["Coords"] = vec3(-520.65,-688.18,32.65), ["Heading"] = 277.8 },
	{ ["Coords"] = vec3(-518.1,-688.12,32.65), ["Heading"] = 277.8 },

	{ ["Coords"] = vec3(-519.3,-692.79,33.00), ["Heading"] = 5.67 },
	
	
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(Chairs) do
		AddBoxZone("Chairs:"..Number,v["Coords"],0.35,0.35,{
			name = "Chairs:"..Number,
			heading = v["Heading"],
			minZ = v["Coords"]["z"] - 0.5,
			maxZ = v["Coords"]["z"] 
		},{
			shop = Number,
			Distance = 1.0,
			options = {
				{
					event = "target:SitChair",
					label = "Sentar",
					tunnel = "client"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:SITCHAIR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:SitChair")
AddEventHandler("target:SitChair",function(Number)
	if not Previous then
		local Ped = PlayerPedId()
		local Coords = Chairs[Number]["Coords"]
		TaskStartScenarioAtPosition(Ped,"PROP_HUMAN_SEAT_CHAIR_UPRIGHT",Coords["x"],Coords["y"],Coords["z"],Chairs[Number]["Heading"] + 1.0,-1,true,true)
		Previous = GetEntityCoords(Ped)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:UPCHAIR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:UpChair")
AddEventHandler("target:UpChair",function()
	if Previous then
		local Ped = PlayerPedId()
		SetEntityCoords(Ped,Previous["x"],Previous["y"],Previous["z"] - 1,false,false,false,false)
		Previous = nil
	end
end)