local myVehiculeEntity = nil

local inServiceAvocat = false

local spawnVehicleChoix = {}

local VehicleModelKeyAvocat = GetHashKey('felon')

local KEY_E = 38

local KEY_UP = 96 -- N+

local KEY_DOWN = 97 -- N-

local KEY_CLOSE = 177

local currentBlip = nil

local listMissions = {}

local currentMissions = nil

local myCallMission = nil

local Avocat_nbMissionEnAttenteText = '-- Aucune Info --'

local Avocat_BlipAvocat = {}

local Avocat_call_accept = 0

local Avocat_nbAvocatInService = 0

local Avocat_nbAvocatDispo = 0



isAvocat = false

isJuge = false

isGouverneur = false

isProcureur = false

isEnqueteur = false



local inServiceGouverneur = false

local inServiceEnqueteur = false

local inServiceJugeProc = false



local TEXT = {

  AutoAvocatGetIn = '~INPUT_PICKUP~ Entrer dans le vehicule d Avocat',

  AutoAvocatGetOut = 'Vous pouvez sortir du vehicule de Avocat',

  AutoAvocatMute = '~INPUT_PICKUP~ Allumer/Eteindre la radio',

  AutoAvocatNextRadio = '~INPUT_VEH_NEXT_RADIO~ Prochaine station',

  AutoAvocatSetWayPoint = '~INPUT_PICKUP~ Mettez un point GPS puis appuyer pour partir',



  PrendreService = '~INPUT_PICKUP~ ~g~Prendre son service',

  QuitterService = '~INPUT_PICKUP~ ~r~Quitter son service',

  SpawnVehicle = '~INPUT_PICKUP~ Recupérer son véhicule de service',

  SpawnVehicleImpossible = '~R~ Impossible, aucune place disponible',



  Blip = 'Course en cours',

  BlipGarage = "Avocat",

  MissionCancel = 'Votre course à été annuler',

  MissionClientAccept = 'Un Avocat a prit votre appel',

  MissionClientCancel = 'Votre Avocat à abandonné votre commande',

  InfoAvocatNoAppel = '~g~Aucun appel en attente',

  InfoAvocatNbAppel = '~w~ Appel en attente',

  BlipAvocatService = 'Prise de service',

  BlipAvocatVehicle = 'Prise du véhicule de service',



  CALL_INFO_NO_PERSONNEL = '~r~Aucun Avocat en service',

  CALL_INFO_ALL_BUSY = '~o~Tous nos Avocats sont occupés',

  CALL_INFO_WAIT = '~b~Votre appel est sur attente',

  CALL_INFO_OK = '~g~Un Avocat va arriver sur les lieux de l\'appel',

  CALL_INFO_IA_DRIVER = '~g~Un Avocat automatique va arriver',

  CALL_INFO_IA_WAITING = '~g~Votre Avocat vous attend',

  CALL_INFO_IA_LEAVING = '~o~Votre Avocat est reparti',



  CALL_RECU = 'Confirmation\nVotre appel à été enregistré',

  CALL_ACCEPT = 'Votre appel a été accepté, un Avocat est en route',

  CALL_CANCEL = 'Le Avocat vient d\'abandonné votre appel',

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

    ['PriseDeService'] = {x = -71.97082, y = -813.9302, z = 243.3858},

    ['SpawnVehicleAction'] = { x = -91.9091, y = -810.4772, z = 36.27263},

    ['SpawnVehicle'] = {

      { x = -91.9091, y = -810.4772, z = 36.27263, h = 309.01065063477, type = VehicleModelKeyAvocat, plate = "AVOCAT"},

    },

  }

}



--====================================================================================

-- Avocat AUTOMATIQUE

--====================================================================================

local IAspawnPoint = {x = 0.37, y = 0.75, z = 0.04, h = 0.02}       --Spawn point

local IAdriver = nil      --Ped of the IA driver

local IAcar = nil         --Vehicle of the IA driver

local IAstate = 0         --Logical state of the IA

