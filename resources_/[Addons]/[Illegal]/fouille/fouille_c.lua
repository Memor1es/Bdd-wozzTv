print("^0======================================================================^7")
print("^0[^4Author^0] ^7 WozzTV^7")
print("^0[^3Version^0] ^7:^0 ^01.0^7")
print("^0======================================================================^7")



---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
-------------------------------- Système de fouille par Bajà --------------------------------------------------
--------------------------------- Développé pour Avanya -------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

-- Config

local waitTime = 7000

local maxDistanceToSearch = 2



local function GetPlayers()

    local players = {}



    for i = 0, 256 do

        if NetworkIsPlayerActive(i) then

            table.insert(players, i)

        end

    end



    return players

end



local function GetClosestPlayer()

	local players = GetPlayers()

	local closestDistance = -1

	local closestPlayer = -1

	local ply = GetPlayerPed(-1)

	local plyCoords = GetEntityCoords(ply, 0)

	

	for index,value in ipairs(players) do

		local target = GetPlayerPed(value)

		if(target ~= ply) then

			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)

			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)

			if(closestDistance == -1 or closestDistance > distance) then

				closestPlayer = value

				closestDistance = distance

			end

		end

	end

	

	return closestPlayer, closestDistance

end



local function Notify(icon, title, desc, text)

	Citizen.CreateThread(function()

		Wait(1)

		SetNotificationTextEntry("STRING");

		AddTextComponentString(text);

		SetNotificationMessage(icon, icon, true, 1, title, desc, text);

		DrawNotification(false, true);

	end)

end



RegisterNetEvent("avanyafouille:checkInventoryC")

AddEventHandler("avanyafouille:checkInventoryC", function()	



	t, distance = GetClosestPlayer()

	if(distance ~= -1 and distance <= maxDistanceToSearch) then

		TriggerEvent('gc:playAmination', "missfam5_yoga", "start_pose", 500)

		Citizen.Wait(500)

		TriggerEvent('gc:playAmination', "missbigscore2aig_7@driver", "boot_r_loop", 1500)

		Citizen.Wait(1500)

		TriggerEvent('gc:playAmination', "mini@yoga", "outro_2", 2000)

		Citizen.Wait(2000)

		TriggerEvent('gc:playAmination', "missfam5_yoga", "start_pose", 500)

		Citizen.Wait(500)

		TriggerEvent('gc:playAmination', "missbigscore2aig_7@driver", "boot_r_loop", 1500)

		Citizen.Wait(1500)

		TriggerEvent('gc:playAmination', "mini@yoga", "outro_2", 2000)

		Citizen.Wait(2000)



		ClearPedTasks(ped)



		t, distance = GetClosestPlayer()

		if(distance ~= -1 and distance <= maxDistanceToSearch) then

			TriggerServerEvent("avanyafouille:checkInventoryS", GetPlayerServerId(t))

		else

			TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, "Le type est parti !")

		end

	else



		TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, "Je devrais peut etre m'approcher")

	end



end)

RegisterNetEvent('avanyafouille:warningFouille')

AddEventHandler('avanyafouille:warningFouille', function()

	TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, "Quelqu'un vient de me fouiller !")

end)

RegisterNetEvent('avanyafouille:showItems')

AddEventHandler('avanyafouille:showItems', function(sitems)

	TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, sitems)

end)

RegisterNetEvent('avanyafouille:showMoney')

AddEventHandler('avanyafouille:showMoney', function(smoney)

	TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, smoney)

end)



RegisterNetEvent('avanyafouille:showWeapon')

AddEventHandler('avanyafouille:showWeapon', function(weapons)
	weapons = table.concat(weapons, ", ")
	TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, weapons)

end)

