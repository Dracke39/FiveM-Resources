-- 14 minutes 33 seconds Without opening the cash desk in the offices and without police or negotiations
-- 16 minutes 14 seconds Also robbing the cashier in the office but without bargaining or disturbing the police

statusbox1 = false
statusbox2 = false
statusbox3 = false
statusbox4 = false
statusbox5 = false
statusbox6 = false
robbing = false
robbed = false
canrob = true
updoorcloused = true
caveaucloused = true
drill = 0
PlayerHasProp = false
PlayerProps = {}

local player = GetPlayerPed(-1)
local playerLoc = GetEntityCoords(player)

-- Door status function

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(10000)
        if updoorcloused == false then
            local door = GetClosestObjectOfType(261.84136962891,222.05204772949,106.28380584717, 1.0, 746855201, false, false, false)
            local door2 = GetClosestObjectOfType(265.55120849609,217.76226806641,110.28303527832, 1.0, 1956494919, false, false, false)
            local door3 = GetClosestObjectOfType(256.87606811523,206.79135131836,110.28302001953, 1.0, 1956494919, false, false, false)
            if door ~= 0 then
                NetworkRequestControlOfEntity(door)
                FreezeEntityPosition(door, false)
            end
            if door2 ~= 0 then
                NetworkRequestControlOfEntity(door2)
                FreezeEntityPosition(door2, false)
            end
            if door3 ~= 0 then
                NetworkRequestControlOfEntity(door3)
                FreezeEntityPosition(door3, false)
            end
        elseif updoorcloused == true then
            local door = GetClosestObjectOfType(261.84136962891,222.05204772949,106.28380584717, 1.0, 746855201, false, false, false)
            local door2 = GetClosestObjectOfType(265.55120849609,217.76226806641,110.28303527832, 1.0, 1956494919, false, false, false)
            local door3 = GetClosestObjectOfType(256.87606811523,206.79135131836,110.28302001953, 1.0, 1956494919, false, false, false)
            if door ~= 0 then
                NetworkRequestControlOfEntity(door)
                FreezeEntityPosition(door, true)
            end
            if door2 ~= 0 then
                NetworkRequestControlOfEntity(door2)
                FreezeEntityPosition(door2, true)
            end
            if door3 ~= 0 then
                NetworkRequestControlOfEntity(door3)
                FreezeEntityPosition(door3, true)
            end
        end
    end
end)

-- Caveou status function

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(10000)
        if caveaucloused == false then
            local door = GetClosestObjectOfType(254.03179931641,224.15879821777,101.88326263428, 1.0, 961976194, false, false, false)
            local door2 = GetClosestObjectOfType(252.61108398438,221.16389465332,101.68344116211, 1.0, 2786611474, false, false, false)
            if door ~= 0 then
                SetEntityHeading(door, 1)
            end
            if door2 ~= 0 then
                NetworkRequestControlOfEntity(door2)
                FreezeEntityPosition(door2, false)
            end
        elseif caveaucloused == true then
            local door2 = GetClosestObjectOfType(252.61108398438,221.16389465332,101.68344116211, 1.0, 2786611474, false, false, false)
            if door2 ~= 0 then
                NetworkRequestControlOfEntity(door2)
                FreezeEntityPosition(door2, true)
            end
        end
    end
end)

-- Door open

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if canrob == true then
            if updoorcloused == true then
                DrawMarker(27, 261.92630004883,223.17308044434,106.28411102295-0.95, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 0, 0, 100, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 261.92630004883,223.17308044434,106.28411102295-0.95, 1) then
                    help_message("Press ~INPUT_CONTEXT~ to start hacking")
                    if IsControlJustReleased(1, 38) then
                        TriggerServerEvent('centralbankrobberry:phone1')
                    end
                end
            end
        end
    end
end)

function mycb(success, timeremaining)
	if success then
        TriggerEvent('mhacking:hide')
        updoorcloused = false
        TriggerServerEvent('centralbankrobberry:callpolicerobberrydoor')
	else
        TriggerEvent('mhacking:hide')
        notify_message("~r~You failed to hack the doors")
        TriggerServerEvent('centralbankrobberry:callpolicerobberrydoor')
	end
end

RegisterNetEvent('centralbankrobberry:phoneclient1')
AddEventHandler('centralbankrobberry:phoneclient1', function()
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start",7,60,mycb)
    robbed = true
end)

