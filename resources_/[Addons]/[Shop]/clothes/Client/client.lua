---------------------------------------------------------------------------------------
--                     Author: Xavier CHOPIN <www.github.com/xchopin>                --
--                                 License: Apache 2.0                               --
---------------------------------------------------------------------------------------

local firstspawn = 0

local lang = 'fr'



local txt = {

  ['en'] = {

        ['title'] = 'Binco Shop',

        ['gender'] = 'Changing gender',

        ['head'] = 'Header',

        ['body'] = 'Body',

        ['pants'] = 'Pants',

        ['shoes'] = 'Shoes',

        ['vests'] = 'Vests',

        ['bags'] = 'Bags',

        ['accessoires'] = 'Accessoires',

        ['close'] = 'Close',

        ['hair'] = 'Hair',

        ['face'] = 'Face',

        ['ears'] = 'Ears',

        ['glasses'] = 'Glasses',

        ['masks'] = "Masks",

        ['hats'] = "Hats",

        ['gloves'] = "Arms and gloves",

        ['shirts'] = "Shirts",

        ['jackets'] = "Jackets",

        ['message'] = "Press ~INPUT_CONTEXT~ to ~g~shop for clothes",

        ['close'] = "Close"

  },



    ['fr'] = {

        ['title'] = 'Nouveau style',

        ['gender'] = 'Changer de genre',

        ['head'] = 'Tete',

        ['body'] = 'Corps',

        ['pants'] = 'Pantalon',

        ['shoes'] = 'Chaussures',

        ['vests'] = 'Kevlar',

        ['bags'] = 'Sacs',

		['accessoires'] = 'Accessoires',

        ['close'] = 'Fermer',

        ['hair'] = 'Cheveux',

        ['face'] = 'Visages',

        ['ears'] = 'Accessoires oreilles',

        ['glasses'] = 'Lunettes',

        ['masks'] = "Masques",

        ['hats'] = "Chapeaux",

        ['gloves'] = "Bras et gants",

        ['shirts'] = "Haut",

        ['jackets'] = "Vestes",

        ['message'] = "~INPUT_CONTEXT~ Pour vous ~b~changer",

        ['close'] = "Fermer"

  },

}


local isLeaving = false

AddEventHandler('playerSpawned', function(spawn)
    if firstspawn == 0 then
        TriggerServerEvent("clothing_shop:SpawnPlayer_server")
        firstspawn = 1
    end
    --TriggerServerEvent("item:getItems")
end)

RegisterNetEvent("clothing_shop:loadItems_client")
AddEventHandler("clothing_shop:loadItems_client",function(items)
    LoadItems(items)
end)

AddEventHandler('onPlayerDied', function()
    TriggerServerEvent("clothing_shop:SpawnPlayer_server")
end)

RegisterNetEvent("clothing_shop:getSkin_client")
AddEventHandler("clothing_shop:getSkin_client",function(skin)
    ChangeGender(skin)
end)

