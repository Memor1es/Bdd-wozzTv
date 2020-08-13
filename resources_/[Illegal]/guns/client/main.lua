local lockers =

{
    { x = 812.03936767578, y = -2151.9758300781, z = 28.619016647339 },

    { x = 18.280990600586, y = -1111.8747558594, z = 28.797031402588 },

    { x = -1310.6567382813, y = -391.01898193359, z = 35.69580078125 },

    { x = 247.38514709473, y = -46.347534179688, z = 68.941040039063 },

    { x = 138.80187988281, y = -1293.8731689453, z = 28.232719421387 },

    { x = 1275.2604980469, y = -1710.7546386719, z = 53.77144241333 },
	
    { x = -1866.441, y = 2065.421, z = 134.4346 },


    { x = -330.69348144532, y = 6293.0756835938, z = -12.67658901214 },

    { x = -327.4076538086, y = 6078.1440429688, z = 30.454767227172 },

    { x = 1696.9802246094, y = 3754.7172851562, z = 33.705341339112 },



    { x = -796.62536621094, y = 327.57922363282, z = 216.0382385254 },

    { x = -1559.209350586, y = -432.42129516602, z = 41.14433670044 },


    -- Apps

    { x = -899.63604736328, y = -448.7670288086, z = 125.54302215576 },

    { x = -175.43426513672, y = 492.25549316406, z = 129.04371643066 },

    { x = -1905.14453125, y = -571.12994384766, z = 18.097211837768 },

    { x = -27.416326522828, y = -588.58782958984, z = 89.1234664917 },

    { x = -11.569939613342, y = -598.44348144532, z = 78.430229187012 },

    { x = -467.9981994629, y = -699.07305908204, z = 76.095542907714 },

    { x = -467.9981994629, y = -699.07305908204, z = 76.095542907714 },

    { x = -765.14477539062, y = 327.10751342774, z = 209.39657592774 },

    { x = -772.55633544922, y = 326.62216186524, z = 174.81233215332 },

    { x = -622.85229492188, y = 55.50556564331, z = 96.599533081054 },

    { x = 336.34033203125, y = 437.5484008789, z = 140.77076721192 },

    { x = 378.63458251954, y = 430.01159667968, z = 137.3001403808 },

    { x = 119.69998931884, y = 567.603515625, z = 175.69714355468 },

    ------- GANG

    { x = -796.3016, y = 327.5777, z = 186.3132 }, -- GOTO

    { x = 330.4100, y = -2014.3100, z = 21.3900 }, -- VAGOS 

    { x = 106.6369, y = -1981.2560, z = 19.9620 }, -- BALLAS 

    { x = -137.1991, y = -1609.959, z = 34.03031 }, -- FAMILIES

    { x = -85.2542, y = 997.9051, z = 229.6071 }, -- Yiddish
    
    { x = -1520.066, y = 110.5334, z = 50.02735 },  -- Camorra
 
}



local ammoPistol = 1337

local ammoSMG = 1337

local ammoRifle = 1337

local ammoMolly = 2



local allWeapons = {}

local currentWeapons = {}

-- Weapon List

