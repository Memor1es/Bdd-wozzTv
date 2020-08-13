--require "resources/mysql-async/lib/MySQL"

metiersList = {
	{name="chomeur", id=1},
	{name="police", id=2},
	{name="mineur", id=9},
	{name="bucheron", id=7},
	{name="fermier", id=6},
	{name="pecheur", id=10},
	--{name="docker", id=11},
	{name="brasseur", id=12},
	{name="vigneron", id=13},
	--{name="livreur", id=13},
	{name="ambulancier", id=15},
	{name="mecano", id=16},
	{name="taxi", id=17},
	{name="joaillier", id=18},
	{name="bar", id=19},
	{name="brinks", id=99},
	{name="burgershot", id=98},
	{name="evenementiel", id=100},
	{name="journaliste", id=101},
	{name="patron-burgershot", id=102},
	{name="patron-mecano", id=103},
	{name="patron-evenementiel", id=104},
	{name="patron-journaliste", id=105},
	{name="patron-bar", id=106},
	{name="patron-brinks", id=107},
	{name="avocat", id=38},
	{name="juge", id=39},
	{name="enqueteur", id=40},
	{name="gouverneur", id=41},
	{name="gouverneur-adjoint", id=42},
	{name="procureur", id=43}
}

function MineGetPlayerJobID(playerId)
	return MySQL.Sync.fetchScalar("SELECT job FROM users WHERE identifier = @name", {['@name'] = playerId})
end

function MineGetPlayerJobName(JobId)
	return MySQL.Sync.fetchScalar("SELECT job_name FROM jobs WHERE job_id = @namejob", {['@namejob'] = JobId})
end

RegisterServerEvent('metiers:isChomeur')
AddEventHandler('metiers:isChomeur', function()
	local mysource = source
	TriggerEvent('es:getPlayerFromId', mysource, function(user)
		local playerJobID = MineGetPlayerJobID(user.getIdentifier())
		TriggerClientEvent('metiers:defineJobMenu', mysource, playerJobID)
	end)
end)

RegisterServerEvent('metiers:jobs')
AddEventHandler('metiers:jobs', function(id)
	local mysource = source
	TriggerEvent('es:getPlayerFromId', mysource, function(user)

		local playerJobID = MineGetPlayerJobID(user.getIdentifier())
		local playerJobName = MineGetPlayerJobName(playerJobID)
		local NewJobName = MineGetPlayerJobName(id)

		for _, item in pairs(metiersList) do
			if playerJobID == item.id then
				TriggerClientEvent(item.name..":deleteBlips", mysource)
			end
		end

		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = id, ['@identifier'] = user.getIdentifier()})

		TriggerClientEvent("metiers:updateJob", mysource, NewJobName)

		for _, item in pairs(metiersList) do
			if id == item.id then
				TriggerClientEvent(item.name..":drawBlips", mysource)
				TriggerClientEvent(item.name..":drawMarker", mysource, true)
				TriggerClientEvent(item.name..":marker", mysource)
				--TriggerClientEvent(item.name..":getSkin", source)
			end
		end
		TriggerClientEvent("es_freeroam:notify", mysource, "CHAR_MP_STRIPCLUB_PR", 1, "Entreprise", false, "Votre métier est maintenant : ".. NewJobName..". Récuperez votre vehicule special a l'entreprise")
	end)
end)

AddEventHandler('es:playerLoaded', function(source)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		local playerJobID = MineGetPlayerJobID(user.getIdentifier())
		local playerJobName = MineGetPlayerJobName(playerJobID)
		for _, item in pairs(metiersList) do
			if playerJobID == item.id then
				TriggerClientEvent(item.name..":drawBlips", source)
				TriggerClientEvent(item.name..":drawMarker", source, true)
				TriggerClientEvent(item.name..":marker", source)
			end
		end
		TriggerClientEvent("metiers:updateJob", source, playerJobName)
	end)
end)


-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP MECANO-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'mecadd', 'admin', function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /mecadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es mécano !~w~")
				TriggerClientEvent('metiers:getmyjob',player,16)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'mecrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /mecrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus mécano !~w~")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP BRINKS-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'brkadd', 'admin', function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /brkadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Brinks !~w~")
				TriggerClientEvent('metiers:getmyjob',player,99)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'brkrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /brkrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Brinks !~w~")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP AMBULANCIER-------------------
-----------------------------------------------------------------------

