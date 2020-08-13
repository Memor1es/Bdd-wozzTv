function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.abs(math.floor(num * mult + 0.5) / mult)
end

RegisterServerEvent('avanyafacture:factureGranted')
AddEventHandler('avanyafacture:factureGranted', function(target, amount)
	TriggerClientEvent('avanyafacture:payFacture', target, amount, source)
	TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Facture", false, "Facture de ~g~"..amount.."$~s~ envoyée à "..GetPlayerName(target))
end)

RegisterServerEvent('avanyafacture:factureETA')
AddEventHandler('avanyafacture:factureETA', function(sender, code)
	if(code==1) then
		TriggerClientEvent("es_freeroam:notify", sender, "CHAR_BANK_MAZE", 1, "Facture", false, GetPlayerName(source).."~b~ à déjà une demande de facture en cours !")
	elseif(code==2) then
		TriggerClientEvent("es_freeroam:notify", sender, "CHAR_BANK_MAZE", 1, "Facture", false, GetPlayerName(source).."~y~ n'a pas répondu à la demande de facture !")
	elseif(code==3) then
		TriggerClientEvent("es_freeroam:notify", sender, "CHAR_BANK_MAZE", 1, "Facture", false, GetPlayerName(source).."~r~ à refuser de payer la facture !")
	elseif(code==0) then
		TriggerClientEvent("es_freeroam:notify", sender, "CHAR_BANK_MAZE", 1, "Facture", false, GetPlayerName(source).."~g~ à payer la facture !")
	end
end)

RegisterServerEvent('avanyafacture:givecash')
AddEventHandler('avanyafacture:givecash', function(t, amount)
    local my_source = source
    local amount = round(tonumber(amount))
     if amount <= 0 then
        TriggerClientEvent('chatMessage', my_source, "", {0, 0, 200}, "^1Valeur incorrect^0")
    else
        TriggerEvent('es:getPlayerFromId', my_source, function(user)
            if user.getBank() >= amount then
                TriggerEvent('es:getPlayerFromId', t, function(recipient)
                    user.removeBank(amount)
                    recipient.addMoney(amount)
                    TriggerClientEvent("es_freeroam:notify", my_source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Argent donne: ~r~-$".. amount)
                    TriggerClientEvent("es_freeroam:notify", t, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Argent recu: ~g~$".. amount)
                    --TriggerClientEvent("banking:updateBalance", my_source)
                end)
            else
                TriggerClientEvent('chatMessage', my_source, "", {0, 0, 200}, "^1Pas assez d'argent^0")
                CancelEvent()
            end
        end)
    end
end)