-- Change the gender of a player
function ChangeGender(skin)
    local newSkin = nil;
    if skin == "mp_m_freemode_01" then
        newSkin = "mp_f_freemode_01"
        setSkin(newSkin)
    else
        newSkin = "mp_m_freemode_01"
        setSkin(newSkin)
    end

    BuyItem({collection = "skin"}, {value = newSkin })
    -- Reset clothes
    if(GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) then 

		-- Male

		SetPedComponentVariation(GetPlayerPed(-1), 11, 257, 9, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 3, 6, 0, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 7, 4, 0, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 5, 20, 0, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 4, 78, 0, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 6, 31, 2, 2)



		SaveItem({collection = "component", id= 11}, {value = 257, texture_value = 9 })

		SaveItem({collection = "component", id= 8}, {value = 15, texture_value = 0 })

		SaveItem({collection = "component", id= 3}, {value = 6, texture_value = 0 })

		SaveItem({collection = "component", id= 7}, {value = 4, texture_value = 0 })

		SaveItem({collection = "component", id= 5}, {value = 20, texture_value = 0 })

		SaveItem({collection = "component", id= 4}, {value = 78, texture_value = 0 })

		SaveItem({collection = "component", id= 6}, {value = 31, texture_value = 2 })

	else 

		-- Female

		SetPedComponentVariation(GetPlayerPed(-1), 11, 268, 1, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 8, 87, 3, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 7, 43, 0, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 6, 32, 4, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 5, 20, 0, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 4, 80, 0, 2)

		SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 2)



		SaveItem({collection = "component", id= 11}, {value = 268, texture_value = 1 })

		SaveItem({collection = "component", id= 8}, {value = 87, texture_value = 3 })

		SaveItem({collection = "component", id= 7}, {value = 43, texture_value = 0 })

		SaveItem({collection = "component", id= 6}, {value = 32, texture_value = 4 })

		SaveItem({collection = "component", id= 5}, {value = 20, texture_value = 0 })

		SaveItem({collection = "component", id= 4}, {value = 80, texture_value = 0 })

		SaveItem({collection = "component", id= 3}, {value = 1, texture_value = 0 })

	end
end

function LoadItems(items)
    print("Avanyacloth : LOAD ITEMS !")

    if (items ~= nil) then
        print("Avanyacloth : ~= nil")

        currentMask = {mask = items.mask, texture = items.mask_texture}

		currentHat = {hat = items.hat, texture = items.hat_texture}

        currentGlasses = {glasses = items.glasses, texture = items.glasses_texture}
        
        setItem("component", 0, items.face, items.face_texture)
        setItem("component", 1, items.mask, items.mask_texture)
        setItem("component", 2, items.hair, items.hair_texture)
        setItem("component", 3, items.gloves, items.gloves_texture)
        setItem("component", 4, items.pants, items.pants_texture)
        setItem("component", 5, items.bag, items.bag_texture)
        setItem("component", 6, items.shoes, items.shoes_texture)
        setItem("component", 8, items.shirt, items.shirt_texture)
        setItem("component", 9, items.vest, items.vest_texture)
        setItem("component", 11, items.jacket, items.jacket_texture)
        -- Props (accessories that can fall) --
        setItem("prop", 0, items.hat, items.hat_texture)
        setItem("prop", 1, items.glasses, items.glasses_texture)
        setItem("prop", 2, items.ears, items.ears_texture)
    else
        print('Avanyacloth : is nil, default clothes')
        if(GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) then 

			-- Male

			SetPedComponentVariation(GetPlayerPed(-1), 11, 257, 9, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 3, 6, 0, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 7, 4, 0, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 5, 20, 0, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 4, 78, 0, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 6, 31, 2, 2)



			SetPedPropIndex(GetPlayerPed(-1), 0, 4, 6, 0)

		else 

			-- Female

			SetPedComponentVariation(GetPlayerPed(-1), 11, 10, 15, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 8, 11, 15, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 4, 43, 3, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 5, 20, 0, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 6, 3, 0, 2)

		end
    end

    SetModelAsNoLongerNeeded(modelhashed)
end

-- Sets skin's client
function setSkin(skin)
    local modelhashed = GetHashKey(skin)
    RequestModel(modelhashed)
    while not HasModelLoaded(modelhashed) do
        RequestModel(modelhashed)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), modelhashed)
    SetModelAsNoLongerNeeded(modelhashed)
end


-- Set an item on client's character
----------------------------------------------------------
---- TYPE = "component"     --      TYPE = "prop"       --
----------------------------------------------------------
---- NAME      |  part      --   NAME      |  part      --
----------------------------------------------------------
---- Face      |    0       --  Hats       |     0      --
---- Mask      |    1       --  Glasses    |     1      --
---- Hair      |    2       --  Ears       |     2      --
---- Gloves    |    3       --             |            --
---- Pants     |    4       --             |            --
---- Bags      |    5       --             |            --
---- Shoes     |    6       --             |            --
---- Shirts    |    8       --             |            --
---- Vests     |    9       --             |            --
---- Jackets   |   11       --             |            --
----------------------------------------------------------


