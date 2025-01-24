-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORDS
-----------------------------------------------------------------------------------------------------------------------------------------
Discords = {
	-- GENERAL
	["createAccount"] = "",
	-- ADMIN
	["Noclip"] = "",
	["AddVeh"] = "",
	["RemVeh"] = "",
	["ClearInv"] = "",
	["ClearChest"] = "",
	["GemStone"] = "",
	["Revive"] = "",
	["ReviveAll"] = "",
	["Dollars"] = "",
	["GiveItem"] = "",
	["RemoveCharacter"] = "-",
	["Kick"] = "",
	["Banned"] = "",
	["UnBanned"] = "",
	["WhiteList"] = "",
	["UnWhiteList"] = "",
	["Tpcds"] = "",
	["Group"] = "",
	["UnGroup"] = "",
	["Tptome"] = "",
	["Tpto"] = "",
	["Tuning"] = "",
	["Repair"] = "",
	["ClearArea"] = "",
	["Announce"] = "",
	["KickAll"] = "",
	["SaveData"] = "",
	["Spectate"] = "",
	["ResetCharacter"] = "",
	["Bucket"] = "",
	-- PROPERTYS
	["BuyProperty"] = "",
	["SellProperty"] = "",
	["TransferProperty"] = "",
	["TaxProperty"] = "",
	["RealtyProperty"] = "",
	-- PDM
	["BuyVehicle"] = "",
	["RentalVehicle"] = "",
	["TestDriver"] = "",
	-- GARAGES
	["TransferVehicle"] = "",
	["SellVehicle"] = "",
	["TaxVehicle"] = "",
	-- PAUSE
	["ShopPause"] = "",
	["BuyPass"] = "",
	["RedeemPass"] = "",
	["OpenBox"] = "",

	["Connect"] = "",
	["Disconnect"] = "",
	["Airport"] = "",
	["Deaths"] = "",
	["Polices"] = "",
	["Police"] = "",
	["Paramedic"] = "",
	["Paramedic-3"] = "",
	["Login"] = "",
	["Event"] = "",
	["Robberys"] = "",
	["Garages"] = "",
	["Hackers"] = "",
	["Inventory"] = "",
	["Premium"] = "",
	["Wash"] = "",
	["Desmanche"] = "",

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Discord",function(Hook,Message,Color)
	PerformHttpRequest(Discords[Hook],function(err,text,headers) end,"POST",json.encode({
		username = ServerName,
		embeds = { { color = Color, description = Message } }
	}),{ ["Content-Type"] = "application/json" })
end)