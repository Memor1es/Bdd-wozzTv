RegisterServerEvent("voiture:CheckMoneyForVel")
AddEventHandler("voiture:CheckMoneyForVel", function(name, vehicle, price)
    local mysource = source
    TriggerEvent('es:getPlayerFromId', mysource, function(user)
        local player = user.getIdentifier()
        local vehicle = vehicle
        local name = name
        local price = tonumber(price)

           if (user.getMoney() >= tonumber(price)) then
                -- user.removeBank((price))
                user.removeMoney(price)
                TriggerClientEvent('voiture:FinishMoneyCheckForVel', mysource, name, vehicle, price)
                TriggerClientEvent("es_freeroam:notify", mysource, "CHAR_SIMEON", 1, "Simeon", false, "Bonne route!\n")
           --elseif ( (tonumber(user.dirty_money) + tonumber(user.money)) >= tonumber(price) ) then
           --     user:removeDirty_Money((price - user.money))
           --     user:removeMoney((user.money))
           --     TriggerClientEvent('FinishMoneyCheckForVeh', mysource, name, vehicle, price)
           --     TriggerClientEvent("es_freeroam:notify", mysource, "CHAR_SIMEON", 1, "Simeon", false, "Bonne route!\n")
           else
                TriggerClientEvent("es_freeroam:notify", mysource, "CHAR_SIMEON", 1, "Simeon", false, "Fonds insuffisants!\n")
           end
        end)
end)