function setItem(type, part, value, texture_value)
    if (part ~= nil and value ~= nil and texture_value ~= nil and type ~= nil) then
        if (type == "component") then
            SetPedComponentVariation(GetPlayerPed(-1), part, tonumber(value), tonumber(texture_value), 0)
        else
            if (type == "prop") then
                SetPedPropIndex(GetPlayerPed(-1), part, tonumber(value), tonumber(texture_value), 0)
            end
        end
    end
end


-- List of the clothing shops {parts,x,y,z}
local clothingShops = {
    { name="Magasin de vêtement", color=4, id=73, x=72.2545394897461,  y=-1399.10229492188, z=29.3761386871338},

    { name="Magasin de vêtement", color=4, id=73, x=-703.77685546875,  y=-152.258544921875, z=37.4151458740234},

    { name="Magasin de vêtement", color=4, id=73, x=-167.863754272461, y=-298.969482421875, z=39.7332878112793},

    { name="Magasin de vêtement", color=4, id=73, x=428.694885253906,  y=-800.1064453125,   z=29.4911422729492},

    { name="Magasin de vêtement", color=4, id=73, x=-829.413269042969, y=-1073.71032714844, z=11.3281078338623},

    { name="Magasin de vêtement", color=4, id=73, x=-1447.7978515625,  y=-242.461242675781, z=49.8207931518555},

    { name="Magasin de vêtement", color=4, id=73, x=11.6323690414429,  y=6514.224609375,    z=31.8778476715088},

    { name="Magasin de vêtement", color=4, id=73, x=123.64656829834,   y=-219.440338134766, z=54.5578384399414},

    { name="Magasin de vêtement", color=4, id=73, x=1696.29187011719,  y=4829.3125,         z=42.0631141662598},

    { name="Magasin de vêtement", color=4, id=73, x=618.093444824219,  y=2759.62939453125,  z=42.0881042480469},

    { name="Magasin de vêtement", color=4, id=73, x=1190.55017089844,  y=2713.44189453125,  z=38.2226257324219},

    { name="Magasin de vêtement", color=4, id=73, x=-1193.42956542969, y=-772.262329101563, z=17.3244285583496},

    { name="Magasin de vêtement", color=4, id=73, x=-3172.49682617188, y=1048.13330078125,  z=20.8632030487061},

    { name="Magasin de vêtement", color=4, id=73, x=-1108.44177246094, y=2708.92358398438,  z=19.1078643798828},
}


function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

-- Check if a player is near of a shop
function IsNearShop()

    for _, item in pairs(clothingShops) do

        local ply = GetPlayerPed(-1)

        local plyCoords = GetEntityCoords(ply, 0)

        local distance = GetDistanceBetweenCoords(item.x, item.y, item.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)

        if(distance < 10) then

			DrawMarker(25, item.x, item.y, item.z-0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 58,83,155, 50, 0, 0, 2, 0, 0, 0, 0)

        end

        if(distance < 3) then

            DisplayHelpText(txt[lang]['message'],0,1,0.5,0.8,0.6,255,255,255,255)

            return true

        end

    end

end

-- Check if a player is in a vehicle
function IsInVehicle()
    local player = GetPlayerPed(-1)
    return IsPedSittingInAnyVehicle(player)
end

-- Buy new clothes !
function BuyItem(item, values)
    -- Buy new clothes !
    TriggerServerEvent("clothing_shop:SaveItem_server", item, values)   
end

function SaveItem(item, values)
    TriggerServerEvent("clothing_shop:SaveItem_server", item, values)
end


local skinOptions = {
    open = false,
    title = "Categories",
    currentmenu = "main",
    lastmenu = "main",
    currentpos = nil,
    selectedbutton = 0,
    marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    buttons = 10,
    from = 1,
    to = 10,
    scale = 0.4,
    font = 0,
}

local skinMenu = ModuleMenu:create(skinOptions)
local oldSelect = 0

