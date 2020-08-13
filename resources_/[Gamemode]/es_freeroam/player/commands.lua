TriggerEvent('es:addGroupCommand', 'tpgps', "admin", function(source, args, user)
    TriggerClientEvent('bajautils:tpgps', source)
end)

TriggerEvent('es:addGroupCommand', 'unl', "admin", function(source, args, user)
    TriggerClientEvent('bajautils:unlock', source)
end)

TriggerEvent('es:addGroupCommand', 'rp', "admin", function(source, args, user)
    TriggerClientEvent('bajautils:repairvh', source)
end)

TriggerEvent('es:addGroupCommand', 'heal', "admin", function(source, args, user)
    if(GetPlayerName(tonumber(args[1])))then
        local player = tonumber(args[1])
        TriggerEvent("es:getPlayerFromId", player, function(target)
            TriggerClientEvent('bajautils:revive', player)
            TriggerClientEvent('bajautils:heal', player)
            TriggerClientEvent('chatMessage', player, "SYSTEM", {255, 0, 0}, "^1Tu a été réanimé par "..GetPlayerName(source).."")
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Le joueur ^2" .. GetPlayerName(player) .. "^0 a bien été réanimé")
        end)
    end
end, function(source, args, user)
    TriggerClientEvent('chatMessage', source, "ERREUR", {255, 0, 0}, "Permissions insuffisante")
end)

TriggerEvent('es:addGroupCommand', 'tppc', "admin", function(source, args, user)
    TriggerClientEvent('bajautils:tppc', source)
    TriggerClientEvent('bajautils:heal', source)
end)

TriggerEvent('es:addGroupCommand', 'tpmc', "admin", function(source, args, user)
    TriggerClientEvent('bajautils:tpmc', source)
    TriggerClientEvent('bajautils:heal', source)
end)

TriggerEvent('es:addGroupCommand', 'tpqg', "admin", function(source, args, user)
    TriggerClientEvent('bajautils:tpqg', source)
    TriggerClientEvent('bajautils:heal', source)
end)

TriggerEvent('es:addGroupCommand', 'poi', "user", function(source, args, user)
    TriggerClientEvent('bajautils:poi', source)
end)

TriggerEvent('es:addGroupCommand', 'sid', "admin", function(source, args, user)
    TriggerClientEvent('bajautils:bajaid', source)
end)

TriggerEvent('es:addGroupCommand', 'fondapos', "admin", function(source, args, user)
    TriggerClientEvent('bajautils:getpos', source)
end)

TriggerEvent('es:addGroupCommand', 'inv', "admin", function(source, args, user)
    TriggerClientEvent('bajautils:inv', source)
end)

TriggerEvent('es:addGroupCommand', 'tp', "admin", function(source, args, user)
    TriggerClientEvent('bajautils:tp', source)
end)

TriggerEvent('es:addGroupCommand', 'announce', "admin", function(source, args, user)
    local scaleType, time, font = tonumber(args[1]), tonumber(args[2]), args[3]
		local extraArgs
		if tonumber(args[3]) then extraArgs = 3 else extraArgs = 2 end
		for i=1, extraArgs do table.remove(args, 1) end
        TriggerClientEvent("Scaleform:Announce", -1, scaleType, time, font, table.concat(args, " "))
end)

TriggerEvent('es:addGroupCommand', 'clean', "admin", function(source, args, user)
    TriggerClientEvent('avanyac:cleaneverything', source)
end)

TriggerEvent('es:addGroupCommand', 'clear', "admin", function(source, args, user)
    if(GetPlayerName(tonumber(args[1])))then
        local player = tonumber(args[1])
        TriggerEvent('es:getPlayerFromId', player, function(target)
            TriggerClientEvent('bajautils:clearWeapons', player)
        end)
    end
end)

TriggerEvent('es:addGroupCommand', 'register', "admin", function(source, args, user)
    if(GetPlayerName(tonumber(args[1])))then
        local player = tonumber(args[1])
        TriggerEvent('es:getPlayerFromId', player, function(target)
            TriggerClientEvent('gc:showRegisterItentity', player)
        end)
    end
end)

TriggerEvent('es:addGroupCommand', 'bajaweap', "admin", function(source, args, user)
    if(GetPlayerName(tonumber(args[1])))then
        local player = tonumber(args[1])
        local weapon = GetHashKey(args[2])
        TriggerEvent('es:getPlayerFromId', player, function(target)
            TriggerClientEvent('bajautils:giveweapon', player, weapon)
        end)
    end
end)

TriggerEvent('es:addGroupCommand', 'fondacash', "admin", function(source, args, user)
    if(GetPlayerName(tonumber(args[1])))then
        local player = tonumber(args[1])
        local amount = tonumber(args[2])
        TriggerEvent('es:getPlayerFromId', player, function(target)
            user.addMoney(amount)
        end)
    end
end)

TriggerEvent('es:addGroupCommand', 'drop', "admin", function(source, args, user)
    if(GetPlayerName(tonumber(args[1])))then
        local player = tonumber(args[1])
        TriggerEvent('es:getPlayerFromId', player, function(target)
            DropPlayer(player, "Vous avez été déconnecter par un administrateur.")
        end)
    end
end)