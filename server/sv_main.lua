if Config.Settings.Framework == "QB" then 
    for k,v in pairs(Config.Items) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if Player.Functions.GetItemByName(k) then
                Player.Functions.RemoveItem(k, 1) 
                TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[k], "remove")
                TriggerClientEvent('bbv_vehitems:spawnvehicle',src,v)
                return
            end
        end)
    end
end

if Config.Settings.Framework == "ESX" then 
    for k,v in pairs(Config.Items) do
        ESX.RegisterUsableItem(k, function(source)
            local src = source
            local xPlayer = ESX.GetPlayerFromId(src)
            xPlayer.removeInventoryItem(k, 1)
            TriggerClientEvent('bbv_vehitems:spawnvehicle',src,v)
            return
        end)
    end
end

RegisterNetEvent('bbv_vehitems:returnitem',function(data)
    local src = source
    if Config.Settings.Framework == "QB" then
        for k, v in pairs(Config.Items) do
            if v == data then
                item = k
                break
            end
        end
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem(item, 1) 
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
    end
    if Config.Settings.Framework == "ESX" then 
        for k, v in pairs(Config.Items) do
            if v == data then
                item = k
                break
            end
        end
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.addInventoryItem(item, 1)
    end
end)
