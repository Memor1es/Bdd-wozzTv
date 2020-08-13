currentPropUsed = nil

usedProps = {}

allPropsAnimations = 
{
	{
		label = "Gants de boxe",
		dict = "",
		anim = "",
		AnimationOptions =
		{
			Prop = "prop_boxing_glove_01",
			PropBone = 57005, -- Right Hand
			PropBone2 = 18905, -- Left Hand
			PropPlacement = {-0.03, 0.0, -0.04, 0.0, 90.0, 90.0},
			PropPlacement2 = {-0.05, 0.0, 0.04, 0.0, 90.0, -90.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Carton",
		dict = "anim@heists@box_carry@",
		anim = "idle",
		AnimationOptions =
		{
			Prop = "hei_prop_heist_box",
			PropBone = 60309,
			PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},	

	{
		label = "Carton de biere",
		dict = "anim@heists@box_carry@",
		anim = "idle",
		AnimationOptions =
		{
			Prop = "prop_beer_box_01",
			PropBone = 60309,
			PropPlacement = {0.025, -0.05, 0.255, -70.0, 290.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Boite a pizza",
		dict = "anim@heists@box_carry@",
		anim = "idle",
		AnimationOptions =
		{
			Prop = "prop_pizza_box_01",
			PropBone = 60309,
			PropPlacement = {0.15, -0.025, 0.255, -70.0, 290.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Parapluie",
		dict = "amb@world_human_drinking@coffee@male@base",
		anim = "base",
		AnimationOptions =
		{
			Prop = "p_amb_brolly_01",
			PropBone = 57005,
			PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Cigarette Homme - 1",
		dict = "amb@world_human_aa_smoke@male@idle_a",
		anim = "idle_c",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Cigarette Homme - 2",
		dict = "amb@world_human_aa_smoke@male@idle_a",
		anim = "idle_b",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Cigarette Femme",
		dict = "amb@world_human_smoking@female@idle_a",
		anim = "idle_b",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Joint",
		dict = "amb@world_human_aa_smoke@male@idle_a",
		anim = "idle_c",
		AnimationOptions =
		{
			Prop = 'p_cs_joint_02',
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Cigar",
		dict = "amb@world_human_aa_smoke@male@idle_a",
		anim = "idle_c",
		AnimationOptions =
		{
			Prop = 'prop_cigar_01',
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, 0.0, 0.0, 180.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},
	
	{
		label = "Radio",
		dict = "missheistdocksprep1hold_cellphone",
		anim = "hold_cellphone",
		AnimationOptions =
		{
			Prop = "prop_boombox_01",
			PropBone = 57005,
			PropPlacement = {0.27, 0.04, -0.04, 0.0, 280.0, 53.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Attache-case",
		dict = "missheistdocksprep1hold_cellphone",
		anim = "hold_cellphone",
		AnimationOptions =
		{
			Prop = "prop_ld_suitcase_01",
			PropBone = 57005,
			PropPlacement = {0.39, 0.02, -0.02, 0.0, 266.0, 60.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Attache-case 2",
		dict = "missheistdocksprep1hold_cellphone",
		anim = "hold_cellphone",
		AnimationOptions =
		{
			Prop = "prop_security_case_01",
			PropBone = 57005,
			PropPlacement = {0.12, 0.02, -0.02, 0.0, 280.0, 53.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Attache-case 3",
		dict = "missheistdocksprep1hold_cellphone",
		anim = "hold_cellphone",
		AnimationOptions =
		{
			Prop = "prop_ld_case_01",
			PropBone = 57005,
			PropPlacement = {0.12, 0.02, -0.02, 0.0, 280.0, 53.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},
	
	{
		label = "Cafe",
		dict = "amb@world_human_drinking@coffee@male@idle_a",
		anim = "idle_c",
		AnimationOptions =
		{
			Prop = 'p_amb_coffeecup_01',
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Whiskey",
		dict = "amb@world_human_drinking@coffee@male@idle_a",
		anim = "idle_c",
		AnimationOptions =
		{
			Prop = 'prop_drink_whisky',
			PropBone = 28422,
			PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Verre de vin",
		dict = "anim@heists@humane_labs@finale@keycards",
		anim = "ped_a_enter_loop",
		AnimationOptions =
		{
			Prop = 'prop_drink_redwine',
			PropBone = 18905,
			PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Flute de Champagne - vide",
		dict = "anim@heists@humane_labs@finale@keycards",
		anim = "ped_a_enter_loop",
		AnimationOptions =
		{
			Prop = 'prop_champ_flute',
			PropBone = 18905,
			PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Flute de Champagne - pleine",
		dict = "anim@heists@humane_labs@finale@keycards",
		anim = "ped_a_enter_loop",
		AnimationOptions =
		{
			Prop = 'prop_drink_champ',
			PropBone = 18905,
			PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Biere",
		dict = "amb@world_human_drinking@coffee@male@idle_a",
		anim = "idle_c",
		AnimationOptions =
		{
			Prop = 'prop_amb_beer_bottle',
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Gobelet",
		dict = "amb@world_human_drinking@coffee@male@idle_a",
		anim = "idle_c",
		AnimationOptions =
		{
			Prop = 'prop_plastic_cup_02',
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Donuts",
		dict = "mp_player_inteat@burger",
		anim = "mp_player_int_eat_burger",
		AnimationOptions =
		{
			Prop = 'prop_amb_donut',
			PropBone = 18905,
			PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
			EmoteMoving = true,
		},
	},

	{
		label = "Barre de chocolat",
		dict = "mp_player_inteat@burger",
		anim = "mp_player_int_eat_burger",
		AnimationOptions =
		{
			Prop = 'prop_choc_ego',
			PropBone = 60309,
			PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
			EmoteMoving = true,
		},
	},

	{
		label = "Guitar",
		dict = "amb@world_human_musician@guitar@male@idle_a",
		anim = "idle_b",
		AnimationOptions =
		{
			Prop = 'prop_acc_guitar_01',
			PropBone = 24818,
			PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Guitar 2",
		dict = "switch@trevor@guitar_beatdown",
		anim = "001370_02_trvs_8_guitar_beatdown_idle_busker",
		AnimationOptions =
		{
			Prop = 'prop_acc_guitar_01',
			PropBone = 24818,
			PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Guitar electrique",
		dict = "amb@world_human_musician@guitar@male@idle_a",
		anim = "idle_b",
		AnimationOptions =
		{
			Prop = 'prop_el_guitar_01',
			PropBone = 24818,
			PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Guitar electrique 2",
		dict = "amb@world_human_musician@guitar@male@idle_a",
		anim = "idle_b",
		AnimationOptions =
		{
			Prop = 'prop_el_guitar_03',
			PropBone = 24818,
			PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Livre",
		dict = "cellphone@",
		anim = "cellphone_text_read_base",
		AnimationOptions =
		{
			Prop = 'prop_novel_01',
			PropBone = 6286,
			PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Sac sur l'epaule",
		dict = "move_p_m_zero_rucksack",
		anim = "idle",
		AnimationOptions =
		{
			Prop = 'p_michael_backpack_s',
			PropBone = 24818,
			PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Bloc note",
		dict = "missfam4",
		anim = "base",
		AnimationOptions =
		{
			Prop = 'p_amb_clipboard_01',
			PropBone = 36029,
			PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Carte",
		dict = "amb@world_human_tourist_map@male@base",
		anim = "base",
		AnimationOptions =
		{
			Prop = 'prop_tourist_map_01',
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Tablette - 1",
		dict = "amb@world_human_tourist_map@male@base",
		anim = "base",
		AnimationOptions =
		{
			Prop = "prop_cs_tablet",
			PropBone = 28422,
			PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},
	
	{
		label = "Tablette - 2",
		dict = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a",
		anim = "idle_a",
		AnimationOptions =
		{
			Prop = "prop_cs_tablet",
			PropBone = 28422,
			PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Faux appel",
		dict = "cellphone@",
		anim = "cellphone_call_listen_base",
		AnimationOptions =
		{
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Eponge - 1",
		dict = "timetable@floyd@clean_kitchen@base",
		anim = "base",
		AnimationOptions =
		{
			Prop = "prop_sponge_01",
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Eponge - 2",
		dict = "amb@world_human_maid_clean@",
		anim = "base",
		AnimationOptions =
		{
			Prop = "prop_sponge_01",
			PropBone = 28422,
			PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Rose",
		dict = "anim@heists@humane_labs@finale@keycards",
		anim = "ped_a_enter_loop",
		AnimationOptions =
		{
			Prop = "prop_single_rose",
			PropBone = 18905,
			PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
			EmoteLoop = true,
			EmoteMoving = true,
		},
	},

	{
		label = "Ours en peluche",
		dict = "impexp_int-0",
		anim = "mp_m_waremech_01_dual-0",
		AnimationOptions =
		{
			Prop = 'v_ilev_mr_rasberryclean',
			PropBone = 24817,
			PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},

	{
		label = "Bouquet",
		dict = "impexp_int-0",
		anim = "mp_m_waremech_01_dual-0",
		AnimationOptions =
		{
			Prop = 'prop_snow_flower_02',
			PropBone = 24817,
			PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
			EmoteMoving = true,
			EmoteLoop = true
		},
	},
}

------------------------------------------------------------------------------------------------------

function RemoveAllObjectsFromPed()
	RequestControlAndDelete(currentPropUsed)
	currentPropUsed = nil

	for k,v in pairs(usedProps) do
		RequestControlAndDelete(v)
	end

	usedProps = {}
end

function RequestControlAndDelete(entity)    
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

local function SimpleNotify(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(0,1)
end

function LoadPropDict(model)
	while not HasModelLoaded(GetHashKey(model)) do
		RequestModel(GetHashKey(model))
		Wait(10)
	end
end

function AddPropToPlayer(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
	local Player = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(Player))

	if not HasModelLoaded(prop1) then
		LoadPropDict(prop1)
	end

	currentPropUsed = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, false)
	table.insert(usedProps, currentPropUsed)

	AttachEntityToEntity(currentPropUsed, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
	SetModelAsNoLongerNeeded(prop1)
end

local function PlayPropsAnimation(emoteIndex)
	local MovementType = 0
	local currentDuration = -1

	currentEmote = allPropsAnimations[emoteIndex]

	if currentEmote.AnimationOptions then
		if currentEmote.AnimationOptions.EmoteLoop then
			MovementType = 1
			if currentEmote.AnimationOptions.EmoteMoving then
				MovementType = 51
			end
		elseif currentEmote.AnimationOptions.EmoteMoving then
			MovementType = 51
		elseif currentEmote.AnimationOptions.EmoteMoving == false then
			MovementType = 0
		elseif currentEmote.AnimationOptions.EmoteStuck then
			MovementType = 50
		end
	else
		MovementType = 0
	end

	if currentEmote.AnimationOptions.EmoteDuration then
		currentDuration = currentEmote.AnimationOptions.EmoteDuration
	end

	if currentEmote.dict ~= "" then
		RequestAnimDict(currentEmote.dict)

		while not HasAnimDictLoaded(currentEmote.dict) do
			Citizen.Wait(100)
		end

		TaskPlayAnim(GetPlayerPed(-1), currentEmote.dict, currentEmote.anim, 2.0, 2.0, currentDuration, MovementType, 0, false, false, false)
		RemoveAnimDict(currentEmote.dict)
	end

	PropName = currentEmote.AnimationOptions.Prop
	PropBone = currentEmote.AnimationOptions.PropBone

	PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(currentEmote.AnimationOptions.PropPlacement)
	AddPropToPlayer(PropName, PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6)

	if currentEmote.AnimationOptions.PropBone2 ~= nil then
		PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(currentEmote.AnimationOptions.PropPlacement2)
		AddPropToPlayer(PropName, currentEmote.AnimationOptions.PropBone2, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6)
	end
end

RegisterNetEvent("propsanimation:startAnim")
AddEventHandler("propsanimation:startAnim", function(emoteIndex)
	if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
		SimpleNotify("~r~Veuillez descendre du vehicule !")
	else
		RemoveAllObjectsFromPed()
		PlayPropsAnimation(emoteIndex)
	end
end)