function skinMenu:getDrawableList(component)

    local list = {}



	local modelhashed = GetEntityModel(GetPlayerPed(-1))

	RequestModel(modelhashed)

	while not HasModelLoaded(modelhashed) do

		RequestModel(modelhashed)

		Citizen.Wait(0)

	end



	for i = 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), component) + 1 do

		local isBlackList = false

		

		local hashskin = GetHashKey("mp_m_freemode_01")



		local oldI = i - 1



		if (GetEntityModel(GetPlayerPed(-1)) == hashskin) then

			if component == 11 then

				if oldI == 16 or oldI == 17 or oldI == 18 or oldI == 19 or oldI == 24 or oldI == 26 or oldI == 29 or oldI == 30 or oldI == 31 or oldI == 32 or oldI == 34 or oldI == 35 or oldI == 36 or oldI == 39 or oldI == 40 or oldI == 41

				or oldI == 46 or oldI == 47 or oldI == 52 or oldI == 55 or oldI == 64 or oldI == 74 or oldI == 75 or oldI == 77 or oldI == 80 or oldI == 81 or oldI == 91 or oldI == 93 or oldI == 94 or oldI == 97 or oldI == 98 or oldI == 100

				or oldI == 101 or oldI == 102 or oldI == 103 or oldI == 111 or oldI == 118 or oldI == 123 or oldI == 133 or oldI == 143 or oldI == 149 or oldI == 150 or oldI == 154 or oldI == 156 or oldI == 183 or oldI == 130 or oldI == 129 then

					isBlackList = true

				end			

			elseif component == 8 then

				if oldI == 41 or oldI == 43 or oldI == 51 or oldI == 52 or oldI == 67 or oldI == 71 or oldI == 72 or oldI == 92 or oldI == 93 or oldI == 97 or oldI == 123

				then

					isBlackList = true

				end

			elseif component == 0 then

				if oldI == 66 then

					isBlackList = true

				end

			elseif component == 7 then

				if oldI == 7 or oldI == 13 or oldI == 14 or oldI == 20 or oldI == 30 or oldI == 33 or oldI == 40 or oldI == 41 or oldI == 56 or oldI == 57 or oldI == 58 or oldI == 59 or oldI == 60 or oldI == 61 or oldI == 62 or oldI == 63 or oldI == 64

				or oldI == 65 or oldI == 66 or oldI == 67 or oldI == 68 or oldI == 69 or oldI == 70 or oldI == 71 or oldI == 72 or oldI == 73 or oldI == 84 or oldI == 95 or oldI == 96 or oldI == 97 or oldI == 98 or oldI == 99 or oldI == 100 or oldI == 101 

				or oldI == 102 or oldI == 103 or oldI == 104 or oldI == 105 or oldI == 106 or oldI == 106 or oldI == 107 or oldI == 108 or oldI == 109 or oldI == 115 or oldI == 125 or oldI == 126 or oldI == 127 or oldI == 128 then

					oldIsBlackLoldIst = true

				end

			elseif component == 5 then

				--if oldI == 51 or oldI == 52 then

				--	isBlackList = true

				--end

			end

		else

			if component == 11 then

				if oldI == 19 or oldI == 20 or oldI == 21 or oldI == 25 or oldI == 31 or oldI == 32 or oldI == 33 or oldI == 34 or oldI == 36 or oldI == 38 or oldI == 40 or oldI == 64 or oldI == 84 or oldI == 85 or oldI == 88

				or oldI == 89 or oldI == 90 or oldI == 91 or oldI == 92 or oldI == 93 or oldI == 94 or oldI == 103 or oldI == 110 or oldI == 119 or oldI == 126 or oldI == 140 or oldI == 146 or oldI == 151 or oldI == 153 

				or oldI == 172 then

					isBlackList = true

				end

			end

		end



		if isBlackList then

			local cmp               = component

			list[i]                 = {}

			list[i].name            = "↓ ~r~Vetement n°".. i .. " blacklist"

			list[i].max             = false

			list[i].onClick         = function()            

			end

			list[i].onLeft          = function()

			end

			list[i].onRight         = function()

			end

			list[i].onSelected      = function()

			end

			list[i].onBack          = function()

			end

		else

			local cmp               = component

			list[i]                 = {}

			list[i].name			= "↓ Vetement n°".. i .. " - Couleur : ← " .. skinMenu.menu[skinMenu.currentmenu].userSelectVariation .. " →"

			list[i].id              = i

			list[i].max             = false

			if GetNumberOfPedTextureVariations(GetPlayerPed(-1), cmp, i - 1) - 1 ~= nil or GetNumberOfPedTextureVariations(GetPlayerPed(-1), cmp, i - 1) - 1 > 0 then

				list[i].max         = GetNumberOfPedTextureVariations(GetPlayerPed(-1), cmp, i - 1)

			end

			list[i].onClick         = function()

				skinMenu:saveItem( skinMenu.currentmenu, i - 1, skinMenu.menu[skinMenu.currentmenu].userSelectVariation )

				BuyItem({collection = "component", id = cmp}, {value = i - 1, texture_value = skinMenu.menu[skinMenu.currentmenu].userSelectVariation})

            

			end

			list[i].onLeft          = function()

				if skinMenu.menu[skinMenu.currentmenu].userSelectVariation > 0 then

					skinMenu:setCurrentVariation("left", skinMenu.currentmenu)

					SetPedComponentVariation(GetPlayerPed(-1), cmp, i - 1, skinMenu.menu[skinMenu.currentmenu].userSelectVariation, 4)

				end

			end

			list[i].onRight         = function()

				if  skinMenu.menu[skinMenu.currentmenu].userSelectVariation < ( GetNumberOfPedTextureVariations(GetPlayerPed(-1), cmp, i - 1) - 1 ) then

					skinMenu:setCurrentVariation("right", skinMenu.currentmenu)

					SetPedComponentVariation(GetPlayerPed(-1), cmp, i - 1, skinMenu.menu[skinMenu.currentmenu].userSelectVariation, 4)

				end

			end

			list[i].onSelected      = function()

				if oldSelect == skinMenu.menu[skinMenu.currentmenu].userSelect then

				else

					skinMenu.menu[skinMenu.currentmenu].userSelectVariation = 0



					local modelhashed = GetEntityModel(GetPlayerPed(-1))

					RequestModel(modelhashed)

					while not HasModelLoaded(modelhashed) do

						RequestModel(modelhashed)

						Citizen.Wait(0)

					end

					SetModelAsNoLongerNeeded(modelhashed)

				end



				skinMenu.menu[skinMenu.currentmenu].userSelect = i

				oldSelect = skinMenu.menu[skinMenu.currentmenu].userSelect



				SetPedComponentVariation(GetPlayerPed(-1), cmp, i - 1, skinMenu.menu[skinMenu.currentmenu].userSelectVariation, 0)



				if skinMenu.menu[skinMenu.currentmenu].userSelectVariation >= 0 then

					list[i].name = "↓ Vetement n°".. i .. " - Couleur : ← " .. skinMenu.menu[skinMenu.currentmenu].userSelectVariation .. " →"

				end

			end

			list[i].onBack          = function()

				skinMenu:toMenu(skinMenu:getLastMenu())

			end

		end

    end

    return list

