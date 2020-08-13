local entityEnumerator = {

	__gc = function(enum)

	if enum.destructor and enum.handle then

		enum.destructor(enum.handle)

	end

	enum.destructor = nil

	enum.handle = nil

	end

}



local function EnumerateEntities(initFunc, moveFunc, disposeFunc)

	return coroutine.wrap(function()

		local iter, id = initFunc()

		if not id or id == 0 then

			disposeFunc(iter)

			return

		end

    

		local enum = {handle = iter, destructor = disposeFunc}

		setmetatable(enum, entityEnumerator)

    

		local next = true

		repeat

		coroutine.yield(id)

		next, id = moveFunc(iter)

		until not next

    

		enum.destructor, enum.handle = nil, nil

		disposeFunc(iter)

	end)

end



function EnumerateObjects()

	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)

end



function EnumeratePeds()

	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)

end



function EnumerateVehicles()

	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)

end



function EnumeratePickups()

	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)

end



----------------------------------



local function RequestControlAndDelete(entity)    

	NetworkRequestControlOfEntity(entity)

	

	local timeout = 2000

	while timeout > 0 and not NetworkHasControlOfEntity(entity) do

		Wait(10)

		timeout = timeout - 100

	end



	SetEntityAsMissionEntity(entity, true, true)

	

	local timeout = 2000

	while timeout > 0 and not IsEntityAMissionEntity(entity) do

		Wait(10)

		timeout = timeout - 100

	end

	

	Citizen.Trace("Owner of entity: " .. GetPlayerServerId(NetworkGetEntityOwner(entity)) .. " ")



	Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized(entity))

	

	if (DoesEntityExist(entity)) then 

		DeleteEntity(entity)

		if (DoesEntityExist(entity)) then        

			return false

		else 

			return true

		end

	else 

		return true

	end 

end



local function RequestControl(entity)

	NetworkRegisterEntityAsNetworked(entity)

	Citizen.Wait(100)



	NetworkRequestControlOfEntity(entity)



	if not IsEntityAMissionEntity(entity) then

		SetEntityAsMissionEntity(entity)

	end



	Citizen.Wait(100)

end



local function RemovePeds()

	local players = {}



    for i = 0, 256 do

        if NetworkIsPlayerActive(i) then

            table.insert(players, i)

        end

    end



	for Ped in EnumeratePeds() do

		if DoesEntityExist(Ped) then

			local isPlayer = false

			for index,value in ipairs(players) do

				local target = GetPlayerPed(value)

				if Ped == target then

					isPlayer = true

				end

			end



			if not isPlayer and not DecorGetBool(Ped, "RainbowLand") then

				print("Found a ped : " .. GetEntityModel(Ped))

				print(RequestControlAndDelete(Ped))

				Citizen.Wait(10)

			end

		end

	end

end



local function RemoveVehicles()

	for vehicle in EnumerateVehicles() do

		if DoesEntityExist(vehicle) then

			if not DecorGetBool(vehicle, "RainbowLand") then

				print("Found vehicle : " .. vehicle)

				print(RequestControlAndDelete(vehicle))

				Citizen.Wait(10)

			end

		end

	end

end



local blackListedObjets = 

{

	1338692320, -- Yacht - apa_mp_apa_yacht

}



local blackListedObjets2 = 

{

	-- WAR MENU

	"prop_container_01a",

	"prop_contnr_pile_01a",

	"ce_xr_ctr2",

	"stt_prop_ramp_jump_xxl",

	"hei_prop_carrier_jet",

	"csx_seabed_rock3_",

	"db_apart_03_",

	"db_apart_09_",



	-- Track

	"stt_prop_stunt_track_bumps",

	"stt_prop_stunt_track_cutout",

	"stt_prop_stunt_track_start",

	"stt_prop_stunt_track_dwlink",

	"stt_prop_stunt_track_dwlink_02",

	"stt_prop_stunt_track_dwsh15",

	"stt_prop_stunt_track_dwshort",

	"stt_prop_stunt_track_dwslope15",

	"stt_prop_stunt_track_dwslope30",

	"stt_prop_stunt_track_dwslope45",

	"stt_prop_stunt_track_dwturn",

	"stt_prop_stunt_track_dwuturn",

	"stt_prop_stunt_track_exshort",

	"stt_prop_stunt_track_fork",

	"stt_prop_stunt_track_funlng",

	"stt_prop_stunt_track_funnel",

	"stt_prop_stunt_track_hill",

	"stt_prop_stunt_track_hill2",

	"stt_prop_stunt_track_jump",

	"stt_prop_stunt_track_link",

	"stt_prop_stunt_track_otake",

	"stt_prop_stunt_track_sh15",

	"stt_prop_stunt_track_sh30",

	"stt_prop_stunt_track_sh45",

	"stt_prop_stunt_track_sh45_a",

	"stt_prop_stunt_track_short",

	"stt_prop_stunt_track_slope15",

	"stt_prop_stunt_track_slope30",

	"stt_prop_stunt_track_slope45",

	"stt_prop_stunt_track_st_01",

	"stt_prop_stunt_track_st_02",

	"stt_prop_stunt_track_start",

	"stt_prop_stunt_track_start_02",

	"stt_prop_stunt_track_straight",

	"stt_prop_stunt_track_straightice",

	"stt_prop_stunt_track_turn",

	"stt_prop_stunt_track_turnice",

	"stt_prop_stunt_track_uturn",

	"stt_prop_track_bend2_bar_l",

	"stt_prop_track_bend2_bar_l_b",

	"stt_prop_track_bend2_l",

	"stt_prop_track_bend2_l_b",

	"stt_prop_track_bend_15d",

	"stt_prop_track_bend_15d_bar",

	"stt_prop_track_bend_180d",

	"stt_prop_track_bend_180d_bar",

	"stt_prop_track_bend_30d",

	"stt_prop_track_bend_30d_bar",

	"stt_prop_track_bend_5d",

	"stt_prop_track_bend_5d_bar",

	"stt_prop_track_bend_bar_l",

	"stt_prop_track_bend_bar_l_b",

	

	"stt_prop_track_jump_01a",

	"stt_prop_track_jump_01b",

	"stt_prop_track_jump_01c",

	"stt_prop_track_jump_02a",

	"stt_prop_track_jump_02b",

	"stt_prop_track_jump_02c",

	"stt_prop_track_stop_sign",



	-- Custom

	"p_spinning_anus_s",

	"prop_coffin_01",

	"prop_coffin_02",

	"prop_coffin_02b",

	"prop_weed_01",

	"prop_weed_02",

	"prop_cs_dildo_01",

	"prop_asteroid_01",



	-- Lynx

	"p_crahsed_heli_s",

	"prop_rock_4_big2",

	"prop_beachflag_le",



	-- Arena war

	"xs_prop_beer_bottle_wl",

	"xs_prop_burger_meat_wl",

	"xs_prop_can_tunnel_wl",

	"xs_prop_can_wl",

	"xs_prop_chips_tube_wl",

	"xs_prop_chopstick_wl",

	"xs_prop_gate_tyre_01a_wl",

	"xs_prop_hamburgher_wl",

	"xs_prop_nacho_wl",

	"xs_prop_plastic_bottle_wl",

}



