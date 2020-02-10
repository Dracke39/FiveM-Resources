local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_MedicHealt")

RegisterServerEvent('medichealt:checkmoney')
AddEventHandler('medichealt:checkmoney', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        if vRP.tryPayment({user_id,1000}) then
            vRPclient.notify(player,{"You paid ~r~1000$~w~ in medical bills!"})
            TriggerClientEvent('medichealt:function', source)
        else
            vRPclient.notify(player,{"You don't have enough money to afford medical treatment"})
        end
    end
end)