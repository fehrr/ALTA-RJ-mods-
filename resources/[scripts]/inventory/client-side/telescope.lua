local Config = {}

-- discord.gg/5xHA3RY3Fq    zomerx
Config.UseQTarget = false
Config.UseQBTarget = false
-- discord.gg/5xHA3RY3Fq    zomerx

Config.Targeting = {
	Icon = "fas fa-binoculars",
	Label = "Use Telescope"
}

-- discord.gg/5xHA3RY3Fq    zomerx

Config.HelpText = "Pressione ~INPUT_TALK~ para usar telescópio"
Config.NoFoundMessage = "No telescope was found!"
Config.TelescopeInUse = "Someone else is already using the telescope!"
Config.ToFarAway = "You went to far away!"

-- discord.gg/5xHA3RY3Fq    zomerx

Config.UseDistanceThread = true
Config.UseNativeNotifiactions = false 

Config.MaxInteractionDist = 1.5
Config.MaxDetectionDist = 6.0
-- discord.gg/5xHA3RY3Fq    zomerx

Config.MovementSpeed = {
	Keyboard = 2.75,
	Controller = 1.0
}

Config.Zoom = {
	Max = 50.0,
	Min = 5.0,
	Speed = 5.0
}

Config.Animations = {
	["default"] = {
		enter = "enter_front",
		enterTime = 1500,
		exit = "exit_front",
		idle = "idle"
	},
	["public"] = {
		enter = "public_enter_front",
		enterTime = 1500,
		exit = "public_exit_front",
		idle = "public_idle"
	},
	["upright"] = {
		enter = "upright_enter_front",
		enterTime = 2500,
		exit = "upright_exit_front",
		idle = "upright_idle"
	}
}

Config.Models = {
	[1186047406] = { MaxHorizontal = 55.0, MaxVertical = 20.0, offset = vector3(0.0, 0.95, 0.0), headingOffset = 180.0, animation = "public", cameraOffset = vector3(0.0, -0.5, 0.7), scaleform = "OBSERVATORY_SCOPE" }, -- prop_telescope_01 (Public)
	[844159446] = { MaxHorizontal = 55.0, MaxVertical = 20.0, offset = vector3(0.0, -0.85, 1.0), animation = "upright", cameraOffset = vector3(0.0, 0.2, 1.7), scaleform = "BINOCULARS" }, -- prop_telescope (Mount Chilliad)
	[-656927072] = { MaxHorizontal = 55.0, MaxVertical = 35.0, offset = vector3(1.25, 0.0, 0.0), headingOffset = 90.0, animation = "default", cameraOffset = vector3(-0.25, 0.0, 1.3), scaleform = "OBSERVATORY_SCOPE" }, -- prop_t_telescope_01b (Domestic)
	[1930051531] = { MaxHorizontal = 55.0, MaxVertical = 20.0, offset = vector3(0.0, 0.95, 0.0), headingOffset = 180.0, animation = "public", cameraOffset = vector3(0.0, -0.5, 0.7), scaleform = "BINOCULARS" }, -- xs_prop_arena_telescope_01 (not tested)
}

