shared_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version "bodacious"
game "gta5"
lua54 "yes"

ui_page "web-side/index.html"

client_scripts {
	"@vrp/config/Item.lua",
	"@vrp/lib/Utils.lua",
	'shared-side/*', 
	"client-side/*"
}

server_scripts {
	"@vrp/config/Item.lua",
	"@vrp/lib/Utils.lua",
	'shared-side/*',
	"server-side/*"
}

files {
	"web-side/*",
	"web-side/**/*"
}              