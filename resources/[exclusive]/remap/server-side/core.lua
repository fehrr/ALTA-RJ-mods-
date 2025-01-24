-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface(GetCurrentResourceName(), Creative)
vTunnel = Tunnel.getInterface(GetCurrentResourceName())
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
Creative.checkPermission = function(perm)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if exports["hud"]:Wanted(Passport,source) then
			return false
		end
		if vRP.HasGroup(Passport,perm,1 or 2 or 3) and vRP.HasService(Passport,perm) or vRP.HasGroup(Passport,perm,1 or 2 or 3) and vRP.HasService(Passport,perm) then
			return true
		else
			TriggerClientEvent("Notify",source,"vermelho","Você Não Tem Permissão",5000)
			return false
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
Creative.saveRemap = function(Remap,Plate)
	if vRP.PassportPlate(Plate) then
		vRP.Query("entitydata/SetData",{ dkey = "Remap:"..Plate, dvalue = json.encode(Remap) })
	end
end