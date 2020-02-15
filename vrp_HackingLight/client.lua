local boxforced = false
local boxhacked = false
local panel1hacked = false
local door1open = false
local statusmachine = 0
local box1hacked = false
local box2hacked = false
local box3hacked = false
local box4hacked = false
local box5hacked = false
local box6hacked = false
local box7hacked = false
local box8hacked = false
local shock = math.random(1,10)
local hacked = false
local lightoff = false
local workersrapaircall = false

local PlayerHasProp = false
local PlayerProps = {}

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if door1open == false then
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 735.66223144531,133.00497436523,80.738441467285-0.95, 5) then 
                Draw3DText(735.66223144531,133.00497436523,80.738441467285-1.600, "~r~Loked", 2, 0.1, 0.1)
            end
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(10000)
        if door1open == false then
            local door = GetClosestObjectOfType(735.66223144531,133.00497436523,80.738441467285, 1.0, 3271519567, false, false, false)
            if door ~= 0 then
                NetworkRequestControlOfEntity(door)
                FreezeEntityPosition(door, true)
            end
        elseif door1open == true then
            local door = GetClosestObjectOfType(735.66223144531,133.00497436523,80.738441467285, 1.0, 3271519567, false, false, false)
            if door ~= 0 then
                NetworkRequestControlOfEntity(door)
                FreezeEntityPosition(door, false)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if boxforced == false then
            DrawMarker(27, 707.48773193359,62.089157104492,83.693786621094-0.97, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 203,213,218, 200, 0, 0, 0, 1)
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 707.48773193359,62.089157104492,83.693786621094-0.97, 1) then
                help_message("Press ~INPUT_FRONTEND_RRIGHT~ to foce the door control box")
                if IsControlJustReleased(1, 194) then
                    loadAnimDict( "random@mugging4" ) 
                    TaskPlayAnim(GetPlayerPed(-1), "random@mugging4", "struggle_loop_b_thief", 8.0, 1.0, 10000, 1, 0, false, false, false)
                    SetEntityHeading(player, 57.59)
                    SetTimeout(10100, function()
                        boxforced = true
                    end)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if boxforced == true then
            if boxhacked == false then
                DrawMarker(27, 707.48773193359,62.089157104492,83.693786621094-0.97, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 203,213,218, 200, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 707.48773193359,62.089157104492,83.693786621094-0.97, 1) then
                    help_message("Press ~INPUT_CONTEXT~ to foce the door control box")
                    if IsControlJustReleased(1, 38) then
                        DrawSpecialText("Cable connection...", 4500)
                        loadAnimDict( "amb@prop_human_bum_bin@base" ) 
                        TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 4500, 2, 0, false, false, false)
                        SetTimeout(5000, function()
                            loadAnimDict( "cellphone@" )
                            TaskPlayAnim(GetPlayerPed(-1), "cellphone@", "cellphone_text_read_base", 8.0, 1.0, 50000, 1, 0, false, false, false)
                            AddPropToPlayer("prop_npc_phone_02", 28422, 0, 0, 0, 0, 0, 0)
                            SetEntityHeading(player, 57.59)
                            TriggerEvent("mhacking:show")
                            TriggerEvent("mhacking:start",7,50,mycb)
                        end)
                    end
                end
            end
        end
    end
end)