-- Caveau open

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if updoorcloused == false then
        if caveaucloused == true then
            DrawMarker(27, 253.39796447754,228.35009765625,101.68325042725-0.95, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 0, 0, 100, 0, 0, 0, 1)
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 253.39796447754,228.35009765625,101.68325042725-0.95, 1) then
                help_message("Press ~INPUT_CONTEXT~ to start hacking")
                if IsControlJustReleased(1, 38) then
                    TriggerServerEvent('centralbankrobberry:phone2')
                end
            end
        end
        end
    end
end)

function mycb2(success, timeremaining)
	if success then
        TriggerEvent('mhacking:hide')
        notify_message("~g~You managed to hack all the ports")
        SetTimeout(10000, function()
            TriggerServerEvent('InteractSound_SV:PlayOnSource', 'allarm', 0.1)
            TriggerServerEvent('centralbankrobberry:callpolicerobberryvault')
        end)
        caveaucloused = false
        robbing = true
        robbingfinish = false
	else
        TriggerEvent('mhacking:hide')
        notify_message("~r~You failed to hack the doors")
        SetTimeout(10000, function()
            TriggerServerEvent('InteractSound_SV:PlayOnSource', 'allarm', 0.1)
            TriggerServerEvent('centralbankrobberry:callpolicerobberryvault')
        end)
	end
end

RegisterNetEvent('centralbankrobberry:phoneclient2')
AddEventHandler('centralbankrobberry:phoneclient2', function()
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start",7,60,mycb2)
    robbed = true
end)

-- Clouse all door police

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if updoorcloused == false then
            DrawMarker(27, 256.15243530273,222.64448547363,106.28665924072-0.95, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 0, 0, 100, 0, 0, 0, 1)
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 256.15243530273,222.64448547363,106.28665924072-0.95, 1) then
                help_message("Press ~INPUT_CONTEXT~ to close all the automatic doors of the bank")
                if IsControlJustReleased(1, 38) then
                    TriggerServerEvent('centralbankrobberry:policecheckpermdoor')
                end
            end
        end
    end
end)

RegisterNetEvent('centralbankrobberry:policecheckpermdoorSUCC')
AddEventHandler('centralbankrobberry:policecheckpermdoorSUCC', function()
    notify_message("~r~All the doors of the bank are closing automatically!")
    notify_message("~r~Closing is expected in 10 seconds!")
    SetTimeout(10000, function()
        updoorcloused = true
        notify_message("~r~Closing completed!")
    end)
    SetTimeout(50000, function()
        local door2 = GetClosestObjectOfType(252.61108398438,221.16389465332,101.68344116211, 1.0, 2786611474, false, false, false)
        if door2 ~= 0 then
            NetworkRequestControlOfEntity(door2)
            FreezeEntityPosition(door2, true)
        end
        caveaucloused = true
        notify_message("~r~Closing vault successful!")
        SetTimeout(15000, function()
            robbingfinish = true
        end)
    end)
end)