end

function skinMenu:getPropList(prop)

    local list = {}



	local modelhashed = GetEntityModel(GetPlayerPed(-1))

	RequestModel(modelhashed)

	while not HasModelLoaded(modelhashed) do

		RequestModel(modelhashed)

		Citizen.Wait(0)

	end



    for i = 0, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), prop) + 1 do

		local isBlackList = false

		

		local hashskin = GetHashKey("mp_m_freemode_01")



		local oldI = i - 1



		if (GetEntityModel(GetPlayerPed(-1)) == hashskin) then

			if prop == 0 then

				if oldI == 1 or oldI == 17 or oldI == 41 or oldI == 45 or oldI == 46 or oldI == 48 or oldI == 112 then

					isBlackList = true

				end			

			end

		else

			if prop == 0 then

				if oldI == 1 or oldI == 8 or oldI == 13 or oldI == 17 or oldI == 28 or oldI == 32 or oldI == 40 or oldI == 45 or oldI == 48 or oldI == 111 or oldI == 112 or oldI == 113

				then

					isBlackList = true

				end

			end

		end



		if isBlackList then

			local cmp               = prop

			list[i]                 = {}

			list[i].name            = "↓ ~r~Vetement n°".. i .. " blacklist"

			list[i].id              = i

			list[i].max				= 0

			list[i].onClick         = function()            

			end

			list[i].onLeft          = function()

			end

			list[i].onRight         = function()

			end

			list[i].onSelected      = function()

			end

			list[i].onBack          = function()

			end

		else

			local cmp               = prop

			list[i]                 = {}

			list[i].name			= "↓ Vetement n°".. i .. " - Couleur : ← " .. skinMenu.menu[skinMenu.currentmenu].userSelectVariation .. " →"

			list[i].id              = i

			if GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), cmp, i - 1) ~= nil then

				list[i].max         = GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), cmp, i - 1) - 1

			else

				list[i].max         = 0

			end



			list[i].onClick         = function()

				skinMenu:saveItem(skinMenu.currentmenu, i - 1, skinMenu.menu[skinMenu.currentmenu].userSelectVariation)

				BuyItem({collection = "prop", id = cmp}, {value = i - 1, texture_value = skinMenu.menu[skinMenu.currentmenu].userSelectVariation})

			end

			list[i].onLeft          = function()

				if skinMenu.menu[skinMenu.currentmenu].userSelectVariation > 0 then

					skinMenu:setCurrentVariation("left", skinMenu.currentmenu)

					SetPedPropIndex(GetPlayerPed(-1), cmp, i - 1, skinMenu.menu[skinMenu.currentmenu].userSelectVariation, 0)

				end

			end

			list[i].onRight         = function()

				if  skinMenu.menu[skinMenu.currentmenu].userSelectVariation < ( GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), cmp, i - 1) - 1 ) then

					skinMenu:setCurrentVariation("right", skinMenu.currentmenu)

					SetPedPropIndex(GetPlayerPed(-1), cmp, i - 1, skinMenu.menu[skinMenu.currentmenu].userSelectVariation, 0)

				end

			end

			list[i].onSelected      = function()

				if oldSelect == skinMenu.menu[skinMenu.currentmenu].userSelect then

				else

					skinMenu.menu[skinMenu.currentmenu].userSelectVariation = 0



					local modelhashed = GetEntityModel(GetPlayerPed(-1))

					RequestModel(modelhashed)

					while not HasModelLoaded(modelhashed) do

						RequestModel(modelhashed)

						Citizen.Wait(0)

					end

					SetModelAsNoLongerNeeded(modelhashed)

				end



				oldSelect = skinMenu.menu[skinMenu.currentmenu].userSelect





				SetPedPropIndex(GetPlayerPed(-1), cmp, i - 1, skinMenu.menu[skinMenu.currentmenu].userSelectVariation, 0)

				if skinMenu.menu[skinMenu.currentmenu].userSelectVariation >= 0 then

					list[i].name = "↓ Vetement n°".. i .. " - Couleur : ← " .. skinMenu.menu[skinMenu.currentmenu].userSelectVariation .. " →"

				end

			end

			list[i].onBack          = function()

				skinMenu:toMenu(skinMenu:getLastMenu())

			end

		end



        

    end

    return list