local function RemoveObjects()

	for object in EnumerateObjects() do

		if DoesEntityExist(object) then

			local model = GetEntityModel(object)

			local isABlacklistedObject = false

			for k,v in pairs(blackListedObjets) do

				if v == model then

					isABlacklistedObject = true

				end

			end



			if isABlacklistedObject then

				print("Blacklist : " .. object)

				if not RequestControlAndDelete(object) then

					DetachEntity(object, true, true)

					SetEntityCoords(object, -309.8, -3245.0, -24.5, 0.0, 0.0, 0.0, 0)

				end

			else

				if not DecorGetBool(object, "RainbowLand") and GetEntityScript(object) ~= nil then

					print("Found object : " .. GetEntityModel(object))

					

					if not RequestControlAndDelete(object) then

						SetEntityCoords(object, -309.8, -3245.0, -24.5, 0.0, 0.0, 0.0, 0)

					end



					print(GetEntityScript(object))

					Citizen.Wait(10)

				end

			end

		end

	end



	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))



	local newObject = nil

	for i,v in pairs(blackListedObjets2) do

		newObject = GetClosestObjectOfType(x, y, z, 500.0, v, false, true, true)

		if newObject ~= nil and newObject ~= 0 then

			DetachEntity(newObject, true, true)

			print("Detected : " .. v .. " : " .. newObject)



			if not RequestControlAndDelete(newObject) then

				DetachEntity(newObject, true, true)

				SetEntityCoords(newObject, -309.8, -3245.0, -24.5, 0.0, 0.0, 0.0, 0)

			end

		end

	end

end



RegisterNetEvent("avanyac:cleaneverything")

AddEventHandler("avanyac:cleaneverything", function()

	print("------------------ STARTING the clearing process ------------------")



	RemovePeds()

	

	print("-------- Peds are now cleared --------")

	

	Citizen.Wait(500)

	

	RemoveVehicles()

	

	print("-------- Vehicles are now cleared --------")

	

	Citizen.Wait(500)



	RemoveObjects()



	print("-------- Objects are now cleared --------")

	

	Citizen.Wait(250)



	print("------------------ Clearing process DONE ------------------")

end)



local weaponDamages = 

{

	-- Pistol

	{weaponHash = "weapon_pistol",			weaponDamage = 26.0},

	{weaponHash = "weapon_pistol_mk2",		weaponDamage = 32.0},

	{weaponHash = "weapon_combatpistol",	weaponDamage = 27.0},

	{weaponHash = "weapon_appistol",		weaponDamage = 28.0},

	{weaponHash = "weapon_pistol50",		weaponDamage = 51.0},

	{weaponHash = "weapon_heavypistol",		weaponDamage = 40.0},

	{weaponHash = "weapon_vintagepistol",	weaponDamage = 34.0},

	{weaponHash = "weapon_revolver",		weaponDamage = 80.0},

	-- SMG

	{weaponHash = "weapon_microsmg",		weaponDamage = 21.0},

	{weaponHash = "weapon_smg",				weaponDamage = 22.0},

	{weaponHash = "weapon_smg_mk2",			weaponDamage = 25.0},

	{weaponHash = "weapon_assaultsmg",		weaponDamage = 23.0},

	{weaponHash = "weapon_combatpdw",		weaponDamage = 28.0},

	{weaponHash = "weapon_machinepistol",	weaponDamage = 27.0},

	{weaponHash = "weapon_minismg",			weaponDamage = 22.0},

	-- SHOTGUN

	{weaponHash = "weapon_sawnoffshotgun",	weaponDamage = 40.0},

	{weaponHash = "weapon_autoshotgun",		weaponDamage = 27.0},

	{weaponHash = "weapon_dbshotgun",		weaponDamage = 30.0},

}
