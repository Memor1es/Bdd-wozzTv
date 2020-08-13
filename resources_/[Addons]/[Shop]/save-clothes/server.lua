RegisterServerEvent("outfit:LoadOutfits")
AddEventHandler("outfit:LoadOutfits", function()
    local _source = source
    local identifier = GetPlayerIdentifiers(_source)[1]

    local Params = {
        ['identifier'] = identifier
    }
    MySQL.Async.fetchAll("SELECT * FROM player_outfits WHERE identifier=@identifier", Params, function(data)
        TriggerClientEvent("outfit:LoadOutfits", _source, data)
    end)
end)

RegisterServerEvent("outfit:SaveOutfit")
AddEventHandler("outfit:SaveOutfit", function(name, outfit)
    local _source = source
    local identifier = GetPlayerIdentifiers(_source)[1]

    local Params = {
        ['identifier'] = identifier,
        ['name'] = name,
        ['outfit'] = outfit,
    }
    MySQL.Async.execute("INSERT INTO player_outfits (identifier, name, outfit) VALUES (@identifier, @name, @outfit)", Params)
end)

RegisterServerEvent("outfit:DeleteOutfit")
AddEventHandler("outfit:DeleteOutfit", function(name)
    local _source = source
    local identifier = GetPlayerIdentifiers(_source)[1]

    local Params = {
        ['name'] = name,
        ['identifier'] = identifier,
    }
    MySQL.Async.execute("DELETE FROM player_outfits WHERE name=@name AND identifier=@identifier", Params)
end)