end


function skinMenu:saveItem(menuId, value, value_texture)
    local item = {
        menuId = menuId,
        value = value,
        value_texture = value_texture
    }
end


skinMenu:setMenu( "main",txt[lang]['title'],{



    {

        id="head",

        name = txt[lang]['head'],

        description = "",

        onClick = function()

            skinMenu:toMenu("head")

        end,

        onLeft = function() return false end,

        onRight = function() return false end,

        onSelected = function() return false end,

        onBack = function() return false end

    }, {

        id="body",

        name = txt[lang]['body'],

        description = "",

        onClick= function()

            skinMenu:toMenu("body")

        end,

        onLeft= function() return false end,

        onRight= function() return false end,

        onSelected= function() return false end,

        onBack = function() return false end

    }, {

        id="pantmenu",

        name = txt[lang]['pants'],

        description = "",

        onClick= function()

            skinMenu:toMenu("pant")

        end,

        onLeft= function() return false end,

        onRight= function() return false end,

        onSelected= function() return false end,

        onBack = function() return false end

    }, {

        id="shoeMenu",

        name = txt[lang]['shoes'],

        description = "",

        onClick= function()

            skinMenu:toMenu("shoe")

        end,

        onLeft= function() return false end,

        onRight= function() return false end,

        onSelected= function() return false end,

        onBack = function() return false end

    }, {

        id="exit",

        name = txt[lang]['close'],

        description = "",

        onClick= function()

            skinMenu:close()

            isLeaving = false

            if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

				TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

			else

				TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

			end

        end,

        onLeft= function() return false end,

        onRight= function() return false end,

        onSelected= function() return false end,

        onBack = function() return false end

    } }, false )



