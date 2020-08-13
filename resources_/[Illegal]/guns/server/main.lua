local lockerWeapons = {}

MySQL.ready(function()
    print("MySQL Ready")
	local result = MySQL.Sync.fetchAll('SELECT identifier, loadout FROM users')

	for i=1, #result, 1 do
        if result[i].loadout == nil or result[i].loadout == "" then
            result[i].loadout = "[]"
        end
		lockerWeapons[result[i].identifier] = json.encode(result[i].loadout)
    end

    for i=1, 256, 1 do
        user = exports['essentialmode']:getPlayerFromId(i)
        if user and user.getIdentifier() then
            print(("Sending weapons to %s"):format(i))
            TriggerClientEvent('avanyaguns:setWeapons', i, lockerWeapons[user.getIdentifier()])
        end
    end
	-- send information after db has loaded, making sure everyone gets vehicle information
end)

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

function saveWeapons(user, weapons)
    local identifier = user.getIdentifier()
    local loadout = json.encode(weapons)
    MySQL.Async.execute('UPDATE users SET loadout = @loadout WHERE identifier = @identifier',
        {
            ['@loadout'] = loadout,
            ['@identifier'] = identifier
        })
end

function removeWeaponFromWeapons(weapon_name, weapons)
    for k, v in ipairs(weapons) do
        if v.name == weapon_name then
            table.remove(weapons, k)
            --weapons[k] = nil
        end
    end
end


-- Player Joined Save to DB
RegisterNetEvent('es:playerLoaded')
AddEventHandler('es:playerLoaded', function(source, user)
    local Source = source
    print("es:playerLoaded")
    print(("%s - %s"):format(Source, user))
    for k, v in pairs(user) do
        print(("%s - %s"):format(k, v))
    end

    local identifier = user.getIdentifier()
    print(("identifier - %s"):format(identifier))

    local currentWeapons = getWeapons(identifier)
    lockerWeapons[identifier] = currentWeapons
    print("[es_locker] sending weaposn to client")
    TriggerClientEvent('avanyaguns:setWeapons', Source, currentWeapons)
end)


-- Player Left Save to DB
AddEventHandler('es:playerDropped', function(user)
    local identifier = user.getIdentifier()
    print(("[es_locker] Player Droped: %s "):format(identifier))
    local currentWeapons = lockerWeapons[identifier]
    if currentWeapons ~= nil and #currentWeapons ~= 0 then
        saveWeapons(user, currentWeapons)
    end
end)


RegisterServerEvent('avanyaguns:svTryGiveWeapon')
AddEventHandler('avanyaguns:svTryGiveWeapon', function(requestId, weapon_name)
    local Source = source
    print('avanyaguns:svTryGiveWeapon')
    print(('trying to give %s - %s from %s'):format(requestId, weapon_name, Source))
    user = exports['essentialmode']:getPlayerFromId(Source)
    target = exports['essentialmode']:getPlayerFromId(requestId)

    if (user) and (target) then
        print(("%s - %s - %s"):format(Source, user.getIdentifier(), target.getIdentifier()))
        local identifier = user.getIdentifier()
        local currentWeapons = getWeapons(identifier)

        for k,v in ipairs(currentWeapons) do
            if v.name == weapon_name then
                print(("removing %s"):format(v.name))
                --currentWeapons[k] = nil
                table.remove(currentWeapons, k)
            end
        end
        local tidentifier = target.getIdentifier()
        local targets_weapons = getWeapons(tidentifier)

        local already_has = false
        for k,v in ipairs(targets_weapons) do
            if v.name == weapon_name then
                print(("already has %s"):format(v.name))
                v.isHidden = false
                already_has = true
            end
        end
        if already_has == false then
            print(("giving %s - %s"):format(requestId, weapon_name))
            table.insert(targets_weapons, {name = weapon_name, weaponModel = weapon_name, isHidden = false})
        elseif already_has == true then
            table.insert(targets_weapons, {name = weapon_name, weaponModel = weapon_name, isHidden = true})
        end

        lockerWeapons[identifier] = currentWeapons
        lockerWeapons[tidentifier] = targets_weapons
        saveWeapons(user, currentWeapons)
        saveWeapons(target, targets_weapons)
        --currentWeapons = targets_weapons
        --TriggerClientEvent('avanyaguns:setWeapons', source, currentWeapons)
        TriggerClientEvent('avanyaguns:removeWeapon', Source, {name = weapon_name, weapon_model = weapon_name})
        TriggerClientEvent('avanyaguns:setWeapons', requestId, targets_weapons)
    end

end)

