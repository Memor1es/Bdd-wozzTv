local myVehiculeEntity = nil

local inServiceburgershot = false

local spawnVehicleChoix = {}

local VehicleModelKeyburgershot = GetHashKey('taco')

local KEY_E = 38

local KEY_UP = 96 -- N+

local KEY_DOWN = 97 -- N-

local KEY_CLOSE = 177

local currentBlip = nil

local listMissions = {}

local currentMissions = nil

local myCallMission = nil

local burgershot_nbMissionEnAttenteText = '-- Aucune Info --'

local burgershot_Blipburgershot = {}

local burgershot_call_accept = 0

local burgershot_nbburgershotInService = 0

local burgershot_nbburgershotDispo = 0



isburgershot = false



local TEXT = {

  AutoburgershotGetIn = '~INPUT_PICKUP~ Entrer dans le vehicule de burgershot',

  AutoburgershotGetOut = 'Vous pouvez sortir du vehicule de burgershot',

  AutoburgershotMute = '~INPUT_PICKUP~ Allumer/Eteindre la radio',

  AutoburgershotNextRadio = '~INPUT_VEH_NEXT_RADIO~ Prochaine station',

  AutoburgershotSetWayPoint = '~INPUT_PICKUP~ Mettez un point GPS puis appuyer pour partir',



  PrendreService = '~INPUT_PICKUP~ ~g~Pour prendre son service de burgershot',

  QuitterService = '~INPUT_PICKUP~ ~r~Pour quitter son service de burgershot',

  SpawnVehicle = '~INPUT_PICKUP~ Sortir le vehicule : ~b~',

  SpawnVehicleImpossible = '~R~ Impossible, aucune place disponible',



  Blip = 'Course en cours',

  BlipGarage = "burgershot",

  MissionCancel = 'Votre course à été annuler',

  MissionClientAccept = 'Un burgershot a prit votre appel',

  MissionClientCancel = 'Votre burgershot à abandonné votre commande',

  InfoburgershotNoAppel = '~g~Aucun appel en attente',

  InfoburgershotNbAppel = '~w~ Appel en attente',

  BlipburgershotService = 'Prise de service',

  BlipburgershotVehicle = 'Prise du véhicule de service',



  CALL_INFO_NO_PERSONNEL = '~r~Aucun burgershot en service',

  CALL_INFO_ALL_BUSY = '~o~Tous nos burgershots sont occupés',

  CALL_INFO_WAIT = '~b~Votre appel est sur attente',

  CALL_INFO_OK = '~g~Un burgershot va arriver sur les lieux de l\'appel',

  CALL_INFO_IA_DRIVER = '~g~Un burgershot automatique va arriver',

  CALL_INFO_IA_WAITING = '~g~Votre burgershot vous attend',

  CALL_INFO_IA_LEAVING = '~o~Votre burgershot est reparti',



  CALL_RECU = 'Confirmation\nVotre appel à été enregistré',

  CALL_ACCEPT = 'Votre appel a été accepté, un burgershot est en route',

  CALL_CANCEL = 'Le burgershot vient d\'abandonné votre appel',

  CALL_FINI = 'Votre appel a été résolu',

  CALL_EN_COURS = 'Vous avez déjà une demande en cours ...',



  MISSION_NEW = 'Une nouvelle course est disponible',

  MISSION_ACCEPT = 'Course acceptée, mettez vous en route',

  MISSION_ANNULE = 'Votre client s\'est décommandé',

  MISSION_CONCURENCE = 'Vous étes plusieurs sur le coup',

  MISSION_INCONNU = 'Cette course n\'est plus d\'actualité',

  MISSION_EN_COURS = 'Il y à deja un collègue sur le coup'



}

-- restart depanneur

local coords = {

  {

    ['PriseDeService'] = {x = -1195.608, y = -900.502, z = 12.9951},

    ['SpawnVehicleAction'] = { x = -1178.1246, y = -891.6715, z = 12.7596},

    ['SpawnVehicle'] = {

      {x = -1172.3282, y = -893.7578, z = 12.87317, h = 31.4965, type = "isVehicle"},

    },

  }

}



--====================================================================================

-- burgershot AUTOMATIQUE

--====================================================================================

local IAspawnPoint = {x = 0.37, y = 0.75, z = 0.04, h = 0.02}       --Spawn point

local IAdriver = nil      --Ped of the IA driver

local IAcar = nil         --Vehicle of the IA driver

local IAstate = 0         --Logical state of the IA

local IAmissionId = 0     --Id of the mission the IA take care of

local IATarget = nil      --GPS point set by the player

local IAactionKey = 38    --E key

local IAradio = true      --Radio State

local IAprice = 0         --Price of the burgershot ride

local IAnbrPeople = 1     --number of people

local IAtimeout = 3000    --Timeout of the burgershot

local IAfoundZ = true

local IAblip

local IAcurrenttimeout = IAtimeout



