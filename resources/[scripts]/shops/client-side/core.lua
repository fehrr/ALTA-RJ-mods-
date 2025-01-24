-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("shops",Creative)
vSERVER = Tunnel.getInterface("shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Close")
AddEventHandler("inventory:Close",function()
	SetNuiFocus(false,false)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ Action = "Close" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Request",function(Data,Callback)
	local inventoryShop,inventoryUser,invPeso,invMaxpeso,shopSlots = vSERVER.Request(Data["shop"])
	if inventoryShop then
		Callback({ inventoryShop = inventoryShop, inventoryUser = inventoryUser, invPeso = invPeso, invMaxpeso = invMaxpeso, shopSlots = shopSlots })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionShops",function(Data,Callback)
	if vSERVER.functionShops(Data["shop"],Data["item"],Data["amount"],Data["slot"],Data["target"]) then
		SendNUIMessage({ Action = "Close" })
		SetNuiFocus(false,false)
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	PlaySoundFrontend(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 1)
	vSERVER.Update(Data["slot"],Data["target"],Data["amount"])
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("shops:Update")
AddEventHandler("shops:Update",function(Action)
	SendNUIMessage({ Action = Action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	{ 24.49,-1346.08,29.49,"Departament",true },
	{ 2556.74,381.24,108.61,"Departament",true },
	{ 1164.82,-323.65,69.2,"Departament",true },
	{ -706.15,-914.53,19.21,"Departament",true },
	{ -47.38,-1758.68,29.42,"Departament",true },
	{ 373.1,326.81,103.56,"Departament",true },
	{ -3242.75,1000.46,12.82,"Departament",true },
	{ 1728.47,6415.46,35.03,"Departament",true },
	{ 1960.2,3740.68,32.33,"Departament",true },
	{ 2677.8,3280.04,55.23,"Departament",true },
	{ 1697.31,4923.49,42.06,"Departament",true },
	{ -1819.52,793.48,138.08,"Departament",true },
	{ 1391.69,3605.97,34.98,"Departament",true },
	{ -2966.41,391.55,15.05,"Departament",true },
	{ -3039.54,584.79,7.9,"Departament",true },
	{ 1134.33,-983.11,46.4,"Departament",true },
	{ 1165.28,2710.77,38.15,"Departament",true },
	{ -1486.72,-377.55,40.15,"Departament",true },
	{ -1221.45,-907.92,12.32,"Departament",true },
	{ 161.2,6641.66,31.69,"Departament",true },
	{ -160.62,6320.93,31.58,"Departament",true },
	{ 548.7,2670.73,42.16,"Departament",true },
	{ 1692.28,3760.94,34.69,"Ammunation",false },
	{ 253.79,-50.5,69.94,"Ammunation",false },
	{ 842.41,-1035.28,28.19,"Ammunation",false },
	{ -331.62,6084.93,31.46,"Ammunation",false },
	{ -662.29,-933.62,21.82,"Ammunation",false },
	{ -1304.17,-394.62,36.7,"Ammunation",false },
	{ -1118.95,2699.73,18.55,"Ammunation",false },
	{ 2567.98,292.65,108.73,"Ammunation",false },
	{ -3173.51,1088.38,20.84,"Ammunation",false },
	{ 22.59,-1105.54,29.79,"Ammunation",false },
	{ 810.22,-2158.99,29.62,"Ammunation",false },
	{ 2736.91,3462.28,55.69,"Tools",false },
	{ -40.2,-1660.0,29.49,"Tools",false },
	-- { 46.62,-1749.7,29.62,"MegaMall",false },
	{ 1132.37,-474.31,66.71,"Digital",false },
	{ 1171.9,-304.07,69.1,"Fishing",false },
	{ 1522.17,3783.13,34.47,"Fishing2",true,1.75 },
	{ 1170.55,-296.03,69.1,"Fruit",false },
	{ 1170.88,-298.2,69.1,"Ingredient",false },
	{ 568.96,2796.64,42.01,"Hunting",false },
	{ -775.96,5602.95,33.73,"Hunting2",false },
	{ -171.46,6386.75,31.49,"Pharmacy",false },
	{ 318.23,-1078.4,29.47,"Pharmacy",false },
	{ 92.04,-231.03,54.66,"Pharmacy",false },
	{ 324.37,-583.76,43.27,"Paramedic",false },
	{ -428.57,-1728.35,19.78,"Recycle",false },
	{ 180.55,2793.45,45.65,"Recycle",false },
	{ -195.79,6264.95,31.49,"Recycle",false },
	{ -332.12,-251.72,34.39,"Police",false },
	{ -628.79,-238.7,38.05,"Miners",false },
	{ 475.1,3555.28,33.23,"Criminal",false },
	{ 112.41,3373.68,35.25,"Criminal2",false },
	{ 2013.95,4990.88,41.21,"Criminal3",false },
	{ 186.9,6374.75,32.33,"Criminal4",false },
	{ -653.12,-1502.67,5.22,"Criminal",false },
	{ 389.71,-942.61,29.42,"Criminal2",false },
	{ 154.98,-1472.47,29.35,"Criminal3",false },
	{ 488.1,-1456.11,29.28,"Criminal4",false },
	{ 169.76,-1535.88,29.25,"Weapons",false },
	{ 301.14,-195.75,61.57,"Weapons",false },
	{ -1636.74,-1092.17,13.08,"Oxy",false },
	{ -1196.9,-901.58,13.99,"BurgerShot",false },
	{ 806.22,-761.68,26.77,"PizzaThis",false },
	{ -588.5,-1066.23,22.34,"UwuCoffee",false },
	{ 124.01,-1036.72,29.27,"BeanMachine",false },
	{ -709.23,-151.35,37.41,"Clothes",false },
	{ -165.08,-303.46,39.73,"Clothes",false },
	{ -823.16,-1072.39,11.32,"Clothes",false },
	{ -1194.6,-767.56,17.3,"Clothes",false },
	{ -1448.61,-237.61,49.81,"Clothes",false },
	{ 5.87,6511.4,31.88,"Clothes",false },
	{ 1695.37,4823.17,42.06,"Clothes",false },
	{ 127.23,-223.39,54.56,"Clothes",false },
	{ 613.09,2761.8,42.09,"Clothes",false },
	{ 1196.55,2711.64,38.22,"Clothes",false },
	{ -3169.1,1044.04,20.86,"Clothes",false },
	{ -1102.41,2711.57,19.11,"Clothes",false },
	{ 427.02,-806.21,29.49,"Clothes",false },
	{ 73.93,-1392.9,29.37,"Clothes",false },
	{ 563.07,2753.0,42.87,"Animals",false },
	{ -1172.14,-1571.77,4.67,"Weeds",false },
	{ 1085.83,-2001.74,31.41,"Foundry",false },
	{ 987.83,-95.28,74.85,"Drinks",false },
	{ 1775.73,2553.63,45.56,"Prision",false },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- MATERIALS
-----------------------------------------------------------------------------------------------------------------------------------------
local Materials = {
	{
		["Coords"] = vec3(2455.81,4979.48,51.56),
		["Hours"] = 5
	},{
		["Coords"] = vec3(-286.33,2838.56,54.96),
		["Hours"] = 10
	},{
		["Coords"] = vec3(-1505.9,1526.25,115.25),
		["Hours"] = 15
	},{
		["Coords"] = vec3(3452.72,3646.46,42.6),
		["Hours"] = 20
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Open",function(Number)
	if not exports["hud"]:Wanted() and vSERVER.Permission(List[Number][4]) then
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open", name = List[Number][4], type = vSERVER.ShopType(List[Number][4]) })
		if List[Number][5] then
			TriggerEvent("sounds:Private","shop",0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:COFFEE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Coffee",function()
	SendNUIMessage({ Action = "Open", name = "Coffee", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:SODA
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Soda",function()
	SendNUIMessage({ Action = "Open", name = "Soda", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DONUT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Donut",function()
	SendNUIMessage({ Action = "Open", name = "Donut", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HAMBURGER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Hamburger",function()
	SendNUIMessage({ Action = "Open", name = "Hamburger", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HOTDOG
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Hotdog",function()
	SendNUIMessage({ Action = "Open", name = "Hotdog", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:CHIHUAHUA
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Chihuahua",function()
	SendNUIMessage({ Action = "Open", name = "Chihuahua", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:WATER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Water",function()
	SendNUIMessage({ Action = "Open", name = "Water", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:CIGARETTE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Cigarette",function()
	SendNUIMessage({ Action = "Open", name = "Cigarette", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MEDIC
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Medic",function()
	if not exports["hud"]:Wanted() and vSERVER.Permission("Paramedic") then
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open", name = "Paramedic", type = "Buy" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:FUEL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Fuel",function()
	SendNUIMessage({ Action = "Open", name = "Fuel", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(List) do
		exports["target"]:AddCircleZone("Shops:"..Number,vec3(v[1],v[2],v[3]),0.50,{
			name = "Shops:"..Number,
			heading = 0.0
		},{
			shop = Number,
			Distance = v[6] or 2.0,
			options = {
				{
					event = "shops:Open",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
	for Number,v in pairs(Materials) do
		exports["target"]:AddCircleZone("Materials:"..Number,v["Coords"],0.50,{
			name = "Materials:"..Number,
			heading = 0.0
		},{
			shop = Number,
			Distance = 1.25,
			options = {
				{
					event = "shops:Materials",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MATERIALS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Materials",function(Number)
	if Materials[Number] then
		if GlobalState["Hours"] == Materials[Number]["Hours"] then
			SetNuiFocus(true,true)
			SendNUIMessage({ Action = "Open", name = "Materials", type = "Buy" })
		else
			TriggerEvent("Notify","amarelo","Estou sem mercadoria no momento, volte as <b>"..Materials[Number]["Hours"]..":00 Horas</b> que vou ver se consigo mercadoria.",5000,"Robert Jenkyns")
		end
	end
end)