skinMenu:setMenu( "head", txt[lang]['head'], {



    {

        id="ears",

        name = txt[lang]['ears'],

        description = "",

        onClick = function()

            skinMenu:toMenu("ears")

        end,

        onLeft = function() return false end,

        onRight = function() return false end,

        onSelected = function() return false end,

        onBack = function()

            skinMenu:toMenu('main')

        end

    },

    {

        id="glasses",

        name = txt[lang]['glasses'],

        description = "",

        onClick = function()

            skinMenu:toMenu("glasses")

        end,

        onLeft = function() return false end,

        onRight = function() return false end,

        onSelected = function() return false end,

        onBack = function()

            skinMenu:toMenu('main')

        end

    },

    {

        id="helmet",

        name = txt[lang]['hats'],

        description = "",

        onClick = function()

            skinMenu:toMenu("helmet")

        end,

        onLeft = function() return false end,

        onRight = function() return false end,

        onSelected = function() return false end,

        onBack = function()

            skinMenu:toMenu('main')

        end

    },

    {

        id="masks",

        name = txt[lang]['masks'],

        description = "",

        onClick = function()

            skinMenu:toMenu("masks")

        end,

        onLeft = function() return false end,

        onRight = function() return false end,

        onSelected = function() return false end,

        onBack = function()

            skinMenu:toMenu('main')

        end

    }

}, false )



skinMenu:setMenu( "glasses", txt[lang]['glasses'], function() return skinMenu:getPropList(1) end, true )

skinMenu:setMenu( "helmet", txt[lang]['hats'], function() return skinMenu:getPropList(0) end, true )

skinMenu:setMenu( "masks", txt[lang]['masks'], function() return skinMenu:getDrawableList(1) end, true )

skinMenu:setMenu( "body", txt[lang]['body'], {

    {

        id="glove",

        name = txt[lang]['gloves'],

        description = "",

        onClick = function()

            skinMenu:toMenu("glove")

        end,

        onLeft = function() return false end,

        onRight = function() return false end,

        onSelected = function() return false end,

        onBack = function()

            skinMenu:toMenu('main')

        end

    },

	{

        id="bags",

        name = txt[lang]['bags'],

        description = "",

        onClick = function()

            skinMenu:toMenu("bags")

        end,

        onLeft = function() return false end,

        onRight = function() return false end,

        onSelected = function() return false end,

        onBack = function()

            skinMenu:toMenu('main')

        end

    },

	{

        id="accessoires",

        name = txt[lang]['accessoires'],

        description = "",

        onClick = function()

            skinMenu:toMenu("accessoires")

        end,

        onLeft = function() return false end,

        onRight = function() return false end,

        onSelected = function() return false end,

        onBack = function()

            skinMenu:toMenu('main')

        end

    },

    {

        id="tshirt",

        name = txt[lang]['shirts'],

        description = "",

        onClick = function()

            skinMenu:toMenu("tshirt")

        end,

        onLeft = function() return false end,

        onRight = function() return false end,

        onSelected = function() return false end,

        onBack = function()

            skinMenu:toMenu('main')

        end

    },

    {

        id="jacket",

        name = txt[lang]['jackets'],

        description = "",

        onClick = function()

            skinMenu:toMenu("jacket")

        end,

        onLeft = function() return false end,

        onRight = function() return false end,

        onSelected = function() return false end,

        onBack = function()

            skinMenu:toMenu('main')

        end

    },

}, false )