local function IAgotoPlayer(type)

  IAstate = 0

  IAfoundZ = true

  IAcurrenttimeout = IAtimeout

  local myPed = GetPlayerPed(-1)

  local myPos = GetEntityCoords(myPed)



  IAnbrPeople = type



  --get spawnpoint

  local x = 0

  local spawnZ = 0

  local isok = false

  local coords = GetOffsetFromEntityInWorldCoords(myPed, x, 70.002, spawnZ)

  isok, spawnZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z +1000)

  local isfree = GetClosestVehicle(coords.x, coords.y, spawnZ, 2.0, 0, 70)

  while not IsPointOnRoad(coords.x, coords.y, spawnZ, 0) or isok == false or isfree ~= 0 do --last param is useless https://wiki.rage.mp/index.php?title=Pathfind::isPointOnRoad

    coords = GetOffsetFromEntityInWorldCoords(myPed, x, 70.002, 0)

    isok, spawnZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z +1000)

    isfree = GetClosestVehicle(coords.x, coords.y, spawnZ, 2.0, 0, 70)

    Wait(1) -- care for the client

    x = x + 1

  end

  IAspawnPoint.x = coords.x

  IAspawnPoint.y = coords.y

  IAspawnPoint.z = spawnZ

  IAspawnPoint.h = 0.1



  --create the car

  RequestModel(VehicleModelKeyburgershot)

  while not HasModelLoaded(VehicleModelKeyburgershot) do

    Wait(1)

  end

  IAcar = CreateVehicle(VehicleModelKeyburgershot, IAspawnPoint.x, IAspawnPoint.y, IAspawnPoint.z, IAspawnPoint.h, true, false)

  DecorRegister("RainbowLand", 2)

  DecorSetBool(IAcar, "RainbowLand", true)

  local ObjectId = NetworkGetNetworkIdFromEntity(IAcar)

  SetNetworkIdExistsOnAllMachines(ObjectId, true)

  SetNetworkIdCanMigrate(ObjectId, true)

  SetVehicleOnGroundProperly(IAcar)



  --create the driver

  local hashDriver = GetHashKey('player_zero')

  local random = math.random(0, 2)

  if random == 1 then

    hashDriver = GetHashKey('player_one')

  elseif random == 2 then

    hashDriver = GetHashKey('player_two')

  end

  RequestModel(hashDriver)

  while not HasModelLoaded(hashDriver) do

    Wait(1)

  end

  IAdriver = CreatePed(5, hashDriver, myPos.x, myPos.y, myPos.z, 0, true, true)

  local ObjectId2 = NetworkGetNetworkIdFromEntity(IAdriver)

  SetNetworkIdExistsOnAllMachines(ObjectId2, true)

  SetNetworkIdCanMigrate(ObjectId2, true)



  -- set driver abilities and put it into the vehicle

  SetBlockingOfNonTemporaryEvents(IAdriver, true)

  SetPedCombatAttributes(IAdriver, 46, true)

  SetPedFleeAttributes(IAdriver, 0, 0)

  SetPedRelationshipGroupHash(IAdriver, GetHashKey("CIVFEMALE"))

  SetPedIntoVehicle(IAdriver, IAcar, -1)



  --SetDriverAggressiveness(IAdriver, 0.99)

--  SetDriverAbility(IAdriver, 0.99)

  -- drive to the player pos

--  TaskVehicleDriveToCoord(IAdriver, IAcar, myPos.x, myPos.y, myPos.z, 80.001, 1.1, GetHashKey(vehicle), 786859, 10.0001, true) --http://gtaforums.com/topic/822314-guide-driving-styles/

--  Citizen.InvokeNative(0x158BB33F920D360C, IAdriver, IAcar, myPos.x, myPos.y, myPos.z, 80.001, 1.1, GetHashKey(vehicle), 786859, 10.0001, true) --http://gtaforums.com/topic/822314-guide-driving-styles/

Citizen.InvokeNative(0x158BB33F920D360C, IAdriver, IAcar, myPos.x, myPos.y, myPos.z, 10.01, 0xC00AB, 20.0001)

end



	function getIsInServiceburgershot()

	return inServiceburgershot

    end



local function IAgotoGPS(myPos)

  -- go to the gps blip

  IATarget = Citizen.InvokeNative(0xFA7C7F0AADF25D09, GetFirstBlipInfoId(8), Citizen.ResultAsVector())

  IAfoundZ, targetZ = GetGroundZFor_3dCoord(IATarget.x, IATarget.y, IATarget.z +1000)

  if IAfoundZ then

    IATarget = vector3(IATarget.x, IATarget.y, targetZ)

  end

  --Citizen.Trace("IAfoundZ " .. tostring(IAfoundZ) .. " z " .. targetZ)

