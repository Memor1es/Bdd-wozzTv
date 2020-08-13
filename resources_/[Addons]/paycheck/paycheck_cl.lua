local isInService = false

Citizen.CreateThread(function ()
	Citizen.Wait(5000)
	
	while true do
		CheckAllServices()
	
		if isInService then 
			TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "Entreprise", false, "Vous etes en service prochaine paye dans 10 min !")
			Citizen.Wait(600000) -- Modifier cette valeur pour la fréquence des salaires (600000 = 10 minutes)
			TriggerServerEvent('paycheck:salary')
		else
			Citizen.Wait(60000) -- Check le service toutes les 2 minutes
		end
	end
end)

function CheckAllServices()
	if exports.metiers:getIsInService() then
		isInService = true
	elseif exports.ambulancier:getIsInServiceAmbulancier() then
		isInService = true
	elseif exports.burgershot:getIsInServiceburgershot() then
		isInService = true
	elseif exports.metiers:getIsInServiceBrasseur() then
		isInService = true
	elseif exports.metiers:getIsInServiceBrinks() then
		isInService = true
	--elseif exports.metiers:getIsInServiceBrasseur() then
		--isInService = true
	elseif exports.metiers:getIsInServiceBucheron() then
		isInService = true
	elseif exports.metiers:getIsInServiceFermier() then
		isInService = true
	elseif exports.metiers:getIsInServiceJoaillier() then
		isInService = true
	--elseif exports.metiers:getIsInServiceelectricien() then
		--isInService = true
	elseif exports.metiers:getIsInServiceMecano() then
		isInService = true
	elseif exports.metiers:getIsInServiceMineur() then
		isInService = true
	elseif exports.metiers:getIsInServicePecheur() then
		isInService = true
	--elseif exports.metiers:getIsInServicePompiste() then
		--isInService = true
	elseif exports.metiers:getIsInServiceVigneron() then
		isInService = true
	elseif exports.taxi:getIsInServiceTaxi() then
		isInService = true
	elseif exports.bar:getIsInServicebar() then
		isInService = true
	elseif exports.event:getIsInServiceEvent() then
		isInService = true
	--elseif exports.transporteur:getIsInServicetransporteur() then
		--isInService = true
	elseif exports.avocat:getIsInServiceAvocat() then
		isInService = true
	else
		isInService = false
	end
end