local IAmissionId = 0     --Id of the mission the IA take care of

local IATarget = nil      --GPS point set by the player

local IAactionKey = 38    --E key

local IAradio = true      --Radio State

local IAprice = 0         --Price of the Avocat ride

local IAnbrPeople = 1     --number of people

local IAtimeout = 3000    --Timeout of the Avocat

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

  RequestModel(VehicleModelKeyAvocat)

  while not HasModelLoaded(VehicleModelKeyAvocat) do

    Wait(1)

  end

  IAcar = CreateVehicle(VehicleModelKeyAvocat, IAspawnPoint.x, IAspawnPoint.y, IAspawnPoint.z, IAspawnPoint.h, true, false)

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



function getIsInServiceAvocat()

	if inServiceAvocat then

		return true

	elseif inServiceEnqueteur then

		return true

	elseif inServiceGouverneur then

		return true

	elseif inServiceJugeProc then

		return true

	else

		return false

	end

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



local function IAtimeoutLoop(AvocatPos)

   IAcurrenttimeout = IAcurrenttimeout - 1

  if IAcurrenttimeout <= 0 then -- timeout

    --Citizen.Trace('IAcurrenttimeout : ')

    IAstate = 5 -- we release the Avocat

  end

end



local function IAactionsLoop()

  if IAdriver ~= nil then

    if IAblip then

      RemoveBlip(IAblip)

    end

    local myPed = GetPlayerPed(-1)

    local myPos = GetEntityCoords(myPed)

    local AvocatPos = GetEntityCoords(IAdriver)



    if IAstate == 0 then

      IAblip = AddBlipForCoord(AvocatPos.x, AvocatPos.y, AvocatPos.z)

      SetBlipSprite(currentBlip, 357)

      SetBlipColour(currentBlip, 3)

      BeginTextCommandSetBlipName("STRING")

      AddTextComponentString("Avocat")

      EndTextCommandSetBlipName(currentBlip)

      if GetScriptTaskStatus(IAdriver, 0x21d33957) == 7 and Avocat_call_accept ~= 4 then

        StartVehicleHorn(IAcar, 10000, 0 , 0)

        Avocat_call_accept = 4

      end

      if GetDistanceBetweenCoords(myPos.x, myPos.y, myPos.z, AvocatPos.x, AvocatPos.y, AvocatPos.z, true) <= 10 then

        SetTextComponentFormat("STRING")

        AddTextComponentString(TEXT.AutoAvocatGetIn)

        DisplayHelpTextFromStringLabel(0, 0, 1, -1)

        if IsControlJustPressed(0, IAactionKey) then

          Avocat_call_accept = 10

          TaskEnterVehicle(myPed, IAcar, -1, 2, 1.5, 1, 0)

          IAstate = 0.5

        end

      end

      if GetScriptTaskStatus(IAdriver, 0x21d33957) == 7 then

        IAtimeoutLoop(AvocatPos)

      end

    elseif IAstate == 0.5 then

      if IsPedSittingInVehicle(myPed, IAcar) then

        IAstate = 1

      end

    elseif IAstate == 1 then

      SetTextComponentFormat("STRING")

      AddTextComponentString(TEXT.AutoAvocatSetWayPoint)

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

      AddTextComponentString(TEXT.AutoAvocatMute)

      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

--      if not IAfoundZ then

        if GetDistanceBetweenCoords(AvocatPos.x, AvocatPos.y, IATarget.z, IATarget.x, IATarget.y, IATarget.z, true) <= 50 then

          Citizen.InvokeNative(0x158BB33F920D360C, IAdriver, IAcar, AvocatPos.x, AvocatPos.y, AvocatPos.z, 15.5, 0xC00AB, 20.0001)

          Wait(100)

        end