Citizen.CreateThread(function()

    --allWeapons["-1834847097"]	= "WEAPON_DAGGER"

    allWeapons["-1786099057"] = "WEAPON_BAT"

    allWeapons["-102323637"] = "WEAPON_BOTTLE"

    allWeapons["-2067956739"] = "WEAPON_CROWBAR"

    allWeapons["-1951375401"] = "WEAPON_FLASHLIGHT"

    allWeapons["1141786504"] = "WEAPON_GOLFCLUB"

    allWeapons["1317494643"] = "WEAPON_HAMMER"

    allWeapons["-102973651"] = "WEAPON_HATCHET"

    allWeapons["-656458692"] = "WEAPON_KNUCKLE"

    allWeapons["-1716189206"] = "WEAPON_KNIFE"

    allWeapons["-581044007"] = "WEAPON_MACHETE"

    allWeapons["-538741184"] = "WEAPON_SWITCHBLADE"

    --allWeapons["1737195953"]	= "WEAPON_NIGHTSTICK"

    allWeapons["419712736"] = "WEAPON_WRENCH"

    allWeapons["-853065399"] = "WEAPON_BATTLEAXE"

    allWeapons["-1810795771"] = "WEAPON_POOLCUE"

    allWeapons["940833800"] = "WEAPON_STONE_HATCHET"

    --allWeapons["-1239161099"]	= "WEAPON_KATANA"



    allWeapons["453432689"] = "WEAPON_PISTOL"

    allWeapons["-1075685676"] = "WEAPON_PISTOL_MK2"

    allWeapons["-771403250"] = "WEAPON_HEAVYPISTOL"

    allWeapons["1593441988"] = "WEAPON_COMBATPISTOL"

    allWeapons["584646201"] = "WEAPON_APPISTOL"

    allWeapons["911657153"] = "WEAPON_STUNGUN"

    allWeapons["-1716589765"] = "WEAPON_PISTOL50"

    allWeapons["137902532"] = "WEAPON_VINTAGEPISTOL"

    allWeapons["1198879012"] = "WEAPON_FLAREGUN"

    allWeapons["-598887786"] = "WEAPON_MARKSMANPISTOL"

    allWeapons["-1045183535"] = "WEAPON_REVOLVER"

    allWeapons["-879347409"] = "WEAPON_REVOLVER_MK2"

    allWeapons["-1746263880"] = "WEAPON_DOUBLEACTION"



    allWeapons["324215364"] = "WEAPON_MICROSMG"

    allWeapons["736523883"] = "WEAPON_SMG"

    allWeapons["2024373456"] = "WEAPON_SMG_MK2"

    allWeapons["-270015777"] = "WEAPON_ASSAULTSMG"

    allWeapons["171789620"] = "WEAPON_COMBATPDW"

    allWeapons["-619010992"] = "WEAPON_MACHINEPISTOL"

    allWeapons["-1121678507"] = "WEAPON_MINISMG"



    allWeapons["487013001"] = "WEAPON_PUMPSHOTGUN"

    allWeapons["1432025498"] = "WEAPON_PUMPSHOTGUN_MK2"

    allWeapons["2017895192"] = "WEAPON_SAWNOFFSHOTGUN"

    allWeapons["-494615257"] = "WEAPON_ASSAULTSHOTGUN"

    allWeapons["-1654528753"] = "WEAPON_BULLPUPSHOTGUN"

    allWeapons["-1466123874"] = "WEAPON_MUSKET"

    allWeapons["984333226"] = "WEAPON_HEAVYSHOTGUN"

    allWeapons["-275439685"] = "WEAPON_DBSHOTGUN"

    allWeapons["317205821"] = "WEAPON_AUTOSHOTGUN"



    allWeapons["-1074790547"] = "WEAPON_ASSAULTRIFLE"

    allWeapons["961495388"] = "WEAPON_ASSAULTRIFLE_MK2"

    allWeapons["-2084633992"] = "WEAPON_CARBINERIFLE"

    allWeapons["-86904375"] = "WEAPON_CARBINERIFLE_MK2"

    allWeapons["-1357824103"] = "WEAPON_ADVANCEDRIFLE"

    allWeapons["-1063057011"] = "WEAPON_SPECIALCARBINE"

    allWeapons["-1768145561"] = "WEAPON_SPECIALCARBINE_MK2"

    allWeapons["2132975508"] = "WEAPON_BULLPUPRIFLE"

    allWeapons["-2066285827"] = "WEAPON_BULLPUPRIFLE_MK2"

    allWeapons["1649403952"] = "WEAPON_COMPACTRIFLE"



    allWeapons["-1660422300"] = "WEAPON_MG"

    allWeapons["2144741730"] = "WEAPON_COMBATMG"

    allWeapons["-608341376"] = "WEAPON_COMBATMG_MK2"

    allWeapons["1627465347"] = "WEAPON_GUSENBERG"



    allWeapons["100416529"] = "WEAPON_SNIPERRIFLE"

    allWeapons["205991906"] = "WEAPON_HEAVYSNIPER"

    allWeapons["177293209"] = "WEAPON_HEAVYSNIPER_MK2"

    allWeapons["-952879014"] = "WEAPON_MARKSMANRIFLE"

    allWeapons["1785463520"] = "WEAPON_MARKSMANRIFLE_MK2"



    allWeapons["-1813897027"] = "WEAPON_GRENADE"

    allWeapons["741814745"] = "WEAPON_STICKYBOMB"

    allWeapons["615608432"] = "WEAPON_MOLOTOV"

    allWeapons["1233104067"] = "WEAPON_FLARE"

    allWeapons["-1600701090"] = "WEAPON_BZGAS"

    allWeapons["198329471"] = "WEAPON_wwshield"
end)


