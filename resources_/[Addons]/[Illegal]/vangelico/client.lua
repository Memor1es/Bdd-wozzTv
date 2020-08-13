------------------------------------

----            Config          ----

------------------------------------



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



local vangelicoCoords = {x = -631.8, y = -237.8, z = 38.0}

local vangelicoCenterCoords = {x = -623.65, y = -231.9, z = 38.0}



local securitySystemCoords = {x = -631.46, y = -229.90, z = 38.05}



local rangeForCabinet = 1.0



---------------------------------------------------------------



local isRobbing = false

local isTryingToRob = false

local hasRemovedSecuritySystem = false



local currentPed = nil

local currentPos = nil



local function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end



Drawing = setmetatable({}, Drawing)

Drawing.__index = Drawing



function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)

	local px,py,pz=table.unpack(GetGameplayCamCoords())

	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)



	local scale = (1/dist)*14

	local fov = (1/GetGameplayCamFov())*100

	local scale = scale*fov



	SetTextScale(scaleX*scale, scaleY*scale)

	SetTextFont(4)

	SetTextProportional(1)

	SetTextColour(r, g, b, a)

	SetTextDropshadow(0, 0, 0, 0, 255)

	SetTextEdge(2, 0, 0, 0, 150)

	SetTextDropShadow()

	SetTextOutline()

	SetTextEntry("STRING")

	SetTextCentre(1)

	AddTextComponentString(textInput)

	SetDrawOrigin(x,y,z+1, 0)

	DrawText(0.0, 0.0)

	ClearDrawOrigin()

end



local function loadAnimDict(dict)  

    while (not HasAnimDictLoaded(dict)) do

        RequestAnimDict(dict)

        Citizen.Wait(10)

    end

end



local function DisarmSecuritySystem()

	local dict = "missheist_jewel@hacking"

	loadAnimDict(dict)



	local anim1 = "hack_intro"

	local anim2 = "hack_loop"

	local anim3 = "hack_outro"



	TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "Listory - Braquage", false, "Je desactive le systeme!")



	TaskPlayAnimAdvanced(PlayerPedId(), dict, anim1, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, 0.0, 0.0, 220.0, 1.0, 1.0, -1, 8, -1, 0, 0)

	Citizen.Wait(500)

	TaskPlayAnimAdvanced(PlayerPedId(), dict, anim2, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, 0.0, 0.0, 220.0, 1.0, 1.0, -1, 8, -1, 0, 0)

	Citizen.Wait(1700)

	TaskPlayAnimAdvanced(PlayerPedId(), dict, anim2, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, 0.0, 0.0, 220.0, 1.0, 1.0, -1, 8, -1, 0, 0)

	Citizen.Wait(1700)

	TaskPlayAnimAdvanced(PlayerPedId(), dict, anim2, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, 0.0, 0.0, 220.0, 1.0, 1.0, -1, 8, -1, 0, 0)

	Citizen.Wait(1700)

	TaskPlayAnimAdvanced(PlayerPedId(), dict, anim2, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, 0.0, 0.0, 220.0, 1.0, 1.0, -1, 8, -1, 0, 0)

	Citizen.Wait(1700)

	TaskPlayAnimAdvanced(PlayerPedId(), dict, anim2, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, 0.0, 0.0, 220.0, 1.0, 1.0, -1, 8, -1, 0, 0)

	Citizen.Wait(1700)

	TaskPlayAnimAdvanced(PlayerPedId(), dict, anim2, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, 0.0, 0.0, 220.0, 1.0, 1.0, -1, 8, -1, 0, 0)

	Citizen.Wait(1700)

	TaskPlayAnimAdvanced(PlayerPedId(), dict, anim2, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, 0.0, 0.0, 220.0, 1.0, 1.0, -1, 8, -1, 0, 0)

	Citizen.Wait(1700)

	TaskPlayAnimAdvanced(PlayerPedId(), dict, anim2, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, 0.0, 0.0, 220.0, 1.0, 1.0, -1, 8, -1, 0, 0)

	Citizen.Wait(1700)

	TaskPlayAnimAdvanced(PlayerPedId(), dict, anim2, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, 0.0, 0.0, 220.0, 1.0, 1.0, -1, 8, -1, 0, 0)

	Citizen.Wait(1700)

	TaskPlayAnimAdvanced(PlayerPedId(), dict, anim3, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, 0.0, 0.0, 220.0, 1.0, 1.0, -1, 8, -1, 0, 0)

	Citizen.Wait(500)



	RemoveAnimDict(dict)

	ClearPedTasks(GetPlayerPed(-1))	



	TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "Listory - Braquage", false, "C'est bon! fonce recuperer les bijoux!")



	hasRemovedSecuritySystem = true	