--      end

      if GetScriptTaskStatus(IAdriver, 0x21d33957) == 7 then

        IAstate = 3

      end

    elseif IAstate == 3 then

      SetTextComponentFormat("STRING")

      AddTextComponentString(TEXT.AutoAvocatGetOut)

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

      TriggerServerEvent('avocat:PayAutomaticAvocat', IAprice)

      TaskVehicleDriveWander(IAdriver, IAcar, 10.0, 786859)

      Avocat_call_accept = 0

      IAstate = 0

      SetModelAsNoLongerNeeded(IAcar) -- srv will destroy it later

      SetModelAsNoLongerNeeded(IAdriver) -- same



      IAdriver = nil

      IAcar = nil

    end



    if IAstate >= 1 and not IsPedSittingInVehicle(myPed, IAcar) and IAstate < 3 then -- if the player leave the car before the end

      IAstate = 5 -- we release the Avocat

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

local function showBlipAvocat()

  for _ , c in pairs(coords) do

    local currentBlip = AddBlipForCoord(c.PriseDeService.x, c.PriseDeService.y, c.PriseDeService.z)

    SetBlipSprite(currentBlip, 17)

    SetBlipColour(currentBlip, 25)

    SetBlipAsShortRange(currentBlip, true)

    BeginTextCommandSetBlipName("STRING")

    AddTextComponentString(TEXT.BlipAvocatService)

    EndTextCommandSetBlipName(currentBlip)

    SetBlipAsMissionCreatorBlip(currentBlip, true)

    table.insert(Avocat_BlipAvocat, currentBlip)



    local currentBlip2 = AddBlipForCoord(c.SpawnVehicleAction.x, c.SpawnVehicleAction.y, c.SpawnVehicleAction.z)

    SetBlipSprite(currentBlip2, 18)

    SetBlipColour(currentBlip2, 64)

    SetBlipAsShortRange(currentBlip2, true)

    --SetBlipFlashes(currentBlip,1)

    BeginTextCommandSetBlipName("STRING")

    AddTextComponentString(TEXT.BlipAvocatVehicle)

    EndTextCommandSetBlipName(currentBlip2)

    SetBlipAsMissionCreatorBlip(currentBlip2, true)

    table.insert(Avocat_BlipAvocat, currentBlip2)

  end

end



local function removeBlipAvocat()

  for _ , c in pairs(Avocat_BlipAvocat) do

    RemoveBlip(c)

  end

  Avocat_BlipAvocat = {}

end



--[[function spawnVehicle(coords, type)

	deleteVehicle()

  local myPed = GetPlayerPed(-1)

  local myPos = GetEntityCoords(myPed)

	local vehi = GetClosestVehicle(myPos.x, myPos.y, myPos.z, 2.0, 0, 70)

    if vehi == 0 then

		RequestModel(type)

		while not HasModelLoaded(type) do

			Wait(1)

		end

		myVehiculeEntity = CreateVehicle(type, myPos.x, myPos.y, myPos.z, true, false)

		DecorRegister("Avanya", 2)

		DecorSetBool(myVehiculeEntity, "Avanya", true)

		local ObjectId = NetworkGetNetworkIdFromEntity(myVehiculeEntity)

    SetNetworkIdCanMigrate(ObjectId, true)

    SetEntityInvincible(myVehiculeEntity, false)

    SetVehicleNumberPlateText(myVehiculeEntity, "AVOCAT" .. math.random(0,99))

    SetPedIntoVehicle(GetPlayerPed(-1), myVehiculeEntity, - 1)

    SetEntityAsMissionEntity(myVehiculeEntity, true, true)

		local p = GetEntityCoords(myVehiculeEntity, 0)

		local h = GetEntityHeading(myVehiculeEntity)

		--showMessageInformation('Pos: ' .. p.x .. ' ' .. p.y .. ' ' .. p.z .. ' ' .. h)

    end

end]]
function spawnVehicle(coords, type)

  local myPos = GetEntityCoords(GetPlayerPed(-1))

  local vehiculeDetected = GetClosestVehicle(myPos.x, myPos.y, myPos.z, 6.0, 0, 70)

	if not DoesEntityExist(vehiculeDetected) then

    local myPed = GetPlayerPed(-1)
    
    local myPos = GetEntityCoords(myPed)

		local player = PlayerId()

		RequestModel(type)

		while not HasModelLoaded(type) do

			Wait(1)

		end

		existingVeh = CreateVehicle(type,myPos.x, myPos.y, myPos.z,0.0, true, false)

		DecorRegister("RainbowLand", 2)

		DecorSetBool(existingVeh, "RainbowLand", true)

		SetVehicleHasBeenOwnedByPlayer(existingVeh,true)

		local id = NetworkGetNetworkIdFromEntity(existingVeh)

		SetNetworkIdCanMigrate(id, true)

		SetEntityInvincible(existingVeh, false)

		SetVehicleOnGroundProperly(existingVeh)

		SetVehicleNumberPlateText(existingVeh, "GOUV" .. math.random(0, 99))

		SetPedIntoVehicle(myPed, existingVeh, - 1)

		SetEntityAsMissionEntity(existingVeh, true, true)

		plate = GetVehicleNumberPlateText(existingVeh)

		TriggerServerEvent("ls:refreshid",plate,existingVeh)

		

		SetModelAsNoLongerNeeded(vehicle)

	else

		notif("Zone encombrée.")

  end
  