function mycb(success, timeremaining)
	if success then
        TriggerEvent('mhacking:hide')
        panel1hacked = true
        boxhacked = true
        DestroyAllProps()
        SetTimeout(1000, function() DestroyAllProps() end)
        ClearPedTasksImmediately(PlayerPedId())
        notify_message("~g~Hacking successful the door has been unlocked!")
        door1open = true
	else
        TriggerEvent('mhacking:hide')
        notify_message("~r~You were unable to access the network!")
        notify_message("~r~Police were warned of a network leak!")
        TriggerServerEvent("hackinglight:callboxpolice")
        ClearPedTasksImmediately(PlayerPedId())
        DestroyAllProps()
        SetTimeout(1000, function() DestroyAllProps() end)
	end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if door1open == true then
            DrawMarker(27, 732.12329101563,134.42192077637,80.754470825195-0.97, 0, 0, 0, 0, 0, 0, 0.701, 0.7001, 0.7001, 93,182,229, 100, 0, 0, 0, 1)
            DrawMarker(27, 722.17779541016,138.48406982422,80.754486083984-0.97, 0, 0, 0, 0, 0, 0, 0.701, 0.7001, 0.7001, 93,182,229, 100, 0, 0, 0, 1)
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 732.12329101563,134.42192077637,80.754470825195-0.97, 2) then
                help_message("Press ~INPUT_CONTEXT~ to enter")
                if IsControlJustReleased(1, 38) then
                    FreezeEntityPosition(player, true)
                    DoScreenFadeOut(500)
                    Citizen.Wait(500)
                    DoScreenFadeIn(500)
                    FreezeEntityPosition(player, false)
                    SetEntityCoords(player, 722.17779541016,138.48406982422,80.754486083984-0.97)
                    SetEntityHeading(player, 54.5)
                end
            end
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 722.17779541016,138.48406982422,80.754486083984-0.97, 2) then 
                help_message("Press ~INPUT_CONTEXT~ to exit")
                if IsControlJustReleased(1, 38) then
                    FreezeEntityPosition(player, true)
                    DoScreenFadeOut(500)
                    Citizen.Wait(500)
                    DoScreenFadeIn(500)
                    FreezeEntityPosition(player, false)
                    SetEntityCoords(player, 732.12329101563,134.42192077637,80.754470825195-0.97)
                    SetEntityHeading(player, 236.5)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if boxforced == true and boxhacked == true and panel1hacked == true and door1open == true then
            if box1hacked == false then
                DrawMarker(27, 711.33001708984,128.11096191406,80.754600524902-0.95, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 255,0,0, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 711.33001708984,128.11096191406,80.754600524902-0.95, 1) then 
                    help_message("Press ~INPUT_CONTEXT~ for destroy the machine")
                    if IsControlJustReleased(1, 38) then
                        if shock == 1 or shock == 10 then
                            local healt = GetEntityHealth(player)
                            box1hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "stungun@standing" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "stungun@standing", "damage", 8.0, 1.0, 7000, 1, 0, false, false, false)
                            setHealth(healt-50)
                        else
                            box1hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "amb@prop_human_bum_bin@base" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 10232, 2, 0, false, false, false)
                        end
                    end
                end 
            end
            if box2hacked == false then
                DrawMarker(27, 707.57055664063,108.64702606201,80.939094543457-0.97, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 255,0,0, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 707.57055664063,108.64702606201,80.939094543457-0.95, 1) then 
                    help_message("Press ~INPUT_CONTEXT~ for destroy the machine")
                    if IsControlJustReleased(1, 38) then
                        if shock == 1 or shock == 10 then
                            local healt = GetEntityHealth(player)
                            box2hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "stungun@standing" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "stungun@standing", "damage", 8.0, 1.0, 7000, 1, 0, false, false, false)
                            setHealth(healt-50)
                        else
                            box2hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "amb@prop_human_bum_bin@base" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 10232, 2, 0, false, false, false)
                        end
                    end
                end 
            end
            if box3hacked == false then
                DrawMarker(27, 697.58483886719,104.33528137207,80.928764343262-0.95, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 255,0,0, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 697.58483886719,104.33528137207,80.928764343262-0.95, 1) then 
                    help_message("Press ~INPUT_CONTEXT~ for destroy the machine")
                    if IsControlJustReleased(1, 38) then
                        if shock == 1 or shock == 10 then
                            local healt = GetEntityHealth(player)
                            box3hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "stungun@standing" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "stungun@standing", "damage", 8.0, 1.0, 7000, 1, 0, false, false, false)
                            setHealth(healt-50)
                        else
                            box3hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "amb@prop_human_bum_bin@base" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 10232, 2, 0, false, false, false)
                        end
                    end
                end 
            end
            if box4hacked == false then
                DrawMarker(27, 658.77978515625,114.72064208984,80.922927856445-0.95, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 255,0,0, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 658.77978515625,114.72064208984,80.922927856445-0.95, 1) then 
                    help_message("Press ~INPUT_CONTEXT~ for destroy the machine")
                    if IsControlJustReleased(1, 38) then
                        if shock == 1 or shock == 10 then
                            local healt = GetEntityHealth(player)
                            box4hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "stungun@standing" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "stungun@standing", "damage", 8.0, 1.0, 7000, 1, 0, false, false, false)
                            setHealth(healt-50)
                        else
                            box4hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "amb@prop_human_bum_bin@base" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 10232, 2, 0, false, false, false)
                        end
                    end
                end 
            end
            if box5hacked == false then
                DrawMarker(27, 664.40356445313,130.21142578125,80.950202941895-0.95, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 255,0,0, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 664.40356445313,130.21142578125,80.950202941895-0.95, 1) then 
                    help_message("Press ~INPUT_CONTEXT~ for destroy the machine")
                    if IsControlJustReleased(1, 38) then
                        if shock == 1 or shock == 10 then
                            local healt = GetEntityHealth(player)
                            box5hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "stungun@standing" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "stungun@standing", "damage", 8.0, 1.0, 7000, 1, 0, false, false, false)
                            setHealth(healt-50)
                        else
                            box5hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "amb@prop_human_bum_bin@base" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 10232, 2, 0, false, false, false)
                        end
                    end
                end 
            end
            if box6hacked == false then
                DrawMarker(27, 672.12487792969,145.16604614258,80.941864013672-0.95, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 255,0,0, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 672.12487792969,145.16604614258,80.941864013672-0.95, 1) then 
                    help_message("Press ~INPUT_CONTEXT~ for destroy the machine")
                    if IsControlJustReleased(1, 38) then
                        if shock == 1 or shock == 10 then
                            local healt = GetEntityHealth(player)
                            box6hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "stungun@standing" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "stungun@standing", "damage", 8.0, 1.0, 7000, 1, 0, false, false, false)
                            setHealth(healt-50)
                        else
                            box6hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "amb@prop_human_bum_bin@base" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 10232, 2, 0, false, false, false)
                        end
                    end
                end 
            end
            if box7hacked == false then
                DrawMarker(27, 674.23449707031,155.68727111816,80.936531066895-0.95, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 255,0,0, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 674.23449707031,155.68727111816,80.936531066895-0.95, 1) then 
                    help_message("Press ~INPUT_CONTEXT~ for destroy the machine")
                    if IsControlJustReleased(1, 38) then
                        if shock == 1 or shock == 10 then
                            local healt = GetEntityHealth(player)
                            box7hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "stungun@standing" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "stungun@standing", "damage", 8.0, 1.0, 7000, 1, 0, false, false, false)
                            setHealth(healt-50)
                        else
                            box7hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "amb@prop_human_bum_bin@base" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 10232, 2, 0, false, false, false)
                        end
                    end
                end 
            end
            if box8hacked == false then
                DrawMarker(27, 700.15966796875,168.87678527832,80.950202941895-0.95, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 255,0,0, 50, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 700.15966796875,168.87678527832,80.950202941895-0.95, 1) then 
                    help_message("Press ~INPUT_CONTEXT~ for destroy the machine")
                    if IsControlJustReleased(1, 38) then
                        if shock == 1 or shock == 10 then
                            local healt = GetEntityHealth(player)
                            box8hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "stungun@standing" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "stungun@standing", "damage", 8.0, 1.0, 7000, 1, 0, false, false, false)
                            setHealth(healt-50)
                        else
                            box8hacked = true
                            statusmachine = statusmachine+1
                            loadAnimDict( "amb@prop_human_bum_bin@base" ) 
                            TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 10232, 2, 0, false, false, false)
                        end
                    end
                end 
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if lightoff == true and hacked == true and workersrapaircall == false then
            DrawMarker(27, 710.66046142578,165.2922668457,80.754539489746-0.95, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 255,0,0, 50, 0, 0, 0, 1)
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 710.66046142578,165.2922668457,80.754539489746-0.95, 1) then 
                help_message("Press ~INPUT_CONTEXT~ for the workers who come to repair the control units")
                if IsControlJustReleased(1, 38) then
                    TriggerServerEvent('hackinglight:requestpermissionrapair')
                end
            end
        end
    end