end



Citizen.CreateThread(function()

	Citizen.Wait(13000)



	while true do

		currentPed = GetPlayerPed(-1)

		currentPos = GetEntityCoords(currentPed, false)

		Citizen.Wait(500)

	end

end)



Citizen.CreateThread(function()

	Citizen.Wait(15000)



	local blip = AddBlipForCoord(vangelicoCoords.x, vangelicoCoords.y, vangelicoCoords.z)

	SetBlipSprite(blip, 439)

	SetBlipScale(blip, 1.2)

	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")

	AddTextComponentString("Bijouterie")

	EndTextCommandSetBlipName(blip)



	while true do

		Citizen.Wait(0)



		if not isTryingToRob then

			local distance = 1000



			if isRobbing then

				local distanceFromVangelico = GetDistanceBetweenCoords(vangelicoCenterCoords.x, vangelicoCenterCoords.y, vangelicoCenterCoords.z, currentPos.x, currentPos.y, currentPos.z, true)

				if distanceFromVangelico > 11.0 then

					TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "Listory - Braquage", false, "Attention! tu sors de la zone, tu as 5 secondes pour revenir a l'interieur!")

					Citizen.Wait(5000)

					distanceFromVangelico = GetDistanceBetweenCoords(vangelicoCenterCoords.x, vangelicoCenterCoords.y, vangelicoCenterCoords.z, currentPos.x, currentPos.y, currentPos.z, true)

					if distanceFromVangelico > 11.0 then

						TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "Listory - Braquage", false, "C'est termine, tu ne peux plus rien ramasser, casse toi vite !")

						isRobbing = false

						hasRemovedSecuritySystem = false



						for k,v in pairs(cabinetsCoords) do

							v.canRob = true

						end

					end

				end



				if hasRemovedSecuritySystem then

					for k,v in pairs(cabinetsCoords) do

						if v.canRob then

							distance = GetDistanceBetweenCoords(v.x, v.y, v.z, currentPos.x, currentPos.y, currentPos.z, true)

							if(distance < 10.0) then

								DrawMarker(25, v.x, v.y, v.z - 0.8, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 0, 0, 50, 0, 0, 2, 0, 0, 0, 0)

								Drawing.draw3DText(v.x, v.y, v.z - 0.3, "Bijoux", 4, 0.1, 0.05, 255, 255, 255, 255)

							end

							if(distance < rangeForCabinet) then

								DisplayHelpText("~INPUT_CONTEXT~ Prendre les bijoux !")

								if IsControlJustPressed(1, 51) then

									v.canRob = false



									local dict = "mp_missheist_ornatebank"

									local anim = "stand_cash_in_bag_loop"



									loadAnimDict(dict)



									if math.random(0,100) > 80 then anim = "put_cash_into_bag_loop" else anim = "stand_cash_in_bag_loop" end

									TaskPlayAnim(PlayerPedId(), dict, anim, 2.0, 2.0, -1, 0, 0, false, false, false)

									Citizen.Wait(1400)

									if math.random(0,100) > 80 then anim = "put_cash_into_bag_loop" else anim = "stand_cash_in_bag_loop" end

									TaskPlayAnim(PlayerPedId(), dict, anim, 2.0, 2.0, -1, 0, 0, false, false, false)

									Citizen.Wait(1400)



									RemoveAnimDict(dict)



									ClearPedTasks(GetPlayerPed(-1))	



									TriggerEvent('player:receiveItem', 16, 1)



									ClearPrints()

									SetTextEntry_2("STRING")

									AddTextComponentString("~g~Vous ramassez 1 bijoux")

									DrawSubtitleTimed(1500, 1)

								end

							end

						end

					end

				else

					local distanceFromSecuritySystem = GetDistanceBetweenCoords(securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, currentPos.x, currentPos.y, currentPos.z, true)

					if distanceFromSecuritySystem < 10.0 then

						DrawMarker(25, securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z - 0.9, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0, 0, 2, 0, 0, 0, 0)

						distanceFromSecuritySystem = GetDistanceBetweenCoords(securitySystemCoords.x, securitySystemCoords.y, securitySystemCoords.z, currentPos.x, currentPos.y, currentPos.z, true)

						if distanceFromSecuritySystem < 2.0 then

							DisplayHelpText("~INPUT_CONTEXT~ Desactiver le systeme de securite !")

							if IsControlJustPressed(1,51) then

								DisarmSecuritySystem()

							end

						end

					end

				end

			else

				distance = GetDistanceBetweenCoords(vangelicoCoords.x, vangelicoCoords.y, vangelicoCoords.z, currentPos.x, currentPos.y, currentPos.z, true)

				if(distance < 10.0) then

					DrawMarker(25, vangelicoCoords.x, vangelicoCoords.y, vangelicoCoords.z - 0.9, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 0, 0, 50, 0, 0, 2, 0, 0, 0, 0)

				end

				if(distance < 2.0) then

					if IsPedArmed(currentPed, 7) then

						if IsPlayerFreeAiming(PlayerId()) then

							DisplayHelpText("~INPUT_CONTEXT~ Entrer par effraction et declencher l'alarme !")

							if IsControlJustPressed(1,51) then

								if exports.metiers:getIsInService() or exports.metiers:getIsCop() then

									TriggerEvent('chatMessage', "", {0, 255, 0}, "T'es un flic, tu ne peux pas braquer !")

								else

									--isTryingToRob = true	

									--TriggerServerEvent('avanyavangelico:tryrobbery')
									TriggerServerEvent('police:isVangelicoRobbable')

								end



								Citizen.Wait(5000)

							end

						end

					end

				end

			end

		end

	end