skinMenu:setMenu("ears", txt[lang]['ears'], function() return skinMenu:getPropList(2) end , true )

skinMenu:setMenu("pant", txt[lang]['pants'], function() return skinMenu:getDrawableList(4) end, true )

skinMenu:setMenu("shoe", txt[lang]['shoes'], function() return skinMenu:getDrawableList(6) end, true )

skinMenu:setMenu("glove", txt[lang]['gloves'], function() return skinMenu:getDrawableList(3) end, true )

skinMenu:setMenu("bags", txt[lang]['bags'], function() return skinMenu:getDrawableList(5) end, true )

skinMenu:setMenu("accessoires", txt[lang]['accessoires'], function() return skinMenu:getDrawableList(7) end, true )

skinMenu:setMenu("tshirt", txt[lang]['shirts'], function() return skinMenu:getDrawableList(8) end, true )

skinMenu:setMenu("jacket", txt[lang]['jackets'], function() return skinMenu:getDrawableList(11) end, true )

RegisterNetEvent("avanyacloth:toggleHat")

AddEventHandler("avanyacloth:toggleHat", function()

	ToggleHat()

end)



RegisterNetEvent("avanyacloth:toggleMask")

AddEventHandler("avanyacloth:toggleMask", function()

	ToggleMask()

end)



RegisterNetEvent("avanyacloth:toggleGlasses")

AddEventHandler("avanyacloth:toggleGlasses", function()

	ToggleGlasses()

end)

-- Places the blips on the map
Citizen.CreateThread(function()
    for _, item in pairs(clothingShops) do
        item.blip = AddBlipForCoord(item.x, item.y, item.z)
        SetBlipSprite(item.blip, item.id)
        SetBlipAsShortRange(item.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(item.name)
        EndTextCommandSetBlipName(item.blip)
    end

    while (true) do
        if skinMenu.open == true then
            skinMenu:display()
        end
        if(IsNearShop()) then
            if IsControlJustPressed(1,51) then
                skinMenu.open = true
                isLeaving = true
            end
        else
            skinMenu:close()
            if isLeaving then
              TriggerServerEvent("clothing_shop:SpawnPlayer_server") -- Validate the choices ;)
              isLeaving = false
            end
        end
        if IsControlJustPressed(1, 303) then

			ToggleHat()

		end
        Citizen.Wait(0)
    end
end)

currentHat = {}

local isWearingHat = true

function ToggleHat()

	if isWearingHat then

		ClearPedProp(GetPlayerPed(-1),0)

		isWearingHat = false

	else

		if currentHat.hat ~= nil then

			setItem("prop", 0, currentHat.hat, currentHat.texture)

			isWearingHat = true

		end

	end

end

currentMask = {}

local isWearingMask = true

function ToggleMask()

	if isWearingMask then

		SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)

		isWearingMask = false

	else

		if currentMask.mask ~= nil then

			setItem("component", 1, currentMask.mask, currentMask.texture)

			isWearingMask = true

		end

	end

end

currentGlasses = {}

local isWearingGlasses = true

function ToggleGlasses()

	if isWearingGlasses then

		ClearPedProp(GetPlayerPed(-1),1)

		isWearingGlasses = false

	else

		if currentGlasses.glasses ~= nil then

			setItem("prop", 1, currentGlasses.glasses, currentGlasses.texture)

			isWearingGlasses = true

		end

	end

end