_menuPool = NativeUI.CreatePool()

menuLocker = NativeUI.CreateMenu("", "Casier d'armes", 0, 0)

_menuPool:Add(menuLocker)

function AddMenu()
    for k, v in ipairs(currentWeapons) do
        local item
        local weaponName = string.upper(v.weaponModel)

        if weaponName == "WEAPON_DAGGER" then
            weaponName = "WEAPON_KARAMBIT"
        elseif weaponName == "WEAPON_NIGHTSTICK" then
            weaponName = "WEAPON_DILDO"
        end

        local model = string.gsub(weaponName, "WEAPON_", "")

        if v.isHidden then
            item = NativeUI.CreateItem("" .. model .. " ~r~Rangée", "~r~L'arme est rangée dans le casier~w~ Appuyez sur ENTRER ~g~pour la récupérer.")
        else
            item = NativeUI.CreateItem("" .. model .. " ~g~Sortie", "~g~L'arme est sortie~w~ Appuyez sur ENTRER ~r~pour la ranger.")
        end

        menuLocker:AddItem(item)
        item.Activated = function(sender, item, index)
            currentWeapons[k].isHidden = not currentWeapons[k].isHidden

            TriggerServerEvent("avanyaguns:updateWeaponsStatus", currentWeapons[k])

            ammoPistol = 1337
            ammoSMG = 1337
            ammoRifle = 1337
            ammoMolly = 2

            ToggleWeapons()

            menuLocker:Clear()
            AddMenu()
        end
    end
end


_menuPool:MouseControlsEnabled(false)

_menuPool:ControlDisablingEnabled(false)

_menuPool:RefreshIndex()

function GetPlayers()

    local players = {}

    for i = 0, 256 do

        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()

    local players = GetPlayers()

    local closestDistance = -1

    local closestPlayer = -1

    local ply = GetPlayerPed(-1)

    local plyCoords = GetEntityCoords(ply, 0)



    for index, value in ipairs(players) do

        local target = GetPlayerPed(value)

        if (target ~= ply) then

            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)

            local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)

            if (closestDistance == -1 or closestDistance > distance) then

                closestPlayer = value

                closestDistance = distance
            end
        end
    end



    return closestPlayer, closestDistance
end

function ShowNotification(text)

    SetNotificationTextEntry("STRING")

    AddTextComponentString(text)

    DrawNotification(false, false)
end

function Chat(t)

    TriggerEvent("chatMessage", 'RainbowLand ', { 255, 0, 0 }, "" .. tostring(t))
end

function DisplayHelpText(str)

    SetTextComponentFormat("STRING")

    AddTextComponentString(str)

    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function ToggleWeapons()



    local playerPed = GetPlayerPed(-1)



    local notHiddenWeapons = {}



    for k, v in ipairs(currentWeapons) do

        if not v.isHidden then
            print(v.weaponModel)

            table.insert(notHiddenWeapons, v.weaponModel)
        end



        RemoveWeaponFromPed(playerPed, GetHashKey(v.weaponModel))
    end



    for index, value in ipairs(notHiddenWeapons) do

        local ammoType = GetPedAmmoTypeFromWeapon(PlayerPedId(), GetHashKey(value))

        local ammoAmount = 1337



        if ammoType == 1950175060 then -- Pistol

            ammoAmount = ammoPistol

        elseif ammoType == 1820140472 then -- SMG

            ammoAmount = ammoSMG

        elseif ammoType == 218444191 then -- Rifle

            ammoAmount = ammoRifle
        end



        if value == "WEAPON_MOLOTOV" then

            GiveWeaponToPed(playerPed, GetHashKey(value), ammoMolly, true, true)

        else

            SetPedAmmoByType(PlayerPedId(), ammoType, ammoAmount)
            print(value)
            print(ammoAmount)
            print(GetHashKey(value))
            GiveWeaponToPed(playerPed, GetHashKey(value), ammoAmount, true, true)
        end
    end



    menuLocker:Clear()

    AddMenu()
