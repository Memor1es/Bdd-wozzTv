-- SETUP 
local talkKey = 56 -- F9
local displayTime = 1000 -- in ms

local voice = 
{
	whisper = 2.0,
	default = 8.0,
	shout = 12.0,
}

-----------------------------------------

local currentVoice = 0
local currentRange = voice.default
local stopTime = 0

function Texte(_texte, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(_texte)
	DrawSubtitleTimed(showtime, 1)
end

AddEventHandler('onClientMapStart', function()
	if currentVoice == 0 then
		currentRange = voice.default
		NetworkSetTalkerProximity(voice.default)
	elseif currentVoice == 1 then
		currentRange = voice.shout
		NetworkSetTalkerProximity(voice.shout)
	elseif currentVoice == 2 then
		currentRange = voice.whisper
		NetworkSetTalkerProximity(voice.whisper)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustPressed(1, talkKey) then
			currentVoice = (currentVoice + 1) % 3

			if currentVoice == 0 then
				currentRange = voice.default
				NetworkSetTalkerProximity(voice.default)
				Texte("Vous entendez jusqu'a (~b~".. voice.default .."~s~m)", displayTime * 2)
			elseif currentVoice == 1 then
				currentRange = voice.shout
				NetworkSetTalkerProximity(voice.shout)
				Texte("Vous entendez jusqu'a (~b~".. voice.shout .."~s~m)", displayTime * 2)
			elseif currentVoice == 2 then
				currentRange = voice.whisper
				NetworkSetTalkerProximity(voice.whisper)
				Texte("Vous entendez jusqu'a (~b~".. voice.whisper .."~s~m)", displayTime * 2)
			end

			stopTime = GetGameTimer() + displayTime

			--NetworkClearVoiceChannel()
			Citizen.Wait(50)
			--NetworkSetVoiceChannel(currentVoiceChannel)
		end

		if stopTime >= GetGameTimer() then
			local coords = GetEntityCoords(GetPlayerPed(-1), 0)
			DrawMarker(28, coords.x, coords.y, coords.z, 0, 0, 0, 0, 0, 0, currentRange, currentRange, currentRange, 36, 160, 237, 100, 0, 0, 2, 0, 0, 0, 0)
		end
	end
end)