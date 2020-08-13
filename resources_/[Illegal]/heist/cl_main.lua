-- Config
local distanceForOutOfRange = 50.0

-- Variables
local isHacking = false
local cantRob = false
local isRobbing = false
local cachedData = {}

-- Utils
local function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local function notif(message)
	Citizen.CreateThread(function()
		Wait(10)
		SetNotificationTextEntry("STRING")
		AddTextComponentString(message)
		DrawNotification(false, false)
	end)
end

LoadModels = function(models)
	for index, model in ipairs(models) do
		if IsModelValid(model) then
			while not HasModelLoaded(model) do
				RequestModel(model)
	
				Citizen.Wait(10)
			end
		else
			while not HasAnimDictLoaded(model) do
				RequestAnimDict(model)
	
				Citizen.Wait(10)
			end    
		end
	end
end

-- Functions
local function ToggleBag(active)
	if active then
		-- ADD bag
		SetPedComponentVariation(GetPlayerPed(-1), 5, 45, 0, 2)
	else
		-- Remove bag
		SetPedComponentVariation(GetPlayerPed(-1), 5, 0, 0, 2)
	end
end

local function CancelRobbery()
	isRobbing = false
end

local function GrabCash(trolleyData)
	local ped = PlayerPedId()

	local CashAppear = function()
		local pedCoords = GetEntityCoords(ped)
	
		local cashModel = GetHashKey("hei_prop_heist_cash_pile")
	
		LoadModels({
			cashModel
		})
	
		local cashPile = CreateObject(cashModel, pedCoords, true)
	
		FreezeEntityPosition(cashPile, true)
		SetEntityInvincible(cashPile, true)
		SetEntityNoCollisionEntity(cashPile, ped)
		SetEntityVisible(cashPile, false, false)
		AttachEntityToEntity(cashPile, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
	
		local startedGrabbing = GetGameTimer()

		Citizen.CreateThread(function()
			while GetGameTimer() - startedGrabbing < 37000 do
				Citizen.Wait(0)
	
				DisableControlAction(0, 73, true)

				if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
					if not IsEntityVisible(cashPile) then
						SetEntityVisible(cashPile, true, false)
					end
				end
		
				if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
					if IsEntityVisible(cashPile) then
						SetEntityVisible(cashPile, false, false)

						notif("~r~+680$")
					end
				end
			end
		
			DeleteObject(cashPile)
			TriggerServerEvent("avanyaheist:receiveCash")
		end)
	end

	local trolleyObject = NetToObj(trolleyData["net"])
	local emptyTrolley = Config.EmptyTrolley

	if IsEntityPlayingAnim(trolleyObject, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
		print("Somebody is already grabbing.")
	end

	LoadModels({
		GetHashKey("hei_p_m_bag_var22_arm_s"),
		"anim@heists@ornate_bank@grab_cash",
		emptyTrolley["model"]
	})
	
	while not NetworkHasControlOfEntity(trolleyObject) do
		Citizen.Wait(0)

		NetworkRequestControlOfEntity(trolleyObject)
	end

	cachedData["bag"] = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)

	ToggleBag(false)

	cachedData["scene"] = NetworkCreateSynchronisedScene(GetEntityCoords(trolleyObject), GetEntityRotation(trolleyObject), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, cachedData["scene"], "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(cachedData["bag"], cachedData["scene"], "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(cachedData["scene"])

	Citizen.Wait(1500)

	CashAppear()

	cachedData["scene"] = NetworkCreateSynchronisedScene(GetEntityCoords(trolleyObject), GetEntityRotation(trolleyObject), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, cachedData["scene"], "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(cachedData["bag"], cachedData["scene"], "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(trolleyObject, cachedData["scene"], "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)

	NetworkStartSynchronisedScene(cachedData["scene"])

	Citizen.Wait(37000)

	cachedData["scene"] = NetworkCreateSynchronisedScene(GetEntityCoords(trolleyObject), GetEntityRotation(trolleyObject), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, cachedData["scene"], "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(cachedData["bag"], cachedData["scene"], "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)

	NetworkStartSynchronisedScene(cachedData["scene"])
	
	local newTrolley = CreateObject(emptyTrolley["model"], GetEntityCoords(trolleyObject) + vector3(0.0, 0.0, - 0.985), true)
	SetEntityRotation(newTrolley, GetEntityRotation(trolleyObject))

	DecorRegister("RainbowLand", 2)
	DecorSetBool(newTrolley, "Rainbowland", true)
	
	while not NetworkHasControlOfEntity(trolleyObject) do
		Citizen.Wait(0)

		NetworkRequestControlOfEntity(trolleyObject)
	end

	DeleteObject(trolleyObject)
	PlaceObjectOnGroundProperly(newTrolley)
	
	Citizen.Wait(1900)

	DeleteObject(cachedData["bag"])
	ToggleBag(true)
	
	RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
	SetModelAsNoLongerNeeded(emptyTrolley["model"])
	SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
end

local function OpenDoor(bankIndex)
	RequestScriptAudioBank("vault_door", false)

	local doorInformation = Config.Banks["Pacific"]["door"]
	local doorEntity = GetClosestObjectOfType(doorInformation["pos"], 5.0, doorInformation["model"], false)

	--if bankIndex == "Pacific" then
		local count = 0

		repeat
			local rotation = GetEntityHeading(doorEntity) - 0.05
			SetEntityHeading(doorEntity, rotation)
			count = count + 1
			Citizen.Wait(10)
		until count == 750

		FreezeEntityPosition(doorEntity, true)
	--[[else
		while not HasAnimDictLoaded("anim@heists@fleeca_bank@bank_vault_door") do
			Citizen.Wait(0)

			RequestAnimDict("anim@heists@fleeca_bank@bank_vault_door")
		end

		if not DoesEntityExist(doorEntity) then
			return
		end

		PlaySoundFromCoord(-1, "vault_unlock", doorInformation["pos"], "dlc_heist_fleeca_bank_door_sounds", 0, 0, 0)
		PlayEntityAnim(doorEntity, "bank_vault_door_opens", "anim@heists@fleeca_bank@bank_vault_door", 4.0, false, 1, 0, 0.0, 8)
		ForceEntityAiAndAnimationUpdate(doorEntity)

		Citizen.Wait(5000)

		DeleteEntity(doorEntity)

		if IsEntityPlayingAnim(doorEntity, "anim@heists@fleeca_bank@bank_vault_door", "bank_vault_door_opens", 3) then
			if GetEntityAnimCurrentTime(doorEntity, "anim@heists@fleeca_bank@bank_vault_door", "bank_vault_door_opens") >= 1.0 then
				FreezeEntityPosition(doorEntity, true)

				StopEntityAnim(doorEntity, "bank_vault_door_opens", "anim@heists@fleeca_bank@bank_vault_door", -1000.0)
				SetEntityRotation(doorEntity, 0, 0, -80.0, 2, 1)

				ForceEntityAiAndAnimationUpdate(doorEntity)

				RemoveAnimDict("anim@heists@fleeca_bank@bank_vault_door")
			end
		end

		Citizen.Wait(500)
	end]]


	local doorInformation = Config.Banks["Pacific"]["door"]

	local doorEntity = GetClosestObjectOfType(doorInformation["pos"], 5.0, doorInformation["model"], false)

	while isRobbing do
		local sleepThread = 500
			
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Banks["Pacific"]["start"]["pos"], true)

		if dstCheck <= 20.0 then
			sleepThread = 5

			if not DoesEntityExist(doorEntity) then
				doorEntity = GetClosestObjectOfType(doorInformation["pos"], 5.0, doorInformation["model"], false)
			end

			if math.floor(GetEntityRotation(doorEntity)["z"]) ~= -80 then
				SetEntityRotation(doorEntity, 0, 0, -80.0, 2, 1)
			end

			for trolley, trolleyData in pairs(Config.Banks["Pacific"]["trolleys"]) do
				if NetworkDoesEntityExistWithNetworkId(trolleyData["net"]) then
					local dstCheck = #(pedCoords - GetEntityCoords(NetToObj(trolleyData["net"])))

					if dstCheck <= 1.5 then
						DisplayHelpText("~INPUT_CONTEXT~ ~g~Ramasser ~w~l'argent.")

						if IsControlJustPressed(0, 46) then
							GrabCash(trolleyData)
						end
					end
				end
			end
		end

		Citizen.Wait(sleepThread)
	end
end

local function SpawnTrolleys(bankIndex)
	local bankTrolleys = Config.Banks["Pacific"]["trolleys"]
	local trolleyInfo = Config.Trolley

	local trolleyData = {}

	for trolley, values in pairs(bankTrolleys) do
		if not HasModelLoaded(trolleyInfo["model"]) then
			LoadModels({
				trolleyInfo["model"]
			})
		end

		local trolleyObject = CreateObject(trolleyInfo["model"], values["pos"], true)
		DecorRegister("RainbowLand", 2)
		DecorSetBool(trolleyObject, "RainbowLand", true)

		SetEntityRotation(trolleyObject, 0.0, 0.0, values["heading"])

		PlaceObjectOnGroundProperly(trolleyObject)
		SetEntityAsMissionEntity(trolleyObject, true, true)

		trolleyData[trolley] = {
			["net"] = ObjToNet(trolleyObject),
			["money"] = Config.Trolley["cash"]
		}

		SetModelAsNoLongerNeeded(trolleyInfo["model"])
	end
	
	return trolleyData
end

function HackingCompleted(success)
	if success then
		notif("Veuillez patienter 25 secondes avant l'ouverture de la porte...")
		Citizen.Wait(10000)
		notif("Veuillez patienter encore 15 secondes avant l'ouverture de la porte...")
		Citizen.Wait(10000)
		notif("Veuillez patienter encore 5 secondes avant l'ouverture de la porte...")
		Citizen.Wait(5000)

		local trolleys = SpawnTrolleys(cachedData["bank"])
		Config.Banks["Pacific"]["trolleys"] = trolleys


		OpenDoor(cachedData["bank"])
	else
		notif("Tu t'es rate, prend la fuite !")
	end
end

local function StartHacking(bankIndex)
	Citizen.CreateThread(function()
		isHacking = true

		local bankValues = Config.Banks["Pacific"]

		local device = GetClosestObjectOfType(bankValues["start"]["pos"], 5.0, bankValues["device"]["model"], false)

		if not DoesEntityExist(device) then
			return
		end
	
		LoadModels({
			GetHashKey("hei_p_m_bag_var22_arm_s"),
			GetHashKey("hei_prop_hst_laptop"),
			"anim@heists@ornate_bank@hack"
		})

		cachedData["bag"] = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), bankValues["start"]["pos"] - vector3(0.0, 0.0, 5.0), true, false, false)
		cachedData["laptop"] = CreateObject(GetHashKey("hei_prop_hst_laptop"), bankValues["start"]["pos"]  - vector3(0.0, 0.0, 5.0), true, false, false)

		local offset = GetOffsetFromEntityInWorldCoords(device, 0.1, 0.8, 0.4)
		local initial = GetAnimInitialOffsetPosition("anim@heists@ornate_bank@hack", "hack_enter", offset, 0.0, 0.0, GetEntityHeading(device), 0, 2)
		local position = vector3(initial["x"], initial["y"], initial["z"] + 0.2)
	
		ToggleBag(false)
	
		cachedData["scene"] = NetworkCreateSynchronisedScene(position, 0.0, 0.0, GetEntityHeading(device), 2, false, false, 1065353216, 0, 1.3)
	
		NetworkAddPedToSynchronisedScene(PlayerPedId(), cachedData["scene"], "anim@heists@ornate_bank@hack", "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
	
		NetworkAddEntityToSynchronisedScene(cachedData["bag"], cachedData["scene"], "anim@heists@ornate_bank@hack", "hack_enter_suit_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(cachedData["laptop"], cachedData["scene"], "anim@heists@ornate_bank@hack", "hack_enter_laptop", 4.0, -8.0, 1)
	
		NetworkStartSynchronisedScene(cachedData["scene"])
	
		Citizen.Wait(6000)
	
		cachedData["scene"] = NetworkCreateSynchronisedScene(position, 0.0, 0.0, GetEntityHeading(device), 2, false, false, 1065353216, 0, 1.3)
	
		NetworkAddPedToSynchronisedScene(PlayerPedId(), cachedData["scene"], "anim@heists@ornate_bank@hack", "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
	
		NetworkAddEntityToSynchronisedScene(cachedData["bag"], cachedData["scene"], "anim@heists@ornate_bank@hack", "hack_loop_suit_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(cachedData["laptop"], cachedData["scene"], "anim@heists@ornate_bank@hack", "hack_loop_laptop", 4.0, -8.0, 1)
	
		NetworkStartSynchronisedScene(cachedData["scene"])
	
		Citizen.Wait(2500)
	
		StartComputer()
	
		Citizen.Wait(4200)
	
		cachedData["scene"] = NetworkCreateSynchronisedScene(position, 0.0, 0.0, GetEntityHeading(device), 2, false, false, 1065353216, 0, 1.3)
	
		NetworkAddPedToSynchronisedScene(PlayerPedId(), cachedData["scene"], "anim@heists@ornate_bank@hack", "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
	
		NetworkAddEntityToSynchronisedScene(cachedData["bag"], cachedData["scene"], "anim@heists@ornate_bank@hack", "hack_exit_suit_bag", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(cachedData["laptop"], cachedData["scene"], "anim@heists@ornate_bank@hack", "hack_exit_laptop", 4.0, -8.0, 1)
	
		NetworkStartSynchronisedScene(cachedData["scene"])
	
		Citizen.Wait(4500)
	
		ToggleBag(true)

		DeleteObject(cachedData["bag"])
		DeleteObject(cachedData["laptop"])

		isHacking = false
	end)
end

-- Loop
Citizen.CreateThread(function()
	Citizen.Wait(500)

	while true do
		local sleepThread = 500

		if not isHacking and not cantRob then
			local ped = PlayerPedId()
	  		local pedCoords = GetEntityCoords(ped)

			for bankIndex, values in pairs(Config.Banks) do
				local dstCheck = GetDistanceBetweenCoords(pedCoords, values["start"]["pos"], true)

				if dstCheck <= 5.0 then
					sleepThread = 5

					if dstCheck <= 1.0 then
						if not IsPedArmed(GetPlayerPed(-1), 7) then
							notif("Tu as besoin d\'être armé pour braquer !")
						else
							local usable = true
							local textToDisplay = "~INPUT_CONTEXT~ ~r~Pirater ~w~la banque"

							DisplayHelpText(textToDisplay)

							if IsControlJustPressed(0, 46) then
								TriggerServerEvent('police:BankRob', bankIndex)
								Citizen.Wait(5000)
							end
						end
					end
					local hackPos = values["start"]["pos"] - vector3(0.0, 0.0, 0.985)
					DrawMarker(6, hackPos.x, hackPos.y, hackPos.z, 0, 0, 0, -90.0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 80, 0, 0, 2, 0, 0, 0, 0)
				end
			end
		end

		if isRobbing then
			local ped = PlayerPedId()
	  		local pedCoords = GetEntityCoords(ped)

			--local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Banks[cachedData["bank"]]["start"]["pos"], true)
			local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Banks["Pacific"]["start"]["pos"], true)
			if dstCheck > distanceForOutOfRange then
				CancelRobbery()
				notif("Vous avez quitte la zone, le braquage est termine")
			end
		end

	  	Citizen.Wait(sleepThread)
	end
end)

-- Events

RegisterNetEvent('avanyaheist:isrobbingpossible')
AddEventHandler('avanyaheist:isrobbingpossible', function(bankIndex, cops)
    local neededNumberOfCops = 0
    if cops < neededNumberOfCops then
        TriggerEvent("es_freeroam:notify", "CHAR_LESTER_DEATHWISH", 1, "Braquage", false, "Braquage ~r~non autorisé~w~. Manque de policer (min : ~y~" .. neededNumberOfCops .. "~w~).")
    else
        TriggerServerEvent('avanyaheist:tryRob', bankIndex)
    end
end)

RegisterNetEvent('avanyaheist:startRobbery')
AddEventHandler('avanyaheist:startRobbery', function(bankIndex)
	isRobbing = true
    cachedData["Pacific"] = bankIndex
	StartHacking(bankIndex)
end)

RegisterNetEvent('avanyaheist:cantRob')
AddEventHandler('avanyaheist:cantRob', function()
	cantRob = true
end)

RegisterNetEvent('avanyaheist:onMyRobberyCompleted')
AddEventHandler('avanyaheist:onMyRobberyCompleted', function(moneyAmount)
	TriggerServerEvent("avanyaheist:robCompleteGiveMoney", moneyAmount)
end)

local currentBlip
RegisterNetEvent("avanyaheist:warnClient")
AddEventHandler("avanyaheist:warnClient", function(index)
	if exports.metiers:getIsCop() then
		local currentArea = Config.Banks["Pacific"]["start"]["pos"]

		TriggerEvent("es_freeroam:notify", "CHAR_LESTER_DEATHWISH", 1, "Braquage de banque", false, "GPS mis a jour ! vas-y fonce !")

		RemoveBlip(currentBlip)

		currentBlip = AddBlipForCoord(currentArea.x, currentArea.y, currentArea.z)
		SetBlipSprite(currentBlip, 432)
		SetBlipScale(currentBlip, 1.5)
		SetBlipAsShortRange(currentBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Braquage de banque")
		EndTextCommandSetBlipName(currentBlip)

		SetNewWaypoint(currentArea.x, currentArea.y)
	end
end)