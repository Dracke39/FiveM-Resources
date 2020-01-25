positions = {
    --{{Teleport Marker-BLip 1 X, Teleport Marker-Blip 1 Y, Teleport Marker-Blip 1 Z, Teleport Marker 1 Heading}, {Teleport 2 X, Teleport 2 Y, Teleport 2 Z, Teleport 2 Heading}, {Red, Green, Blue}, "Text for Teleport", Vehicle can, Marker type, Blip status, {Blip id, Blip scale, Blip colour, Blip show text}, Press Key}
    -- Marker Types: https://docs.fivem.net/docs/game-references/markers/
    -- Blips types, colour: https://docs.fivem.net/docs/game-references/blips/
    -- Press key types: https://docs.fivem.net/docs/game-references/controls/
    -- Blip scale optimal is 0.9
    -- Vehicle can: true or false
    -- Blip status: true or false
    
    {{240.82308959961,-1379.2537841797,32.74, 0}, {275.44412231445,-1361.4147949219,23.74, 0},{36,237,157}, "Press ~INPUT_CONTEXT~ to enter the morgue", false, 27, false, {12,0.9,0,"Location teleport name"}, 38, {1.501, 1.5001, 0.5001}},
    {{275.44412231445,-1361.4147949219,23.74, 0}, {240.82308959961,-1379.2537841797,32.74, 0},{36,237,157}, "Press ~INPUT_CONTEXT~ to get out of the morgue", false, 27, false, {12,0.9,0,"Location teleport name"}, 38, {1.501, 1.5001, 0.5001}},
    {{405.68246459961,-975.96734619141,-100.004180908203, 0}, {436.17590332031,-997.45428466797,25.757606506348, 180.0},{36,237,157}, "Press ~INPUT_CONTEXT~ to get out of the police garage", true, 27, false, {12,0.9,0,"Location teleport name"}, 38, {1.501, 1.5001, 0.5001}},
    {{452.2995300293,-997.24291992188,25.0, 0}, {405.68246459961,-975.96734619141,-100.004180908203, 0},{36,237,157}, "Press ~INPUT_CONTEXT~ to enter the police garage", true, 27, false, {12,0.9,0,"Location teleport name"}, 38, {1.501, 1.5001, 0.5001}},
    {{452.2173767089,-988.19927978516,25.724211502075, 0}, {405.68246459961,-975.96734619141,-100.004180908203, 0},{36,237,157}, "Press ~INPUT_CONTEXT~ to enter the police garage", false, 27, false, {12,0.9,0,"Location teleport name"}, 38, {1.501, 1.5001, 0.5001}},
}

vehicle_message = "~r~You can't do it with the vehicle!"
novehcile_message = "~r~You are entering/leaving without a vehicle"

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for _,location in ipairs(positions) do
            teleport_text = location[4]
            pos1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            pos2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }
            ColorRed = location[3][1]
            ColorGreen = location[3][2]
            ColorBlue = location[3][3]

            vechicle = location[5]
            MarkerType = location[6]

            PressKey = location[9]

            range = {
                p1=location[10][1],
                p2=location[10][2],
                p3=location[10][3],
            }

            DrawMarker(MarkerType, pos1.x, pos1.y, pos1.z, 0, 0, 0, 0, 0, 0, range.p1, range.p2, range.p3, ColorRed, ColorGreen, ColorBlue, 200, 0, 0, 0, 1)

            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, pos1.x, pos1.y, pos1.z, 2) then 
                help_message(teleport_text)
                if IsControlJustReleased(1, PressKey) then
                    if vechicle == true then
                        if IsPedInAnyVehicle(player, true) then
                            FreezeEntityPosition(player, true)
                            DoScreenFadeOut(500)
                            Citizen.Wait(500)
                            DoScreenFadeIn(500)
                            FreezeEntityPosition(player, false)
                            SetEntityCoords(GetVehiclePedIsUsing(player), pos2.x, pos2.y, pos2.z)
                            SetEntityHeading(GetVehiclePedIsUsing(player), pos2.heading)
                        else
                            FreezeEntityPosition(player, true)
                            DoScreenFadeOut(500)
                            Citizen.Wait(500)
                            DoScreenFadeIn(500)
                            FreezeEntityPosition(player, false)
                            SetEntityCoords(player, pos2.x, pos2.y, pos2.z)
                            SetEntityHeading(player, pos2.heading)
                            notify_message(novehcile_message)
                        end
                    elseif vechicle == false then
                        if IsPedInAnyVehicle(player, true) then
                            notify_message(vehicle_message)
                        else
                            FreezeEntityPosition(player, true)
                            DoScreenFadeOut(500)
                            Citizen.Wait(500)
                            DoScreenFadeIn(500)
                            FreezeEntityPosition(player, false)
                            SetEntityCoords(player, pos2.x, pos2.y, pos2.z)
                            SetEntityHeading(player, pos2.heading)
                        end
                    end
                end
            end          
        end
    end
end)

Citizen.CreateThread(function()
    for _,location in ipairs(positions) do

        pos1 = {
            x=location[1][1],
            y=location[1][2],
            z=location[1][3],
            heading=location[1][4]
        }

        blip_status = location[7]
        blip_id = location[8][1]
        blip_scale = location[8][2]
        blip_colour = location[8][3]
        blip_title = location[8][4]

        if blip_status == true then
            infoblip = AddBlipForCoord(pos1.x, pos1.y, pos1.z)
            SetBlipSprite(infoblip, blip_id)
            SetBlipDisplay(infoblip, 4)
            SetBlipScale(infoblip, blip_scale)
            SetBlipColour(infoblip, blip_colour)
            SetBlipAsShortRange(infoblip, true)
	        BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(blip_title)
            EndTextCommandSetBlipName(infoblip)
        end
    end
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