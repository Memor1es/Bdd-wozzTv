-- All voice channels

local channelBetween = 5 -- When player is between two borders/channels and players are near

local channelNorth = 4

local channelCityLeft = 3

local channelCityRightBottom = 2

local channelCityRightTop = 1



-- North border using Y coords

local northBorder = 650.0 

-- Left and Right border using X coords

local mainLeftAndRightBorder = -260.0

-- Right bottom top border

local bottomTopBorder = -1100.0



-- Max distance for voice proximity

local maxVoiceDistance = 12.5



DecorRegister("AvanyaChannel", 3)



--local oldVoiceChannel = 0

currentVoiceChannel = 0



local debugModeActivated = false

RegisterNetEvent("avanyainfinity:debugmode")

AddEventHandler("avanyainfinity:debugmode", function()

	debugModeActivated = not debugModeActivated

end)



function DoVoiceChannelCheck()

	local myPed = GetPlayerPed(-1)

	local myCoords = GetEntityCoords(myPed)



	-- Use position to define potential new channel

	local newChannel = 1



	if myCoords.y < northBorder then

		if myCoords.x > mainLeftAndRightBorder then

			if myCoords.y < bottomTopBorder then

				newChannel = channelCityRightBottom

			else

				newChannel = channelCityRightTop

			end

		else

			newChannel = channelCityLeft

		end

	else

		newChannel = channelNorth

	end



	if debugModeActivated then

		print("New channel after coords : " .. newChannel)

	end



	-- Check borders

	local isNearBorder = false

	-- Check north border

	if myCoords.y < northBorder + maxVoiceDistance and myCoords.y > northBorder - maxVoiceDistance then

		isNearBorder = true

	elseif myCoords.x > mainLeftAndRightBorder - maxVoiceDistance and myCoords.x < mainLeftAndRightBorder + maxVoiceDistance then

		isNearBorder = true

	elseif myCoords.x > mainLeftAndRightBorder and myCoords.y < bottomTopBorder + maxVoiceDistance and myCoords.y > bottomTopBorder - maxVoiceDistance then

		isNearBorder = true

	end



	if isNearBorder then

		if debugModeActivated then

			print("Near borders")

		end

		

		newChannel = channelBetween

	else

		local otherPlayerInBetween = false



		-- Check nearby players

		local otherPed = nil

		local otherPedCoords = nil

		local distanceBetweenPlayer = 1337.0

		for _, i in ipairs(GetActivePlayers()) do

			otherPed = GetPlayerPed(i)

			otherPedCoords = GetEntityCoords(otherPed)

			distanceBetweenPlayer = GetDistanceBetweenCoords(otherPedCoords.x, otherPedCoords.y, otherPedCoords.z, myCoords.x, myCoords.y, myCoords.z, true) -- Check if vector - vector isn't better

			if distanceBetweenPlayer < maxVoiceDistance and otherPed ~= GetPlayerPed(-1) then

				-- Player nearby ! check decor

				local currentOtherDecor = DecorGetInt(otherPed, "AvanyaChannel")



				if debugModeActivated then

					print("Player nearby, check decor : " .. currentOtherDecor)

				end

				

				while currentOtherDecor >= 6 do

					currentOtherDecor = DecorGetInt(otherPed, "AvanyaChannel")

					Citizen.Wait(2)

				end



				if currentOtherDecor == channelBetween then

					otherPlayerInBetween = true

				end

			end

		end



		if otherPlayerInBetween then

			if debugModeActivated then

				print("An other player is near border")

			end



			local distanceRange = maxVoiceDistance * 3.2



			for _, i in ipairs(GetActivePlayers()) do

				otherPed = GetPlayerPed(i)

				otherPedCoords = GetEntityCoords(otherPed)

				distanceBetweenPlayer = GetDistanceBetweenCoords(otherPedCoords.x, otherPedCoords.y, otherPedCoords.z, myCoords.x, myCoords.y, myCoords.z, true) -- Check if vector - vector isn't better

				if distanceBetweenPlayer < distanceRange and otherPed ~= GetPlayerPed(-1) then

					-- Player nearby ! check decor

					local currentOtherDecor = DecorGetInt(otherPed, "AvanyaChannel")				

					while currentOtherDecor >= 6 do

						currentOtherDecor = DecorGetInt(otherPed, "AvanyaChannel")

						Citizen.Wait(2)

					end



					if currentOtherDecor == channelBetween then

						if myCoords.y < northBorder + distanceRange and myCoords.y > northBorder - distanceRange then

							newChannel = channelBetween

						elseif myCoords.x > mainLeftAndRightBorder - distanceRange and myCoords.x < mainLeftAndRightBorder + distanceRange then

							newChannel = channelBetween

						elseif myCoords.x > mainLeftAndRightBorder and myCoords.y < bottomTopBorder + distanceRange and myCoords.y > bottomTopBorder - distanceRange then

							newChannel = channelBetween

						end

					end

				end

			end

		end

	end



	DecorSetInt(GetPlayerPed(-1), "AvanyaChannel", math.random(6,100000000))

	Citizen.Wait(5)

	DecorSetInt(GetPlayerPed(-1), "AvanyaChannel", newChannel)



	if debugModeActivated then

		print("On set le decor : " .. newChannel)

	end



	--NetworkClearVoiceChannel()

	--Citizen.Wait(10)

	NetworkSetVoiceChannel(newChannel)

	currentVoiceChannel = newChannel



	if debugModeActivated then

		print("Nouvelle voix : " .. newChannel)

		print("--------------------------------------------------------\n\n")

	end

	-- Check if voice channel need a change or not

	--if oldVoiceChannel ~= newChannel then

		--oldVoiceChannel = newChannel

	--end

end



function ShowDebugText(text)  

	ClearPrints()



	-- when drawing

	BeginTextCommandDisplayText('AVANYADEBUGVOICE')

	AddTextComponentSubstringPlayerName(text)

	EndTextCommandDisplayText(0.0, 0.9)

end



function DisplayDebug()

	--local currentRegisteredDecor = DecorGetInt(GetPlayerPed(-1), "avanyaChannel")

	--ShowDebugText("Decor : " .. currentRegisteredDecor .. " Voice channel : " .. currentVoiceChannel)

	ShowDebugText("Voice channel : " .. currentVoiceChannel)

end



Citizen.CreateThread(function()

	while true do

		--NetworkClearVoiceChannel()

		--Citizen.Wait(10)

		--NetworkSetVoiceChannel(1)



		DoVoiceChannelCheck()

		Citizen.Wait(250)

	end

end)



-- Workaround

--Citizen.CreateThread(function()

--	while true do

--		Citizen.Wait(7500)

--		NetworkClearVoiceChannel()

--		Citizen.Wait(50)

--		NetworkSetVoiceChannel(currentVoiceChannel)

--	end

--end)





Citizen.CreateThread(function()

	Citizen.Wait(500)



	AddTextEntry('AVANYADEBUGVOICE', "<p align='center'><font size='30'>~r~Debug : ~w~~a~</font></p>")



	while true do

		if debugModeActivated then

			DisplayDebug()

			Citizen.Wait(0)

		else

			Citizen.Wait(500)

		end

	end

end)