robberyCooldown = 0

RegisterServerEvent('avanyaheist:receiveCash')
AddEventHandler('avanyaheist:receiveCash', function()
    local source = source
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local randomMoney = math.random(Config.Trolley["cash"][1], Config.Trolley["cash"][2])
        user.addDirtyMoney(randomMoney)
        TriggerClientEvent("es_freeroam:notify", source, "CHAR_SOCIAL_CLUB", 1, "Listory - Braquage", false, "~g~+30.000$")
    end)
end)

RegisterServerEvent('avanyaheist:tryRob')
AddEventHandler('avanyaheist:tryRob', function(bankIndex)
    if robberyCooldown <= 0 then
        TriggerClientEvent('avanyaheist:startRobbery', source)
        TriggerClientEvent('avanyaheist:warnClient', -1)
        robberyCooldown = 10800
    else
        TriggerClientEvent("es_freeroam:notify", source, "CHAR_SOCIAL_CLUB", 1, "Listory - Braquage", false, "Reviens dans 3h mec !")
        TriggerClientEvent("avanyaheist:cantRob", source)
    end
end)

Citizen.CreateThread(function()
	while true do
		if robberyCooldown > 0 then
			robberyCooldown = robberyCooldown - 1
		end
		Wait(1000)
	end
end)