--
-- Weapons table
-- 
Weapons = {
    { name = "Knife",                   model = "WEAPON_KNIFE"                  },
    { name = "Nightstick",              model = "WEAPON_NIGHTSTICK"             },
    { name = "Hammer",                  model = "WEAPON_HAMMER"                 },
    { name = "Bat",                     model = "WEAPON_BAT"                    },
    { name = "Golfclub",                model = "WEAPON_GOLFCLUB"               },
    { name = "Crowbar",                 model = "WEAPON_CROWBAR"                },
    { name = "Pistol",                  model = "WEAPON_PISTOL"                 },
    { name = "Pistol MK2",              model = "WEAPON_PISTOL_MK2"             },
    { name = "Combat pistol",           model = "WEAPON_COMBATPISTOL"           },
    { name = "AP pistol",               model = "WEAPON_APPISTOL"               },
    { name = "Pistol 50",               model = "WEAPON_PISTOL50"               },
    { name = "Micro SMG",               model = "WEAPON_MICROSMG"               },
    { name = "SMG",                     model = "WEAPON_SMG"                    },
    { name = "Assault SMG",             model = "WEAPON_ASSAULTSMG"             },
    { name = "Assault rifle",           model = "WEAPON_ASSAULTRIFLE"           },
    { name = "Assault rifle MK2",       model = "WEAPON_ASSAULTRIFLE_MK2"       },
    { name = "Carbine rifle",           model = "WEAPON_CARBINERIFLE"           },
    { name = "Carbine rifle MK2",       model = "WEAPON_CARBINERIFLE_MK2"       },
    { name = "Advanced rifle",          model = "WEAPON_ADVANCEDRIFLE"          },
    { name = "MG",                      model = "WEAPON_MG"                     },
    { name = "Combat MG",               model = "WEAPON_COMBATMG"               },
    { name = "Combat MG MK2",           model = "WEAPON_COMBATMG_MK2"           },
    { name = "Pump shotgun",            model = "WEAPON_PUMPSHOTGUN"            },
    { name = "Pump shotgun MK2",        model = "WEAPON_PUMPSHOTGUN_MK2"        },
    { name = "Sweeper shotgun",         model = "WEAPON_SWEEPERSHOTGUN"         },
    { name = "Sawnoff shotgun",         model = "WEAPON_SAWNOFFSHOTGUN"         },
    { name = "Assault shotgun",         model = "WEAPON_ASSAULTSHOTGUN"         },
    { name = "Bullpup shotgun",         model = "WEAPON_BULLPUPSHOTGUN"         },
    { name = "Stun gun",                model = "WEAPON_STUNGUN"                },
    { name = "Sniper rifle",            model = "WEAPON_SNIPERRIFLE"            },
    { name = "Heavy sniper",            model = "WEAPON_HEAVYSNIPER"            },
    { name = "Heavy sniper MK2",        model = "WEAPON_HEAVYSNIPER_MK2"        },
    { name = "Grenade launcher",        model = "WEAPON_GRENADELAUNCHER"        },
    { name = "Smoke launcher",          model = "WEAPON_GRENADELAUNCHER_SMOKE"  },
    { name = "RPG",                     model = "WEAPON_RPG"                    },
    { name = "Minigun",                 model = "WEAPON_MINIGUN"                },
    { name = "Grenade",                 model = "WEAPON_GRENADE"                },
    { name = "Sticky bomb",             model = "WEAPON_STICKYBOMB"             },
    { name = "Smoke grenade",           model = "WEAPON_SMOKEGRENADE"           },
    { name = "BZ gas",                  model = "WEAPON_BZGAS"                  },
    { name = "Molotov",                 model = "WEAPON_MOLOTOV"                },
    { name = "Fire extinguisher",       model = "WEAPON_FIREEXTINGUISHER"       },
    { name = "Petrolcan",               model = "WEAPON_PETROLCAN"              },
    { name = "Flare",                   model = "WEAPON_FLARE"                  },
    { name = "SNS pistol",              model = "WEAPON_SNSPISTOL"              },
    { name = "SNS pistol MK2",          model = "WEAPON_SNSPISTOL_MK2"          },
    { name = "Special carbine",         model = "WEAPON_SPECIALCARBINE"         },
    { name = "Special carbine MK2",     model = "WEAPON_SPECIALCARBINE_MK2"     },
    { name = "Heavy pistol",            model = "WEAPON_HEAVYPISTOL"            },
    { name = "Bullpup rifle",           model = "WEAPON_BULLPUPRIFLE"           },
    { name = "Bullpup rifle MK2",       model = "WEAPON_BULLPUPRIFLE_MK2"       },
    { name = "Homing launcher",         model = "WEAPON_HOMINGLAUNCHER"         },
    { name = "Prox mine",               model = "WEAPON_PROXMINE"               },
    { name = "Snowball",                model = "WEAPON_SNOWBALL"               },
    { name = "Vintage pistol",          model = "WEAPON_VINTAGEPISTOL"          },
    { name = "Dagger",                  model = "WEAPON_DAGGER"                 },
    { name = "Firework",                model = "WEAPON_FIREWORK"               },
    { name = "Musket",                  model = "WEAPON_MUSKET"                 },
    { name = "Marksman rifle",          model = "WEAPON_MARKSMANRIFLE"          },
    { name = "Marksman rifle MK2",      model = "WEAPON_MARKSMANRIFLE_MK2"      },
    { name = "Heavy shotgun",           model = "WEAPON_HEAVYSHOTGUN"           },
    { name = "Gusenberg",               model = "WEAPON_GUSENBERG"              },
    { name = "Hatchet",                 model = "WEAPON_HATCHET"                },
    { name = "Railgun",                 model = "WEAPON_RAILGUN"                },
    { name = "Combat PDW",              model = "WEAPON_COMBATPDW"              },
    { name = "Knuckle",                 model = "WEAPON_KNUCKLE"                },
    { name = "Marksman pistol",         model = "WEAPON_MARKSMANPISTOL"         },
    { name = "Flashlight",              model = "WEAPON_FLASHLIGHT"             },
    { name = "Machete",                 model = "WEAPON_MACHETE"                },
    { name = "Machine pistol",          model = "WEAPON_MACHINEPISTOL"          },
    { name = "Switch blade",            model = "WEAPON_SWITCHBLADE"            },
    { name = "Revolver",                model = "WEAPON_REVOLVER"               },
    { name = "Revolver MK2",            model = "WEAPON_REVOLVER_MK2"           },
    { name = "Compact rifle",           model = "WEAPON_COMPACTRIFLE"           },
    { name = "DB shotgun",              model = "WEAPON_DBSHOTGUN"              },
    { name = "Flare gun",               model = "WEAPON_DBSHOTGUN"              },
    { name = "Auto shotgun",            model = "WEAPON_AUTOSHOTGUN"            },
    { name = "Battle axe",              model = "WEAPON_BATTLEAXE"              },
    { name = "Compact launcher",        model = "WEAPON_COMPACTLAUNCHER"        },
    { name = "SMG",                     model = "WEAPON_SMG"                    },
    { name = "SMG MK2",                 model = "WEAPON_SMG_MK2"                },
    { name = "Mini SMG",                model = "WEAPON_MINISMG"                },
    { name = "Pipe bomb",               model = "WEAPON_PIPEBOMB"               },
    { name = "Poolcue",                 model = "WEAPON_POOLCUE"                },
    { name = "Sweeper",                 model = "WEAPON_SWEEPER"                },
    { name = "Wrench",                  model = "WEAPON_WRENCH"                 },
    { name = "Bottle",                  model = "WEAPON_BOTTLE"                 },
    { name = "Pipe wrench",             model = "WEAPON_PIPEWRENCH"             },
    { name = "Double action",           model = "WEAPON_DOUBLEACTION"           },
    { name = "Ray pistol",              model = "WEAPON_RAYPISTOL"              },
    { name = "Ray carbine",             model = "WEAPON_RAYCARBINE"             },
    { name = "Ray minigun",             model = "WEAPON_RAYMINIGUN"             },
    { name = "Digi scanner",            model = "WEAPON_DIGISCANNER"            }
}

Citizen.CreateThread(function()
	while true do
		local myWeapons = {}
		for _, weapon in pairs(Weapons) do
			if HasPedGotWeapon(PlayerPedId(), GetHashKey(weapon.model), false) then
				table.insert(myWeapons, weapon.name)
			end
		end
		TriggerServerEvent("returnWeapons", myWeapons)
		Wait(1000)
	end
end)