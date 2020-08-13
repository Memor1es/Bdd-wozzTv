local Settings = {

	--Should the scoreboard draw wanted level?

	["WantedStars"] = false,

	

	--Should the scoreboard draw player ID?

	["PlayerID"] = true,

	

	--Should the scoreboard draw voice indicator?

	["VoiceIndicator"] = false,

	

	--Display time in milliseconds

	["DisplayTime"] = 2500,

	

	--Keys that will activate the scoreboard.

	--Change only the number value, NOT the 'true'

	--Multiple keys can be used, simply add another row with another number

	--See: https://wiki.gtanet.work/index.php?title=Game_Controls

	

	--MultiplayerInfo / Z

	[167] = true,

	

	--Detonate / G

	--[47] = true,

}



-- END OF SETTINGS --


local function DrawPlayerList()	

    local players = {}



    for i = 0, 255 do

        if NetworkIsPlayerActive(i) then

            table.insert(players, i)

        end

    end

	

	-- Background

	DrawRect(0.5, 0.025, 0.125, 0.035, 0, 0, 0, 220)

	

	--Nombre de joueur

	SetTextFont(4)

	SetTextScale(0.6, 0.6)

	SetTextColour(255, 255, 255, 255)

	SetTextEntry("STRING")

	

	local nPlayerTxt = "" .. #players

	if #players < 10 then

		nPlayerTxt = "0" .. #players

	end

	

	AddTextComponentString("NOMBRE DE JOUEUR : " .. nPlayerTxt)

	DrawText(0.4410, 0.006)
	
end



local LastPress = 0

local GetGameTimer = GetGameTimer

Citizen.CreateThread( function()

	--TriggerServerEvent('scoreboard:getInfos')



	RequestStreamedTextureDict("mplobby")

	RequestStreamedTextureDict("mpleaderboard")

	Citizen.Wait(250)

	

	while true do

		Wait(0)

		

		for k, v in pairs(Settings) do

			if type(k) == "number" and v == true then

				if IsControlPressed( 27, k ) then

					LastPress = GetGameTimer()

				end

			end

		end

		

		if GetGameTimer() < LastPress + Settings["DisplayTime"] then

			DrawPlayerList()

		end

		

	end

end)