end)

RegisterNetEvent('avanyavangelico:isvangelicopossible')
AddEventHandler('avanyavangelico:isvangelicopossible', function(cops)
    local neededNumberOfCops = 2
    if cops < neededNumberOfCops then
        TriggerEvent("es_freeroam:notify", "CHAR_LESTER_DEATHWISH", 1, "Braquage", false, "Braquage ~r~non autorisé~w~. Manque de policer (min : ~y~" .. neededNumberOfCops .. "~w~).")
	else
		isTryingToRob = true
        TriggerServerEvent('avanyavangelico:tryrobbery')
    end
end)

RegisterNetEvent("avanyavangelico:startrobbery")

AddEventHandler("avanyavangelico:startrobbery", function()

	isTryingToRob = false

	isRobbing = true

	TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "Listory - Braquage", false, "Fonce ! les flics sont informes, desactive le systeme d'alarme sur l'ordinateur !")

end)



RegisterNetEvent("avanyavangelico:stoprobbery")

AddEventHandler("avanyavangelico:stoprobbery", function()

	isRobbing = false

	isTryingToRob = false



	for k,v in pairs(cabinetsCoords) do

		v.canRob = true

	end

end)



local currentBlip

RegisterNetEvent("avanyavangelico:warnClient")

AddEventHandler("avanyavangelico:warnClient", function()

	Citizen.Wait(1000)

	if exports.metiers:getIsCop() then

		TriggerEvent("es_freeroam:notify", "CHAR_LESTER_DEATHWISH", 1, "Braquage de bijouterie", false, "GPS mis a jour ! vas-y fonce !")



		RemoveBlip(currentBlip)



		currentBlip = AddBlipForCoord(vangelicoCoords.x, vangelicoCoords.y, vangelicoCoords.z)

		SetBlipSprite(currentBlip, 432)

		SetBlipScale(currentBlip, 1.0)

		SetBlipAsShortRange(currentBlip, true)

		BeginTextCommandSetBlipName("STRING")

		AddTextComponentString("Braquage de bijouterie")

		EndTextCommandSetBlipName(currentBlip)



		SetNewWaypoint(vangelicoCoords.x, vangelicoCoords.y)

	end

end)