--  TaskVehicleDriveToCoord(IAdriver, IAcar, IATarget.x, IATarget.y, IATarget.z, 80.001, 1.1, GetHashKey(vehicle), 786859, 20.0001, true) -- task hash : 0x93a5526e (https://pastebin.com/R9iK6M9W)

  Citizen.InvokeNative(0x158BB33F920D360C, IAdriver, IAcar, IATarget.x, IATarget.y, IATarget.z, 20.0, 0xC00AB, 20.0001) -- task hash : 0x21d33957 (https://pastebin.com/R9iK6M9W)

  --  Citizen.InvokeNative(0x158BB33F920D360C, IAdriver, IAcar, myPos.x, myPos.y, myPos.z, 80.001, 1.1, GetHashKey(vehicle), 786859, 10.0001, true) --http://gtaforums.com/topic/822314-guide-driving-styles/



  -- get the distance aproximatively, i cannot get other Distance fct to work, so i take the distance as the crow flies then qdd 50%

  local distance = GetDistanceBetweenCoords(myPos.x, myPos.y, myPos.z, IATarget.x, IATarget.y, IATarget.z, true) * 1.5

  if distance < 2000 then

    IAprice = 250

  elseif distance >= 2000 and distance < 4000 then

    IAprice = 300

  elseif distance >= 4000 and distance < 6000 then

    IAprice = 350

  elseif distance >= 6000 and distance < 8000 then

    IAprice = 400

  else

    IAprice = 450

  end

end



local function IAtimeoutLoop(burgershotPos)

   IAcurrenttimeout = IAcurrenttimeout - 1

  if IAcurrenttimeout <= 0 then -- timeout

    --Citizen.Trace('IAcurrenttimeout : ')

    IAstate = 5 -- we release the burgershot

  end

end



local function IAactionsLoop()

  if IAdriver ~= nil then

    if IAblip then

      RemoveBlip(IAblip)

    end

    local myPed = GetPlayerPed(-1)

    local myPos = GetEntityCoords(myPed)

    local burgershotPos = GetEntityCoords(IAdriver)



    if IAstate == 0 then

      IAblip = AddBlipForCoord(burgershotPos.x, burgershotPos.y, burgershotPos.z)

      SetBlipSprite(currentBlip, 357)

      SetBlipColour(currentBlip, 3)

      BeginTextCommandSetBlipName("STRING")

      AddTextComponentString("Burgershot")

      EndTextCommandSetBlipName(currentBlip)

      if GetScriptTaskStatus(IAdriver, 0x21d33957) == 7 and burgershot_call_accept ~= 4 then

        StartVehicleHorn(IAcar, 10000, 0 , 0)

        burgershot_call_accept = 4

      end

      if GetDistanceBetweenCoords(myPos.x, myPos.y, myPos.z, burgershotPos.x, burgershotPos.y, burgershotPos.z, true) <= 10 then

        SetTextComponentFormat("STRING")

        AddTextComponentString(TEXT.AutoburgershotGetIn)

        DisplayHelpTextFromStringLabel(0, 0, 1, -1)

        if IsControlJustPressed(0, IAactionKey) then

          burgershot_call_accept = 10

          TaskEnterVehicle(myPed, IAcar, -1, 2, 1.5, 1, 0)

          IAstate = 0.5

        end

      end

      if GetScriptTaskStatus(IAdriver, 0x21d33957) == 7 then

        IAtimeoutLoop(burgershotPos)

      end

    elseif IAstate == 0.5 then

      if IsPedSittingInVehicle(myPed, IAcar) then

        IAstate = 1

      end

    elseif IAstate == 1 then

      SetTextComponentFormat("STRING")

      AddTextComponentString(TEXT.AutoburgershotSetWayPoint)

      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustPressed(0, IAactionKey) then

        IAgotoGPS(myPos)

        Citizen.Wait(500) -- to be sure that the script is launch before calling GetScriptTaskStatus

        IAstate = 2

      end

    elseif IAstate == 2 then

      if IsControlJustPressed(0, IAactionKey) then -- E : key

        IAradio = not IAradio

        SetFrontendRadioActive(IAradio)

      end

      SetTextComponentFormat("STRING")

      AddTextComponentString(TEXT.AutoburgershotMute)

      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

--      if not IAfoundZ then

        if GetDistanceBetweenCoords(burgershotPos.x, burgershotPos.y, IATarget.z, IATarget.x, IATarget.y, IATarget.z, true) <= 50 then

          Citizen.InvokeNative(0x158BB33F920D360C, IAdriver, IAcar, burgershotPos.x, burgershotPos.y, burgershotPos.z, 15.5, 0xC00AB, 20.0001)

          Wait(100)

        end

--      end

      if GetScriptTaskStatus(IAdriver, 0x21d33957) == 7 then

        IAstate = 3

      end

    elseif IAstate == 3 then

      SetTextComponentFormat("STRING")

      AddTextComponentString(TEXT.AutoburgershotGetOut)

      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustPressed(0, 23) then -- F == key F

        IAstate = 4

        Citizen.Wait(3000) -- to be sure that the script is launch before calling GetScriptTaskStatus

      end

    elseif IAstate == 4 then

      if GetScriptTaskStatus(myPed, 0x1ae73569) == 7 then -- 0x1ae73569 == TASK_LEAVE_VEHICLE (https://pastebin.com/R9iK6M9W)

        IAstate = 5

        Citizen.Wait(1000) -- to be sure that the script is launch before calling GetScriptTaskStatus

      end

    elseif IAstate == 5 then

      TriggerServerEvent('burgershot:PayAutomaticburgershot', IAprice)

      TaskVehicleDriveWander(IAdriver, IAcar, 10.0, 786859)

      burgershot_call_accept = 0

      IAstate = 0

      SetModelAsNoLongerNeeded(IAcar) -- srv will destroy it later

      SetModelAsNoLongerNeeded(IAdriver) -- same



      IAdriver = nil

      IAcar = nil

    end



    if IAstate >= 1 and not IsPedSittingInVehicle(myPed, IAcar) and IAstate < 3 then -- if the player leave the car before the end

      IAstate = 5 -- we release the burgershot

    end

  end

end



--====================================================================================

--  Utils function

--====================================================================================

local function showMessageInformation(message, duree)

  duree = duree or 2000

  ClearPrints()

  SetTextEntry_2("STRING")

  AddTextComponentString(message)

  DrawSubtitleTimed(duree, 1)

end





--====================================================================================

--  Gestion de prise et d'abandon de service

--====================================================================================

local function showBlipburgershot()

  for _ , c in pairs(coords) do

    local currentBlip = AddBlipForCoord(c.PriseDeService.x, c.PriseDeService.y, c.PriseDeService.z)

    SetBlipSprite(currentBlip, 17)

    SetBlipColour(currentBlip, 25)

    SetBlipAsShortRange(currentBlip, true)

    BeginTextCommandSetBlipName("STRING")

    AddTextComponentString(TEXT.BlipburgershotService)

    EndTextCommandSetBlipName(currentBlip)

    SetBlipAsMissionCreatorBlip(currentBlip, true)

    table.insert(burgershot_Blipburgershot, currentBlip)



    local currentBlip2 = AddBlipForCoord(c.SpawnVehicleAction.x, c.SpawnVehicleAction.y, c.SpawnVehicleAction.z)

    SetBlipSprite(currentBlip2, 18)

    SetBlipColour(currentBlip2, 64)

    SetBlipAsShortRange(currentBlip2, true)

    --SetBlipFlashes(currentBlip,1)

    BeginTextCommandSetBlipName("STRING")

    AddTextComponentString(TEXT.BlipburgershotVehicle)

    EndTextCommandSetBlipName(currentBlip2)

    SetBlipAsMissionCreatorBlip(currentBlip2, true)

    table.insert(burgershot_Blipburgershot, currentBlip2)

  end

end



local function removeBlipburgershot()

  for _ , c in pairs(burgershot_Blipburgershot) do

    RemoveBlip(c)

  end

  burgershot_Blipburgershot = {}

end



function spawnVehicle(coords, type)

  deleteVehicle()

  for _, pos in pairs(coords) do

    if pos.type == "isVehicle" then

      local vehi = GetClosestVehicle(pos.x, pos.y, pos.z, 2.0, 0, 70)

      if vehi == 0 then

        RequestModel(type)

        while not HasModelLoaded(type) do

          Wait(1)

        end

        myVehiculeEntity = CreateVehicle(type, pos.x, pos.y, pos.z, pos.h , true, false)

		DecorRegister("RainbowLand", 2)

		DecorSetBool(myVehiculeEntity, "RainbowLand", true)

        SetVehicleNumberPlateText(myVehiculeEntity, "BS" .. math.random(100,999))

        local ObjectId = NetworkGetNetworkIdFromEntity(myVehiculeEntity)

        SetNetworkIdExistsOnAllMachines(ObjectId, true)



        local p = GetEntityCoords(myVehiculeEntity, 0)

        local h = GetEntityHeading(myVehiculeEntity)

        return

      end

    end

  end



  notifIcon("CHAR_FACEBOOK", 1, "burgershot", false, TEXT.SpawnVehicleImpossible)

end



local function toogleService()

	inServiceburgershot = not inServiceburgershot



	if inServiceburgershot then

		local myPed = GetPlayerPed(-1)

		TriggerServerEvent('burgershot:takeService')

		TriggerEvent('burgershot:Advert')

		TriggerServerEvent('burgershot:requestMission')

	else

		-- Restaure Ped

		TriggerServerEvent('burgershot:endService')

    

		if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

		else

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

		end

	end

end



RegisterNetEvent("burgershot:Advert")

AddEventHandler("burgershot:Advert",function()

	TriggerServerEvent('Syncburgershot', "Disponible")

end)



RegisterNetEvent('Displayburgershot')

AddEventHandler('Displayburgershot',function(inputText)



SetNotificationTextEntry("STRING");

AddTextComponentString(inputText);

SetNotificationMessage("CHAR_SOCIAL_CLUB", "CHAR_SOCIAL_CLUB", true, 1, "~y~Burgershot En Service~s~", "");

DrawNotification(false, true);



end)



local foods = 

{

	{name = "Tacos", itemID = 55, price = 20},

	{name = "Frite", itemID = 41, price = 20},

	{name = "Nuggets", itemID = 57, price = 20},

	{name = "Burger", itemID = 51, price = 20},

	{name = "Donuts", itemID = 58, price = 20},



	{name = "Cafe", itemID = 50, price = 20},

	{name = "Fanta", itemID = 54, price = 20},

	{name = "Coca", itemID = 53, price = 20},

	{name = "Redbull", itemID = 56, price = 20},



	{name = "Biere", itemID = 25, price = 20},

	{name = "Champagne", itemID = 52, price = 20},

	{name = "Bouteille de vin", itemID = 27, price = 20},

	{name = "Vodka", itemID = 44, price = 20},

}



local currentSelectedFood = 1

local nFoods = 12

local currentVehicleIndex = 1



local vehicleList = 

{

	{vehicleName = "Camion", hash = GetHashKey("boxville2")},

	{vehicleName = "Van", hash = GetHashKey("burrito2")},

}



local oldVest = 15

local oldVestTexture = 0

local oldShirt = 15

local oldShirtTexture = 0

local oldArms = 15

local hasShirtOn = false

local function PutShirt()

	Citizen.CreateThread(function()

		local ped = GetPlayerPed(-1)



		RequestAnimDict("clothingtie")

		while not HasAnimDictLoaded("clothingtie") do

			Citizen.Wait(0)

		end

	

		local flags = 16 -- only play the animation on the upper body

		TaskPlayAnim(ped, "clothingtie", "try_tie_neutral_a", 8.0, -8, -1, flags, 0, 0, 0, 0)

		RemoveAnimDict("clothingtie")



		Wait (1500)

		ClearPedTasks(PlayerPedId())



		if hasShirtOn then

			SetPedComponentVariation(ped, 11, oldVest, oldVestTexture, 0)

			SetPedComponentVariation(ped, 8, oldShirt, oldShirtTexture, 0)

			SetPedComponentVariation(ped, 3, oldArms, 0, 0)

			hasShirtOn = false

		else

			oldVest = GetPedDrawableVariation(ped, 11)

			oldVestTexture = GetPedTextureVariation(ped, 11)

			oldShirt = GetPedDrawableVariation(ped, 8)

			oldShirtTexture= GetPedTextureVariation(ped, 8)

			oldArms = GetPedDrawableVariation(ped, 3)



			if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

				SetPedComponentVariation(ped, 11, 147, 0, 0)

				SetPedComponentVariation(ped, 8, 15, 0, 0)

				SetPedComponentVariation(ped, 3, 0, 0, 0)

			else

				SetPedComponentVariation(ped, 11, 147, 0, 0)

				SetPedComponentVariation(ped, 8, 15, 0, 0)

				SetPedComponentVariation(ped, 3, 0, 0, 0)

			end



			hasShirtOn = true

		end

	end)

end



local function gestionService()

	local myPed = GetPlayerPed(-1)

	local myPos = GetEntityCoords(myPed)



	for _, coordData in pairs(coords) do

		local pos = coordData.PriseDeService

		local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, myPos.x, myPos.y, myPos.z, false)

		if dist <= 20 then

			if inServiceburgershot then

				DrawMarker(25, pos.x, pos.y, pos.z + 0.05, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 255, 0, 0, 50, 0, 0, 0, 0)

			else

				DrawMarker(25, pos.x, pos.y, pos.z + 0.05, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 0, 255, 0, 50, 0, 0, 0, 0)

			end

		end

		if dist <= 1 then

			if inServiceburgershot then

				SetTextComponentFormat("STRING")

				AddTextComponentString(TEXT.QuitterService)

				DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			else

				SetTextComponentFormat("STRING")

				AddTextComponentString(TEXT.PrendreService)

				DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			end



			if IsControlJustPressed(0, KEY_E) then

				toogleService()

			end

		end



		if inServiceburgershot then

			local pos = coordData.SpawnVehicleAction

			local distFromVehicleSpawner = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, myPos.x, myPos.y, myPos.z, false)

			if distFromVehicleSpawner <= 20.0 then

				DrawMarker(25, pos.x, pos.y, pos.z + 0.05, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 255, 255, 255, 50, 0, 0, 0, 0)

			end

			if distFromVehicleSpawner <= 1.5 then

				-- showMessageInformation(TEXT.SpawnVehicle, 60)

				SetTextComponentFormat("STRING")

				AddTextComponentString(TEXT.SpawnVehicle .. vehicleList[currentVehicleIndex].vehicleName .. "\n~INPUT_REPLAY_ADVANCE~ ~w~pour changer de vehicule")

				DisplayHelpTextFromStringLabel(0, 0, 1, -1)

				if IsControlJustPressed(0, KEY_E) then

					spawnVehicle(coordData.SpawnVehicle, vehicleList[currentVehicleIndex].hash)

				end

				if IsControlJustPressed(0, 307) then

					currentVehicleIndex = currentVehicleIndex + 1

					if currentVehicleIndex > 2 then

						currentVehicleIndex = 1

					end

				end

			end



			local removeVehiclePos = {x = -1172.388, y=-893.6888, z=13.87249}

			local distanceFromRemoveVehicle = GetDistanceBetweenCoords(myPos.x, myPos.y, myPos.z, removeVehiclePos.x, removeVehiclePos.y, removeVehiclePos.z, true)

			if distanceFromRemoveVehicle < 20.0 then

				DrawMarker(25, removeVehiclePos.x, removeVehiclePos.y, removeVehiclePos.z - 0.95, 0, 0, 0, 0, 0, 0, 2.5, 2.5, 2.5, 155, 0, 0, 50, 0, 0, 0, 0)

			end

			if distanceFromRemoveVehicle < 3.0 then

				SetTextComponentFormat("STRING")

				AddTextComponentString("~INPUT_CONTEXT~ ~r~Ranger le vehicule")

				DisplayHelpTextFromStringLabel(0, 0, 1, -1)

				if IsControlJustPressed(1, 51) then

					TriggerEvent("wk:deleteVehicleAmbu")

				end

			end

			

			local customShop = {x=-1198.588, y=-901.967, z=12.99}

			local distanceFromCustomShop = GetDistanceBetweenCoords(customShop.x, customShop.y, customShop.z, myPos.x, myPos.y, myPos.z, false)

			if distanceFromCustomShop <= 20.0 then

				DrawMarker(25, customShop.x, customShop.y, customShop.z + 0.05, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 255, 255, 255, 50, 0, 0, 0, 0)

			end



			if distanceFromCustomShop <= 1.0 then

				SetTextComponentFormat("STRING")

				AddTextComponentString("~INPUT_CONTEXT~ Achat de ~b~" .. foods[currentSelectedFood].name .. " 20$~w~ \n~INPUT_REPLAY_ADVANCE~ pour changer de produit")

				DisplayHelpTextFromStringLabel(0, 0, 1, -1)

				if IsControlJustPressed(0, KEY_E) then

					TriggerServerEvent('avanyashop:testprix', foods[currentSelectedFood].itemID, foods[currentSelectedFood].price)

					Citizen.Wait(500)

				end

				if IsControlJustPressed(0, 307) then

					currentSelectedFood = currentSelectedFood + 1



					if currentSelectedFood > nFoods then

						currentSelectedFood = 1

					end

				end

				if IsControlJustPressed(0, 308) then

					currentSelectedFood = currentSelectedFood - 1



					if currentSelectedFood == 0 then

						currentSelectedFood = nFoods

					end

				end

			end



			local tshirtPos = {x=-1202.433, y=-894.7779, z=13.995}

			local distanceFromShirt = GetDistanceBetweenCoords(tshirtPos.x, tshirtPos.y, tshirtPos.z, myPos.x, myPos.y, myPos.z, false)

			if distanceFromShirt <= 20.0 then

				DrawMarker(25, tshirtPos.x, tshirtPos.y, tshirtPos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 255, 255, 255, 50, 0, 0, 0, 0)

			end

			--[[if distanceFromShirt <= 1.0 then

				SetTextComponentFormat("STRING")

				AddTextComponentString("~INPUT_CONTEXT~ Enfiler/Retirer le tshirt/pull")

				DisplayHelpTextFromStringLabel(0, 0, 1, -1)

				if IsControlJustPressed(0, KEY_E) then

					PutShirt()

				end

			end]]

		end

	end

end





--====================================================================================

--

--====================================================================================



function showInfoClient()

  if burgershot_call_accept ~= 0 and burgershot_call_accept ~= 10 then



    local offsetX = 0.87

    local offsetY = 0.785

    DrawRect(offsetX, offsetY, 0.23, 0.035, 0, 0, 0, 215)



    SetTextFont(1)

    SetTextScale(0.0,0.5)

    SetTextCentre(true)

    SetTextDropShadow(0, 0, 0, 0, 0)

    SetTextEdge(0, 0, 0, 0, 0)

    SetTextColour(255, 255, 255, 255)

    SetTextEntry("STRING")



    if burgershot_call_accept == 1 then

      AddTextComponentString(TEXT.CALL_INFO_OK)

    elseif burgershot_call_accept == 3 then

      AddTextComponentString(TEXT.CALL_INFO_IA_DRIVER)

    elseif burgershot_call_accept == 4 then

      AddTextComponentString(TEXT.CALL_INFO_IA_WAITING)

    elseif burgershot_call_accept == 5 then

      AddTextComponentString(TEXT.CALL_INFO_IA_LEAVING)

    else

      if burgershot_nbburgershotInService == 0 then

        AddTextComponentString(TEXT.CALL_INFO_NO_PERSONNEL)

      elseif burgershot_nbburgershotDispo == 0 then

        AddTextComponentString(TEXT.CALL_INFO_ALL_BUSY)

      else

        AddTextComponentString(TEXT.CALL_INFO_WAIT)

      end

    end

    DrawText(offsetX, offsetY - 0.015 )

  end

end



function showInfoJobs()

  local offsetX = 0.9

  local offsetY = 0.845

  DrawRect(offsetX, offsetY, 0.15, 0.07, 0, 0, 0, 215)



  SetTextFont(1)

  SetTextScale(0.0,0.5)

  SetTextCentre(true)

  SetTextDropShadow(0, 0, 0, 0, 0)

  SetTextEdge(0, 0, 0, 0, 0)

  SetTextColour(255, 255, 255, 255)

  SetTextEntry("STRING")

  AddTextComponentString('~o~Burgershot Info')

  DrawText(offsetX, offsetY - 0.03)



  SetTextFont(1)

  SetTextScale(0.0,0.5)

  SetTextCentre(false)

  SetTextDropShadow(0, 0, 0, 0, 0)

  SetTextEdge(0, 0, 0, 0, 0)

  SetTextColour(255, 255, 255, 255)

  SetTextEntry("STRING")



  AddTextComponentString(burgershot_nbMissionEnAttenteText)

  DrawText(offsetX - 0.065, offsetY -0.002)

end



function deleteVehicle()

  if myVehiculeEntity ~= nil then

    DeleteVehicle(myVehiculeEntity)

    myVehiculeEntity = nil

  end

end



Citizen.CreateThread(function()

  while true do

    Citizen.Wait(0)



    -- IAactionsLoop()



    if isburgershot then

      gestionService()

      if inServiceburgershot then

        showInfoJobs()

      end

    end



    if burgershot_call_accept ~= 0 then

      showInfoClient()

    end

  end

end)



--

RegisterNetEvent("burgershot:callAutoburgershot")

AddEventHandler("burgershot:callAutoburgershot",function(source, position, type)

  if burgershot_call_accept == 0 then

    IAgotoPlayer(type)

  end

end)



RegisterNetEvent('burgershot:drawMarker')

AddEventHandler('burgershot:drawMarker', function (boolean)

  isburgershot = boolean

  if isburgershot then

    showBlipburgershot()

  else

    removeBlipburgershot()

  end

end)



RegisterNetEvent('patron-burgershot:drawMarker')

AddEventHandler('patron-burgershot:drawMarker', function (boolean)

	isburgershot = boolean

	if isburgershot then

		showBlipburgershot()

	else

		removeBlipburgershot()

	end

end)



RegisterNetEvent('burgershot:drawBlips')

AddEventHandler('burgershot:drawBlips', function ()

end)

RegisterNetEvent('burgershot:marker')

AddEventHandler('burgershot:marker', function ()

end)



RegisterNetEvent('burgershot:deleteBlips')

AddEventHandler('burgershot:deleteBlips', function ()

  isburgershot = false

  removeBlipburgershot()

end)



RegisterNetEvent('patron-burgershot:deleteBlips')

AddEventHandler('patron-burgershot:deleteBlips', function ()

  isburgershot = false

  removeBlipburgershot()

end)



--====================================================================================

-- Serveur - Client Trigger

-- restart depanneur

--====================================================================================



function notifIcon(icon, type, sender, title, text)

  Citizen.CreateThread(function()

    Wait(1)

    SetNotificationTextEntry("STRING");

    if TEXT[text] ~= nil then

      text = TEXT[text]

    end

    AddTextComponentString(text);

    SetNotificationMessage(icon, icon, true, type, sender, title, text);

    DrawNotification(false, true);

  end)

end



RegisterNetEvent("burgershot:PersonnelMessage")

AddEventHandler("burgershot:PersonnelMessage",function(message)

  if inServiceburgershot then

    notifIcon("CHAR_SOCIAL_CLUB", 1, "Burgershot Info", false, message)

  end

end)



RegisterNetEvent("burgershot:ClientMessage")

AddEventHandler("burgershot:ClientMessage",function(message)

  notifIcon("CHAR_SOCIAL_CLUB", 1, "Burgershot", false, message)

end)





--=== restart depanneur

function acceptMission(data)

  local mission = data.mission

  TriggerServerEvent('burgershot:AcceptMission', mission.id)

end



function finishCurrentMission()

  TriggerServerEvent('burgershot:FinishMission', currentMissions.id)

  currentMissions = nil

  if currentBlip ~= nil then

    RemoveBlip(currentBlip)

  end

end



function updateMenuMission()

  local items = {}

  for _,m in pairs(listMissions) do

    local item = {

      Title = 'Mission ' .. m.id .. ' [' .. m.type .. ']',

      mission = m,

      Function = acceptMission

    }

    if #m.acceptBy ~= 0 then

      item.Title = item.Title .. ' (En cours)'

      item.TextColor = {39, 174, 96, 255}

    end

    table.insert(items, item)

  end

  if currentMissions ~= nil then

    table.insert(items, {['Title'] = 'Terminer la mission', ['Function'] = finishCurrentMission})

  end

  table.insert(items, {['Title'] = 'Fermer'})



  menu = items

  updateMenu(menu)

end



RegisterNetEvent('burgershot:MissionAccept')

AddEventHandler('burgershot:MissionAccept', function (mission)

  currentMissions = mission

  SetNewWaypoint(mission.pos[1], mission.pos[2])

  currentBlip= AddBlipForCoord(mission.pos[1], mission.pos[2], mission.pos[3])

  SetBlipSprite(currentBlip, 309)

  SetBlipColour(currentBlip, 5)

  SetBlipAsShortRange(currentBlip, true)

  --SetBlipFlashes(currentBlip,1)

  BeginTextCommandSetBlipName("STRING")

  AddTextComponentString(TEXT.Blip)

  EndTextCommandSetBlipName(currentBlip)

  SetBlipAsMissionCreatorBlip(currentBlip, true)



end)





RegisterNetEvent('burgershot:MissionCancel')

AddEventHandler('burgershot:MissionCancel', function ()

  currentMissions = nil

  if currentBlip ~= nil then

    RemoveBlip(currentBlip)

  end

end)



RegisterNetEvent('burgershot:MissionChange')

AddEventHandler('burgershot:MissionChange', function (missions)

  if not inServiceburgershot then

    return

  end

  listMissions = missions



  local nbMissionEnAttente = 0



  for _,m in pairs(listMissions) do



    if #m.acceptBy == 0 then

      nbMissionEnAttente = nbMissionEnAttente + 1

    end

  end

  if nbMissionEnAttente == 0 then

    burgershot_nbMissionEnAttenteText = TEXT.InfoburgershotNoAppel

  else

    burgershot_nbMissionEnAttenteText = '~g~ ' .. nbMissionEnAttente .. ' ' .. TEXT.InfoburgershotNbAppel

  end



  updateMenuMission()

end)





function callService(type)

  local myPed = GetPlayerPed(-1)

  local myCoord = GetEntityCoords(myPed)

  TriggerServerEvent('burgershot:Call', myCoord.x, myCoord.y, myCoord.z, type)

end



function toogleHelperLine()

  ShowLineGrueHelp = not ShowLineGrueHelp

end

RegisterNetEvent('burgershot:openMenu')

AddEventHandler('burgershot:openMenu', function()

  if inServiceburgershot then

    TriggerServerEvent('burgershot:requestMission')

    openMenuGeneral()

  else

    showMessageInformation("~r~Vous devais etre en service pour accedez au menu")

  end

end)



RegisterNetEvent('patron-burgershot:openMenu')

AddEventHandler('patron-burgershot:openMenu', function()

  if inServiceburgershot then

    TriggerServerEvent('burgershot:requestMission')

    openMenuGeneral()

  else

    showMessageInformation("~r~Vous devais etre en service pour accedez au menu")

  end

end)



RegisterNetEvent('burgershot:callService')

AddEventHandler('burgershot:callService',function(data)

  callService(data.type)

end)



RegisterNetEvent('burgershot:callServiceCustom')

AddEventHandler('burgershot:callServiceCustom',function(data)

  local info = openTextInput('', '', 128)

  if info ~= nil and info ~= '' then

    callService(info)

  end

end)



RegisterNetEvent('burgershot:callStatus')

AddEventHandler('burgershot:callStatus',function(status)

  burgershot_call_accept = status

end)



RegisterNetEvent('burgershot:personnelChange')

AddEventHandler('burgershot:personnelChange',function(nbPersonnel, nbDispo)

  burgershot_nbburgershotInService = nbPersonnel

  burgershot_nbburgershotDispo = nbDispo

end)



RegisterNetEvent('burgershot:cancelCall')

AddEventHandler('burgershot:cancelCall',function(data)

  TriggerServerEvent('burgershot:cancelCall')

  if IAdriver then

    IAstate = 5

  end

end)







function openTextInput(title, defaultText, maxlength)

  DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", defaultText or "", "", "", "", maxlength or 180)

  while (UpdateOnscreenKeyboard() == 0) do

    DisableAllControlActions(0);

    Wait(0);

  end

  if (GetOnscreenKeyboardResult()) then

    return GetOnscreenKeyboardResult()

  end

  return nil

end





----Citizen.Trace("burgershot load")

TriggerServerEvent('burgershot:requestPersonnel')



--====================================================================================

-- Paycheck Salary

--====================================================================================







-- isburgershot = true

-- toogleService()





-- ----[[ DEBUG

-- local myPed = GetPlayerPed(-1)

-- local myCoord = GetEntityCoords(myPed)

-- -- toogleService()

-- --Citizen.Trace('Pos init: ' .. myCoord.x .. ', ' .. myCoord.y .. ', ' .. myCoord.z)



-- -- local l = math.floor(math.random() * #coords) + 1

-- -- -- --Citizen.Trace('Tp at ' .. l )

-- -- local pos = coords[l].SpawnVehicleAction

-- -- --SetEntityCoords(myPed, pos.x, pos.y, pos.z)



-- -- --]]

-- toogleService()

-- isburgershot = true

-- -- local myPed = GetPlayerPed(-1)

-- -- local myCoord = GetEntityCoords(myPed)

-- -- local any = nil

-- -- AddRope(

-- -- myCoord.x, myCoord.y, myCoord.z,

-- -- 0.0, 0.0, 0.0,

-- -- 5.0, 1, 4.5, 5.5,

-- -- 0,0,0,

-- -- 0,0,0,Citizen.ReturnResultAnyway())

-- local function GetVehicleInDirection( coordFrom, coordTo )

--     local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )

--     local _, _, _, _, vehicle = GetRaycastResult( rayHandle )

--     return vehicle

-- end



-- local function GetVehicleLookByPlayer(ped, dist)

--     local playerPos =GetOffsetFromEntityInWorldCoords( ped, 0.0, 0.0, 0.0 )

--     local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, dist, -0.8 )