-- Drill box

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if robbing == true then
            if statusbox1 == false then
                DrawMarker(20, 257.6257019043,214.40907287598,101.68344116211, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 255, 255, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 257.6257019043,214.40907287598,101.68344116211-0.95, 1.3) then
                    help_message("Press ~INPUT_CONTEXT~ to drill the box")
                    if IsControlJustReleased(1, 38) then
                        TriggerServerEvent('centralbankrobberry:checkdrill1')
                    end
                end
            end
            if statusbox2 == false then
                DrawMarker(20, 259.89172363281,217.94772338867,101.68343353271, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 255, 255, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 259.89172363281,217.94772338867,101.68343353271-0.95, 1.3) then
                    help_message("Press ~INPUT_CONTEXT~ to drill the box")
                    if IsControlJustReleased(1, 38) then
                        TriggerServerEvent('centralbankrobberry:checkdrill2')
                    end
                end
            end
            if statusbox3 == false then
                DrawMarker(20, 264.28872680664,211.91584777832,101.68335723877, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 255, 255, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 264.28872680664,211.91584777832,101.68335723877-0.95, 1.3) then
                    help_message("Press ~INPUT_CONTEXT~ to drill the box")
                    if IsControlJustReleased(1, 38) then
                        TriggerServerEvent('centralbankrobberry:checkdrill3')
                    end
                end
            end
            if statusbox4 == false then
                DrawMarker(20, 263.29931640625,216.5632019043,101.68338775635, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 255, 255, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 263.29931640625,216.5632019043,101.68338775635-0.95, 1.3) then
                    help_message("Press ~INPUT_CONTEXT~ to drill the box")
                    if IsControlJustReleased(1, 38) then
                        TriggerServerEvent('centralbankrobberry:checkdrill4')
                    end
                end
            end
            if statusbox5 == false then
                DrawMarker(20, 265.98706054688,213.27047729492,101.68346405029, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 255, 255, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 265.98706054688,213.27047729492,101.68346405029-0.95, 1.3) then
                    help_message("Press ~INPUT_CONTEXT~ to drill the box")
                    if IsControlJustReleased(1, 38) then
                        TriggerServerEvent('centralbankrobberry:checkdrill5')
                    end
                end
            end
            if statusbox6 == false then
                DrawMarker(20, 264.40725708008,208.92994689941,110.2876739502, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 255, 255, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 264.40725708008,208.92994689941,110.2876739502-0.95, 1.3) then
                    help_message("Press ~INPUT_CONTEXT~ to open the drawer")
                    if IsControlJustReleased(1, 38) then
                        TriggerServerEvent('centralbankrobberry:checkdrill6')
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('centralbankrobberry:boxuse1')
AddEventHandler('centralbankrobberry:boxuse1', function()
    SetEntityCoords(player, 257.23168945313,214.84596252441,101.68336486816)
    SetEntityHeading(player, 155.43)
    loadAnimDict( "anim@heists@fleeca_bank@drilling" ) 
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@fleeca_bank@drilling", "drill_straight_start", 8.0, 1.0, 139000, 2, 0, false, false, false)
    AddPropToPlayer("hei_prop_heist_drill", 28422, 0, 0, 0, 0, 0, 0)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'drill', 0.1)
    statusbox1 = true
    drill = drill+1
    DrawSpecialText("Drilling... (".. drill .. "/6)", 139000)
    SetTimeout(139200 ,function()
        DestroyAllProps()
        TriggerServerEvent('centralbankrobberry:give')
        loadAnimDict( "amb@prop_human_bum_bin@base" ) 
        TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 3000, 2, 0, false, false, false)
    end)
end)

RegisterNetEvent('centralbankrobberry:boxuse2')
AddEventHandler('centralbankrobberry:boxuse2', function()
    SetEntityCoords(player, 259.77404785156,217.56546020508,101.68016052246)
    SetEntityHeading(player, 342.9)
    loadAnimDict( "anim@heists@fleeca_bank@drilling" ) 
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@fleeca_bank@drilling", "drill_straight_start", 8.0, 1.0, 139000, 2, 0, false, false, false)
    AddPropToPlayer("hei_prop_heist_drill", 28422, 0, 0, 0, 0, 0, 0)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'drill', 0.1)
    statusbox2 = true
    drill = drill+1
    DrawSpecialText("Drilling... (".. drill .. "/6)", 139000)
    SetTimeout(139200 ,function()
        DestroyAllProps()
        TriggerServerEvent('centralbankrobberry:give')
        loadAnimDict( "amb@prop_human_bum_bin@base" ) 
        TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 3000, 2, 0, false, false, false)
    end)
end)

RegisterNetEvent('centralbankrobberry:boxuse3')
AddEventHandler('centralbankrobberry:boxuse3', function()
    SetEntityCoords(player, 264.43585205078,212.34107971191,101.68003082275)
    SetEntityHeading(player, 160.92)
    loadAnimDict( "anim@heists@fleeca_bank@drilling" ) 
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@fleeca_bank@drilling", "drill_straight_start", 8.0, 1.0, 139000, 2, 0, false, false, false)
    AddPropToPlayer("hei_prop_heist_drill", 28422, 0, 0, 0, 0, 0, 0)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'drill', 0.1)
    statusbox3 = true
    drill = drill+1
    DrawSpecialText("Drilling... (".. drill .. "/6)", 139000)
    SetTimeout(139200 ,function()
        DestroyAllProps()
        TriggerServerEvent('centralbankrobberry:giveover')
        loadAnimDict( "amb@prop_human_bum_bin@base" ) 
        TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 3000, 2, 0, false, false, false)
    end)
end)

