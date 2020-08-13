-- 8 Banks :
--      * Pacific Standard [pacificstd] Vinewood Boulevard 
--      * Flecca [fleeca] Vespucci Boulevard
--      * Fleeca [fleeca2] Hawick Avenue & Meteor Street
--      * Fleeca [fleeca3] Hawick Avenue
--      * Fleeca [fleeca4] Boulevard Del Perro
--      * Fleeca [fleeca5] Great Ocean Highway
--      * Fleeca [fleeca6] Route 68
--      * Blaine County Savings [blainecounty] Paleto Boulevard

local banks = {
    ["fleeca"] = {
        position = { ['x'] = 147.049, ['y'] = -1044.944, ['z'] = 29.368 },
        reward = 80000,
        nameofbank = "Fleeca, Vespucci Boulevard",
        lastrobbed = 0,
        robbingseconds = 300
    },
    --[[["fleeca2"] = {
        position = { ['x'] = 311.232, ['y'] = -283.249, ['z'] = 54.074 },
        reward = 20000,
        nameofbank = "Fleeca, Hawick Avenue & Meteor Street",
        lastrobbed = 0,
        robbingseconds = 300
    },]]
    --[[["fleeca3"] = {
        position = { ['x'] = -353.814, ['y'] = -54.051, ['z'] = 49.046 },
        reward = 20000,
        nameofbank = "Fleeca, Hawick Avenue",
        lastrobbed = 0,
        robbingseconds = 300
    },
    ["fleeca4"] = {
        position = { ['x'] = -1211.607, ['y'] = -335.744, ['z'] = 37.689 },
        reward = 20000,
        nameofbank = "Fleeca, Boulevard Del Perro",
        lastrobbed = 0,
        robbingseconds = 300
    },]]
    ["fleeca5"] = {
        position = { ['x'] = -2957.667, ['y'] = 481.457, ['z'] = 15.697 },
        reward = 35000,
        nameofbank = "Fleeca, Great Ocean Highway",
        lastrobbed = 0,
        robbingseconds = 360
    },
    --[[["fleeca6"] = {
        position = { ['x'] = 1176.471, ['y'] = 2711.818, ['z'] = 37.997 },
        reward = 22000,
        nameofbank = "Fleeca, Route 68",
        lastrobbed = 0,
        robbingseconds = 360
    },]]
    ["blainecounty"] = {
        position = { ['x'] = -107.065, ['y'] = 6474.801, ['z'] = 31.626 },
        reward = 25000,
        nameofbank = "Blaine County Savings, Paleto Boulevard",
        lastrobbed = 0,
        robbingseconds = 360
    }
}

local delayBetweenRobbings = 10800

local robbers = {}

function get3DDistance(x1, y1, z1, x2, y2, z2)
    return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('es_bank:toofar')
AddEventHandler('es_bank:toofar', function(robb)
    if (robbers[source]) then
        local message = "Le braquage a été ~b~annulé~w~ à : ~y~" .. banks[robb].nameofbank .. "~w~."
        TriggerEvent('police:sendAlert', message)
        TriggerClientEvent('es_bank:toofarlocal', source)
        robbers[source] = nil
    end
end)

RegisterServerEvent('es_bank:rob')
AddEventHandler('es_bank:rob', function(robb)
    if banks[robb] then
        local bank = banks[robb]

        if (os.time() - bank.lastrobbed) < delayBetweenRobbings and bank.lastrobbed ~= 0 then
            -- TriggerClientEvent("showNotify", source, "Un braquage a eu lieu récemment ici. Possible dans ~y~" .. (7200 - (os.time() - bank.lastrobbed)) .. " secondes~w~.")
            TriggerEvent("es_freeroam:notify", "CHAR_LESTER_DEATHWISH", 1, "Braquage", false, "Un braquage a déjà eu lieu ici, reviens dans 3h !")
            return
        end
        local message = "~r~BRAQUAGE EN COURS~w~ à : ~y~" .. bank.nameofbank .. "~w~."
        TriggerEvent('police:sendAlert', message)
        TriggerClientEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "L\'alarme a été déclenchée !")
        TriggerClientEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Vous devez rester dans cette zone !")
        TriggerClientEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Tenez la position pendant ~y~" .. (bank.robbingseconds / 60) .. " minutes~w~ et l\'~g~argent~w~ sera à vous !")
        TriggerClientEvent('es_bank:currentlyrobbing', source, robb, bank.robbingseconds)
        banks[robb].lastrobbed = os.time()
        robbers[source] = robb
        local savedSource = source
        SetTimeout((bank.robbingseconds * 1000), function()
            if (robbers[savedSource]) then
                TriggerClientEvent('es_bank:robberycomplete', savedSource, job)
                TriggerEvent('es:getPlayerFromId', savedSource, function(target)
                    if (target) then
                        --target:addDirty_Money(bank.reward)
                        target.addDirtyMoney(bank.reward)
                        local message = "Le ~r~braquage~w~ est bientôt terminé à : ~y~" .. bank.nameofbank .. " ~w~!"
                        TriggerEvent('police:sendAlert', message)
                    end
                end)
            end
        end)
    end
end)