Config.Telescopes = {
	-- Public --
	-- Galileo Observatory
	{ model = 1186047406, coords = vector3(-490.6682, 1095.387, 319.9773) },
	{ model = 1186047406, coords = vector3(-487.7137, 1094.643, 319.9769) },
	{ model = 1186047406, coords = vector3(-466.6990, 1088.443, 327.5582) },
	{ model = 1186047406, coords = vector3(-452.7089, 1082.787, 332.4135) },
	{ model = 1186047406, coords = vector3(-457.2304, 1101.254, 332.4135) },
	{ model = 1186047406, coords = vector3(-451.7881, 1099.751, 332.4135) },
	{ model = 1186047406, coords = vector3(-415.1138, 1089.622, 332.4135) },
	{ model = 1186047406, coords = vector3(-409.6714, 1088.119, 332.4135) },
	{ model = 1186047406, coords = vector3(-401.0349, 1051.714, 323.721) },

	-- Senora National Park
	{ model = 1186047406, coords = vector3(2615.951, 3667.427, 101.9804) },
	{ model = 1186047406, coords = vector3(2613.160, 3662.852, 101.9836) },

	-- Del Perro Beach
	{ model = 1186047406, coords = vector3(-1722.135, -1014.014, 5.067778) },
	{ model = 1186047406, coords = vector3(-1719.312, -1016.231, 5.140132) },
	{ model = 1186047406, coords = vector3(-1677.599, -989.2823, 7.260609) },
	{ model = 1186047406, coords = vector3(-1682.565, -1005.748, 7.264191) },
	{ model = 1186047406, coords = vector3(-1704.427, -1058.541, 12.89529) }, -- This one is on the pier but is much closer to the beach ones

	-- Del Perro Pier
	{ model = 1186047406, coords = vector3(-1839.998, -1166.770, 12.8953) },
	{ model = 1186047406, coords = vector3(-1852.887, -1182.131, 12.8953) },
	{ model = 1186047406, coords = vector3(-1865.726, -1197.432, 12.8953) },
	{ model = 1186047406, coords = vector3(-1879.108, -1213.380, 12.898) },
	{ model = 1186047406, coords = vector3(-1867.321, -1223.522, 12.898) },
	{ model = 1186047406, coords = vector3(-1856.398, -1232.756, 12.91837) },
	{ model = 1186047406, coords = vector3(-1838.830, -1247.536, 12.91732) },
	{ model = 1186047406, coords = vector3(-1823.529, -1260.374, 12.918) },
	{ model = 1186047406, coords = vector3(-1826.419, -1270.177, 8.503754) },
	{ model = 1186047406, coords = vector3(-1841.719, -1257.338, 8.5031) },
	{ model = 1186047406, coords = vector3(-1857.081, -1244.448, 8.50415) },

	-- Hill Valley Church (West Eclipse Boulevard)
	{ model = 1186047406, coords = vector3(-1810.320, -129.073, 78.66142) },

	-- Public Binocular --
	-- Mount Chilliad
	{ model = 844159446, coords = vector3(499.8335, 5602.674, 796.9147) },
	{ model = 844159446, coords = vector3(503.3787, 5602.383, 796.9147) },

	-- Chumash
	{ model = 844159446, coords = vector3(-3259.545, 982.4403, 11.59678) }, -- Both are at the base of the pier
	{ model = 844159446, coords = vector3(-3259.456, 987.225, 11.59678) },

	-- Domestics --
	-- Houses/Apartment
	{ model = -656927072, coords = vector3(13.73517, 528.4813, 174.2378) }, -- Franklin
	{ model = -656927072, coords = vector3(-667.9016, 845.2842, 224.6442) }, -- 6085 Milton Road
	{ model = -656927072, coords = vector3(-1018.618, 658.7, 160.8932) }, -- 2884 Hillcrest Avenue (Martin Madrazo's house)

	{ model = -656927072, coords = vector3(-130.2234, -645.0045, 168.4174) }, -- Apartment (Arcadius Business Center)
	{ model = -656927072, coords = vector3(-1473.417, -543.9343, 73.04141) }, -- Apartment (Marathon Ave/North Rockford Drive)
	{ model = -656927072, coords = vector3(-15.94042, -580.2412, 79.02798) }, -- Apartment (Integrity)

	-- Other apartments
	{ model = -656927072, coords = vector3(-774.7643, 604.7314, 143.3283) },
	{ model = -656927072, coords = vector3(-662.9636, 582.7271, 144.5675) },
	{ model = -656927072, coords = vector3(-570.1771, 640.1734, 145.0294) },
	{ model = -656927072, coords = vector3(-851.1698, 671.2417, 152.0503) },
	{ model = -656927072, coords = vector3(-1282.699, 429.0291, 97.09206) },
	{ model = -656927072, coords = vector3(-162.235, 479.5696, 136.8414) },
	{ model = -656927072, coords = vector3(126.4659, 540.1469, 183.4945) },
	{ model = -656927072, coords = vector3(327.7837, 421.3323, 148.5685) },
	{ model = -656927072, coords = vector3(375.5592, 401.9527, 145.0975) },
	{ model = -656927072, coords = vector3(-12.571, -581.1641, 98.44279) },
	{ model = -656927072, coords = vector3(-44.62522, -578.5092, 88.32477) },
	{ model = -656927072, coords = vector3(-260.373, -941.1046, 75.44127) },
	{ model = -656927072, coords = vector3(-282.813, -967.2342, 90.72084) },
	{ model = -656927072, coords = vector3(-880.5233, -442.9293, 124.7444) },
	{ model = -656927072, coords = vector3(-918.014, -446.9025, 119.817) },
	{ model = -656927072, coords = vector3(-901.0436, -425.5372, 93.67105) },
	{ model = -656927072, coords = vector3(-912.1877, -386.501, 113.2719) },
	{ model = -656927072, coords = vector3(-895.6904, -368.2518, 83.69043) },
	{ model = -656927072, coords = vector3(-934.3463, -383.0493, 107.6502) },
	{ model = -656927072, coords = vector3(-1475.581, -539.8524, 55.13894) },
	{ model = -656927072, coords = vector3(-1475.581, -539.8524, 67.76656) },
	{ model = -656927072, coords = vector3(-1557.817, -580.1621, 108.1199) },
	{ model = -656927072, coords = vector3(-1368.97, -468.4037, 71.63905) },
	{ model = -656927072, coords = vector3(-625.4163, 59.26805, 106.237) },
	{ model = -656927072, coords = vector3(-612.4269, 39.68902, 97.1973) },
	{ model = -656927072, coords = vector3(-575.95, 48.04946, 91.83607) },

	-- DLC: Los Santos The Contract
	{ model = -656927072, coords = vector3(-1017.182, -436.4265, 67.2585) },
	{ model = -656927072, coords = vector3(-1011.75, -435.0921, 72.0585) },
	{ model = -656927072, coords = vector3(380.2575, -69.22025, 106.7604) },
	{ model = -656927072, coords = vector3(384.9384, -72.2832, 111.5604) },
	{ model = -656927072, coords = vector3(-994.3716, -760.9808, 65.29156) },
	{ model = -656927072, coords = vector3(-993.0943, -755.5347, 70.09155) },
	{ model = -656927072, coords = vector3(-588.0742, -706.9901, 116.4024) },
	{ model = -656927072, coords = vector3(-593.5171, -705.6987, 121.2024) },
}

local inTelescope = false
local gameplayCamera = {}
-- discord.gg/5xHA3RY3Fq    zomerx

local camera = nil
local scaleform = nil
local instScaleform = nil
local fov = Config.Zoom.Max
-- discord.gg/5xHA3RY3Fq    zomerx

local maxLeft = 0
local maxRight = 0

-- discord.gg/5xHA3RY3Fq    zomerx

local function DisplayNativeNotification(msg)
	BeginTextCommandThefeedPost("STRING")
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandThefeedPostTicker(false, false)
end
-- discord.gg/5xHA3RY3Fq    zomerx

local function DisplayNotification(msg)
	if Config.UseNativeNotifiactions then
		DisplayNativeNotification(msg)
	else
		exports.mythic_notify:SendAlert('error', msg)
	end
end
-- discord.gg/5xHA3RY3Fq    zomerx

local function DisplayHelpText(msg)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end

local function SetupInstructions()
    instScaleform = RequestScaleformMovie("instructional_buttons")
    while not HasScaleformMovieLoaded(instScaleform) do
        Citizen.Wait(10)
    end
    
    DrawScaleformMovieFullscreen(instScaleform, 255, 255, 255, 0, 0)
    
    PushScaleformMovieFunction(instScaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(instScaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(instScaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    ScaleformMovieMethodAddParamPlayerNameString("~INPUT_TALK~")
    BeginTextCommandScaleformString("STRING")
	AddTextComponentSubstringPlayerName("Sair telescópio")
	EndTextCommandScaleformString(0, 0, 1, -1)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(instScaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(instScaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()
end

local function LoadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
end

local function GetDifference(num1, num2)
	if num1 > num2 then
		return num1 - num2
	else
		return num2 - num1
	end
end

local function RotationToHeading(rotation)
    local heading = rotation
    if heading < 0 then 
        heading = heading*-1 
        heading = heading + GetDifference(heading, 180.0)*2
    end
    return heading
end

local function HeadingToRotation(heading)
    local rotation = heading
    if rotation > 180.0 then
        rotation = 180.0 - GetDifference(rotation, 180.0)
        rotation = rotation*-1 
    end
    return rotation
end

local function CreateTelescopeCamera(entity, data)
    camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    local coords = GetOffsetFromEntityInWorldCoords(entity, data.cameraOffset)
    local rotation = GetEntityRotation(entity, 5).z
    if data.headingOffset then
        rotation = rotation + data.headingOffset 
        if rotation > 360.0 then rotation = rotation - 360.0 end
    end

    SetCamCoord(camera, coords.x, coords.y, coords.z)
    SetCamRot(camera, 0.0, 0.0, rotation, 2)

    SetExtraTimecycleModifier("telescope")

    scaleform = RequestScaleformMovie(data.scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(10)
    end
    local xres,yres = GetActiveScreenResolution()
    BeginScaleformMovieMethod(scaleform, "SET_DISPLAY_CONFIG")
    ScaleformMovieMethodAddParamInt(xres)
    ScaleformMovieMethodAddParamInt(yres)
    ScaleformMovieMethodAddParamInt(5) --_safeTopPercent
    ScaleformMovieMethodAddParamInt(5) --_safeBottomPercent
    ScaleformMovieMethodAddParamInt(5) --_safeLeftPercent
    ScaleformMovieMethodAddParamInt(5) --_safeRightPercent
    ScaleformMovieMethodAddParamBool(GetIsWidescreen())
    ScaleformMovieMethodAddParamBool(GetIsHidef())
    ScaleformMovieMethodAddParamBool(false) --isAsian
    EndScaleformMovieMethod()

    RenderScriptCams(camera, 0, 0, false, false)
end

local function HideHudThisFrame()
	HideHudAndRadarThisFrame()
	HideHudComponentThisFrame(1) -- Wanted Stars
	HideHudComponentThisFrame(2) -- Weapon icon
	HideHudComponentThisFrame(3) -- Cash
	HideHudComponentThisFrame(4) -- MP CASH
	HideHudComponentThisFrame(6)
	HideHudComponentThisFrame(7)
	HideHudComponentThisFrame(8)
	HideHudComponentThisFrame(9)
	HideHudComponentThisFrame(13) -- Cash Change
	HideHudComponentThisFrame(11) -- Floating Help Text
	HideHudComponentThisFrame(12) -- More floating help text
	HideHudComponentThisFrame(15) -- Subtitle Text
	HideHudComponentThisFrame(18) -- Game Stream
	HideHudComponentThisFrame(19) -- Weapon Wheel
end

-- EnumerateEntities made by IllidanS4
-- https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2
local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	local entityEnumerator = {
		__gc = function(enum)
			if enum.destructor and enum.handle then
				enum.destructor(enum.handle)
			end
			enum.destructor = nil
			enum.handle = nil
		end
	}
	
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end
		
		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)
		
		local next = true
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next
		
		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

local function IsPedPlayingAnyTelescopeAnim(ped)
    for animType, animations in pairs(Config.Animations) do 
        for type, animation in pairs(animations) do 
            if type ~= "enterTime" and IsEntityPlayingAnim(ped, "mini@telescope", animation, 3) then
                return true
            end
        end
    end
    return false
end

local function IsTelescopeAvailable(coords)
	local playerPed = GetPlayerPed(-1)
    for ped in EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed) do
        if #(GetEntityCoords(ped)-coords) < 1.0 and ped ~= playerPed then
            if IsPedPlayingAnyTelescopeAnim(ped) then
			    return false
            end
        end
	end
    return true
end

local function HandleZoom()
	if GetDisabledControlNormal(0, 32) ~= 0.0 or GetDisabledControlNormal(0, 335) ~= 0.0 then -- Zoom in
        fov = math.max(fov - Config.Zoom.Speed, Config.Zoom.Min)
    end
    if GetDisabledControlNormal(0, 33) ~= 0.0 or GetDisabledControlNormal(0, 336) ~= 0.0 then -- Zoom out
        fov = math.min(fov + Config.Zoom.Speed, Config.Zoom.Max)
    end
    local current_fov = GetCamFov(camera)
    if math.abs(fov-current_fov) < 0.1 then
        fov = current_fov
    end
    SetCamFov(camera, current_fov + (fov - current_fov)*0.05)
end

local function HandleMovement(maxVertical)
    local rightAxisX = GetDisabledControlNormal(0, 220)
	local rightAxisY = GetDisabledControlNormal(0, 221)

	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
        local zoomValue = (1.0/(Config.Zoom.Max-Config.Zoom.Min))*(fov-Config.Zoom.Min)
        local rotation = GetCamRot(camera, 2)
        local heading = RotationToHeading(rotation.z)
        
        local movementSpeed = (IsUsingKeyboard(1) and Config.MovementSpeed.Keyboard) or Config.MovementSpeed.Controller
        local newX = math.max(math.min(maxVertical, rotation.x + rightAxisY*-1.0*(movementSpeed)*(zoomValue+0.1)), maxVertical*-1)
        local newZ = rotation.z

        if not (heading > maxLeft and rightAxisX < 0.0) and not (heading < maxRight and rightAxisX > 0.0) then
            newZ = rotation.z + rightAxisX*-1.0*(movementSpeed)*(zoomValue+0.1)
        end

		SetCamRot(camera, newX, 0.0, newZ, 2)
	end
end

local function GetClosestTelescope()
    local closest = 0
    local closestDist = Config.MaxDetectionDist
    local coords = GetEntityCoords(GetPlayerPed(-1))

    for model, data in pairs(Config.Models) do
        local entity = GetClosestObjectOfType(coords.x, coords.y, coords.z, Config.MaxDetectionDist, model, false, false, false)
        if entity ~= 0 then
            local entityCoords = GetEntityCoords(entity)
            local dist = #(coords-entityCoords)
            if dist < closestDist then
                closest = entity
                closestDist = dist
            end
        end
    end
   
    return closest
end

local function UseTelescope(entity)
    local playerPed = GetPlayerPed(-1)
    local data = Config.Models[GetEntityModel(entity)]
    local offsetCoords = GetOffsetFromEntityInWorldCoords(entity, data.offset)
    local animation = Config.Animations[data.animation]
    inTelescope = true

    if not IsTelescopeAvailable(offsetCoords) then
        DisplayNotification(Config.TelescopeInUse)
        return
    end

    local heading = GetEntityHeading(entity)
    if data.headingOffset then 
        heading = heading + data.headingOffset
        if heading > 360.0 then heading = heading - 360.0 end
    end

    TaskGoStraightToCoord(playerPed, offsetCoords, 1, 8000, heading, 0.05)

    while true do
        Citizen.Wait(500)
        local taskStatus = GetScriptTaskStatus(playerPed, "SCRIPT_TASK_GO_STRAIGHT_TO_COORD") 
        if taskStatus == 0 or taskStatus == 7 then
            break
        end
    end

    ClearPedTasks(playerPed)
    local difference = GetDifference(heading, GetEntityHeading(playerPed))
    if difference > 10.0 then
        SetEntityHeading(playerPed, heading)
    end

    local dist = #(GetEntityCoords(playerPed)-offsetCoords)
    if dist > 0.3 and dist < 2.5 then
        SetEntityCoords(playerPed, vector3(offsetCoords.x, offsetCoords.y, offsetCoords.z-1.0))
    elseif dist > 2.5 then
        DisplayNotification(Config.ToFarAway)
        ClearPedTasks(playerPed)
        return
    end

    LoadAnimDict("mini@telescope")
    TaskPlayAnim(playerPed, "mini@telescope", animation.enter, 2.0, 2.0, -1, 2, 0, false, false, false)

    gameplayCamera.heading = GetGameplayCamRelativeHeading()
    gameplayCamera.pitch = GetGameplayCamRelativePitch()

    Citizen.Wait(animation.enterTime)
    DoScreenFadeOut(500)
    Citizen.Wait(600)

    TaskPlayAnim(playerPed, "mini@telescope", animation.idle, 2.0, 2.0, -1, 1, 0, false, false, false)
    CreateTelescopeCamera(entity, data)
    SetupInstructions()
    Citizen.CreateThread(function()
        DoScreenFadeIn(500)
    end)

    local tick = 0
    local doAnim = true
    fov = Config.Zoom.Max

    maxLeft = heading+data.MaxHorizontal
    if maxLeft > 360.0 then maxLeft = maxLeft - 360.0 end

    maxRight = heading-data.MaxHorizontal
    if maxRight < 0.0 then maxRight = maxRight + 360.0 end

    while true do
        -- Handle the movement and button inputs every frame
        HandleZoom()
        HandleMovement(data.MaxVertical)

        if IsControlJustPressed(0, 46) then
            break
        end

        -- Only handle "less important" stuff every 100 frames
        if tick >= 100 then
            if #(GetEntityCoords(playerPed)-offsetCoords) > 2.0 or IsEntityDead(playerPed) then
                doAnim = false
                break
            end
            tick = 0
        end

        -- Draw the scaleform
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)

        -- Draw instructions
        DrawScaleformMovieFullscreen(instScaleform, 255, 255, 255, 255, 0)

        -- Hide hud
        HideHudThisFrame()

        tick = tick + 1
        Citizen.Wait(0)
    end

    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
        Citizen.Wait(0)
    end
    Citizen.Wait(150)

    RenderScriptCams(cam, 0, false, 0, false, false)
    DestroyCam(cam, 0)

    ClearExtraTimecycleModifier()
    SetScaleformMovieAsNoLongerNeeded(scaleform)
    SetScaleformMovieAsNoLongerNeeded(instScaleform)

    SetGameplayCamRelativeHeading(gameplayCamera.heading)
    SetGameplayCamRelativePitch(gameplayCamera.pitch, 1.0)

    DoScreenFadeIn(500)
    Citizen.Wait(500)

    if doAnim then
        TaskPlayAnim(playerPed, "mini@telescope", animation.exit, 2.0, 1.0, -1, 0, 0, false, false, false)
        Citizen.Wait(1500)
    else
        ClearPedTasks(playerPed)
    end
    inTelescope = false
    RemoveAnimDict("mini@telescope")
end


-- Targeting --
if Config.UseQTarget or Config.UseQBTarget then
    local models = {}
    local index = 0
    for model, data in pairs(Config.Models) do
        index = index + 1
        models[index] = model
    end

    if Config.UseQTarget then
        exports.qtarget:AddTargetModel(models, {
            options = {
                {
                    icon = Config.Targeting.Icon,
                    label = Config.Targeting.Label,
                    action = function(entity)
                        UseTelescope(entity)
                    end
                },
            },
            distance = Config.MaxInteractionDist
        })
    elseif Config.UseQBTarget then
        exports['qb-target']:AddTargetModel(models, {
            options = {
                {
                    icon = Config.Targeting.Icon,
                    label = Config.Targeting.Label,
                    action = function(entity)
                        UseTelescope(entity)
                    end
                }
            },
            distance = Config.MaxInteractionDist,
        })
    end
end


-- Help Text Thread --
if Config.UseDistanceThread then
    Citizen.CreateThread(function()
        while true do
            local sleep = 500
            local coords = GetEntityCoords(GetPlayerPed(-1))
            local closest = 0
            local distance = 1000

            if not inTelescope then
                for index, data in pairs(Config.Telescopes) do
                    local dist = #(data.coords-coords)
                    if dist < distance then
                        closest = index
                        distance = dist
                    end
                end

                if closest ~= 0 then
                    if distance < Config.MaxInteractionDist then
                        sleep = 0
                        DisplayHelpText(Config.HelpText)
                        if IsControlJustPressed(0, 46) then
                            local telescope = GetClosestTelescope()
                            if telescope ~= 0 then
                                UseTelescope(telescope)
                            else
                                DisplayNotification(Config.NoFoundMessage)
                            end
                        end
                    else
                        sleep = distance*20
                    end
                end
            else
                sleep = 500
            end

            Citizen.Wait(sleep)
        end
    end)
end


-- Commands --
RegisterCommand("telescope", function(source, args, rawCommand)
    local telescope = GetClosestTelescope()
    if telescope ~= 0 then
        UseTelescope(telescope)
    else
        DisplayNotification(Config.NoFoundMessage)
    end
end, false)