end)

RegisterNetEvent('hackinglight:requestpermissionrapairsucc')
AddEventHandler('hackinglight:requestpermissionrapairsucc', function()
    local player = GetPlayerPed(-1)
    local playerLoc = GetEntityCoords(player)
    loadAnimDict( "cellphone@" )
    TaskPlayAnim(GetPlayerPed(-1), "cellphone@", "cellphone_call_listen_base", 8.0, 1.0, 50000, 1, 0, false, false, false)
    AddPropToPlayer("prop_npc_phone_02", 28422, 0, 0, 0, 0, 0, 0)
    DrawSpecialText("Calling on the phone...", 15000)
    SetTimeout(15000, function()
        ClearPedTasksImmediately(PlayerPedId())
        DestroyAllProps()
        SetTimeout(1000, function() DestroyAllProps() end)
        workersrapaircall = true
        notify_message("You called ~r~Worker")
        SetTimeout(1000, function()
            notifypicture_message("CHAR_JIMMY_BOSTON", 2, "New message", false, "We are preparing the equipment and we are coming!")
            SetTimeout(65000, function()
                notifypicture_message("CHAR_JIMMY_BOSTON", 2, "New message", false, "We are going to get to repair the ECUs")
                Citizen.Wait(5000)
                Workerped()
            end)
        end)
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if box1hacked == true and box2hacked == true and box3hacked == true and box4hacked == true and box5hacked == true and box6hacked == true and box7hacked == true and box8hacked == true and statusmachine == 8 then
            hacked = true
            lightoff = true
        end 
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        if lightoff == true then
            SetBlackout(true)
        elseif lightoff == false then
            SetBlackout(false)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if door1open == true then
            DrawMarker(27, 718.68060302734,152.48046875,80.754486083984-0.95, 0, 0, 0, 0, 0, 0, 0.501, 0.5001, 0.5001, 255,255,255, 200, 0, 0, 0, 1)
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 718.68060302734,152.48046875,80.754486083984-0.95, 2) then 
                DrawSpecialText("Destroyed machine... (" .. statusmachine .. "/8)")
                Draw3DText(718.68060302734,152.48046875,80.754486083984-1.600, "Destroyed machine... (" .. statusmachine .. "/8)", 4, 0.1, 0.1)
            end 
        end
    end
end)

