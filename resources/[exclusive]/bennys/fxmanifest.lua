shared_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version "bodacious"
game "gta5"
ui_page "web-side/index.html"
client_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"client-side/*"
}
server_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"server-side/*"
}
files {
	"web-side/*",
	"web-side/**/*",
	"data/carcols_gen9.meta",
	"data/carmodcols_gen9.meta",
    "stream/vehicle_paint_ramps.ytd"	
}
data_file "CARCOLS_GEN9_FILE" "data/carcols_gen9.meta"
data_file "CARMODCOLS_GEN9_FILE" "data/carmodcols_gen9.meta"              