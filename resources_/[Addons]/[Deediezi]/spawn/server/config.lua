--[[
##################################################################
Author : Deediezi
-----------------------------------------------------------------
Gitlab : https://gitlab.com/Deediezi/gta5_scripts
-----------------------------------------------------------------
Discord : Deediezi#0794
##################################################################
]]


----------------------------------------------
-- Global configuration ######################
-- - - - - - - - - - - - - - - - - - - - - - -
lang = 'fr'								-- English (eng) or French (fr). You can add a new language using the template below. Pay attention to commas.

globalConf = {
	
	['SERVER'] = {
		remote_database = false				-- If your database is not on the same machine as your server, set to true. (Optimizing query performance).
	},

	['MAIN'] = {
		autoUpdate = true,					-- Disable / Enable automatic player position update.
		autoUpdate_timer = 150000,			-- Set the time interval between two updates in the DB. Useless if the previous parameter is set to false. (600000ms = 600s = 10mn) - 6000ms minimum.
		checkVersion = true,				-- Checks the latest version of the script and informs you if an update is available.
	},

	['DB'] = {
		column_name = 'lastPosition'		-- Name of the 'lastpos' column in the users table in the database. If you do not have it, please import the lastPosition.sql file at the root of the folder.
	},

	['MSG'] = {
		save_message = true					-- Print a message in the console when the players' position is saved if the convar mysql_debug is set to false.
	},

	['COMMANDS'] = {
		rconSave = true 					-- Enable /save for the Rcon.
	}
}

--------------------------------------------------------------------------------
-- The world's most useful translation (lel) .. It may become useful some day? #
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
txt = {
	['eng'] = {
		update_available		= "[DEED] - Spawn : An update is available !",
		unable_to_find 			= "[DEED] - Spawn : Unable to find the latest version !",
		has_been_saved 			= "[DEED] - Spawn : The position of the players has been saved"
	},

	['fr'] = {
		update_available 		= "[DEED] - Spawn : Une mise à jour est disponible !",
		unable_to_find 			= "[DEED] - Spawn : Impossible de trouver la dernière version !",
		has_been_saved 			= "[DEED] - Spawn : La position des joueurs à été sauvegardé."
	}
}

----------------------------------------------
-- Do not touch below ! ######################
-- - - - - - - - - - - - - - - - - - - - - - -
fivemLink = "https://forum.fivem.net/t/release-deed-spawn-optimized-spawn-to-last-pos/43739"
_Version = '1.1'

--[[ Version Checker
if globalConf['MAIN'].checkVersion then
	PerformHttpRequest("https://www.dropbox.com/s/4b4pym91d9c3xky/version.txt?dl=0", function(err, rText, headers)
		if rText then
			if tonumber(rText) > tonumber(_Version) then
				print("\n---------------------------------------------------")
				print(txt[lang].update_available)
				print("---------------------------------------------------")
				print("Current : " .. _Version)
				print("Latest  : " .. rText .. "\n")
				os.execute("start " .. fivemLink)
			end
		else
			print("\n---------------------------------------------------")
			print(txt[lang].unable_to_find)
			print("---------------------------------------------------\n")
		end
	end, "GET", "", {what = 'this'})
end]]