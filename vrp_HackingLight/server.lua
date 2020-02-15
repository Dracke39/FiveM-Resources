local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_HackingLight")

RegisterServerEvent('hackinglight:callboxpolice')
AddEventHandler('hackinglight:callboxpolice', function()
    vRP.sendServiceAlert({nil, "police",707.48773193359,62.089157104492,83.693786621094-0.97,"Someone is trying to access a public network through an unknown device!"})
end)

RegisterServerEvent('hackinglight:requestpermissionrapair')
AddEventHandler('hackinglight:requestpermissionrapair', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.hasPermission({user_id,"hackinglight.repair"}) then
            TriggerClientEvent('hackinglight:requestpermissionrapairsucc', source)
        else
            vRPclient.notify(player,{"~r~You can't call the workers!"})
        end
    end
end)