end


local function toogleService()

  inServiceAvocat = not inServiceAvocat

  if inServiceAvocat then

    local myPed = GetPlayerPed(-1)

    TriggerServerEvent('avocat:takeService')

    TriggerEvent('avocat:Advert')

    TriggerServerEvent('avocat:requestMission')

  else

    -- Restaure Ped

    TriggerServerEvent('avocat:endService')



	if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

	else

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

	end



  end

end



RegisterNetEvent("avocat:Advert")

AddEventHandler("avocat:Advert",function()



		TriggerServerEvent('SyncAvocat', "Disponible")



end)



RegisterNetEvent('DisplayAvocat')

AddEventHandler('DisplayAvocat',function(inputText)



SetNotificationTextEntry("STRING");

AddTextComponentString(inputText);

SetNotificationMessage("CHAR_ARTHUR", "CHAR_ARTHUR", true, 1, "~y~Avocat En Service~s~", "");

DrawNotification(false, true);



end)





local function gestionService()

  local myPed = GetPlayerPed(-1)

  local myPos = GetEntityCoords(myPed)

  for _, coordData in pairs(coords) do

    local pos = coordData.PriseDeService

    local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, myPos.x, myPos.y, myPos.z, false)

    if dist <= 20 then

		if inServiceAvocat then

			DrawMarker(25, pos.x, pos.y, pos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0, 0, 0, 0)

		else

			DrawMarker(25, pos.x, pos.y, pos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 255, 0, 50, 0, 0, 0, 0)

		end

    end

    if dist <= 1.5 then

      if inServiceAvocat then

        --showMessageInformation(TEXT.QuitterService, 60)

        SetTextComponentFormat("STRING")

        AddTextComponentString(TEXT.QuitterService)

        DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      else

        SetTextComponentFormat("STRING")

        AddTextComponentString(TEXT.PrendreService)

        DisplayHelpTextFromStringLabel(0, 0, 1, -1)

        --showMessageInformation(TEXT.PrendreService, 60)

      end

      if IsControlJustPressed(0, KEY_E) then

        toogleService()

      end

    end



    if inServiceAvocat then

      local pos = coordData.SpawnVehicleAction

      local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, myPos.x, myPos.y, myPos.z, false)

      if dist <= 20 then

        DrawMarker(25, pos.x, pos.y, pos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)

      end

      if dist <= 1 then

        -- showMessageInformation(TEXT.SpawnVehicle, 60)

        SetTextComponentFormat("STRING")

        AddTextComponentString(TEXT.SpawnVehicle)

        DisplayHelpTextFromStringLabel(0, 0, 1, -1)

        if IsControlJustPressed(0, KEY_E) then

          spawnVehicle(coordData.SpawnVehicle, VehicleModelKeyAvocat, "AVOCAT")

        end

      end

    end

  end

