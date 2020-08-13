ITEMS = {}

-- flag to keep track of whether player died to prevent

-- multiple runs of player dead code

local playerdead = false

local maxCapacity = 55

--local maxCapacity1 = 70

-- INVENTORY CONFIG --



local WaterID = 6 -- Eau
local FoodID = 30 -- Sandwich
local RepairID = 47 -- Kit de réparation
local ZipID = 60 -- Zip Tie
local SilenceID = 70 -- Silencieux
local ClipsID = 71 -- Chargeur
local TacosID = 55 -- Tacos
local FriteID = 41 -- Frite
local NuggetsID = 57 -- Nuggets
local BurgerID = 51 -- Burger
local DonutsID = 58 -- Donuts
local CafeID = 50 -- Café
local FantaID = 54 -- Fanta
local CocaID = 53 -- Coca
local RedbullID = 56 -- Redbull
local BiereID = 25 -- Biere
local ChampagneID = 52 -- Champagne
local VinID = 27 -- Vin
local VodkaID = 44 -- Vodka
local SacID = 66 -- Sac tete
local RecycleurID = 72 -- Recycleur

-- register events, only needs to be done once

RegisterNetEvent("item:reset")

RegisterNetEvent("item:getItems")

RegisterNetEvent("item:updateQuantity")

RegisterNetEvent("item:setItem")

RegisterNetEvent("item:sell")

RegisterNetEvent("gui:getItems")

RegisterNetEvent("player:receiveItem")

RegisterNetEvent("player:looseItem")

RegisterNetEvent("player:sellItem")

RegisterNetEvent("player:sellItemSale")



function Chat(t)

	TriggerEvent("chatMessage", 'TRUCKER', { 0, 255, 255}, "" .. tostring(t))

end

RegisterNetEvent('showNotify')
AddEventHandler('showNotify', function(notify)
    ShowAboveRadarMessage(notify)
end)



AddEventHandler("playerSpawned", function()

    TriggerServerEvent("item:getItems")

    playerdead = false

end)



AddEventHandler("gui:getItems", function(THEITEMS)

    ITEMS = {}

    ITEMS = THEITEMS

end)



AddEventHandler("player:receiveItem", function(item, quantity)
    if (getPods() + quantity <= maxCapacity) then
        item = tonumber(item)
        if (ITEMS[item] == nil) then
            new(item, quantity)
        else
            add({ item, quantity })
        end
	else
	    quantityDispo = maxCapacity - getPods()
		-- quantityDrop = quantity - quantityDispo
		item = tonumber(item)
		-- local bag = SetBagOnGround()
	    -- TriggerServerEvent('DropSystem:create', bag, item, quantityDrop)
        if (ITEMS[item] == nil) then
            new(item, quantityDispo)
        else
            add({ item, quantityDispo })
        end
    end
end)



function SetBagOnGround()

 x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

 Bag = GetHashKey("prop_paper_bag_small")

 RequestModel(Bag)

 while not HasModelLoaded(Bag) do

  Citizen.Wait(1)

 end

 local object = CreateObject(Bag, x, y, z-2, true, true, true) -- x+1

 DecorRegister("RainbowLand", 2)

 DecorSetBool(object, "RainbowLand", true)

 PlaceObjectOnGroundProperly(object)

 local network = NetworkGetNetworkIdFromEntity(object)

 return network

end



AddEventHandler("player:looseItem", function(item, quantity)
    item = tonumber(item)
    if (ITEMS[item].quantity >= quantity) then
        delete1({ item, quantity })
    end
end)



AddEventHandler("player:sellItem", function(item, price)

    item = tonumber(item)

    if (ITEMS[item].quantity > 0) then

        sell({ item, price })

    end

end)



AddEventHandler("player:sellItemSale", function(item, price)

    item = tonumber(item)

    if (ITEMS[item].quantity > 1) then

        sellsale({ item, price })

    end

end)



function sell(arg)

    local itemId = tonumber(arg[1])

    local price = arg[2]

    local item = ITEMS[itemId]

    item.quantity = item.quantity - 1

    TriggerServerEvent("item:sell", itemId, item.quantity, price)

    InventoryMenu()

end



function sellsale(arg)

    local itemId = tonumber(arg[1])

    local price = arg[2]

    local item = ITEMS[itemId]

    item.quantity = item.quantity - 1

    TriggerServerEvent("item:sellsale", itemId, item.quantity, price)

    InventoryMenu()

end