TriggerEvent('es:addGroupCommand', 'ambadd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /ambadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es ambulancier !~w~")
				TriggerClientEvent('metiers:getmyjob',player,15)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'ambrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /ambrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus ambulancier !~w~")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP TAXI-------------------
-----------------------------------------------------------------------

TriggerEvent('es:addGroupCommand', 'taxadd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /taxadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Taxi !~w~")
				TriggerClientEvent('metiers:getmyjob',player,17)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'taxrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /taxrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Taxi !~w~.")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP BURGERSHOT-------------------
-----------------------------------------------------------------------

TriggerEvent('es:addGroupCommand', 'bsadd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /bsadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Burgershot !~w~")
				TriggerClientEvent('metiers:getmyjob',player,98)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'bsrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /bsrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Burgershot !~w~.")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP EVENT-------------------
-----------------------------------------------------------------------

TriggerEvent('es:addGroupCommand', 'eventadd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /eventadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Evenementiel !~w~")
				TriggerClientEvent('metiers:getmyjob',player,100)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'eventrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /eventrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Evenementiel !~w~.")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP JOURNALISTE-------------------
-----------------------------------------------------------------------

TriggerEvent('es:addGroupCommand', 'jouradd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /jouradd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Journaliste !~w~")
				TriggerClientEvent('metiers:getmyjob',player,101)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'jourrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /jourrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Journaliste !~w~.")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP PATRONBURGERSHOT-------------------
-----------------------------------------------------------------------

TriggerEvent('es:addGroupCommand', 'pbsadd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /pbsadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Patron-Burgershot !~w~")
				TriggerClientEvent('metiers:getmyjob',player,102)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'pbsrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /pbsrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Patron-Burgershot !~w~.")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP PATRONMECANO-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'pmecadd', 'admin', function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /pmecadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Patron-mécano !~w~")
				TriggerClientEvent('metiers:getmyjob',player,103)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'pmecrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /pmecrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Patron-mécano !~w~")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP PATRONEVENT-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'peventadd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /peventadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Patron-Evenementiel !~w~")
				TriggerClientEvent('metiers:getmyjob',player,104)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'peventrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /peventrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Patron-Evenementiel !~w~.")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP PATRONJOURNALISTE-------------------
-----------------------------------------------------------------------

TriggerEvent('es:addGroupCommand', 'pjouradd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /pjouradd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Patron-Journaliste !~w~")
				TriggerClientEvent('metiers:getmyjob',player,105)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'pjourrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /pjourrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Patron-Journaliste !~w~.")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP BARMAN-------------------
-----------------------------------------------------------------------

TriggerEvent('es:addGroupCommand', 'baradd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /baradd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Barman !~w~")
				TriggerClientEvent('metiers:getmyjob',player,19)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'barrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /barrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Barman !~w~.")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP PATRONBARMAN-------------------
-----------------------------------------------------------------------

TriggerEvent('es:addGroupCommand', 'pbaradd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /pbaradd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Patron-Barman !~w~")
				TriggerClientEvent('metiers:getmyjob',player,106)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'pbarrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /pbarrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Patron-Barman !~w~.")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP PATRONBRINKS-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'pbrkadd', 'admin', function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /pbrkadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Patron-Brinks !~w~")
				TriggerClientEvent('metiers:getmyjob',player,107)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'pbrkrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /pbrkrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Patron-Brinks !~w~")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP AVOCAT-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'avocadd', 'admin', function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /avocadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Avocat !~w~")
				TriggerClientEvent('metiers:getmyjob',player,38)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'avocrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /avocrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Avocat !~w~")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP JUGE-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'jugadd', 'admin', function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /jugadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Juge !~w~")
				TriggerClientEvent('metiers:getmyjob',player,39)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'jugrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /jugrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Juge !~w~")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP ENQUETEUR-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'enqadd', 'admin', function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /enqadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Enqueteur !~w~")
				TriggerClientEvent('metiers:getmyjob',player,40)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'enqrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /enqrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Enqueteur !~w~")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP GOUVERNEUR-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'gouvadd', 'admin', function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /gouvadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Gouverneur !~w~")
				TriggerClientEvent('metiers:getmyjob',player,41)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'gouvrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /gouvrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Gouverneur !~w~")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP GOUVERNEUR-ADJ-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'gouvdjadd', 'admin', function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /gouvdjadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Gouverneur-adjoint !~w~")
				TriggerClientEvent('metiers:getmyjob',player,42)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'gouvdjrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /gouvdjrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Gouverneur-adjoint !~w~")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP PROCUREUR-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'procadd', 'admin', function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /procadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Félicitations, tu es Procureur !~w~")
				TriggerClientEvent('metiers:getmyjob',player,43)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'procrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /procrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_SOCIAL_CLUB", 1, "Government", false, "Tu n'es plus Procureur !~w~")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "Tu n'es plus cop !")
				TriggerClientEvent('metiers:getmyjob',player,1)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)