end







function toggleServiceEnqueteur()

	if inServiceEnqueteur then

		inServiceEnqueteur = false



		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("weapon_combatpistol"))

		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("weapon_smg"))

		RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("weapon_stungun"))



		SetPedArmour(GetPlayerPed(-1), 0) -- Ajout armure

	else

		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_combatpistol"), 250, true, true)

		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_smg"), 250, true, true)

		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_stungun"), 250, true, true)

		SetPedArmour(GetPlayerPed(-1), 100) -- Ajout armure



		inServiceEnqueteur = true



		TriggerServerEvent('avocat:endService')

	end

end



function toggleServiceGouverneur()

	if inServiceGouverneur then

		inServiceGouverneur = false

	else

		inServiceGouverneur = true



		TriggerServerEvent('avocat:endService')

	end

end



function toggleServiceJugeProc()

	if inServiceJugeProc then

		inServiceJugeProc = false



		SetPedArmour(GetPlayerPed(-1), 0) -- Ajout armure

	else

		inServiceJugeProc = true



		SetPedArmour(GetPlayerPed(-1), 100) -- Ajout armure



		TriggerServerEvent('avocat:endService')

	end

end



function gestionServiceGouverneur()

	local myPed = GetPlayerPed(-1)

	local myPos = GetEntityCoords(myPed)



	local servicePos = {x = -534.8529, y = -180.6933, z = 46.54615}

	local dist = GetDistanceBetweenCoords(servicePos.x, servicePos.y, servicePos.z, myPos.x, myPos.y, myPos.z, false)

    if dist <= 20 then

		if inServiceGouverneur then

			DrawMarker(25, servicePos.x, servicePos.y, servicePos.z + 0.02, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0, 0, 0, 0)

		else

			DrawMarker(25, servicePos.x, servicePos.y, servicePos.z + 0.02, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 255, 0, 50, 0, 0, 0, 0)

		end

    end

	if dist <= 1.5 then

		if inServiceGouverneur then

			SetTextComponentFormat("STRING")

			AddTextComponentString(TEXT.QuitterService)

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		else

			SetTextComponentFormat("STRING")

			AddTextComponentString(TEXT.PrendreService)

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		end

		if IsControlJustPressed(0, 51) then

			toggleServiceGouverneur()

		end

	end



	if inServiceGouverneur then

		local vehicleInfos = {x = -575.3388, y = -151.1429, z = 36.99839, h = 201.00305175681, type = GetHashKey("cognoscenti2"), plate="GOVERNOR"}

		local vehicleSpawnerPos = {x = -575.3388, y = -151.1429, z = 36.99839}

		local dist = GetDistanceBetweenCoords(vehicleSpawnerPos.x, vehicleSpawnerPos.y, vehicleSpawnerPos.z, myPos.x, myPos.y, myPos.z, false)

		if dist <= 20 then

			DrawMarker(25, vehicleSpawnerPos.x, vehicleSpawnerPos.y, vehicleSpawnerPos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)

		end

		if dist <= 2.0 then

			SetTextComponentFormat("STRING")

			AddTextComponentString("~INPUT_PICKUP~ Sortir votre voiture")

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlJustPressed(0, 51) then

				spawnVehicle(vehicleInfos, vehicleInfos.type)

			end

		end

	end

end



local currentVehicleIndex = 1