function delete(item1)

	DisplayOnscreenKeyboard(1, "Quantité :", "", "", "", "", "", 8)

    while (UpdateOnscreenKeyboard() == 0) do

            DisableAllControlActions(0);

            Wait(0);

    end

	if (GetOnscreenKeyboardResult()) then

	local qty = 0

    qty = tonumber(GetOnscreenKeyboardResult())

    local item = ITEMS[item1]

	if qty > 0 and qty <= item.quantity then

    item.quantity = item.quantity - qty

    TriggerServerEvent("item:updateQuantity", item.quantity, item1)

	local bag = SetBagOnGround()

	TriggerServerEvent('DropSystem:create', bag, item1, qty)

    InventoryMenu()

	end

    end
    
end



function delete1(arg)

    local itemId = tonumber(arg[1])

    local qty = arg[2]

    local item = ITEMS[itemId]

    item.quantity = item.quantity - qty

    TriggerServerEvent("item:updateQuantity", item.quantity, itemId)

    --InventoryMenu()

end









function add(arg)

    local itemId = tonumber(arg[1])

    local qty = arg[2]

    local item = ITEMS[itemId]

    item.quantity = item.quantity + qty

    TriggerServerEvent("item:updateQuantity", item.quantity, itemId)

    InventoryMenu()

end



function new(item, quantity)

    TriggerServerEvent("item:setItem", item, quantity)

    TriggerServerEvent("item:getItems")

end



--[[function getQuantity(itemId)

    if ITEMS[tonumber(itemId)] ~= nil then

        return ITEMS[tonumber(itemId)].quantity

    end

    return 0

end]]

function getQuantity(itemId)
    if ITEMS[tonumber(itemId)] == 1 then

        return ITEMS[tonumber(itemId)].quantity

    end
end



function getPods()

    local pods = 0

    for _, v in pairs(ITEMS) do

        pods = pods + v.quantity

    end

    return pods

end



function notFull()

    local pods = 0

    for _, v in pairs(ITEMS) do

        pods = pods + v.quantity

    end

    if (pods < (maxCapacity-1)) then return true end

end



function InventoryMenu()

    ped = GetPlayerPed(-1);

    MenuTitle = "Objets: " .. (getPods() or 0) .. ".0/" .. maxCapacity .. ".0 Kg"

    ClearMenu()

    for ind, value in pairs(ITEMS) do

        if (value.quantity > 0) then

            Menu.addButton(tostring(value.libelle) .. " : " .. tostring(value.quantity), "ItemMenu", ind)

        end

    end

end







function ItemMenu(itemId)

    ClearMenu()

    MenuTitle = "Details:"

	Menu.addButton("Utiliser", "use", itemId)

    Menu.addButton("Donner", "give", itemId)

	Menu.addButton("Jeter", "delete", itemId)



end



function give(item)

	

	player, distance = GetClosestPlayer()

	

    if(distance ~= -1 and distance < 3) and (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then

        DisplayOnscreenKeyboard(1, "Quantité :", "", "", "", "", "", 3)

        while (UpdateOnscreenKeyboard() == 0) do

            DisableAllControlActions(0);

            Wait(0);

        end

        if (GetOnscreenKeyboardResult()) then

            local res = math.floor(tonumber(GetOnscreenKeyboardResult() or 0))



            if ( res > 0 and ITEMS[item].quantity - res >= 0) then

                TriggerServerEvent("player:giveItem", item, ITEMS[item].libelle, res, GetPlayerServerId(player))

                local ped = GetPlayerPed(-1)

                if ped then

                    TaskStartScenarioInPlace(ped, "PROP_HUMAN_PARKING_METER", 0, false)

                    Citizen.Wait(1500)

                    ClearPedTasks(ped)

                end

                

            end

            Menu.hidden = not Menu.hidden

        end

    else

		TriggerEvent("es_freeroam:notify", "CHAR_MP_STRIPCLUB_PR", 1, "Mairie", false, "Pas de joueur proche ou dans un vehicule")

		Menu.hidden = not Menu.hidden

	end

end



--[[function use(item)
    TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
    Menu.hidden = not Menu.hidden
end]]

function use(item, qty)
    local ped = GetPlayerPed(-1)
    if item == FoodID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayEatingAnimation()
        Menu.hidden = true      
    elseif item == WaterID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayDrinkingAnimation()
        Menu.hidden = true
    elseif item == TacosID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayEatingAnimation()
        Menu.hidden = true
    elseif item == BurgerID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayEatingAnimation()
        Menu.hidden = true
    elseif item == NuggetsID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayEatingAnimation()
        Menu.hidden = true
    elseif item == FriteID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayEatingAnimation()
        Menu.hidden = true
    elseif item == DonutsID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayEatingAnimation()
        Menu.hidden = true
    elseif item == CafeID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayDrinkingAnimation()
        Menu.hidden = true
    elseif item == CocaID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayDrinkingAnimation()
        Menu.hidden = true
    elseif item == FantaID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayDrinkingAnimation()
        Menu.hidden = true
    elseif item == RedbullID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayDrinkingAnimation()
        Menu.hidden = true
    elseif item == BiereID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayDrinkingAnimation()
        Menu.hidden = true
    elseif item == ChampagneID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayDrinkingAnimation()
        Menu.hidden = true
    elseif item == VinID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayDrinkingAnimation()
        Menu.hidden = true
    elseif item == VodkaID then	
        TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)
        PlayDrinkingAnimation()
        Menu.hidden = true
    elseif item == SacID then	
        TriggerEvent("es_worek:start")
        Menu.hidden = true
    elseif item == RecycleurID then	
        TriggerEvent("avanyaguns:ToggleRecycleur")
        Menu.hidden = true
    elseif item == RepairID then      
        TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "Inventaire", false, "Vous avez utiliser x1 Kit de réparation")
        RepairVehicle()
        Menu.hidden = true
    elseif item == ZipID then
        if ped then
            TaskStartScenarioInPlace(ped, "PROP_HUMAN_PARKING_METER", 0, false)
            Citizen.Wait(1500)
            ClearPedTasks(ped)
        end
        TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "Inventaire", false, "Vous avez utiliser x1 Zip-tie")
        TriggerEvent("police:cuff2", t)
    elseif item == SilenceID then
        TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "Inventaire", false, "Vous avez utiliser x1 Silencieux")
        TriggerEvent("avanyaguns:ToggleSilencers")
        Menu.hidden = true
    elseif item == ClipsID then
        TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "Inventaire", false, "Vous avez utiliser x1 Chargeur")
        TriggerEvent("avanyaguns:ToggleClips")
        Menu.hidden = true
    else
        TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "Inventaire", false, "Vous ne pouvez pas utiliser cet item")   
    end
