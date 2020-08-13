Citizen.CreateThread(function()

	while true do

        -- Application ID 

		SetDiscordAppId(714600608920764486)



        -- Image name

		SetDiscordRichPresenceAsset('rich')

		SetDiscordRichPresenceAssetText('RainbowLand - discord.gg/9pqjy7r')

		SetRichPresence("discord.gg/9pqjy7r")



        -- Update every 2min

		Citizen.Wait(120000)

	end

end)