function gestionServiceEnqueteur()

	local myPed = GetPlayerPed(-1)

	local myPos = GetEntityCoords(myPed)



	local servicePos = {x = -545.7396, y = -184.3729, z = 41.7028}

	local dist = GetDistanceBetweenCoords(servicePos.x, servicePos.y, servicePos.z, myPos.x, myPos.y, myPos.z, false)

    if dist <= 20 then

		if inServiceEnqueteur then

			DrawMarker(25, servicePos.x, servicePos.y, servicePos.z + 0.02, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0, 0, 0, 0)

		else

			DrawMarker(25, servicePos.x, servicePos.y, servicePos.z + 0.02, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 255, 0, 50, 0, 0, 0, 0)

		end

    end

	if dist <= 1.5 then

		if inServiceEnqueteur then

			SetTextComponentFormat("STRING")

			AddTextComponentString(TEXT.QuitterService)

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		else

			SetTextComponentFormat("STRING")

			AddTextComponentString(TEXT.PrendreService)

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		end

		if IsControlJustPressed(0, 51) then

			toggleServiceEnqueteur()

		end

	end



	if inServiceEnqueteur then

		local vehicleList =

		{

			{x = -575.3388, y = -151.1429, z = 36.99839, h = 201.00305175681, vehicleName = "Schafter",	type = GetHashKey("schafter3"), plate="89CNE925"},

			{x = -575.3388, y = -151.1429, z = 36.99839, h = 201.00305175681, vehicleName = "Oracle",	type = GetHashKey("oracle"),	plate="69CJK829"},

			{x = -575.3388, y = -151.1429, z = 36.99839, h = 201.00305175681, vehicleName = "Baller",	type = GetHashKey("baller6"),	plate="34VNB949"},

		}

		local vehicleSpawnerPos = {x = -575.3388, y = -151.1429, z = 36.99839}

		local dist = GetDistanceBetweenCoords(vehicleSpawnerPos.x, vehicleSpawnerPos.y, vehicleSpawnerPos.z, myPos.x, myPos.y, myPos.z, false)

		if dist <= 20 then

			DrawMarker(25, vehicleSpawnerPos.x, vehicleSpawnerPos.y, vehicleSpawnerPos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)

		end

		if dist <= 2.0 then

			SetTextComponentFormat("STRING")

			AddTextComponentString("~INPUT_PICKUP~ Sortir votre : " .. vehicleList[currentVehicleIndex].vehicleName .. "\n~INPUT_REPLAY_ADVANCE~ Changer de vehicule")

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlJustPressed(0, 51) then

				spawnVehicle(vehicleList[currentVehicleIndex], vehicleList[currentVehicleIndex].type)

			end



			if IsControlJustPressed(0, 307) then

				currentVehicleIndex = currentVehicleIndex + 1

				if currentVehicleIndex > 3 then

					currentVehicleIndex = 1

				end

			end

		end

	end

end



function gestionServiceJugeProc()

	local myPed = GetPlayerPed(-1)

	local myPos = GetEntityCoords(myPed)



	local servicePos = {x = -534.8529, y = -180.6933, z = 46.5461}

	local dist = GetDistanceBetweenCoords(servicePos.x, servicePos.y, servicePos.z, myPos.x, myPos.y, myPos.z, false)

    if dist <= 20 then

		if inServiceJugeProc then

			DrawMarker(25, servicePos.x, servicePos.y, servicePos.z + 0.02, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0, 0, 0, 0)

		else

			DrawMarker(25, servicePos.x, servicePos.y, servicePos.z + 0.02, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 255, 0, 50, 0, 0, 0, 0)

		end

    end

	if dist <= 1.5 then

		if inServiceJugeProc then

			SetTextComponentFormat("STRING")

			AddTextComponentString(TEXT.QuitterService)

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		else

			SetTextComponentFormat("STRING")

			AddTextComponentString(TEXT.PrendreService)

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		end

		if IsControlJustPressed(0, 51) then

			toggleServiceJugeProc()

		end

	end



	if inServiceJugeProc then

		local vehicleInfos = {x = -575.3388, y = -151.1429, z = 36.99839, h = 201.00305175681, type = GetHashKey("huntley"), plate="45LKO698"}

		local vehicleSpawnerPos = {x = -575.3388, y = -151.1429, z = 36.99839}

		local dist = GetDistanceBetweenCoords(vehicleSpawnerPos.x, vehicleSpawnerPos.y, vehicleSpawnerPos.z, myPos.x, myPos.y, myPos.z, false)

		if dist <= 20 then

			DrawMarker(25, vehicleSpawnerPos.x, vehicleSpawnerPos.y, vehicleSpawnerPos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)

		end

		if dist <= 2.0 then

			SetTextComponentFormat("STRING")

			AddTextComponentString("~INPUT_PICKUP~ Sortir votre voiture")

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlJustPressed(0, 51) then

				spawnVehicle(vehicleInfos, vehicleInfos.type)

			end

		end

	end