function Workerped()
    Citizen.Wait(10000)
    local Hash = GetHashKey("s_m_y_dockwork_01")
    local Ped = CreatePed(1, Hash, 711.33001708984, 128.11096191406, 80.754600524902-0.95, 0.0, false, true)
    if not HasModelLoaded(Hash) then
        RequestModel(Hash)
        Citizen.Wait(200)
    end
    SetEntityHeading(Ped, 164.5)
    FreezeEntityPosition(Ped, true)
    SetTimeout(1000, function()
        loadAnimDict( "amb@prop_human_bum_bin@base" ) 
        TaskPlayAnim(Ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, 30232, 2, 0, false, false, false)
        SetTimeout(30232, function()
            loadAnimDict( "missheistdockssetup1clipboard@base" )
            TaskPlayAnim(Ped, "missheistdockssetup1clipboard@base", "base", 8.0, 1.0, 30232, 2, 0, false, false, false)
            SetTimeout(37232, function()
                SetEntityCoords(Ped, 717.71343994141,152.83018493652,80.754486083984-0.95)
                Citizen.Wait(1000)
                SetEntityHeading(Ped, 333.3)
                SetTimeout(1000, function()
                    loadAnimDict( "amb@prop_human_atm@male@enter" ) 
                    TaskPlayAnim(Ped, "amb@prop_human_atm@male@enter", "enter", 8.0, 1.0, -1, 2, 0, false, false, false)
                    SetTimeout(5000, function()
                        SetEntityCoords(Ped, 717.71343994141,152.83018493652,80.754486083984-3)
                        FreezeEntityPosition(Ped, false)
                        boxforced = false
                        boxhacked = false
                        panel1hacked = false
                        door1open = false
                        statusmachine = 0 
                        box1hacked = false
                        box2hacked = false
                        box3hacked = false
                        box4hacked = false
                        box5hacked = false
                        box6hacked = false
                        box7hacked = false
                        box8hacked = false
                        hacked = false
                        lightoff = false
                        workersrapaircall = false
                    end)
                end)
            end)
        end)
    end)
end

Citizen.CreateThread(function()
    infoblip = AddBlipForCoord(707.48773193359,62.089157104492,83.693786621094-0.97)
    SetBlipSprite(infoblip, 544)
    SetBlipDisplay(infoblip, 4)
    SetBlipScale(infoblip, 0.9)
    SetBlipColour(infoblip, 0)
    SetBlipAsShortRange(infoblip, true)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Turn off city light")
    EndTextCommandSetBlipName(infoblip)
end)

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

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait(5)
    end
end

function notifypicture_message(icon, type, sender, title, text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    SetNotificationMessage(icon, icon, true, type, sender, title, text)
    DrawNotification(false, true)
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

function setHealth(health)
    local n = math.floor(health)
    SetEntityHealth(GetPlayerPed(-1),n)
end

--
-- Extract of script Holograms / Floating text Script by Meh
--

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov   
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        SetBlackout(false)
        DestroyAllProps()
        local door = GetClosestObjectOfType(735.66223144531,133.00497436523,80.738441467285, 1.0, 3271519567, false, false, false)
        if door ~= 0 then
            NetworkRequestControlOfEntity(door)
            FreezeEntityPosition(door, true)
        end
    end
end)