local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_jewelryrobberry")

local rewardjew = math.random(3,13)
local rewardmoney = math.random(525,5974)
local moneygive = math.random(5120,7421)

RegisterServerEvent('jewelryrobberry:sucess')
AddEventHandler('jewelryrobberry:sucess', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,"jewelry",rewardjew,true})
    end
end)

RegisterServerEvent('jewelryrobberry:sucessRW1')
AddEventHandler('jewelryrobberry:sucessRW1', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,"jewelry",1,true})
    end
end)

RegisterServerEvent('jewelryrobberry:sucessMO')
AddEventHandler('jewelryrobberry:sucessMO', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,"dirty_money",rewardmoney,true})
    end
end)

RegisterServerEvent('jewelryrobberry:allarmpolice')
AddEventHandler('jewelryrobberry:allarmpolice', function()
    local user_id = vRP.getUserId({source})
    local player = vRP:getUserSource({user_id})
    if(user_id)then
        vRP.sendServiceAlert(nil, "police",-630.17553710938,-236.52540588379,38.0570602416992-0.95,"Robbery in progress at the jewelry store!")
    end
end)