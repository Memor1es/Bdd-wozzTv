ITEMS = {}
CARITEMS = {}
-- flag to keep track of whether player died to prevent
-- multiple runs of player dead code
local playerdead = false
local maxCapacity = 64
local capacityPlus = 0
local capacityPlusToggle = false
--local maxCapacity1 = 70

local maxCapacityCar = {
    [0] = { ["size"] = 30}, --Compact
    [1] = { ["size"] = 30}, --Sedan
    [2] = { ["size"] = 40}, --SUV
    [3] = { ["size"] = 30}, --Coupes
    [4] = { ["size"] = 30}, --Muscle
    [5] = { ["size"] = 25}, --Sports Classics
    [6] = { ["size"] = 20}, --Sports
    [7] = { ["size"] = 15}, --Super
    [8] = { ["size"] = 5}, --Motorcycles
    [9] = { ["size"] = 35}, --Off-road
    [10] = { ["size"] = 80}, --Industrial
    [11] = { ["size"] = 60}, --Utility
    [12] = { ["size"] = 40}, --Vans
    [13] = { ["size"] = 0}, --Cycles
    [14] = { ["size"] = 0}, --Boats
    [15] = { ["size"] = 0}, --Helicopters
    [16] = { ["size"] = 0}, --Planes
    [17] = { ["size"] = 0}, --Service
    [18] = { ["size"] = 0}, --Emergency
    [19] = { ["size"] = 0}, --Military
    [20] = { ["size"] = 90}, --Commercial
    [21] = { ["size"] = 0}, --Trains
}

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

AddEventHandler("playerSpawned", function()
    TriggerServerEvent("item:getItems")
    playerdead = false
	TriggerServerEvent("clothing_shop:SpawnPlayer_server")	
end)

AddEventHandler("gui:getItems", function(THEITEMS)
    ITEMS = {}
    ITEMS = THEITEMS
end)

RegisterNetEvent('Bag:inventoryStock')
AddEventHandler('Bag:inventoryStock', function(capacity)
capacityPlusToggle = not capacityPlusToggle
  if capacityPlusToggle then
    capacityPlus = capacity
	else
	capacityPlus = 0
  end
end)

AddEventHandler("player:receiveItem", function(item, quantity)
    if (getPods() + quantity <= maxCapacity + capacityPlus) then
        item = tonumber(item)
        if (ITEMS[item] == nil) then
            new(item, quantity)
        else
            add({ item, quantity })
        end
	else
	    quantityDispo = maxCapacity + capacityPlus - getPods()
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

local KeyMarker = 38
local KeyMarkerName = "E"

local text_take = 'Prendre Item ['..KeyMarkerName..']'


local dropList = {}

function SetBagOnGround()

    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
   
    Bag = GetHashKey("prop_paper_bag_small")
   
    RequestModel(Bag)
   
    while not HasModelLoaded(Bag) do
   
     Citizen.Wait(1)
   
    end
   
    local object = CreateObject(Bag, x, y, z-2, true, true, true) -- x+1
   
    DecorRegister("Avanya", 2)
   
    DecorSetBool(object, "Avanya", true)
   
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

function scenrionahoi(text)
	SetTextComponentFormat('STRING')
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, false, false, -1)
end

local canTake = false
local currentBag
local currentIndex
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local pedCoord = GetEntityCoords(GetPlayerPed(-1))
		for k,v in pairs(dropList) do
			if DoesObjectOfTypeExistAtCoords(pedCoord["x"], pedCoord["y"], pedCoord["z"], 1.0, GetHashKey("prop_paper_bag_small"), true) then
				Bag = GetClosestObjectOfType(pedCoord["x"], pedCoord["y"], pedCoord["z"], 1.0, GetHashKey("prop_paper_bag_small"), false, false, false)
				if NetworkGetNetworkIdFromEntity(Bag) == k then
					scenrionahoi(text_take)
					canTake = true
					currentBag = Bag
					currentIndex = k
					Citizen.Wait(1000)
					canTake = false
				end
			else
				canTake = false
			end
		end
	end
end)

local waitCanTake = 1000

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(waitCanTake)
		if canTake then
		waitCanTake = 10
			if IsControlJustPressed(1, KeyMarker) then
				canTake = false
				DeleteBag(currentBag, function(deleted) 
					if deleted then 
						TriggerServerEvent('DropSystem:take', currentIndex)  
					end
				end)
			end
			else
			waitCanTake = 1000
		end
	end
end)


function DeleteBag(bag, cb)
   if (DeleteObject(bag))then
         cb(true)
   end
end

RegisterNetEvent('DropSystem:remove')
AddEventHandler('DropSystem:remove', function(bag)
  if dropList[bag] ~= nil then
    dropList[bag] = nil
  end
end)

RegisterNetEvent('DropSystem:createForAll')
AddEventHandler('DropSystem:createForAll', function(bag)
  dropList[bag] = true
end)

