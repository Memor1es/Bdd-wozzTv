robberyCooldown = 0

local areas =

{

	{shopPed = nil, ped = `mp_m_shopkeep_01`, x = -1486.321,	y = -377.7767,	z = 39.163383483886,	h = 130.93975830078},

	{shopPed = nil, ped = `mp_m_shopkeep_01`, x = 372.513,		y = 326.514,	z = 102.566,			h = 247.224},

	{shopPed = nil, ped = `mp_m_shopkeep_01`, x = 1164.719,		y = -322.5131,	z = 68.205,				h = 108.7031},

}

RegisterServerEvent('avanyarobberyshop:tryRob')
AddEventHandler('avanyarobberyshop:tryRob', function(index)
    if robberyCooldown <= 0 then
        TriggerClientEvent('avanyarobberyshop:startRobbing', source, index)
        TriggerClientEvent('avanyarobberyshop:warnClient', -1)
        robberyCooldown = 3600
    else
        TriggerClientEvent("es_freeroam:notify", source, "CHAR_SOCIAL_CLUB", 1, "Avanya - Braquage", false, "Reviens dans 1h mec !")
    end
end)

RegisterServerEvent('avanyarobberyshop:onRobberyCompleted')
AddEventHandler('avanyarobberyshop:onRobberyCompleted', function()
    local source = source
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local moneyReward = math.random(1600, 2000)
        user.addDirtyMoney(moneyReward)
    end)
end)

Citizen.CreateThread(function()
	while true do
		if robberyCooldown > 0 then
			robberyCooldown = robberyCooldown - 1
		end
		Wait(1000)
	end
end)