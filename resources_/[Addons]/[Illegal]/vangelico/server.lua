robberyCooldown = 0

local cabinetsCoords =

{

	{canRob = true, x = -622.64, y = -232.55, z = 37.86, h = 0.0},

	{canRob = true, x = -624.09, y = -230.8, z = 37.86, h = 0.0},

	{canRob = true, x = -623.68, y = -228.54, z = 37.86, h = 0.0},

	{canRob = true, x = -621.53, y = -228.95, z = 37.86, h = 0.0},

	{canRob = true, x = -620.05, y = -230.77, z = 37.86, h = 0.0},

	{canRob = true, x = -620.54, y = -232.87, z = 37.86, h = 0.0},

	{canRob = true, x = -619.87, y = -234.88, z = 37.86, h = 0.0},

	{canRob = true, x = -618.84, y = -234.06, z = 37.86, h = 0.0},

	{canRob = true, x = -617.1, y = -230.15, z = 37.86, h = 0.0},

	{canRob = true, x = -617.88, y = -229.12, z = 37.86, h = 0.0},

	{canRob = true, x = -619.24, y = -227.23, z = 37.86, h = 0.0},

	{canRob = true, x = -619.96, y = -226.20, z = 37.86, h = 0.0},

	{canRob = true, x = -624.27, y = -226.62, z = 37.86, h = 0.0},

	{canRob = true, x = -625.28, y = -227.43, z = 37.86, h = 0.0},

	{canRob = true, x = -626.32, y = -239.06, z = 37.86, h = 0.0},

	{canRob = true, x = -625.28, y = -238.27, z = 37.86, h = 0.0},

	{canRob = true, x = -626.13, y = -234.21, z = 37.86, h = 0.0},

	{canRob = true, x = -626.51, y = -233.65, z = 37.86, h = 0.0},

	{canRob = true, x = -627.58, y = -234.36, z = 37.86, h = 0.0}, 

	{canRob = true, x = -627.11, y = -234.95, z = 37.86, h = 0.0},

}

RegisterServerEvent('avanyavangelico:tryrobbery')
AddEventHandler('avanyavangelico:tryrobbery', function()
	if robberyCooldown <= 0 then
		TriggerClientEvent('avanyavangelico:startrobbery', source)
		TriggerClientEvent('avanyavangelico:warnClient', -1)
		robberyCooldown = 7200
	else
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_SOCIAL_CLUB", 1, "Listory - Braquage", false, "Reviens dans 2h mec !")
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