end





--====================================================================================

--

--====================================================================================



function showInfoClient()

  if Avocat_call_accept ~= 0 and Avocat_call_accept ~= 10 then



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

    if Avocat_call_accept == 1 then

      AddTextComponentString(TEXT.CALL_INFO_OK)

    elseif Avocat_call_accept == 3 then

      AddTextComponentString(TEXT.CALL_INFO_IA_DRIVER)

    elseif Avocat_call_accept == 4 then

      AddTextComponentString(TEXT.CALL_INFO_IA_WAITING)

    elseif Avocat_call_accept == 5 then

      AddTextComponentString(TEXT.CALL_INFO_IA_LEAVING)

    else

      if Avocat_nbAvocatInService == 0 then

        AddTextComponentString(TEXT.CALL_INFO_NO_PERSONNEL)

      elseif Avocat_nbAvocatDispo == 0 then

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

  AddTextComponentString('~o~Avocat Info')

  DrawText(offsetX, offsetY - 0.03)



  SetTextFont(1)

  SetTextScale(0.0,0.5)

  SetTextCentre(false)

  SetTextDropShadow(0, 0, 0, 0, 0)

  SetTextEdge(0, 0, 0, 0, 0)

  SetTextColour(255, 255, 255, 255)

  SetTextEntry("STRING")



  AddTextComponentString(Avocat_nbMissionEnAttenteText)

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



		if isAvocat then

			gestionService()

			if inServiceAvocat then

				showInfoJobs()

			end

		elseif isGouverneur then

			gestionServiceGouverneur()

		elseif isEnqueteur then

			gestionServiceEnqueteur()

		elseif isJuge or isProcureur then

			gestionServiceJugeProc()

		end



		if Avocat_call_accept ~= 0 then

			showInfoClient()

		end

	end

end)



--

RegisterNetEvent("avocat:callAutoAvocat")

AddEventHandler("avocat:callAutoAvocat",function(source, position, type)

  if Avocat_call_accept == 0 then

    IAgotoPlayer(type)

  end

end)



RegisterNetEvent('avocat:drawMarker')

AddEventHandler('avocat:drawMarker', function (boolean)

  isAvocat = boolean

  if isAvocat then

    showBlipAvocat()

  else

    removeBlipAvocat()

  end

end)



RegisterNetEvent('juge:drawMarker')

AddEventHandler('juge:drawMarker', function (boolean)

  isJuge = boolean

end)



RegisterNetEvent('procureur:drawMarker')

AddEventHandler('procureur:drawMarker', function (boolean)

  isProcureur = boolean

end)



RegisterNetEvent('enqueteur:drawMarker')

AddEventHandler('enqueteur:drawMarker', function (boolean)

  isEnqueteur = boolean

end)



RegisterNetEvent('gouverneur:drawMarker')

AddEventHandler('gouverneur:drawMarker', function (boolean)

  isGouverneur = boolean

end)



RegisterNetEvent('gouverneur-adjoint:drawMarker')

AddEventHandler('gouverneur-adjoint:drawMarker', function (boolean)

  isGouverneur = boolean

end)



RegisterNetEvent('avocat:drawBlips')

AddEventHandler('avocat:drawBlips', function ()

end)

RegisterNetEvent('avocat:marker')

AddEventHandler('avocat:marker', function ()

end)



RegisterNetEvent('avocat:deleteBlips')

AddEventHandler('avocat:deleteBlips', function ()

  isAvocat = false

  removeBlipAvocat()

end)



RegisterNetEvent('juge:deleteBlips')

AddEventHandler('juge:deleteBlips', function ()

  isJuge = false

end)



