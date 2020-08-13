function addBallas(identifier)
	MySQL.Async.execute("INSERT INTO ballas (`identifier`) VALUES (@identifier)", { ['@identifier'] = identifier})
end

function remBallas(identifier)
	MySQL.Async.execute("DELETE FROM ballas WHERE identifier = @identifier", { ['@identifier'] = identifier})
end

function checkIsBallas(identifier, source)
	MySQL.Async.fetchScalar("SELECT identifier FROM ballas WHERE identifier = @identifier", { ['@identifier'] = identifier},
		function(result)
			if(not result) then
				TriggerClientEvent('ballas:receiveIsBallas', source, "inconnu")
			else
				TriggerClientEvent('ballas:receiveIsBallas', source, result.identifier)
			end
		end)
end

RegisterServerEvent('ballas:checkIsBallas')
AddEventHandler('ballas:checkIsBallas', function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local identifier = user.getIdentifier()
		checkIsBallas(identifier, source)
	end)
end)

TriggerEvent('es:addGroupCommand', 'ballasadd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /ballasadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
            TriggerEvent("es:getPlayerFromId", player, function(target)
                addBallas(target.getIdentifier())
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_LESTER_DEATHWISH", 1, "Lester", false, "Tu es Ballas !~w~")
				TriggerClientEvent('ballas:setInfos', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'ballasrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /bsrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
            TriggerEvent("es:getPlayerFromId", player, function(target)
                remBallas(target.getIdentifier())
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_LESTER_DEATHWISH", 1, "Lester", false, "Tu n'es plus Ballas !~w~.")
                TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
                TriggerClientEvent('ballas:removeGang', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)