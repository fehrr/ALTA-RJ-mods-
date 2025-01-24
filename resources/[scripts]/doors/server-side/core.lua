-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("doors",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBALSTATE
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Doors"] = {
	["1"] = { Coords = vec3(1844.99,2604.81,44.63), Hash = 741314661, Disabled = false, Lock = true, Distance = 7, Perm = "Emergency" },
	["2"] = { Coords = vec3(1818.54,2604.40,44.61), Hash = 741314661, Disabled = false, Lock = true, Distance = 7, Perm = "Emergency" },

	["21"] = { Coords = vec3(-352.02,-258.61,36.06), Hash = -543497392, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "22" },
	["22"] = { Coords = vec3(-353.34,-260.38,36.06), Hash = -543497392, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "21" },
	["23"] = { Coords = vec3(-344.54,-248.32,36.06), Hash = -543497392, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "24" },
	["24"] = { Coords = vec3(-345.86,-249.89,36.06), Hash = -543497392, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "23" },
	["25"] = { Coords = vec3(-333.04,-267.37,36.06), Hash = 320433149, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "26" },
	["26"] = { Coords = vec3(-331.79,-265.66,36.06), Hash = 320433149, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "25" },
	["27"] = { Coords = vec3(-315.19,-282.23,35.59), Hash = -543497392, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "28" },
	["28"] = { Coords = vec3(-316.25,-283.88,35.59), Hash = -543497392, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "27" },
	["29"] = { Coords = vec3(-316.4,-283.96,39.87), Hash = -543497392, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "30" },
	["30"] = { Coords = vec3(-314.99,-282.15,39.87), Hash = -543497392, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "29" },
	["31"] = { Coords = vec3(-327.41,-253.27,34.39), Hash = 560252123, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "32" },
	["32"] = { Coords = vec3(-328.57,-254.87,34.86), Hash = -1796068320, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "31" },
	["33"] = { Coords = vec3(-310.66,-277.47,31.71), Hash = 560252123, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "34" },
	["34"] = { Coords = vec3(-311.84,-279.07,31.71), Hash = -1796068320, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police", Other = "33" },
	["35"] = { Coords = vec3(-315.13,-276.07,32.05), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["36"] = { Coords = vec3(-339.61,-270.81,32.07), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["37"] = { Coords = vec3(-333.24,-274.27,32.07), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["38"] = { Coords = vec3(-329.53,-276.8,32.07), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["39"] = { Coords = vec3(-326.0,-279.46,32.07), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["40"] = { Coords = vec3(-322.41,-282.02,32.07), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["41"] = { Coords = vec3(-338.78,-266.22,39.87), Hash = -1320876379, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["42"] = { Coords = vec3(-335.02,-268.82,39.87), Hash = -1320876379, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["42"] = { Coords = vec3(-335.02,-268.82,39.87), Hash = -1320876379, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["43"] = { Coords = vec3(-331.52,-271.39,39.87), Hash = -1320876379, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["44"] = { Coords = vec3(-328.83,-272.39,39.87), Hash = -1320876379, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["45"] = { Coords = vec3(-325.66,-268.86,39.87), Hash = -1320876379, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["46"] = { Coords = vec3(-319.04,-275.57,39.87), Hash = -1320876379, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },
	["47"] = { Coords = vec3(-322.1,-276.97,39.87), Hash = -1320876379, Disabled = false, Lock = true, Distance = 1.75, Perm = "Police" },

	["48"] = { Coords = vec3(-513.09,-684.29,33.18), Hash = -1432609915, Disabled = false, Lock = true, Distance = 1.75, Perm = "CluckinBell", Other = "36" },
	["49"] = { Coords = vec3(-509.97,-684.22,33.16), Hash = 903328250, Disabled = false, Lock = true, Distance = 1.75, Perm = "CluckinBell", Other = "35" },
	["50"] = { Coords = vec3(-511.62,-697.34,33.16), Hash = -738011261, Disabled = false, Lock = true, Distance = 1.75, Perm = "CluckinBell" },

	["51"] = { Coords = vec3(-1182.48,-885.69,13.88), Hash = 1143532813, Disabled = false, Lock = true, Distance = 1.75, Perm = "BurgerShot", Other = "38" },
	["52"] = { Coords = vec3(-1181.06,-887.67,13.88), Hash = -1890974902, Disabled = false, Lock = true, Distance = 1.75, Perm = "BurgerShot", Other = "37" },
	["53"] = { Coords = vec3(-1188.46,-896.21,13.88), Hash = 2010236044, Disabled = false, Lock = true, Distance = 1.75, Perm = "BurgerShot" },
	["54"] = { Coords = vec3(-1197.71,-904.24,13.88), Hash = 1465287574, Disabled = false, Lock = true, Distance = 1.75, Perm = "BurgerShot" },
	
	
	["999"] = { Coords = vec3(251.85,221.06,101.83), Hash = -1508355822, Disabled = true, Lock = true, Distance = 1.75, Perm = "Admin" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Permission(Number)
	local source = source
	local Passport = vRP.Passport(source)
	local Doors = GlobalState["Doors"]
	if Passport and Doors[Number] and Doors[Number]["Perm"] then
		if (SplitTwo(Doors[Number]["Perm"]) and vRP.HasGroup(Passport,SplitOne(Doors[Number]["Perm"]),parseInt(SplitTwo(Doors[Number]["Perm"]))) and vRP.HasService(Passport,SplitOne(Doors[Number]["Perm"]))) or (vRP.HasGroup(Passport,Doors[Number]["Perm"]) or vRP.HasService(Passport,Doors[Number]["Perm"])) then
			Doors[Number]["Lock"] = not Doors[Number]["Lock"]
			if Doors[Number]["Other"] then
				local Second = Doors[Number]["Other"]
				Doors[Second]["Lock"] = not Doors[Second]["Lock"]
			end
			GlobalState:set("Doors",Doors,true)
			vRPC.playAnim(source,true,Doors[Number]["Other"] and {"veh@mower@base","start_engine"} or {"anim@heists@keycard@","exit"},false)
			if Doors[Number]["Lock"] then
				TriggerClientEvent("sounds:Private",source,"houses_door_lock",0.5)
			else
				TriggerClientEvent("sounds:Private",source,"houses_door_unlock",0.5)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROXIMITY
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Proximity",function(Coords)
	for Index,Value in pairs(GlobalState["Doors"]) do
		if not Value["Disabled"] and Value["Lock"] then
			if #(Coords - Value["Coords"]) <= Value["Distance"] then
				return Index
			end
		end
	end
	return false
end)