RegisterServerEvent('avanyaguns:svTryTakeWeapon')
AddEventHandler('avanyaguns:svTryTakeWeapon', function(requestId, weapon_name)
    local Source = source
    print('avanyaguns:svTryTakeWeapon')
    print(('trying to take %s from %s by %s'):format(weapon_name, requestId, Source))
    user = exports['essentialmode']:getPlayerFromId(Source)
    target = exports['essentialmode']:getPlayerFromId(requestId)

    if (user) and (target) then
        print(("%s - %s - %s"):format(Source, user.getIdentifier(), target.getIdentifier()))
        local tidentifier = target.getIdentifier()
        local targets_weapons = getWeapons(tidentifier)

        for k,v in ipairs(targets_weapons) do
            if v.name == weapon_name then
                print(("removing %s from"):format(v.name, target.getIdentifier()))
                table.remove(targets_weapons, k)
                --targets_weapons[k] = nil
            end
        end
        -- currentWeapons = getWeapons(user.getIdentifier())
        local identifier = user.getIdentifier()
        local currentWeapons = getWeapons(identifier)

        local already_has = false
        for k,v in ipairs(currentWeapons) do
            if v.name == weapon_name then
                print(("already has %s"):format(v.name))
                v.isHidden = false
                already_has = true
            end
        end
        if already_has == false then
            print(("giving %s - %s"):format(requestId, weapon_name))
            table.insert(currentWeapons, {name = weapon_name, weaponModel = weapon_name, isHidden = false})
        elseif already_has == true then
            table.insert(currentWeapons, {name = weapon_name, weaponModel = weapon_name, isHidden = true})
        end

        lockerWeapons[identifier] = currentWeapons
        lockerWeapons[tidentifier] = targets_weapons
        saveWeapons(user, currentWeapons)
        saveWeapons(target, targets_weapons)
        TriggerClientEvent('avanyaguns:setWeapons', Source, currentWeapons)
        TriggerClientEvent('avanyaguns:removeWeapon', requestId, {name = weapon_name, weapon_model = weapon_name})
        --TriggerClientEvent('avanyaguns:setWeapons', requestId, targets_weapons)
    end

end)

RegisterServerEvent('avanyaguns:giveWeaponSelf')
AddEventHandler('avanyaguns:giveWeaponSelf', function(weapon_name)
    -- local playerId = sourc
    print('avanyaguns:giveWeaponSelf')
    local Source = source
    print(('trying to give %s - %s'):format(Source, weapon_name))
    user = exports['essentialmode']:getPlayerFromId(Source)
    if user then
        local identifier = user.getIdentifier()
        print(("%s - %s"):format(Source, identifier))
        local currentWeapons = getWeapons(identifier)
        lockerWeapons[identifier] = currentWeapons
        local already_has = false
        for k,v in ipairs(currentWeapons) do
            if v.name == weapon_name then
                print(("already has %s"):format(v.name))
                v.isHidden = false
                already_has = true
            end
        end
        if already_has == false then
            print(("giving %s - %s"):format(requestId, weapon_name))
            table.insert(currentWeapons, {name = weapon_name, weaponModel = weapon_name, isHidden = false})
        elseif alread_has == true then
            table.insert(currentWeapons, {name = weapon_name, weaponModel = weapon_name, isHidden = true})
        end

        local identifier = user.getIdentifier()
        lockerWeapons[identifier] = currentWeapons
        saveWeapons(user, currentWeapons)
        TriggerClientEvent('avanyaguns:setWeapons', Source, currentWeapons)
    else
        print("Error, invalaid user")
    end
end)


RegisterServerEvent('avanyaguns:removeWeaponSelf')
AddEventHandler('avanyaguns:removeWeaponSelf', function(weapon_name)
    -- local playerId = source
    print('avanyaguns:removeWeaponSelf')
    local Source = source
    print(('trying to remove %s - %s'):format(Source, weapon_name))
    user = exports['essentialmode']:getPlayerFromId(Source)
    if user then

        local identifier = user.getIdentifier()
        print(("%s - %s"):format(Source, identifier))
        local currentWeapons = lockerWeapons[identifier]
        local already_has = false
        for k,v in ipairs(currentWeapons) do
            if v.name == weapon_name then
                print(("removing has %s"):format(v.name))
                --currentWeapons[k] = nil
                table.remove(currentWeapons, k)
                already_has = true
            end
        end
        if already_has == false then
            print(("doesn't have %s - %s"):format(requestId, weapon_name))
        elseif already_has == true then
            print(("doesn't have %s - %s"):format(requestId, weapon_name))
        end

        local identifier = user.getIdentifier()
        lockerWeapons[identifier] = currentWeapons
        saveWeapons(user, currentWeapons)
        TriggerClientEvent('avanyaguns:removeWeapon', Source, {name = weapon_name, weapon_model = weapon_name})
        -- TriggerClientEvent('avanyaguns:setWeapons', source, currentWeapons)
    else
        print("Error, invalaid user")
    end
end)


RegisterServerEvent('avanyaguns:getWeapons')
AddEventHandler('avanyaguns:getWeapons', function()
    print('avanyaguns:getWeapons')
    local Source = source
    user = exports['essentialmode']:getPlayerFromId(Source)
    if(user) then
        local identifier = user.getIdentifier()
        local currentWeapons = getWeapons(identifier)
        lockerWeapons[identifier] = currentWeapons
        TriggerClientEvent('avanyaguns:setWeapons', Source, currentWeapons)
    end
end)


RegisterServerEvent('avanyaguns:updateWeaponsStatus')
AddEventHandler('avanyaguns:updateWeaponsStatus', function(weapon)
    local Source = source

    print('avanyaguns:updateWeaponsStatus')
    local user = exports['essentialmode']:getPlayerFromId(Source)
    local identifier = user.getIdentifier()
    print(("%s"):format(weapon))
    currentWeapons = lockerWeapons[identifier]
    for k,v in pairs(currentWeapons) do
        if v.name == weapon.name then
            print(("updating %s"):format(v.name))
            v.isHidden = weapon.isHidden
        end

    end


    lockerWeapons[identifier] = currentWeapons
    saveWeapons(user, currentWeapons)
    -- currentWeapons[weapon].isHidden = weapon.isHidden
    -- TriggerClientEvent('avanyaguns:setWeapons', source, currentWeapons)
end)