AddEventHandler("player:sellItem", function(item, price)
    item = tonumber(item)
    if (ITEMS[item].quantity > 0) then
        sell({ item, price })
    end
end)

AddEventHandler("player:sellItemSale", function(item, price)
    item = tonumber(item)
    if (ITEMS[item].quantity > 0) then
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
    InventoryMenu()
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

function getQuantity(itemId)
    if ITEMS[tonumber(itemId)] ~= nil then
        return ITEMS[tonumber(itemId)].quantity
    end
    return 0
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
    if (pods < (maxCapacity + capacityPlus)) then return true end
end

function InventoryMenu()
    ped = GetPlayerPed(-1);
    MenuTitle = "Items: " .. (getPods() or 0) .. ".0/" .. maxCapacity + capacityPlus  .. ".0 Kg"
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

function use(item)
	TriggerServerEvent("player:useItem", item, ITEMS[item].libelle,1)

	Menu.hidden = not Menu.hidden
end


local bool = false
local showInventory = false
local inventory = false
local car = false
local inventoryGive = false

RegisterNUICallback('NUIFocusOff', function()
showInventory = not showInventory
    SetNuiFocus(false, false)
end)

-- _menuPool = NativeUI.CreatePool()
-- mainMenu = NativeUI.CreateMenu("", "~b~Inventaire", 0, 0)
-- _menuPool:Add(mainMenu)

-- _menuPool:MouseControlsEnabled(false)
-- _menuPool:ControlDisablingEnabled(false)
-- _menuPool:MouseEdgeEnabled(false)
-- _menuPool:RefreshIndex()

-- function AddMenuInventaire(menu)

-- for ind, value in pairs(ITEMS) do
        -- if (value.quantity > 0) then
            -- Menu.addButton(tostring(value.libelle) .. " : " .. tostring(value.quantity), "ItemMenu", ind)
			-- local submenu = _menuPool:AddSubMenu(menu, "Inventaire MAX | 64")
       -- end
	 -- end
    -- for ind, value in pairs(ITEMS) do
        -- if (value.quantity > 0) then
    -- submenu:AddItem(NativeUI.CreateItem(tostring(value.libelle), "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length!"))
	-- end
	 -- end
    -- local Utiliser = NativeUI.CreateItem("Utiliser", "")
	-- submenu:AddItem(Utiliser)
	-- Utiliser.Activated = function(ParentMenu,SelectedItem)
		-- use(ind)
	-- end

	-- local donner = NativeUI.CreateItem("Donner", "")
	-- submenu:AddItem(donner)
	-- donner.Activated = function(ParentMenu,SelectedItem)
		-- give(ind)
	-- end

	-- local jeter = NativeUI.CreateItem("Jeter", "")
	-- submenu:AddItem(jeter)
	-- jeter.Activated = function(ParentMenu,SelectedItem)
		-- delete(ind)
	-- end
	
	-- local giveItem = NativeUI.CreateItem(_U('loadout_give_button'), '')
	-- weaponItemMenu:AddItem(giveItem)

	-- local giveMunItem = NativeUI.CreateItem(_U('loadout_givemun_button'), '')
	-- weaponItemMenu:AddItem(giveMunItem)

	-- local dropItem = NativeUI.CreateItem(_U('loadout_drop_button'), '')
	-- dropItem:SetRightBadge(4)
	-- weaponItemMenu:AddItem(dropItem)

	
-- end

-- function AddMenuInventaire(menu)
	-- inventaireMenu = _menuPool:AddSubMenu(menu, "Inventaire")

	 -- for ind, value in pairs(ITEMS) do
        -- if (value.quantity > 0) then

			-- ItemCreate = NativeUI.CreateItem(tostring(value.libelle), '')
			-- inventaireMenu.SubMenu:AddItem(ItemCreate)
	-- end
	-- end

	
-- end




-- AddMenuInventaire(mainMenu)

-- _menuPool:MouseControlsEnabled(false)
-- _menuPool:ControlDisablingEnabled(false)
-- _menuPool:MouseEdgeEnabled(false)
-- _menuPool:RefreshIndex()

-- Citizen.CreateThread(function()
    -- while true do
        -- Citizen.Wait(0)
        -- _menuPool:ProcessMenus()
        -- if IsControlJustReleased(1, 311) then
            -- mainMenu:Visible(not mainMenu:Visible())
        -- end
    -- end
-- end)

Citizen.CreateThread(function()
-- getInventory()
-- TriggerServerEvent("playercar:getItems_s")
    while true do
        Citizen.Wait(0)
		if IsControlJustReleased(1, 311) then
		-- getInventory()
		-- print("passed Inventory")
		
		--[[local vehFront = VehicleInFront()
		player, distance = GetClosestPlayer()
        local namePlayer = GetPlayerName(player)
        local maxCapacityOfCar = maxCapacityCar[GetVehicleClass(vehFront)].size
		local numberPlate = GetVehicleNumberPlateText(vehFront)
            
                if not showInventory then
                showInventory = not showInventory
				if vehFront > 0 then
                    if(GetVehicleDoorLockStatus(vehFront) < 2) then
					    TriggerServerEvent("car:getItems", GetVehicleNumberPlateText(vehFront))
                        -- ClearMenu()
						print("Inventory Car")
						-- SetCursorLocation(0.60, 0.40)
                        inventory = false
                        car = true
                        inventoryGive = false
						SetVehicleDoorOpen(vehFront, 5, false, false)
						Citizen.Wait(250)
						getInventory(inventory, car, inventoryGive, maxCapacityOfCar, numberPlate, namePlayer)
                        SetNuiFocus(true, true)
                        end
						
						-- showInventory = not showInventory
                        -- MenuTrunk(vehFront)
                        -- Menu.hidden = not Menu.hidden
					elseif((distance ~= -1 and distance < 1.0)) and (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
						print("InventoryGive")
                        -- SetCursorLocation(0.60, 0.40)
						inventory = false
                        car = false
                        inventoryGive = true
						getInventory(inventory, car, inventoryGive, maxCapacityOfCar, numberPlate, namePlayer)
						SetNuiFocus(true, true)
                        
					else
						print("Inventory")
						-- SetCursorLocation(0.60, 0.40)
                        inventory = true
                        car = false
                        inventoryGive = false
						getInventory(inventory, car, inventoryGive, maxCapacityOfCar, numberPlate, namePlayer)
		                SetNuiFocus(true, true)
                    end
                else
                    SetVehicleDoorShut(vehFront, 5, false)
                    -- showInventory = not showInventory
                end]]--
            -- 
		
		
		
		-- if showInventory then
		    -- SetNuiFocus(true, true)
		-- end
	
		 
		 
            InventoryMenu() -- Menu to draw
            Menu.hidden = not Menu.hidden -- Hide/Show the menu
			end
			 if not Menu.hidden then
        Menu.renderGUI() -- Draw menu on each tick if Menu.hidden = false
		end
    end
end)

function VehicleInFront()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 3.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
    local a, b, c, d, result = GetRaycastResult(rayHandle)
    return result
end

RegisterNetEvent("car:hoodContent")
AddEventHandler("car:hoodContent", function(items)
    if items then
        CARITEMS = items
        -- CoffreMenu()
    else
        CARITEMS = {}
        -- CoffreMenu()
    end
end)



function getInventory(inventory, car, inventoryGive, maxCapacityOfCar, numberPlate, namePlayer)


if inventory then
print("CLIENT INVENTORY")
SendNUIMessage({action = "openInventory"})
	local count = 0
    for ind, value in pairs(ITEMS) do
			if (value.quantity > 0) then
			
			count = count + 1
			-- print(value.quantity)
	    SendNUIMessage({
        items  = json.encode({
		id = ind, 
		type = 'item', 
		name = tostring(value.libelle), 
		description = '', 
		weight = 1, 
		max_stack = 0, 
		max_uses = 0,
		countQty = value.quantity,
		showtab = true,
		show2tab = false,
		inventory = inventory,
		numberMax = count
		
		}),
    })
        end
    end
    elseif car then 
	print("CLIENT INVENTORY CAR")
	SendNUIMessage({action = "openInventoryCar"})
    local countCar = 0
    for ind, value in pairs(CARITEMS) do
			if (value.quantity > 0) then
			
			countCar = countCar + 1
			print(countCar)
	SendNUIMessage({
        itemsCar  = json.encode({
		id = ind, 
		type = 'item', 
		name = tostring(value.libelle), 
		description = '', 
		weight = 1, 
		max_stack = 0, 
		max_uses = 0,
		countQty = value.quantity,
		showtab = true,
		show2tab = true,
		show2tabCar = true,
		car = car,
		maxCapacityOfCar = maxCapacityOfCar,
		numberPlate = numberPlate,
		numberMax = countCar
		
		}),
    })
        end
    end
	elseif inventoryGive then
	print("CLIENT INVENTORY GIVE")
	SendNUIMessage({action = "openInventoryGive"})
	local countGive = 0
    for ind, value in pairs(ITEMS) do
			if (value.quantity > 0) then
			
			countGive = countGive + 1
			print(countGive)
	SendNUIMessage({
        itemsGive  = json.encode({
		id = ind, 
		type = 'item', 
		name = tostring(value.libelle), 
		description = '', 
		weight = 1, 
		max_stack = 0, 
		max_uses = 0,
		countQty = value.quantity,
		showtab = true,
		show2tab = true,
		show2tabGive = true,
		inventoryGive = inventoryGive,
		namePlayer = namePlayer,
		numberMax = countGive
		
		}),
    })
        end
    end
    
end    

end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end



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

    -- for i = 0, 129 do
        -- if NetworkIsPlayerActive(i) then
            -- table.insert(players, i)
        -- end
    -- end
	
	for _, player in ipairs(GetActivePlayers()) do
	    table.insert(players, player)
	end

    return players
end