RegisterNetEvent('procureur:deleteBlips')

AddEventHandler('procureur:deleteBlips', function ()

  isProcureur = false

end)



RegisterNetEvent('enqueteur:deleteBlips')

AddEventHandler('enqueteur:deleteBlips', function ()

  isEnqueteur = false

end)



RegisterNetEvent('gouverneur:deleteBlips')

AddEventHandler('gouverneur:deleteBlips', function ()

  isGouverneur = false

end)



RegisterNetEvent('gouverneur-adjoint:deleteBlips')

AddEventHandler('gouverneur-adjoint:deleteBlips', function ()

  isGouverneur = false

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



RegisterNetEvent("avocat:PersonnelMessage")

AddEventHandler("avocat:PersonnelMessage",function(message)

  if inServiceAvocat then

    notifIcon("CHAR_BLANK_ENTRY", 1, "Avocat Info", false, message)

  end

end)



RegisterNetEvent("avocat:ClientMessage")

AddEventHandler("avocat:ClientMessage",function(message)

  notifIcon("CHAR_BLANK_ENTRY", 1, "Avocat", false, message)

end)





--=== restart depanneur

function acceptMission(data)

  local mission = data.mission

  TriggerServerEvent('avocat:AcceptMission', mission.id)

end



function finishCurrentMission()

  TriggerServerEvent('avocat:FinishMission', currentMissions.id)

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



RegisterNetEvent('avocat:MissionAccept')

AddEventHandler('avocat:MissionAccept', function (mission)

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





RegisterNetEvent('avocat:MissionCancel')

AddEventHandler('avocat:MissionCancel', function ()

  currentMissions = nil

  if currentBlip ~= nil then

    RemoveBlip(currentBlip)

  end

end)



RegisterNetEvent('avocat:MissionChange')

AddEventHandler('avocat:MissionChange', function (missions)

  if not inServiceAvocat then

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

    Avocat_nbMissionEnAttenteText = TEXT.InfoAvocatNoAppel

  else

    Avocat_nbMissionEnAttenteText = '~g~ ' .. nbMissionEnAttente .. ' ' .. TEXT.InfoAvocatNbAppel

  end



  updateMenuMission()

end)





function callService(type)

  local myPed = GetPlayerPed(-1)

  local myCoord = GetEntityCoords(myPed)

  TriggerServerEvent('avocat:Call', myCoord.x, myCoord.y, myCoord.z, type)

end



function toogleHelperLine()

  ShowLineGrueHelp = not ShowLineGrueHelp

end

RegisterNetEvent('avocat:openMenu')

AddEventHandler('avocat:openMenu', function()

  if inServiceAvocat then

    TriggerServerEvent('avocat:requestMission')

    openMenuGeneral()

  else

    showMessageInformation("~r~Vous devais etre en service pour accedez au menu")

  end

end)



RegisterNetEvent('avocat:callService')

AddEventHandler('avocat:callService',function(data)

  callService(data.type)

end)



RegisterNetEvent('avocat:callServiceCustom')

AddEventHandler('avocat:callServiceCustom',function()

  local info = openTextInput('', '', 128)

  if info ~= nil and info ~= '' then

    callService(info)

  end

end)



RegisterNetEvent('avocat:callStatus')

AddEventHandler('avocat:callStatus',function(status)

  Avocat_call_accept = status

end)



RegisterNetEvent('avocat:personnelChange')

AddEventHandler('avocat:personnelChange',function(nbPersonnel, nbDispo)

  Avocat_nbAvocatInService = nbPersonnel

  Avocat_nbAvocatDispo = nbDispo

end)



RegisterNetEvent('avocat:cancelCall')

AddEventHandler('avocat:cancelCall',function(data)

  TriggerServerEvent('avocat:cancelCall')

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





----Citizen.Trace("Avocat load")

TriggerServerEvent('avocat:requestPersonnel')



--====================================================================================

-- Paycheck Salary

--====================================================================================







-- isAvocat = true

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

-- isAvocat = true

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