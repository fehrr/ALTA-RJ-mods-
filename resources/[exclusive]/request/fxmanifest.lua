shared_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version "bodacious"
game "gta5"
lua54 "yes"

ui_page "web-side/index.html"

client_scripts {
	"@vrp/lib/Utils.lua",
	"client-side/*"
}

files {
	"web-side/*",
	"web-side/**/*"
}              