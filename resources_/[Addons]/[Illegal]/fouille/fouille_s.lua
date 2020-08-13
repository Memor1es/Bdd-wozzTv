local currentWeapons = {}

function checkInventory(source, target, player)
	local strResult = "Possede : "
	
	local dirtyMoney = player.getDirtyMoney()
	local Money = player.getMoney()
	strResult = strResult .. Money .. "$ d'argent , "
	strResult = strResult .. dirtyMoney .. "$ d'argent sale , "
	local identifiers = GetPlayerIdentifiers(target)
	local persotarget = getIdentifiant(identifiers)

	local result = MySQL.Sync.fetchAll("SELECT * FROM `user_inventory` JOIN items ON items.id = user_inventory.item_id WHERE user_id = @username", {['@username'] = persotarget})
	if (result) then
		for _, v in ipairs(result) do
			if(v.quantity ~= 0) then
				strResult = strResult .. v.quantity .. " de " .. v.libelle .. ", "
			end
		end
	end

	strResult = strResult .. " / "
	local result = MySQL.Sync.fetchAll("SELECT loadout FROM users WHERE identifier = @username", { ['@username'] = player.getIdentifier()})
	if (result) then
		for _, v in ipairs(result) do
			strResult = strResult .. "possession de " .. v.weaponModel .. ", "
		end
	end

	return strResult
end

function checkItems(source, target, player)
	local strResult = "Possede : "
	local identifiers = GetPlayerIdentifiers(target)
	local persotarget = getIdentifiant(identifiers)

	local result = MySQL.Sync.fetchAll("SELECT * FROM `user_inventory` JOIN items ON items.id = user_inventory.item_id WHERE user_id = @username", {['@username'] = persotarget})
	if (result) then
		for _, v in ipairs(result) do
			if(v.quantity ~= 0) then
				strResult = strResult .. v.quantity .. " de " .. v.libelle ..", "
			end
		end
	end
	return strResult
end

function checkMoney(source, target, player)
	local strResult = "Possede : "
	local dirtyMoney = player.getDirtyMoney()
	local Money = player.getMoney()
	local identifiers = GetPlayerIdentifiers(target)
	local persotarget = getIdentifiant(identifiers)

	strResult = strResult .. Money .. "$ d'argent , "
	strResult = strResult .. dirtyMoney .. "$ d'argent sale , "

	return strResult
end

function getWeapons(identifier)
    local weapons = {}
    local result = MySQL.Sync.fetchAll('SELECT loadout FROM users WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    })
    if #result == 0 then
        print("[es_locker] [ERROR] DB set up incorrectly")
    end
    if result[1].loadout == nil then
        print("[es_locker] [ERROR] set up incorrectly")
    end
    if result[1].loadout then
        weapons = json.decode(result[1].loadout)
    end
    return weapons
end

function checkWeapon(source, target, player)
	local strResult = "Armes : "
	local identifiers = GetPlayerIdentifiers(target)
	local persotarget = getIdentifiant(identifiers)
	local currentWeapon = getWeapons(target)

	strResult = strResult .. currentWeapon .. ", "
	
	return strResult
end

function getIdentifiant(id)

	for _, v in ipairs(id) do
	    return v
	end

end

RegisterServerEvent('avanyafouille:checkInventoryS')
AddEventHandler('avanyafouille:checkInventoryS', function(t)
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('es:getPlayerFromId', t, function (user)
				local sitems = checkItems(source, t, user)
				local smoney = checkMoney(source, t, user)
				TriggerClientEvent('chatMessage', source, 'LESTER', {255, 0, 0}, info)
				TriggerClientEvent('avanyafouille:showItems', source, sitems)
				TriggerClientEvent('avanyafouille:showMoney', source, smoney)
				TriggerClientEvent('avanyafouille:showWeapon', source, currentWeapons[t])
		end)
	end)
	TriggerClientEvent("avanyafouille:warningFouille", t)
end)

RegisterServerEvent('returnWeapons')
AddEventHandler('returnWeapons', function(weps)
	currentWeapons[source] = weps
end)