RegisterNetEvent('centralbankrobberry:boxuse4')
AddEventHandler('centralbankrobberry:boxuse4', function()
    SetEntityCoords(player, 263.19622802734,216.28149414063,101.68132781982)
    SetEntityHeading(player, 348.90)
    loadAnimDict( "anim@heists@fleeca_bank@drilling" ) 
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@fleeca_bank@drilling", "drill_straight_start", 8.0, 1.0, 139000, 2, 0, false, false, false)
    AddPropToPlayer("hei_prop_heist_drill", 28422, 0, 0, 0, 0, 0, 0)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'drill', 0.1)
    statusbox4 = true
    drill = drill+1
    DrawSpecialText("Drilling... (".. drill .. "/6)", 139000)
    SetTimeout(139200 ,function()
        DestroyAllProps()
        TriggerServerEvent('centralbankrobberry:giveover')
        loadAnimDict( "amb@prop_human_bum_bin@base" ) 
        TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 3000, 2, 0, false, false, false)
    end)
end)

RegisterNetEvent('centralbankrobberry:boxuse5')
AddEventHandler('centralbankrobberry:boxuse5', function()
    SetEntityCoords(player, 265.70397949219,213.3698425293,101.68143463135)
    SetEntityHeading(player, 250.66)
    loadAnimDict( "anim@heists@fleeca_bank@drilling" ) 
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@fleeca_bank@drilling", "drill_straight_start", 8.0, 1.0, 139000, 2, 0, false, false, false)
    AddPropToPlayer("hei_prop_heist_drill", 28422, 0, 0, 0, 0, 0, 0)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'drill', 0.1)
    statusbox5 = true
    drill = drill+1
    DrawSpecialText("Drilling... (".. drill .. "/6)", 139000)
    SetTimeout(139200 ,function()
        DestroyAllProps()
        TriggerServerEvent('centralbankrobberry:giveover')
        loadAnimDict( "amb@prop_human_bum_bin@base" ) 
        TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 3000, 2, 0, false, false, false)
    end)
end)

RegisterNetEvent('centralbankrobberry:boxuse6')
AddEventHandler('centralbankrobberry:boxuse6', function()
    SetEntityCoords(player, 264.40725708008,208.92994689941,110.2876739502)
    SetEntityHeading(player, 324.59)
    loadAnimDict( "amb@prop_human_bum_bin@base" ) 
    TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 80200, 2, 0, false, false, false)
    statusbox6 = true
    drill = drill+1
    DrawSpecialText("Searching... (".. drill .. "/6)", 80400)
    SetTimeout(80400 ,function()
        DestroyAllProps()
        TriggerServerEvent('centralbankrobberry:givedocs')
    end)
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if drill == 6 then
            Citizen.Wait(50000)
            drill = 0
        end
    end
end)

-- Finish robberry 60 minutes

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if robbed == true then
            SetTimeout(3600000, function()
                robbed = false
                canrob = true
            end)
            DrawMarker(27, 261.92630004883,223.17308044434,106.28411102295-0.95, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 0, 0, 100, 0, 0, 0, 1)
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 261.92630004883,223.17308044434,106.28411102295-0.95, 2) then
                help_message("The bank has already been robbed a short time ago! Come back later.")
            end
        end
    end
end)

-- Help police call
policecalled = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        DrawMarker(20, 244.79832458496,225.91496276855,106.28783416748-0.50, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 89, 174, 74, 50, 0, 0, 0, 1)
        if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 244.79832458496,225.91496276855,106.28783416748-0.95, 1.3) then
            if policecalled == false then
                help_message("Press ~INPUT_CONTEXT~ to trigger the alarm")
                if IsControlJustReleased(1, 38) then
                    notifypicture_message("CHAR_CALL911", 2, "Gruppe6Alarm", false, "The police have been warned that they are arriving in the shortest possible time!")
                    policecalled = true
                    TriggerServerEvent('centralbankrobberry:callpolicebutton')
                    SetTimeout(300000, function()
                        policecalled = false
                    end)
                end
            elseif policecalled == true then
                help_message("~r~The police have already been warned not to fill her up with calls because there may be complications!")
            end
        end 
    end
end)

-- Timed doors police

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if updoorcloused == true then
            DrawMarker(27, 264.9612121582,218.630859375,110.28308868408-0.95, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 0, 0, 100, 0, 0, 0, 1)
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 264.9612121582,218.630859375,110.28308868408-0.95, 1) then
                help_message("Press ~INPUT_CONTEXT~ to open all doors for a limited time of 5 minutes")
                if IsControlJustReleased(1, 38) then
                    TriggerServerEvent('centralbankrobberry:policetimeddoortimed')
                end
            end
        end
    end
end)

