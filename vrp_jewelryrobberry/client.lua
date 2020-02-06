status1 = false
status2 = false
status3 = false
status4 = false
status5 = false
status6 = false
status7 = false
status8 = false
status9 = false
status10 = false
status11 = false
status12 = false
status13 = false
status14 = false
status15 = false
status16 = false
status17 = false
status18 = false
status19 = false
status20 = false
status21 = false
status22 = false
status23 = false
status24 = false
status25 = false

robbing = false
nextrobbing = true
cancelled = false
check = true

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if robbing == false then
            if nextrobbing == true then
                DrawMarker(27, -631.1552734375,-229.40916442871,38.057052612305-0.95, 0, 0, 0, 0, 0, 0, 1.401, 1.401, 1.401, 255, 0, 0, 200, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -631.1552734375,-229.40916442871,38.057052612305-0.95, 2) then
                    help_message("Press ~INPUT_CONTEXT~ to start the jewelry robbery")
                    if IsControlJustReleased(1, 38) then
                        notifypicture_message("CHAR_DETONATEPHONE",2,"Robbery jewelry",false,"~r~The robbery has begun! Steal everything you can!")
                        notifypicture_message("CHAR_DETONATEPHONE",2,"Robbery jewelry",false,"~r~You have 30 seconds to steal everything before the police alarm goes off!")
                        robbing = true
                        nextrobbing = false
                        if cancelled == false then
                            SetTimeout(30000, function()
                                if cancelled == false then
                                    notifypicture_message("CHAR_DETONATEPHONE",1,"Robbery jewelry",false,"~r~Can you hear it? The alarm went off the police were warned of the robbery!")
                                    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'allarm', 0.1)
                                    --TriggerServerEvent('jewelryrobberry:allarmpolice')
                                    notifypicture_message("CHAR_CALL911",1,"Police Department",false,"~r~At the moment there is a robbery at the jewelry store")
                                end
                            end)
                        elseif cancelled == true then
                            notifypicture_message("CHAR_CALL911",1,"Police Department",false,"~r~At the moment there is a robbery at the jewelry store")
                        end
                        SetTimeout(3600000, function()
                            robbing = false
                            nextrobbing = true
                            cancelled = false
                        end)
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if robbing == true then
            if nextrobbing == false then
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -632.86700439453,-238.65907287598,38.07377243042-0.95, 2.5) then
                    notifypicture_message("CHAR_DETONATEPHONE",1,"Robbery jewelry",false,"~r~The robbery was canceled because the main robber has left the limited area!")
                    cancelled = true
                    robbing = false
                    SetTimeout(3600000, function()
                        robbing = false
                        nextrobbing = true
                        cancelled = false
                    end)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if robbing == true then
        if status1 == false then
            DrawMarker(1, -626.39184570313,-239.2056427002,39.243705749512-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status2 == false then
            DrawMarker(1, -625.21459960938,-238.34736633301,39.223617553711-1.35, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status3 == false then
            DrawMarker(1, -627.29907226563,-234.87519836426,38.966594696045-1.15, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status4 == false then
            DrawMarker(1, -626.46722412109,-233.53826904297,39.223575592041-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status5 == false then
            DrawMarker(1, -626.10083007813,-234.11917114258,39.218456268311-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status6 == false then
            DrawMarker(1, -627.44964599609,-234.31884765625,38.862445831299-1.05, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status7 == false then
            DrawMarker(1, -622.44360351563,-229.92840576172,38.057010650635-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status8 == false then
            DrawMarker(1, -624.39660644531,-224.11256408691,38.057052612305-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status9 == false then
            DrawMarker(1, -625.56530761719,-223.91967773438,38.057052612305-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status10 == false then
            DrawMarker(1, -626.81958007813,-224.28707885742,38.057060241699-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status11 == false then
            DrawMarker(1, -627.46771240234,-225.21870422363,38.057060241699-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status12 == false then
            DrawMarker(1, -627.53582763672,-226.63664245605,38.057037353516-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status13 == false then
            DrawMarker(1, -619.77795410156,-237.37419128418,38.057048797607-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status14 == false then
            DrawMarker(1, -618.57702636719,-237.54234313965,38.057048797607-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status15 == false then
            DrawMarker(1, -617.32000732422,-237.18495178223,38.057048797607-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status16 == false then
            DrawMarker(1, -616.51922607422,-236.22741699219,38.057048797607-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status17 == false then
            DrawMarker(1, -616.59136962891,-234.95397949219,38.057048797607-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status18 == false then
            DrawMarker(1, -625.42498779297,-227.33630371094,39.223571777344-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status19 == false then
            DrawMarker(1, -624.21508789063,-226.62153625488,39.218448638916-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status20 == false then
            DrawMarker(1, -619.8193359375,-226.34170532227,39.223571777344-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status21 == false then
            DrawMarker(1, -619.23901367188,-227.3199005127,39.243709564209-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status22 == false then
            DrawMarker(1, -617.91809082031,-229.13171386719,39.223617553711-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status23 == false then
            DrawMarker(1, -617.11437988281,-230.2271270752,39.243701934814-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status24 == false then
            DrawMarker(1, -618.77655029297,-234.12934875488,39.223613739014-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if status25 == false then
            DrawMarker(1, -619.76385498047,-234.82135009766,39.223579406738-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

            if robbing == true then
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -626.39184570313,-239.2056427002,39.243705749512-1.40, 1) then
                    if status1 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status1 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -625.21459960938,-238.34736633301,39.223617553711-1.35, 1) then
                    if status2 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status2 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -627.29907226563,-234.87519836426,38.966594696045-1.15, 1) then
                    if status3 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status3 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -626.46722412109,-233.53826904297,39.223575592041-1.40, 1) then
                    if status4 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status4 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -626.10083007813,-234.11917114258,39.218456268311-1.40, 1) then
                    if status5 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status5 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -627.44964599609,-234.31884765625,38.862445831299-1.05, 1) then
                    if status6 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status6 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -622.44360351563,-229.92840576172,38.057010650635-0.95, 1) then
                    if status7 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get money")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessMO')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status7 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -624.39660644531,-224.11256408691,38.057052612305-0.95, 1) then
                    if status8 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status8 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -625.56530761719,-223.91967773438,38.057052612305-0.95, 1) then
                    if status9 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status9 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -626.81958007813,-224.28707885742,38.057060241699-0.95, 1) then
                    if status10 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status10 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -627.46771240234,-225.21870422363,38.057060241699-0.95, 1) then
                    if status11 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status11 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -627.53582763672,-226.63664245605,38.057037353516-0.95, 1) then
                    if status12 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status12 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -619.77795410156,-237.37419128418,38.057048797607-0.95, 1) then
                    if status13 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status13 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -618.57702636719,-237.54234313965,38.057048797607-0.95, 1) then
                    if status14 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status14 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -617.32000732422,-237.18495178223,38.057048797607-0.95, 1) then
                    if status15 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status15 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -616.51922607422,-236.22741699219,38.057048797607-0.95, 1) then
                    if status16 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status16 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -616.59136962891,-234.95397949219,38.057048797607-0.95, 1) then
                    if status17 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status17 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -625.42498779297,-227.33630371094,39.223571777344-1.40, 1) then
                    if status18 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status18 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -624.21508789063,-226.62153625488,39.218448638916-1.40, 1) then
                    if status19 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status19 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -619.8193359375,-226.34170532227,39.223571777344-1.40, 1) then
                    if status20 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status20 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -619.23901367188,-227.3199005127,39.243709564209-1.40, 1) then
                    if status21 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status21 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -617.91809082031,-229.13171386719,39.223617553711-1.40, 1) then
                    if status22 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status22 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -617.11437988281,-230.2271270752,39.243701934814-1.40, 1) then
                    if status23 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status23 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -618.77655029297,-234.12934875488,39.223613739014-1.40, 1) then
                    if status24 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status24 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -619.76385498047,-234.82135009766,39.223579406738-1.40, 1) then
                    if status25 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get the jewels")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status25 = true
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

        if status1 == true and status2 == true and status3 == true and status4 == true and status5 == true and status6 == true and status7 == true and status8 == true and status8 == true and status9 == true and status10 == true and status11 == true and status12 == true and status13 == true and status14 == true and status15 == true and status16 == true and status17 == true and status18 == true and status19 == true and status20 == true and status21 == true and status22 == true and status23 == true and status24 == true and status25 == true then
            if check == true then
                notifypicture_message("CHAR_DETONATEPHONE",2,"Robbery jewelry",false,"~r~You robbed everything!")
                check = false
            end
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -630.17553710938,-236.52540588379,38.0570602416992-0.95, 3) then
                help_message("~r~You can only do the next robbery at the jewelry store after 60 minutes from the previous one!")
            end
            SetTimeout(3600000, function()
                robbing = false
                nextrobbing = true
                cancelled = false
                check = true
            end)
        end
        if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -630.17553710938,-236.52540588379,38.0570602416992-0.95, 3) then
            if canceled == true then
                help_message("~r~You can only do the next robbery at the jewelry store after 60 minutes from the previous one!")
            end
        end
    end
end)

Citizen.CreateThread(function()
    blip = AddBlipForCoord(-622.24560546875,-230.86483764648,38.057060241699)
    SetBlipSprite(blip, 617)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 18)
    SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Vangelico (Jewelry)")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    blip = AddBlipForCoord(-631.1552734375,-229.40916442871,38.057052612305)
    SetBlipSprite(blip, 276)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 0)
    SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Robbery jewelry")
    EndTextCommandSetBlipName(blip)
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

function notifypicture_message(icon, type, sender, title, text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    SetNotificationMessage(icon, icon, true, type, sender, title, text)
    DrawNotification(false, true)
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 