end

local isNearShop = false

Citizen.CreateThread(function()

    Citizen.Wait(5000)

    -- not sure if you need this or not, but i noticed sometime my weapons didn't "load" on spawn
    print("setting up weapons")
    ToggleWeapons()

    while true do

        _menuPool:ProcessMenus()



        local pos = GetEntityCoords(GetPlayerPed(-1), false)



        isNearShop = false

        for k, v in ipairs(lockers) do

            if (Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 20.0) then

                DrawMarker(25, v.x, v.y, v.z + 0.01, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 0, 0, 50, 0, 0, 2, 0, 0, 0, 0)

                if (Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 1.5) then

                    isNearShop = true
                end
            end
        end



        if isNearShop then

            DisplayHelpText("Ouvrir le casier : ~INPUT_CONTEXT~")

            if (IsControlJustReleased(1, 51)) then

                menuLocker:Visible(not menuLocker:Visible())
            end

        else

            menuLocker:Visible(false)
        end



        Citizen.Wait(0)
    end
end)

RegisterNetEvent("avanyaguns:toggleWeapons")
AddEventHandler("avanyaguns:toggleWeapons", function()
    toggleweapons()
end)


RegisterNetEvent("avanyaguns:needUpdateWeapons")

AddEventHandler("avanyaguns:needUpdateWeapons", function()

    ammoPistol = 0 -- Pistol

    ammoSMG = 0 -- SMG

    ammoRifle = 0 -- Rifle

    ammoMolly = 0 -- Molotov



    TriggerServerEvent('avanyaguns:getWeapons')
end)

RegisterNetEvent("avanyaguns:setWeapons")

AddEventHandler("avanyaguns:setWeapons", function(data)
    print("avanyaguns:setWeapons")
    currentWeapons = data
    print(("%s"):format(data))
    for k,v in ipairs(currentWeapons) do
        print(("%s - %s"):format(k, v))
        for k2,v2 in ipairs(v) do
            print(("%s - %s"):format(k, v))
        end

    end

    ToggleWeapons()
end)



RegisterNetEvent("avanyaguns:removeWeapon")

AddEventHandler("avanyaguns:removeWeapon", function(weaponData)

    for k, v in ipairs(currentWeapons) do

        if v.name == weaponData.name then

            table.remove(currentWeapons, k)



            RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(weaponData.weapon_model))
        end
    end



    ToggleWeapons()
end)



RegisterNetEvent("avanyaguns:tryGiveWeapon")

AddEventHandler("avanyaguns:tryGiveWeapon", function()

    t, distance = GetClosestPlayer()

    if (distance ~= -1 and distance < 3) then

        local currentWeaponHash = GetSelectedPedWeapon(GetPlayerPed(-1))



        if allWeapons["" .. currentWeaponHash] == nil then

            Chat("Veuillez selectionner une arme echangeable.")

        else

            local currentWeapon = allWeapons["" .. currentWeaponHash]

            TriggerServerEvent("avanyaguns:svTryGiveWeapon", GetPlayerServerId(t), currentWeapon)
        end

    else

        Chat("Pas de joueur assez proche")
    end
end)

RegisterNetEvent("avanyaguns:tryTakeeWeapon")
AddEventHandler("avanyaguns:tryTakeWeapon", function()
    t, distance = GetClosestPlayer()
    if (distance ~= -1 and distance < 3) then
        local currentWeaponHash = GetSelectedPedWeapon(GetPlayerPed(-1))
        if allWeapons["" .. currentWeaponHash] == nil then
            Chat("Veuillez selectionner une arme echangeable.")
        else
            local currentWeapon = allWeapons["" .. currentWeaponHash]
            TriggerServerEvent("avanyaguns:svTryTakeWeapon", GetPlayerServerId(t), currentWeapon)
        end
    else
        Chat("Pas de joueur assez proche")
    end
end)

RegisterNetEvent("avanyaguns:giveWeaponSelf")
AddEventHandler("avanyaguns:giveWeaponSelf", function()
    local currentWeaponHash = GetSelectedPedWeapon(GetPlayerPed(-1))
    if allWeapons["" .. currentWeaponHash] == nil then
        Chat("Veuillez selectionner une arme echangeable.")
    else
        local currentWeapon = allWeapons["" .. currentWeaponHash]
        TriggerServerEvent("avanyaguns:giveWeaponSelf", currentWeapon)
    end
end)