--     return GetVehicleInDirection( playerPos, inFrontOfPlayer )

-- end

-- local my= GetPlayerPed(-1)

-- local vi = GetVehicleLookByPlayer(my, 3.0)

-- if vi ~= nil then

--     local myCoord = GetEntityCoords(vi)

--     local h = GetEntityHeading(vi)

--     --Citizen.Trace('Car init: ' .. myCoord.x .. ', ' .. myCoord.y .. ', ' .. myCoord.z ..  ', h :  ' .. h)

-- end



-- Citizen.CreateThread(function()

--     while true do

--     Citizen.Wait(1)

--     local ped = GetPlayerPed(-1)

--            local playerPos = GetEntityCoords( ped, 1 )

--            local p = GetOffsetFromEntityInWorldCoords( ped, 0.0, 0.0, 0.0 )

--         local p1 = GetOffsetFromEntityInWorldCoords( ped, 0.0, 3.0, -0.8)

--         DrawLine(p.x, p.y, p.z, p1.x, p1.y, p1.z, 255,0,0,255)

--     end

-- end)





RegisterNetEvent('burgershot:returnBurgerShotAvailablesToShop')

AddEventHandler('burgershot:returnBurgerShotAvailablesToShop',function()

	TriggerEvent("foodshop:setBurgerShotsAvailable", burgershot_nbburgershotInService)

end)