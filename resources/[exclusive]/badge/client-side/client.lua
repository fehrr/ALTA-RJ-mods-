-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("badge:Show")
AddEventHandler("badge:Show",function(rank,name,callsign)
    SendNUIMessage({ show = true, infos = { picture = "https://cdn.discordapp.com/attachments/1129825264814280744/1194068207422689351/image_3.png", rank = rank, name = name,  callsign = callsign }})
end)