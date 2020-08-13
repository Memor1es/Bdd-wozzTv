-- Discord Webhook Links
-- Need help setting it up? (https://support.discordapp.com/hc/en-us/articles/228383668-Intro-to-Webhooks)

DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/724670608205545602/G1rvKjzGL5Mva3IpRbo_RxM485O3wlmyCBfEZWrgDDockiV9PSQXHFIsVnw93gkL_BjH' -- Replace "WEBHOOK_HERE" Or Error
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/724670608205545602/G1rvKjzGL5Mva3IpRbo_RxM485O3wlmyCBfEZWrgDDockiV9PSQXHFIsVnw93gkL_BjH' -- Replace "WEBHOOK_HERE" Or Error
DiscordWebhookSalary = 'https://discordapp.com/api/webhooks/724670608205545602/G1rvKjzGL5Mva3IpRbo_RxM485O3wlmyCBfEZWrgDDockiV9PSQXHFIsVnw93gkL_BjH'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/724670608205545602/G1rvKjzGL5Mva3IpRbo_RxM485O3wlmyCBfEZWrgDDockiV9PSQXHFIsVnw93gkL_BjH' -- Replace "WEBHOOK_HERE" Or Error

-- Bot/Client Avatar and UserName
SystemAvatar = 'https://preview.redd.it/b2ogwpxt8d031.jpg?auto=webp&s=73fc9e5ecb21589772b2ae7ba4232d7a59890e28' -- Bot Avatar (FiveM Logo By Default)

UserAvatar = 'https://preview.redd.it/b2ogwpxt8d031.jpg?auto=webp&s=73fc9e5ecb21589772b2ae7ba4232d7a59890e28' -- Change this to a link of your choice (Example https://i.imgur.com/KIcqSYs.png)

SystemName = 'Listory Rp Logs' -- Change this to a name of your choice!
SalaryName = 'Listory Rp Logs'

-- How To Format and Setup Special Commands
--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]

-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command

-- These Are Your Special Commands!!
-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '**[OOC]:**'},
				   {'/911', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/AnyCommand',					  
					   '/AnyCommand2',
					  }

-- Own WebHooks/Seperate Channels
-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnyCommand', 'YOUR_WEBHOOK_HERE'},
					  {'/AnyCommand2', 'YOUR_WEBHOOK_HERE'},
					 }

-- Discord Text To Speech Friendly Commands
-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

