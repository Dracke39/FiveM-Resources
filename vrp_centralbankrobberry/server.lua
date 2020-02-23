local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_centralbankrobberry")

local dirtymoneygive = math.random(50120,70421)
local dirtymoneygiveover = math.random(150120,190421)
local docsbankgive = math.random(3,9)
local docsbankgivemoney = math.random(5784,7211)

RegisterServerEvent('centralbankrobberry:give')
AddEventHandler('centralbankrobberry:give', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,"dirty_money",dirtymoneygive,true})
    end
end)

RegisterServerEvent('centralbankrobberry:giveover')
AddEventHandler('centralbankrobberry:giveover', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,"dirty_money",dirtymoneygiveover,true})
    end
end)

RegisterServerEvent('centralbankrobberry:givedocs')
AddEventHandler('centralbankrobberry:givedocs', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,"bank_docs",docsbankgive,true})
    end
end)

RegisterServerEvent('centralbankrobberry:checkdocs')
AddEventHandler('centralbankrobberry:checkdocs', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryGetInventoryItem({user_id,"bank_docs",1,false}) then
            vRP.giveInventoryItem({user_id,"dirty_money",docsbankgivemoney,true})
        else
            vRPclient.notify(player,{"You don't have ~r~1 Bank Document"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:checkdrill1')
AddEventHandler('centralbankrobberry:checkdrill1', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryGetInventoryItem({user_id,"bank_drill",1,false}) then
            TriggerClientEvent('centralbankrobberry:boxuse1', source)
        else
            vRPclient.notify(player,{"You don't have ~r~1 Drill"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:checkdrill2')
AddEventHandler('centralbankrobberry:checkdrill2', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryGetInventoryItem({user_id,"bank_drill",1,false}) then
            TriggerClientEvent('centralbankrobberry:boxuse2', source)
        else
            vRPclient.notify(player,{"You don't have ~r~1 Drill"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:checkdrill3')
AddEventHandler('centralbankrobberry:checkdrill3', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryGetInventoryItem({user_id,"bank_drill",1,false}) then
            TriggerClientEvent('centralbankrobberry:boxuse3', source)
        else
            vRPclient.notify(player,{"You don't have ~r~1 Drill"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:checkdrill4')
AddEventHandler('centralbankrobberry:checkdrill4', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryGetInventoryItem({user_id,"bank_drill",1,false}) then
            TriggerClientEvent('centralbankrobberry:boxuse4', source)
        else
            vRPclient.notify(player,{"You don't have ~r~1 Drill"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:checkdrill5')
AddEventHandler('centralbankrobberry:checkdrill5', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryGetInventoryItem({user_id,"bank_drill",1,false}) then
            TriggerClientEvent('centralbankrobberry:boxuse5', source)
        else
            vRPclient.notify(player,{"You don't have ~r~1 Drill"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:checkdrill6')
AddEventHandler('centralbankrobberry:checkdrill6', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryGetInventoryItem({user_id,"bank_drill",1,false}) then
            TriggerClientEvent('centralbankrobberry:boxuse6', source)
        else
            vRPclient.notify(player,{"You don't have ~r~1 Drill"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:phone1')
AddEventHandler('centralbankrobberry:phone1', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local cops = vRP.getUsersByGroup({"police"})
    if vRP.hasGroup({user_id,"police"}) then
        vRPclient.notify(player,{"~r~Cops can't rob banks."})
    else
        if #cops >= 7 then
            if vRP.tryGetInventoryItem({user_id,"bank_phone",1,false}) then
                TriggerClientEvent('centralbankrobberry:phoneclient1', source)
            else
                vRPclient.notify(player,{"You don't have ~r~1 Hacking Phone"})
            end
        else
            vRPclient.notify(player,{"~r~Not enough cops online."})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:phone2')
AddEventHandler('centralbankrobberry:phone2', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryGetInventoryItem({user_id,"bank_phone",1,false}) then
            TriggerClientEvent('centralbankrobberry:phoneclient2', source)
        else
            vRPclient.notify(player,{"You don't have ~r~1 Hacking Phone"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:policecheckpermdoor')
AddEventHandler('centralbankrobberry:policecheckpermdoor', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.hasPermission({user_id,"bank.doorbutton"}) then
            TriggerClientEvent('centralbankrobberry:policecheckpermdoorSUCC', source)
        else
            vRPclient.notify(player,{"~r~You are not a policeman or a banker!"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:policetimeddoortimed')
AddEventHandler('centralbankrobberry:policetimeddoortimed', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.hasPermission({user_id,"bank.doorbuttontimed"}) then
            TriggerClientEvent('centralbankrobberry:policetimeddoorSUCC', source)
        else
            vRPclient.notify(player,{"~r~You are not a policeman or a banker!"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:cleanmoney1')
AddEventHandler('centralbankrobberry:cleanmoney1', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryGetInventoryItem({user_id,"dirty_money",1,false}) then
            vRP.giveBankMoney({user_id,1})
            vRPclient.notify(player,{"You received ~r~1$"})
        else
            vRPclient.notify(player,{"You don't have ~r~1 Dirty Money"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:cleanmoney1000')
AddEventHandler('centralbankrobberry:cleanmoney1000', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryGetInventoryItem({user_id,"dirty_money",1000,false}) then
            vRP.giveBankMoney({user_id,1000})
            vRPclient.notify(player,{"You received ~r~1000$"})
        else
            vRPclient.notify(player,{"You don't have ~r~1000 Dirty Money"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:cleanmoney100000')
AddEventHandler('centralbankrobberry:cleanmoney100000', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryGetInventoryItem({user_id,"dirty_money",100000,false}) then
            vRP.giveBankMoney({user_id,100000})
            vRPclient.notify(player,{"You received ~r~100000$"})
        else
            vRPclient.notify(player,{"You don't have ~r~100.000 Dirty Money"})
        end
    end
end)

RegisterServerEvent('centralbankrobberry:callpolicerobberrydoor')
AddEventHandler('centralbankrobberry:callpolicerobberrydoor', function()
    vRP.sendServiceAlert({nil, "police",261.92630004883,223.17308044434,106.28411102295,"The central bank door terminal is under hacking attack!"})
end)

RegisterServerEvent('centralbankrobberry:callpolicerobberryvault')
AddEventHandler('centralbankrobberry:callpolicerobberryvault', function()
    vRP.sendServiceAlert({nil, "police",253.39796447754,228.35009765625,101.68325042725,"The vault terminal has been hacked!"})
end)

RegisterServerEvent('centralbankrobberry:callpolicebutton')
AddEventHandler('centralbankrobberry:callpolicebutton', function()
    vRP.sendServiceAlert({nil, "police",244.7554473877,225.93675231934,106.28779602051,"Bank rescue button was pressed (~r~CENTRAL BANK ALARM~w~)"})
end)