RegisterNetEvent("avanyaguns:removeWeaponSelf")
AddEventHandler("avanyaguns:removeWeaponSelf", function()
    local currentWeaponHash = GetSelectedPedWeapon(GetPlayerPed(-1))
    if allWeapons["" .. currentWeaponHash] == nil then
        Chat("Veuillez selectionner une arme echangeable.")
    else
        local currentWeapon = allWeapons["" .. currentWeaponHash]
        TriggerServerEvent("avanyaguns:removeWeaponSelf", currentWeapon)
    end
end)

function loadAnimDict(dict)

    while (not HasAnimDictLoaded(dict)) do

        RequestAnimDict(dict)

        Citizen.Wait(5)
    end
end

----- maybe add this? other wise wepason on the player given from external resouces will not be picked up
function getPlayersWeapons()
    local weapons   = {}
	local playerPed  = PlayerPedId()
	local weaponList = allWeapons

	for k, v in pairs(weaponList) do
		-- local weaponHash = GetHashKey(weaponList[i].name)
        local weaponHash = GetHashKey(v)
        -- k should == GetHashKey(v)
        if k ~= weaponHash then
            print(("Data in table is wrong for %s %s %s"):format(v, k, weaponsHash))
        end

		if HasPedGotWeapon(playerPed, weaponHash, false) and v ~= 'WEAPON_UNARMED' then
            --[[
			table.insert(weapons, {
				value = v
			})
			--]]
            currentWeapons[v] = {
                name = v,
                weaponModel = v,
                isHidden = false
            }
		end
    end
end

RegisterNetEvent("avanyaguns:ToggleSilencers")

AddEventHandler("avanyaguns:ToggleSilencers", function()	

	local ped = PlayerPedId()

    local currentWeaponHash = GetSelectedPedWeapon(ped)



	if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_AR_SUPP_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_SMG_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP"))

	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))

	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_SR_SUPP"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_AT_SR_SUPP_03")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP"))	

	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SR_SUPP_03")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  

	else

		ShowNotification("Veuillez prendre une arme en main capable d'equiper un silencieux.")

		return nil

	end



	ShowNotification("Vous venez de vous equiper d'un silencieux. Il faudra le reequiper a chaques retours en ville.")

end)



RegisterNetEvent("avanyaguns:ToggleClips")

AddEventHandler("avanyaguns:ToggleClips", function()	

	local ped = PlayerPedId()

    local currentWeaponHash = GetSelectedPedWeapon(ped)



	if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_CLIP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_CLIP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_CLIP_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey("COMPONENT_SNSPISTOL_CLIP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_CLIP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_CLIP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_SMG_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_ASSAULTSMG_CLIP_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_COMBATPDW_CLIP_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_MINISMG") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MINISMG"), GetHashKey("COMPONENT_MINISMG_CLIP_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_03"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_MG") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MG"), GetHashKey("COMPONENT_MG_CLIP_02"))

	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATMG") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_COMBATMG_CLIP_02"))  

	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_02")) 

	elseif currentWeaponHash == GetHashKey("WEAPON_GUSENBERG") then

		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_GUSENBERG"), GetHashKey("COMPONENT_GUSENBERG_CLIP_02"))

	else

		ShowNotification("Veuillez prendre une arme en main capable d'equiper un chargeur.")

		return nil

	end



	ShowNotification("Vous venez de vous equiper d'un chargeur. Il faudra le reequiper a chaques retours en ville.")

end)

RegisterNetEvent("avanyaguns:ToggleRecycleur")

AddEventHandler("avanyaguns:ToggleRecycleur", function()	

	local playerPed = GetPlayerPed(-1)



	if (GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) then

		SetPedComponentVariation(playerPed, 8, 123, 0, 0)

		SetPedPropIndex(playerPed, 1, 26, 0, 0)

	else

		SetPedComponentVariation(playerPed, 8, 153, 0, 0)

		SetPedPropIndex(playerPed, 1, 28, 0, 0)

	end



	ShowNotification("Vous venez de vous equiper d'un recycleur, attention a bien etre dans l'eau !")

end)
