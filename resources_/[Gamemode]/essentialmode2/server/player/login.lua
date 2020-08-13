-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --

-- VERSION MYSQL ASYNC BY POLIAKOV (aka PERVS)--

function LoadUser(identifier, source, new)
	local source = source
	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @name", {['@name'] = identifier}, function(user)
		Users[source] = CreatePlayer(source, user.permission_level, user.money, user.bankbalance, user.identifier, user.group, user.dirtymoney)
		Users[source].log('Connecting')
		TriggerEvent('es:playerLoaded', source, Users[source])

		TriggerClientEvent('es:setPlayerDecorator', source, 'rank', Users[source]:getPermissions())
		TriggerClientEvent('es:setMoneyIcon', source,settings.defaultSettings.moneyIcon)

		Users[source].setMoney(user.money)
		if(settings.defaultSettings.showBankBalance)then
			Users[source].setBankBalance(user.bankbalance)
		end
		if(settings.defaultSettings.dirtyMoneyShow)then
			Users[source].setDirtyMoney(user.dirtymoney)
		end
		if(new)then
			TriggerEvent('es:newPlayerLoaded', source, Users[source])
		end
		if(settings.defaultSettings.tpLastPos)then
			local coordsForSpawn = json.decode(user.lastPosition)
			TriggerClientEvent('es:setSpawnCoords_c', source, coordsForSpawn)
		end
	end)
end

function getPlayerFromId(id)
	print("Test: " .. type(id) .. " | " .. id)
	return Users[id]
end

AddEventHandler('es:getPlayers', function(cb)
	cb(Users)
end)

function hasAccount(identifier, callback)
	local result = MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @name", {['@name'] = identifier}, function (result)
		if(user ~= nil) then
			callback(true)
		else
			callback(false)
		end
	end)
end

function registerUser(identifier, source)
	hasAccount(identifier, function (result)
		if result then
			LoadUser(identifier, source, false)
		else
			MySQL.Async.execute("INSERT INTO users (`identifier`, `money`, `bankbalance`) VALUES (@identifier,@money,@bankbalance)", {['@identifier'] = identifier, ['@money'] = settings.defaultSettings.startingCash, ['@bankbalance'] = settings.defaultSettings.startingBank})

			LoadUser(identifier, source, true)
		end
	end)
end

AddEventHandler("es:setPlayerData", function(user, k, v, cb)
	if(Users[user])then
		if(Users[user].get(k))then
			if(k ~= "money") then
				Users[user].set(k, v)

				MySQL.Async.execute("UPDATE users SET @key=@value WHERE identifier = @identifier",
				{['@key'] = k, ['@value'] = v, ['@identifier'] = Users[user]['identifier']})
			end

			if(k == "group")then
				Users[user].set(k, v)
			end
		else
			cb("Column does not exist!", false)
		end
	else
		cb("User could not be found!", false)
	end
end)

AddEventHandler("es:setPlayerDataId", function(user, k, v, cb)
	MySQL.Async.execute("UPDATE users SET @key=@value WHERE identifier = @identifier",
	{['@key'] = k, ['@value'] = v, ['@identifier'] = user})

	cb("Player data edited.", true)
end)

AddEventHandler("es:getPlayerFromId", function(user, cb)
	if cb == nil then
		print('===============================================================================================================')
		print('===============================================================================================================')
		print('===============================================================================================================')
		print('es:getPlayerFromId cb is NIL !!! ERROR :D')
		print('===============================================================================================================')
		print('===============================================================================================================')
		print('===============================================================================================================')
		return 
	end
	if(Users)then
		if(Users[user])then
			cb(Users[user])
		else
			cb(nil)
		end
	else
		cb(nil)
	end
end)

AddEventHandler("es:getPlayerFromIdentifier", function(identifier, cb)
	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @name", {['@name'] = identifier}, function (result)
		if(user)then
			cb(user)
		else
			cb(nil)
		end
	end)
end)

-- Function to update player money every 60 seconds.
local function savePlayerMoney()
	SetTimeout(60000, function()
		for k,v in pairs(Users)do
			if Users[k] ~= nil then
				MySQL.Async.execute("UPDATE users SET `money`=@valMoney, `bankbalance`=@valBankBalance, `dirtymoney`=@valDirtyMoney WHERE identifier = @identifier",
				{['@valMoney'] = v.getMoney(), ['@valBankBalance'] = v.getBank(), ['@valDirtyMoney'] = v.getDirtyMoney(), ['@identifier'] = v.getIdentifier()})
			end
		end

		savePlayerMoney()
	end)
end

savePlayerMoney()