RegisterNetEvent('centralbankrobberry:policetimeddoorSUCC')
AddEventHandler('centralbankrobberry:policetimeddoorSUCC', function()
    updoorcloused = false
    notify_message("~r~All the doors have been opened! Time remaining before automatic closing 5 minutes.")
    SetTimeout(150000, function()
        notify_message("~r~Time left before doors close is 2 minutes 30 seconds!")
        SetTimeout(140000, function()
            notify_message("~r~Time left before doors close is 10 seconds!")
            SetTimeout(10000, function()
                updoorcloused = true
                notify_message("~r~Closing completed!")
            end)
        end)
    end)
end)

-- Hide bank documents

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        DrawMarker(27, -543.97747802734,-1798.7972412109,22.374166488647-0.95, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 255, 255, 100, 0, 0, 0, 1)
        if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -543.97747802734,-1798.7972412109,22.374166488647-0.95, 1) then
            help_message("Press ~INPUT_CONTEXT~ to hide documents")
            if IsControlJustReleased(1, 38) then
                TriggerServerEvent('centralbankrobberry:checkdocs')
            end
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        DrawMarker(27, 245.01211547852,-1966.6773681641,21.961658477783-0.95, 0, 0, 0, 0, 0, 0, 0.401, 0.401, 0.401, 255, 255, 255, 100, 0, 0, 0, 1)
        if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 245.01211547852,-1966.6773681641,21.961658477783-0.95, 1) then
            help_message("Pess to clean\n~INPUT_CONTEXT~ 1$\n~INPUT_ARREST~ 1.000$\n~INPUT_SPECIAL_ABILITY_SECONDARY~ 100.000$")
            if IsControlJustReleased(1, 38) then
                TriggerServerEvent('centralbankrobberry:cleanmoney1')
            elseif IsControlJustReleased(1, 49) then
                TriggerServerEvent('centralbankrobberry:cleanmoney1000')
            elseif IsControlJustReleased(1, 74) then
                TriggerServerEvent('centralbankrobberry:cleanmoney100000')
            end
        end
    end
end)

-- Blip maps

Citizen.CreateThread(function()
    blip = AddBlipForCoord(258.53598022461,216.23875427246,101.6834487915)
    SetBlipSprite(blip, 276)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 0)
    SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Central bank robbery")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    blip = AddBlipForCoord(-543.97747802734,-1798.7972412109,22.374166488647)
    SetBlipSprite(blip, 525)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.6)
    SetBlipColour(blip, 0)
    SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Bank documents hiding place")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    blip = AddBlipForCoord(245.01211547852,-1966.6773681641,21.961658477783)
    SetBlipSprite(blip, 500)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 2)
    SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Cleaning dirty money")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    blip = AddBlipForCoord(244.79832458496,225.91496276855,106.28783416748)
    SetBlipSprite(blip, 428)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.6)
    SetBlipColour(blip, 1)
    SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Bank emergency button")
    EndTextCommandSetBlipName(blip)
end)

-- Function

function position_verf(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function help_message(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function notify_message(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

function notifypicture_message(icon, type, sender, title, text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    SetNotificationMessage(icon, icon, true, type, sender, title, text)
    DrawNotification(false, true)
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait(5)
    end
end

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
      RequestModel(GetHashKey(model))
      Wait(10)
    end
end
  
function DestroyAllProps()
    for _,v in pairs(PlayerProps) do
      DeleteEntity(v)
    end
    PlayerHasProp = false
end
  
function AddPropToPlayer(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
    local Player = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(Player))
  
    if not HasModelLoaded(prop1) then
      LoadPropDict(prop1)
    end
  
    prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
    table.insert(PlayerProps, prop)
    PlayerHasProp = true
    SetModelAsNoLongerNeeded(prop1)
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
      DestroyAllProps()
    end
end)

-- THE USE OF THESE COMMANDS IS NOT RECOMANDED

--[[RegisterCommand('bankdooropen', function(source)
    updoorcloused = false
end)

RegisterCommand('bankdoorcloused', function(source)
    updoorcloused = true
end)

RegisterCommand('bankrobberrystop', function(source)
    robbing = false
    robbed = false
end)

RegisterCommand('bankrobberrystart', function(source)
    robbing = true
    robbed = true
end)

RegisterCommand('bankcaveaucloused', function(source)
    caveaucloused = true
end)

RegisterCommand('bankcaveauopen', function(source)
    caveaucloused = false
end)--]]