end



function PlayEatingAnimation()

	local ped = GetPlayerPed(-1)

	local ad = "amb@code_human_wander_eating_donut@male@idle_a" -- mp_player_inteat@burger



	RequestAnimDict(ad)

	while not HasAnimDictLoaded(ad) do

		Citizen.Wait(100)

	end



	TaskPlayAnim(ped, ad, "idle_c", 8.0, 1.0, -1, 49, 0, 0, 0, 0 ) -- mp_player_int_eat_burger_fp

	RemoveAnimDict(ad)

end



function PlayDrinkingAnimation()

	local ped = GetPlayerPed(-1)

	local ad = "amb@world_human_drinking_fat@beer@male@idle_a" -- mp_player_intdrink



	RequestAnimDict(ad)

	while not HasAnimDictLoaded(ad) do

		Citizen.Wait(100)

	end



	TaskPlayAnim(ped, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 ) -- loop_bottle

	RemoveAnimDict(ad)

end





Citizen.CreateThread(function()

    while true do

      Citizen.Wait(0)

		if IsControlJustPressed(1, 311) then

            InventoryMenu() -- Menu to draw

            Menu.hidden = not Menu.hidden -- Hide/Show the menu

			end

        Menu.renderGUI() -- Draw menu on each tick if Menu.hidden = false

   end

end)









----------------------------------------------------------------



function GetClosestPlayer()

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



function GetPlayers()

    local players = {}



    for i = 0, 256 do

        if NetworkIsPlayerActive(i) then

            table.insert(players, i)

        end

    end



    return players

end

-------- KIT DE REPARATION -------

local function GetVehicleInDirection( coordFrom, coordTo )

    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )

    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )

    return vehicle

end

local function GetVehicleLookByPlayer(ped, dist)

    local playerPos =GetOffsetFromEntityInWorldCoords( ped, 0.0, 0.0, 0.0 )

    local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, dist, -0.8 )

    return GetVehicleInDirection( playerPos, inFrontOfPlayer )

end

function RepairVehicle()

    local player = GetPlayerPed(-1)
    local car = GetVehiclePedIsIn(player, false)

    if car == 0 then
        local pos = GetEntityCoords(player, 1)
        car = GetClosestVehicle(pos.x, pos.y, pos.z, 3.000, 0, 70)
    end

    if DoesEntityExist(car) then
        local scenario = 'WORLD_HUMAN_VEHICLE_MECHANIC'

            local pos = GetOffsetFromEntityInWorldCoords(player, 0.0, 0.02, 0.0)

            local h = GetEntityHeading(player)

            TaskStartScenarioAtPosition(player, scenario, pos.x, pos.y, pos.z, h + 180 , 8000, 1, 0)

            --TaskStartScenarioAtPosition(myPed, scenario,8000,1)

            Citizen.Wait(8000)

            ClearPedTasks(player)
            SetVehicleFixed(car)                                             
            SetVehicleEngineHealth(car, 1000.0)                              
            SetVehicleBodyHealth(car, 1000.0)                              
            SetVehicleEngineOn(car, true, false, true)
            TriggerEvent("player:looseItem", 47, 1)
    end
end