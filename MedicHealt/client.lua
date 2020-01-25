positions = {
    -- Blip cords, tp bed, tp respawn, presskey
    -- X Y Z Heading
    {{307.92263793945,-595.06616210938,42.341786193848},{354.1682434082,-592.81365966797,43.104415893555, 336.63},{353.46752929688,-592.33630371094,43.315010070801, 19.78}, 38},
}

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for _,location in ipairs(positions) do

            pos1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
            }
            pos2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }
            pos3 = {
                x=location[3][1],
                y=location[3][2],
                z=location[3][3],
                heading=location[3][4]
            }

            presskey = location[4]

            DrawMarker(27, x, y, z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 0, 127, 255, 200, 0, 0, 0, 1)

            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, pos1.x, pos1.y, pos1.z, 2) then
                help_message("Press ~INPUT_CONTEXT~ to sign the form")
                if IsControlJustReleased(1, presskey) then
                    FreezeEntityPosition(GetPlayerPed(-1), true)
                    notify_message("~g~You are signing the release")
                    loadAnimDict( "amb@medic@standing@timeofdeath@enter" )
                    loadAnimDict( "amb@medic@standing@timeofdeath@base" )
                    loadAnimDict( "amb@medic@standing@timeofdeath@exit" )
                    TaskPlayAnim(GetPlayerPed(-1),"amb@medic@standing@timeofdeath@enter", "enter",1.0, -1.0, 7000, 0, 7, false, false, false)
                    TaskPlayAnim(GetPlayerPed(-1),"amb@medic@standing@timeofdeath@base", "base",1.0, -1.0, 7000, 0, 7, false, false, false)
                    TaskPlayAnim(GetPlayerPed(-1),"amb@medic@standing@timeofdeath@exit", "exit",1.0, -1.0, 7000, 0, 7, false, false, false)
                    Citizen.Wait(7000)
                    DoScreenFadeOut(500)
                    Citizen.Wait(500)
                    SetEntityCoords(GetPlayerPed(-1), pos2.x, pos2.y, pos1.z, 1,0,0,1)
                    SetEntityHeading(GetPlayerPed(-1), pos2.heading)
                    TaskPlayAnim(GetPlayerPed(-1),"anim@gangops@morgue@table@", "body_search",1.0, -1.0, 120000, 1, 120, false, false, false)
                    Citizen.Wait(1500)
                    DoScreenFadeIn(500)
                    notify_message("~g~The medical staff is taking care of you")
                    DrawSpecialText("The medical staff is taking care of you", 120000)
                    Citizen.Wait(120000)
                    notify_message("~g~The medical staff has provided all the medical care you need now you are free")
                    FreezeEntityPosition(GetPlayerPed(-1), false)
                    setHealth(200)
                    DoScreenFadeOut(500)
                    Citizen.Wait(500)
                    SetEntityCoords(GetPlayerPed(-1), pos3.x, pos3.y, pos3.z, 1,0,0,1)
                    SetEntityHeading(GetPlayerPed(-1), pos3.heading)
                    Citizen.Wait(1000)
                    DoScreenFadeIn(1000)
                end
            end
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

function setHealth(health)
    local n = math.floor(health)
    SetEntityHealth(GetPlayerPed(-1),n)
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end