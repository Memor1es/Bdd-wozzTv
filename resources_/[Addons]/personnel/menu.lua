---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
-------------------------------- Menu personnel par Bajà ------------------------------------------------------
--------------------------------- Développé pour Avanya -------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local allAnimations =

{

	{

		categoryName = "Fumer / Boire",

		categoryDesc = "Animation avec cigarette, joint, biere, cafe...",

		animations =

		{

			{label ="Fumer une cigarette",		scenario = "WORLD_HUMAN_AA_SMOKE",		dict="",				anim="",		 duration = -1,		flag = 8},

			{label ="Fumer une cigarette 2",	scenario = "WORLD_HUMAN_SMOKING",		dict="",				anim="",		 duration = -1,		flag = 8},

			{label ="Fumer un joint",			scenario = "WORLD_HUMAN_SMOKING_POT",	dict="",				anim="",		 duration = -1,		flag = 8},

			{label ="Boire une bierre",			scenario = "WORLD_HUMAN_PARTYING",		dict="",				anim="",		 duration = -1,		flag = 8},

			{label ="Boire un cafe",			scenario = "WORLD_HUMAN_AA_COFFEE",		dict="",				anim="",		 duration = -1,		flag = 8},

			

		}

	},

	{

		categoryName = "Metier",

		categoryDesc = "Prendre des notes, passer le balais...",

		animations =

		{

			{label ="Prendre des notes",		scenario = "WORLD_HUMAN_CLIPBOARD",				dict="",							anim="",				duration = -1,		flag = 8},

			{label ="Prendre des notes 2",		scenario = "CODE_HUMAN_MEDIC_TIME_OF_DEATH",	dict="",							anim="",				duration = -1,		flag = 8},

			{label ="Passer le balais",			scenario = "WORLD_HUMAN_JANITOR",				dict="",							anim="",				duration = -1,		flag = 8},

			{label ="Circulation",				scenario = "WORLD_HUMAN_CAR_PARK_ATTENDANT",	dict="",							anim="",				duration = -1,		flag = 8},

			{label ="Passer le souffleur",		scenario = "WORLD_HUMAN_GARDENER_LEAF_BLOWER",	dict="",							anim="",				duration = -1,		flag = 8},

			{label ="Faire une soudure",		scenario = "WORLD_HUMAN_WELDING",				dict="",							anim="",				duration = -1,		flag = 8},

			{label ="Jumelles",					scenario = "WORLD_HUMAN_BINOCULARS",			dict="",							anim="",				duration = -1,		flag = 8},

			{label ="Inspecter un corps",		scenario = "CODE_HUMAN_MEDIC_KNEEL",			dict="",							anim="",				duration = -1,		flag = 8},

			{label ="Massage Cardiaque",		scenario = "",									dict="mini@cpr@char_a@cpr_str",		anim="cpr_pumpchest",	duration = -1,		flag = 1},

		}

	},

	{

		categoryName = "Saluer",

		categoryDesc = "Faire un signe, serrer la main, check...",

		animations =

		{

			{label ="Check de gang",			scenario = "",	dict="anim@mp_player_intcelebrationpaired@m_m_bro_hug",		anim="bro_hug_right",			duration = 1500,	flag = 8},

			{label ="Bro Check",				scenario = "",	dict="mp_ped_interaction",									anim="hugs_guy_a",				duration = 3000,	flag = 49},

			{label ="Check",					scenario = "",	dict="anim@arena@celeb@flat@paired@no_props@",				anim="high_five_b_player_b",	duration = 10000,	flag = 8},

			{label ="Faire du stop",			scenario = "",	dict="random@hitch_lift",									anim="idle_f",					duration = 5000,	flag = 8},

			{label ="Courbette",				scenario = "",	dict="anim@arena@celeb@podium@no_prop@",					anim="regal_a_1st",				duration = 20000,	flag = 8},

			{label ="Come at me",				scenario = "",	dict="misscommon@response",									anim="bring_it_on",				duration = 5000,	flag = 8},

			{label ="Signe de la main",			scenario = "",	dict="friends@frj@ig_1",									anim="wave_e",					duration = 1500,	flag = 49},

			{label ="Serrer la main",			scenario = "",	dict="mp_common",											anim="givetake1_a",				duration = 1500,	flag = 49},

			{label ="High Five",				scenario = "",	dict="mp_ped_interaction",									anim="highfive_guy_a",			duration = 2000,	flag = 49},

			{label ="Faire un bisous",			scenario = "",	dict="mp_ped_interaction",									anim="kisses_guy_a",			duration = 4000,	flag = 8},

		}

	},

	{

		categoryName = "Expression/Geste",

		categoryDesc = "Faire des doigts, face palm, dire oui...",

		animations =

		{

			{label ="Mains sur la tete",		scenario = "",	dict="random@arrests@busted",											anim="idle_a",							duration = -1,		flag = 49},

			{label ="Faire un doigt",			scenario = "",	dict="anim@mp_player_intselfiethe_bird",								anim="idle_a",							duration = -1,		flag = 49},

			{label ="Faire des doigts",			scenario = "",	dict="anim@mp_player_intupperfinger",									anim="idle_a",							duration = -1,		flag = 49},

			{label ="Faire des doigts 2",		scenario = "",	dict="anim@mp_player_intupperfinger",									anim="idle_a_fp",						duration = -1,		flag = 49},

			{label ="Faire un bras",			scenario = "",	dict="misscommon@response",												anim="screw_you",						duration = 2000,	flag = 49},

			{label ="Radio",					scenario = "",	dict="random@arrests",													anim="generic_radio_chatter",			duration = -1,		flag = 49},

			{label ="Sur le cote !",			scenario = "",	dict="misscarsteal3pullover",											anim="pull_over_right",					duration = 1000,	flag = 49},

			{label ="Pensif",					scenario = "",	dict="amb@code_human_police_investigate@idle_a",						anim="idle_a",							duration = 7000,	flag = 8},

			{label ="Dire oui",					scenario = "",	dict="gestures@m@standing@casual",										anim="gesture_pleased",					duration = 700,		flag = 49},

			{label ="Dire non",					scenario = "",	dict="gestures@m@standing@casual",										anim="gesture_head_no",					duration = 700,		flag = 49},

			{label ="Se gratter le cul",		scenario = "",	dict="mp_player_int_upperarse_pick",									anim="mp_player_int_arse_pick",			duration = -1,		flag = 49},

			{label ="Se gratter les couilles",	scenario = "",	dict="mp_player_int_uppergrab_crotch",									anim="mp_player_int_grab_crotch",		duration = -1,		flag = 49},

			{label ="Signe de paix",			scenario = "",	dict="mp_player_int_upperpeace_sign",									anim="mp_player_int_peace_sign",		duration = -1,		flag = 49},

			{label ="Face palm",				scenario = "",	dict="anim@mp_player_intupperface_palm",								anim="idle_a",							duration = -1,		flag = 49},

			{label ="Doigt dans le nez",		scenario = "",	dict="anim@mp_player_intcelebrationmale@nose_pick",						anim="nose_pick",						duration = 2300,	flag = 49},

			{label ="Craquer ses poings",		scenario = "",	dict="anim@mp_player_intcelebrationmale@knuckle_crunch",				anim="knuckle_crunch",					duration = 2300,	flag = 49},

			{label ="Se branl**",				scenario = "",	dict="mp_player_int_upperwank",											anim="mp_player_int_wank_01",			duration = -1,		flag = 49},

			{label ="Rock",						scenario = "",	dict="mp_player_int_upperrock",											anim="mp_player_int_rock",				duration = -1,		flag = 49},

			{label ="V",						scenario = "",	dict="mp_player_int_upperv_sign",										anim="mp_player_int_v_sign",			duration = -1,		flag = 49},

			{label ="Namaste",					scenario = "",	dict="timetable@amanda@ig_4",											anim="ig_4_base",						duration = -1,		flag = 49},

			{label ="Signe OK",					scenario = "",	dict="anim@mp_player_intselfiedock",									anim="idle_a",						duration = -1,		flag = 49},

			{label ="Salut militaire",			scenario = "",	dict="mp_player_int_uppersalute",										anim="mp_player_int_salute",			duration = -1,		flag = 49},

			{label ="Signe de gang 1",			scenario = "",	dict="mp_player_int_uppergang_sign_a",									anim="mp_player_int_gang_sign_a",		duration = -1,		flag = 49},

			{label ="Signe de gang 2",			scenario = "",	dict="mp_player_int_uppergang_sign_b",									anim="mp_player_int_gang_sign_b",		duration = -1,		flag = 49},

			{label ="Signe de gang 3",			scenario = "",	dict="amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base",		anim="idle_a",							duration = -1,		flag = 49},

			{label ="Signe de gang 4",			scenario = "",	dict="amb@code_human_in_car_mp_actions@gang_sign_b@std@ps@base",		anim="idle_a",							duration = -1,		flag = 49},

			{label ="Signe de gang 5",			scenario = "",	dict="amb@code_human_in_car_mp_actions@gang_sign_a@std@rps@base",		anim="idle_a",							duration = -1,		flag = 49},

			{label ="Signe de gang 6",			scenario = "",	dict="amb@code_human_in_car_mp_actions@gang_sign_b@low@ps@base",		anim="idle_a",							duration = -1,		flag = 49},

			{label ="Signe de gang 7",			scenario = "",	dict="amb@code_human_in_car_mp_actions@gang_sign_b@low@ds@base",		anim="idle_a",							duration = -1,		flag = 49},

			{label ="Signe de gang 8",			scenario = "",	dict="amb@code_human_in_car_mp_actions@gang_sign_a@low@ds@base",		anim="idle_a",							duration = -1,		flag = 49},

		}

	},

	{

		categoryName = "Fete",

		categoryDesc = "Danser, applaudir...",

		animations =

		{

			{label ="Transformation",				scenario = "",									dict="anim@mp_fm_event@intro",								anim="beast_transform",					duration = 2500,	flag = 49},

			{label ="Applaudir",					scenario = "WORLD_HUMAN_CHEERING",				dict="",													anim="",								duration = -1,		flag = 1},

			{label ="Applaudir 2",					scenario = "",									dict="anim@arena@celeb@flat@solo@no_props@",				anim="angry_clap_a_player_a",			duration = -1,		flag = 1},

			{label ="Danse - Gang",					scenario = "",									dict="missfbi3_sniping",									anim="dance_m_default",					duration = -1,		flag = 1},

			{label ="Danse - Put your hands up",	scenario = "",									dict="anim@mp_player_intcelebrationfemale@banging_tunes",	anim="banging_tunes",					duration = -1,		flag = 1},

			{label ="Danse - Put your hands up 2",	scenario = "",									dict="anim@mp_player_intcelebrationfemale@raise_the_roof",	anim="raise_the_roof",					duration = -1,		flag = 1},

			{label ="Danse - De retard",			scenario = "",									dict="anim@mp_player_intcelebrationfemale@cats_cradle",		anim="cats_cradle",						duration = -1,		flag = 1},

			{label ="Danse - Vague",				scenario = "",									dict="anim@mp_player_intcelebrationfemale@find_the_fish",	anim="find_the_fish",					duration = -1,		flag = 1},

			{label ="Danse - Main sur le coeur",	scenario = "",									dict="anim@mp_player_intcelebrationfemale@heart_pumping",	anim="heart_pumping",					duration = -1,		flag = 1},

			{label ="Danse - Rouleau",				scenario = "",									dict="anim@mp_player_intcelebrationfemale@salsa_roll",		anim="salsa_roll",						duration = -1,		flag = 1},

			{label ="Danse - Pas de danse",			scenario = "",									dict="anim@mp_player_intcelebrationfemale@uncle_disco",		anim="uncle_disco",						duration = -1,		flag = 1},

			{label ="Danse - Ish Ish",				scenario = "",									dict="anim@amb@nightclub@dancers@dixon_entourage@",			anim="mi_dance_facedj_15_v1_male^4",	duration = -1,		flag = 1},

			{label ="Danse - Check",				scenario = "",									dict="anim@mp_player_intcelebrationfemale@oh_snap",			anim="oh_snap",							duration = -1,		flag = 1},

			{label ="Danse - Des epaules",			scenario = "",									dict="anim@amb@nightclub@dancers@podium_dancers@",			anim="hi_dance_facedj_17_v2_male^5",	duration = -1,		flag = 1},

			{label ="Danse - Guetteur",				scenario = "",									dict="anim@amb@nightclub@dancers@black_madonna_entourage@",	anim="li_dance_facedj_15_v2_male^2",	duration = -1,		flag = 1},

			{label ="Danse - Timide",				scenario = "",									dict="anim@amb@nightclub@dancers@solomun_entourage@",		anim="li_dance_prop_15_v1_male^5",		duration = -1,		flag = 1},

			{label ="Danse - femme 1",				scenario = "",									dict="mini@strip_club@private_dance@part1",					anim="priv_dance_p1",					duration = -1,		flag = 1},

			{label ="Danse - femme 2",				scenario = "",									dict="anim@amb@nightclub@dancers@podium_dancers@",			anim="hi_dance_facedj_17_v2_female^2",	duration = -1,		flag = 1},

			{label ="Danse - femme 3",				scenario = "",									dict="anim@amb@nightclub@dancers@solomun_entourage@",		anim="mi_dance_facedj_17_v1_female^1",	duration = -1,		flag = 1},

			{label ="Danse de clown 1",				scenario = "",									dict="rcm_barry2",											anim="clown_idle_0",					duration = -1,		flag = 1},

			{label ="Danse de clown 2",				scenario = "",									dict="rcm_barry2",											anim="clown_idle_1",					duration = -1,		flag = 1},

			{label ="Danse de clown 3",				scenario = "",									dict="rcm_barry2",											anim="clown_idle_2",					duration = -1,		flag = 1},

			{label ="Danse de clown 4",				scenario = "",									dict="rcm_barry2",											anim="clown_idle_3",					duration = -1,		flag = 1},

			{label ="Danse de clown 5",				scenario = "",									dict="rcm_barry2",											anim="clown_idle_4",					duration = -1,		flag = 1},

			{label ="Danse de clown 6",				scenario = "",									dict="rcm_barry2",											anim="clown_idle_5",					duration = -1,		flag = 1},

			{label ="Danse de clown 7",				scenario = "",									dict="rcm_barry2",											anim="clown_idle_6",					duration = -1,		flag = 1},

			{label ="Charleston",					scenario = "",									dict="special_ped@mountain_dancer@monologue_3@monologue_3a",anim="mnt_dnc_buttwag",					duration = -1,		flag = 1},

			{label ="Danse d'idiot 1",				scenario = "",									dict="timetable@tracy@ig_5@idle_a",							anim="idle_a",							duration = -1,		flag = 1},

			{label ="Danse d'idiot 2",				scenario = "",									dict="timetable@tracy@ig_8@idle_b",							anim="idle_d",							duration = -1,		flag = 1},

			{label ="Danse de nain",				scenario = "",									dict="move_clown@p_m_two_idles@",							anim="fidget_short_dance",				duration = -1,		flag = 1},

			{label ="Faire la poule",				scenario = "",									dict="random@peyote@chicken",								anim="wakeup",							duration = -1,		flag = 1},

			{label ="Danse 1",						scenario = "",									dict="anim@amb@nightclub@mini@dance@dance_solo@male@var_a@",anim="high_center",						duration = -1,		flag = 1},

			{label ="Danse 2",						scenario = "",									dict="rcmnigel1bnmt_1b",									anim="dance_loop_tyler",				duration = -1,		flag = 1},

			{label ="Danse 3",						scenario = "",									dict="anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",anim="high_center_down",				duration = -1,		flag = 1},

		}

	},

	{

		categoryName = "Prendre une pose",

		categoryDesc = "Garde, bras croises, contre un mur, s'allonger...",

		animations =

		{

			{label ="Bras croises",					scenario = "",									dict="missfbi_s4mop",									anim="guard_idle_a",						duration = -1,		flag = 49},

			{label ="Bras croises 2",				scenario = "",									dict="anim@heists@heist_corona@single_team",			anim="single_team_loop_boss",				duration = -1,		flag = 49},

			{label ="Super Heros",					scenario = "",									dict="rcmbarry",										anim="base",								duration = -1,		flag = 49},

			{label ="Faire l'avion",				scenario = "",									dict="missfbi1",										anim="ledge_loop",							duration = -1,		flag = 49},

			{label ="Dormir debout",				scenario = "",									dict="mp_sleep",										anim="sleep_loop",							duration = -1,		flag = 49},

			{label ="Pose de garde",				scenario = "",									dict="rcmnigel1a",										anim="base",								duration = -1,		flag = 49},

			{label ="Pose de garde 2",				scenario = "",									dict="missbigscore2aig_3",								anim="wait_for_van_c",						duration = -1,		flag = 49},

			{label ="Pose de policier",				scenario = "WORLD_HUMAN_COP_IDLES",				dict="",												anim="",									duration = -1,		flag = 8},

			{label ="Pose de prostituer",			scenario = "WORLD_HUMAN_PROSTITUTE_LOW_CLASS",	dict="",												anim="",									duration = -1,		flag = 8},

			{label ="Poser contre un mur",			scenario = "WORLD_HUMAN_LEANING",				dict="",												anim="",									duration = -1,		flag = 8},

			{label ="Poser au comptoir",			scenario = "PROP_HUMAN_BUM_SHOPPING_CART",		dict="",												anim="",									duration = -1,		flag = 8},

			{label ="Allonger sur le ventre",		scenario = "WORLD_HUMAN_SUNBATHE",				dict="",												anim="",									duration = -1,		flag = 8},

			{label ="Allonger sur le cote",			scenario = "",									dict="switch@trevor@scares_tramp",						anim="trev_scares_tramp_idle_tramp",		duration = -1,		flag = 2},

			{label ="Allonger sur le dos",			scenario = "",									dict="switch@trevor@annoys_sunbathers",					anim="trev_annoys_sunbathers_loop_girl",	duration = -1,		flag = 2},

			{label ="Allonger sur le dos 2",		scenario = "",									dict="switch@trevor@annoys_sunbathers",					anim="trev_annoys_sunbathers_loop_guy",		duration = -1,		flag = 2},

			{label ="Pose de SDF",					scenario = "WORLD_HUMAN_BUM_SLUMPED",			dict="",												anim="",									duration = -1,		flag = 2},

			{label ="Assis au sol",					scenario = "",									dict="anim@heists@fleeca_bank@ig_7_jetski_owner",		anim="owner_idle",							duration = -1,		flag = 2},

			{label ="Assis blesse",					scenario = "WORLD_HUMAN_STUPOR",				dict="",												anim="",									duration = -1,		flag = 2},

			{label ="Assis",						scenario = "",									dict="timetable@ron@ig_3_couch",						anim="base",								duration = -1,		flag = 2},

			{label ="Assis affale",					scenario = "",									dict="timetable@maid@couch@",							anim="base",								duration = -1,		flag = 2},

			{label ="Assis Femme",					scenario = "",									dict="timetable@reunited@ig_10",						anim="base_amanda",							duration = -1,		flag = 2},

		}

	},

	{

		categoryName = "Sport",

		categoryDesc = "Faire des pompes, salto, abdos...",

		animations =

		{

			{label ="Faire un salto",				scenario = "",									dict="anim@arena@celeb@flat@solo@no_props@",				anim="flip_a_player_a",		duration = 1900,	flag = 8},

			{label ="Faire un saut",				scenario = "",									dict="anim@arena@celeb@flat@solo@no_props@",				anim="jump_b_player_a",		duration = 1400,	flag = 8},

			{label ="Capoera",						scenario = "",									dict="anim@arena@celeb@flat@solo@no_props@",				anim="cap_a_player_a",		duration = 2500,	flag = 8},

			{label ="Glisser",						scenario = "",									dict="anim@arena@celeb@flat@solo@no_props@",				anim="slide_a_player_a",	duration = 800,		flag = 8},

			{label ="Jumping Jacks",				scenario = "",									dict="timetable@reunited@ig_2",								anim="jimmy_getknocked",	duration = -1,		flag = 1},

			{label ="Montrer ses muscles",			scenario = "WORLD_HUMAN_MUSCLE_FLEX",			dict="",													anim="",					duration = -1,		flag = 1},

			{label ="Faire des pompes",				scenario = "WORLD_HUMAN_PUSH_UPS",				dict="",													anim="",					duration = -1,		flag = 1},

			{label ="Faire des pompes 2",			scenario = "",									dict="amb@world_human_push_ups@male@idle_a",				anim="idle_d",				duration = -1,		flag = 1},

			{label ="Faire des abdos",				scenario = "WORLD_HUMAN_SIT_UPS",				dict="",													anim="",					duration = -1,		flag = 1},

			{label ="Barre Biceps",					scenario = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",	dict="",													anim="",					duration = -1,		flag = 1},

			{label ="Faire du jogging",				scenario = "WORLD_HUMAN_JOG_STANDING",			dict="",													anim="",					duration = -1,		flag = 1},

			{label ="Faire du yoga",				scenario = "WORLD_HUMAN_YOGA",					dict="",													anim="",					duration = -1,		flag = 1},

			{label ="Faire du yoga 2",				scenario = "",									dict="rcmcollect_paperleadinout@",							anim="meditiate_idle",		duration = -1,		flag = 1},

		}

	},

	{

		categoryName = "+18",

		categoryDesc = "On va pas vous faire un dessin...",

		animations =

		{

			{label ="Bais**",						scenario = "",	dict="timetable@trevor@skull_loving_bear",					anim="skull_loving_bear",				duration = -1,	flag = 1},

			{label ="Se branl**",					scenario = "",	dict="switch@trevor@jerking_off",							anim="trev_jerking_off_loop",			duration = -1,	flag = 1},

			{label ="Strip tease",					scenario = "",	dict="mini@strip_club@lap_dance@ld_girl_a_song_a_p1",		anim="ld_girl_a_song_a_p1_f",			duration = -1,	flag = 1},

			{label ="Strip tease 2",				scenario = "",	dict="mini@strip_club@private_dance@part2",					anim="priv_dance_p2",					duration = -1,	flag = 1},

			{label ="Strip tease 3",				scenario = "",	dict="mp_safehouse",										anim="lap_dance_girl",					duration = -1,	flag = 1},

			{label ="Twerk",						scenario = "",	dict="switch@trevor@mocks_lapdance",						anim="001443_01_trvs_28_idle_stripper",	duration = -1,	flag = 1},

			{label ="Twerk au sol",					scenario = "",	dict="mini@strip_club@private_dance@part3",					anim="priv_dance_p3",					duration = -1,	flag = 1},

			{label ="Montrer sa poitrine",			scenario = "",	dict="mini@strip_club@backroom@",							anim="stripper_b_backroom_idle_b",		duration = -1,	flag = 1},

			{label ="(En voiture) Suc**",			scenario = "",	dict="oddjobs@towing",										anim="f_blow_job_loop",					duration = -1,	flag = 1},

			{label ="(En voiture) Bais**",			scenario = "",	dict="mini@prostitutes@sexlow_veh",							anim="low_car_sex_loop_player",			duration = -1,	flag = 1},

			{label ="(En voiture) Se faire suc**",	scenario = "",	dict="oddjobs@towing",										anim="m_blow_job_loop",					duration = -1,	flag = 1},

			{label ="(En voiture) Se faire bais**",	scenario = "",	dict="mini@prostitutes@sexlow_veh",							anim="low_car_sex_loop_female",			duration = -1,	flag = 1},

		}

	},
	
	{

		categoryName = "Tricks",

		categoryDesc = "Tricks a realiser en moto...",

		animations =

		{

			{label ="Moto - Jambe droite",			scenario = "",	dict="rcmextreme2atv",	anim="idle_b",	duration = -1,	flag = 32},

			{label ="Moto - Jambe gauche",			scenario = "",	dict="rcmextreme2atv",	anim="idle_c",	duration = -1,	flag = 32},

			{label ="Moto - Droite puis gauche",	scenario = "",	dict="rcmextreme2atv",	anim="idle_d",	duration = -1,	flag = 32},

			{label ="Moto - Debout",				scenario = "",	dict="rcmextreme2atv",	anim="idle_e",	duration = -1,	flag = 32},

		}

	},
    
}

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("", "Menu personnel")
_menuPool:Add(mainMenu)

function AddMenuId(menu)
	local itemTop = NativeUI.CreateItem("🏷 ID : " .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))), "Votre ID pour les reports etc..")

	mainMenu:AddItem(itemTop)
end

function AddMenuPersonnel(menu)
    local menuperso = _menuPool:AddSubMenu(menu, "📋 Identite", "Permet de montrer/regarder votre carte d'identite")
	local idCardLook = NativeUI.CreateItem("Regarder sa carte d'identite", "")
	menuperso:AddItem(idCardLook)
    idCardLook.Activated = function(sender, item, index)
        TriggerEvent('gcl:openMeIdentity')
        notify("Vous regardez votre : ~r~carte d'identite~w~.")
    end

    local idCardShow = NativeUI.CreateItem("Montrer sa carte d'identite", "")
    menuperso:AddItem(idCardShow)
    idCardShow.Activated = function(sender, item, index)
        TriggerEvent('gcl:showItentity')
        notify("Vous montrez votre : ~r~carte d'identite~w~.")
	end

end

function AddMenuMoney(menu)
    local menumoney = _menuPool:AddSubMenu(menu, "💰 Argent", "Permet de donner de l'argent")

    local giveMoney = NativeUI.CreateItem("Donner de l'argent", "")
    menumoney:AddItem(giveMoney)
    giveMoney.Activated = function(sender, item, index)
        mainMenu:Visible(false)
        menumoney:Visible(false)
        TriggerEvent("bank:givecash")
	end
	
	local giveDirtyMoney = NativeUI.CreateItem("Donner de l'argent sale", "")
	menumoney:AddItem(giveDirtyMoney)
	giveDirtyMoney.Activated = function(sender, item, index)
		mainMenu:Visible(false)
		menumoney:Visible(false)
		TriggerEvent("bank:givedirty")
	end

end

function AddMenuArmes(menu)
    local menuarmes = _menuPool:AddSubMenu(menu, "⚔️ Donner votre arme", "Permet de donner votre arme")

	local giveArme = NativeUI.CreateItem("Donner son arme", "")
    menuarmes:AddItem(giveArme)
    giveArme.Activated = function(sender, item, index)
        mainMenu:Visible(false)
        TriggerEvent("avanyaguns:tryGiveWeapon")
    end
end

function AddMenuVapot(menu)
	local menuvapot = _menuPool:AddSubMenu(menu, "🚬 Vapoter", "Permet de vapoter avec une cigarette éléctronique..")

	local vapotOn = NativeUI.CreateItem("Vapoter", "")
	menuvapot:AddItem(vapotOn)
	vapotOn.Activated = function(sender, item, index)
		mainMenu:Visible(false)
		TriggerEvent("Vape:StartVaping")
	end

	local vapotOff = NativeUI.CreateItem("Arrêter de vapoter", "")
	menuvapot:AddItem(vapotOff)
	vapotOff.Activated = function(sender, item, index)
		mainMenu:Visible(false)
		TriggerEvent("Vape:StopVaping")
	end
end

function AddMenuAnim(menu)
    local menuanim = _menuPool:AddSubMenu(menu, "💃 Animations", "Réaliser des danses, salutation, prendre des poses...")

    for index, currentCategory in pairs(allAnimations) do
        local menuanimcurrent = _menuPool:AddSubMenu(menuanim, currentCategory.categoryName, currentCategory.categoryDesc)

        for i, currentAnimation in pairs(currentCategory.animations) do
            local newLabel = NativeUI.CreateItem(currentAnimation.label, "")

            menuanimcurrent:AddItem(newLabel)
            newLabel.Activated = function(sender, item, index)
                if string.len(currentAnimation.dict) > 0 then
                    RequestAnimDict(currentAnimation.dict)
                    while not HasAnimDictLoaded(currentAnimation.dict) do
                        Citizen.Wait(0)
                    end

                    TaskPlayAnim(GetPlayerPed(-1), currentAnimation.dict, currentAnimation.anim, 4.0, 4.0, currentAnimation.duration, currentAnimation.flag, 0, 0, 0, 0)
                    RemoveAnimDict(currentAnimation.dict)

                elseif string.len(currentAnimation.scenario) > 0 then
                    TaskStartScenarioInPlace(GetPlayerPed(-1), currentAnimation.scenario, -1, true)
                end
            end
        end
    end

	local menudem = _menuPool:AddSubMenu(menuanim, "Démarches", "Choisir une démarche...")

	local marchesonne = NativeUI.CreateItem("Sonné", "")
	menudem:AddItem(marchesonne)
	marchesonne.Activated = function(sender, item, index)
		SetMovementAnim("MOVE_M@BAIL_BOND_NOT_TAZERED")
	end

	local marcheblesse = NativeUI.CreateItem("Blessé", "")
	menudem:AddItem(marcheblesse)
	marcheblesse.Activated = function(sender, item, index)
		SetMovementAnim("move_injured_generic")
	end

	local marchelegbourre = NativeUI.CreateItem("Légerement bourré", "")
	menudem:AddItem(marchelegbourre)
	marchelegbourre.Activated = function(sender, item, index)
		SetMovementAnim("MOVE_M@DRUNK@SLIGHTLYDRUNK")
	end

	local marchebourre = NativeUI.CreateItem("Bourré", "")
	menudem:AddItem(marchebourre)
	marchebourre.Activated = function(sender, item, index)
		SetMovementAnim("move_m@drunk@moderatedrunk")
	end

	local marchecptbourre = NativeUI.CreateItem("Complètement bourré", "")
	menudem:AddItem(marchecptbourre)
	marchecptbourre.Activated = function(sender, item, index)
		SetMovementAnim("MOVE_M@DRUNK@VERYDRUNK")
	end

	local marchehbasique = NativeUI.CreateItem("Homme - basique", "")
	menudem:AddItem(marchehbasique)
	marchehbasique.Activated = function(sender, item, index)
		SetMovementAnim("move_m@JOG@")
	end

	local marchehbasique2 = NativeUI.CreateItem("Homme - basique 2", "")
	menudem:AddItem(marchehbasique2)
	marchehbasique2.Activated = function(sender, item, index)
		SetMovementAnim("MOVE_P_M_ONE")
	end

	local marchehbasique3 = NativeUI.CreateItem("Homme - basique 3", "")
	menudem:AddItem(marchehbasique3)
	marchehbasique3.Activated = function(sender, item, index)
		SetMovementAnim("MOVE_P_M_ONE_BRIEFCASE")
	end

	local marchebg = NativeUI.CreateItem("Beau gosse", "")
	menudem:AddItem(marchebg)
	marchebg.Activated = function(sender, item, index)
		SetMovementAnim("move_m@bag")
	end

	local marchenrv = NativeUI.CreateItem("Prêt à se tape", "")
	menudem:AddItem(marchenrv)
	marchenrv.Activated = function(sender, item, index)
		SetMovementAnim("clipset@move@trash_fast_turn")
	end

	local marchecul = NativeUI.CreateItem("Bâton dans le cul", "")
	menudem:AddItem(marchecul)
	marchecul.Activated = function(sender, item, index)
		SetMovementAnim("ANIM_GROUP_MOVE_BALLISTIC")
	end

	local marchemuscle = NativeUI.CreateItem("Musclé", "")
	menudem:AddItem(marchemuscle)
	marchemuscle.Activated = function(sender, item, index)
		SetMovementAnim("move_characters@franklin@fire")
	end
	
	local marchemuscle2 = NativeUI.CreateItem("Musclé 2", "")
	menudem:AddItem(marchemuscle2)
	marchemuscle2.Activated = function(sender, item, index)
		SetMovementAnim("move_characters@michael@fire")
	end

	local marchelent = NativeUI.CreateItem("Lent", "")
	menudem:AddItem(marchelent)
	marchelent.Activated = function(sender, item, index)
		SetMovementAnim("move_characters@Jimmy@slow@")
	end

	local marchedeter = NativeUI.CreateItem("Déterminé", "")
	menudem:AddItem(marchedeter)
	marchedeter.Activated = function(sender, item, index)
		SetMovementAnim("move_m@brave")
	end

	local marchelentbg = NativeUI.CreateItem("Lent beau gosse", "")
	menudem:AddItem(marchelentbg)
	marchelentbg.Activated = function(sender, item, index)
		SetMovementAnim("move_m@casual@d")
	end

	local marchegrvenrv = NativeUI.CreateItem("Enervé", "")
	menudem:AddItem(marchegrvenrv)
	marchegrvenrv.Activated = function(sender, item, index)
		SetMovementAnim("move_p_m_zero_janitor")
	end

	local marchedur = NativeUI.CreateItem("Gros dure", "")
	menudem:AddItem(marchedur)
	marchedur.Activated = function(sender, item, index)
		SetMovementAnim("MOVE_M@TOUGH_GUY@")
	end

	local marchecanard = NativeUI.CreateItem("Boiteux", "")
	menudem:AddItem(marchecanard)
	marchecanard.Activated = function(sender, item, index)
		SetMovementAnim("move_lester_CaneUp")
	end
	
	local marchesprint = NativeUI.CreateItem("Sprinteuse", "")
	menudem:AddItem(marchesprint)
	marchesprint.Activated = function(sender, item, index)
		SetMovementAnim("FEMALE_FAST_RUNNER")
	end

	local marchefemmecul = NativeUI.CreateItem("Femme - roue du cul", "")
	menudem:AddItem(marchefemmecul)
	marchefemmecul.Activated = function(sender, item, index)
		SetMovementAnim("MOVE_M@FEMME@")
	end

	local marchefemmecul = NativeUI.CreateItem("Femme - michto", "")
	menudem:AddItem(marchefemmecul)
	marchefemmecul.Activated = function(sender, item, index)
		SetMovementAnim("MOVE_F@FEMME@")
	end

	local marchesexy = NativeUI.CreateItem("Sexy", "")
	menudem:AddItem(marchesexy)
	marchesexy.Activated = function(sender, item, index)
		SetMovementAnim("move_f@sexy@a")
	end

	local marchepeur = NativeUI.CreateItem("Froussard", "")
	menudem:AddItem(marchepeur)
	marchepeur.Activated = function(sender, item, index)
		SetMovementAnim("move_f@scared")
	end

	local marchegangf = NativeUI.CreateItem("Gangster femme", "")
	menudem:AddItem(marchegangf)
	marchegangf.Activated = function(sender, item, index)
		SetMovementAnim("MOVE_F@GANGSTER@NG")
	end

	local marchezik = NativeUI.CreateItem("Musique", "")
	menudem:AddItem(marchezik)
	marchezik.Activated = function(sender, item, index)
		SetMovementAnim("anim@move_m@grooving@")
	end

	local marcheriche = NativeUI.CreateItem("Fortuné", "")
	menudem:AddItem(marcheriche)
	marcheriche.Activated = function(sender, item, index)
		SetMovementAnim("move_m@money")
	end

	local marchegang = NativeUI.CreateItem("Gang", "")
	menudem:AddItem(marchegang)
	marchegang.Activated = function(sender, item, index)
		SetMovementAnim("move_m@gangster@generic")
	end

	----

	local stopAnim = NativeUI.CreateItem("Stopper l'animation", "")

	menuanim:AddItem(stopAnim)
	stopAnim.Activated = function(sender, item, index)
		ClearPedTasks(PlayerPedId())
		ClearPedSecondaryTask(GetPlayerPed(-1))
	end
end

function ToggleDoorData(door)

	local myPed = GetPlayerPed(-1)

	local vehicle = GetVehiclePedIsIn(myPed, false)



	if vehicle ~= 0 then

		local doorAngle = GetVehicleDoorAngleRatio(vehicle, door)

		if (doorAngle == 0) then -- Door is closed

			SetVehicleDoorOpen(vehicle, door, 0, 0)

		else

			SetVehicleDoorShut(vehicle, door, 0, 0)

		end

	else

		notify("Vous n'etes pas dans un vehicule")

	end

end

function FairePipi()

	local particleDictionary = "scr_amb_chop"

	local particleName = "ent_anim_dog_peeing"

	local animDictionary = 'missbigscore1switch_trevor_piss'

	local animName = 'piss_loop'



	RequestNamedPtfxAsset(particleDictionary)

	while not HasNamedPtfxAssetLoaded(particleDictionary) do

		Citizen.Wait(0)

	end



	RequestAnimDict(animDictionary)



	while not HasAnimDictLoaded(animDictionary) do

	Citizen.Wait(0)

	end



	SetPtfxAssetNextCall(particleDictionary)

	bone  = GetPedBoneIndex(GetPlayerPed(-1), 11816)

	TaskPlayAnim(GetPlayerPed(-1), animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)

	RemoveAnimDict(animDictionary)

	effect = StartParticleFxLoopedOnPedBone(particleName, GetPlayerPed(-1), 0.0, 0.0, -0.1, 90.0, 90.0, 20.0, bone, 2.0, false, false, false)

	RemoveNamedPtfxAsset(particleDictionary)

	Wait(5500)

	StopParticleFxLooped(effect, 0)

end

function AddMenuActions(menu)
	local menuact = _menuPool:AddSubMenu(menu, "🔍 Actions", "Une liste d'actions réalisable...")

	local facture = NativeUI.CreateItem("Faire une facture", "Faire une facture à un joueur")
	menuact:AddItem(facture)
	facture.Activated = function(sender, item, index)
		mainMenu:Visible(false)
		menuact:Visible(false)

		TriggerEvent('avanyafacture:rentrerFacture')
	end
	
	local pipi = NativeUI.CreateItem("Faire pipi", "Une envie pressante ?")
	menuact:AddItem(pipi)
	pipi.Activated = function(sender, item, index)
		mainMenu:Visible(false)
		menuact:Visible(false)

		FairePipi()
	end

	local jum = NativeUI.CreateItem("Activer les jumelles", "Zoomer avec la molette et quitter avec clique droit ou retour")
	menuact:AddItem(jum)
	jum.Activated = function(sender, item, index)
		mainMenu:Visible(false)
		menuact:Visible(false)

		TriggerEvent('binoculars:Activate')
	end

	local camera = NativeUI.CreateItem("Camera", "Porter une caméra")
	menuact:AddItem(camera)
	camera.Activated = function(sender, item, index)
		mainMenu:Visible(false)
		menuact:Visible(false)

		TriggerEvent('Cam:ToggleCam')
	end

	local micro = NativeUI.CreateItem("Micro", "Prendre un micro")
	menuact:AddItem(micro)
	micro.Activated = function(sender, item, index)
		mainMenu:Visible(false)
		menuact:Visible(false)

		TriggerEvent('Mic:ToggleMic')
	end

	local microp = NativeUI.CreateItem("Micro-perche", "Porter un micro-perche")
	menuact:AddItem(microp)
	microp.Activated = function(sender, item, index)
		mainMenu:Visible(false)
		menuact:Visible(false)

		TriggerEvent('Mic:ToggleBMic')
	end

	local genoux = NativeUI.CreateItem("Se mettre à genoux", "A genoux, mains sur la tête")
	menuact:AddItem(genoux)
	genoux.Activated = function(sender, item, index)
		local player = GetPlayerPed( -1 )

		if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 

			loadAnimDict( "random@arrests" )

			loadAnimDict( "random@arrests@busted" )

			if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 

				TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )

				Wait (3000)

				TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )

				RemoveAnimDict("random@arrests@busted")

				RemoveAnimDict("random@arrests")

			else

				TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )

				Wait (4000)

				TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )

				Wait (500)

				TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )

				Wait (1000)

				TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )

				RemoveAnimDict("random@arrests@busted")

				RemoveAnimDict("random@arrests")

			end     

		end
	end

	local porter = NativeUI.CreateItem("Porter une personne", "Hu Dada!")
	menuact:AddItem(porter)
	porter.Activated = function(sender, item, index)
		mainMenu:Visible(false)
		menuact:Visible(false)

		TriggerEvent('piggyback:toggle')
	end

	local fouille = NativeUI.CreateItem("Fouiller une personne", "Permet de fouiller les poches..")
	menuact:AddItem(fouille)
	fouille.Activated = function(sender, item, index)
		mainMenu:Visible(false)
		menuact:Visible(false)
		TriggerEvent('avanyafouille:checkInventoryC')
	end

end

function AddMenuVoiture(menu)
	local menuvroom = _menuPool:AddSubMenu(menu, "🔧 Mon véhicule", "Contrôler votre véhicule")

	local capot = NativeUI.CreateItem("Capot", "Permet d'ouvrir/fermer les portes du véhicule")
	menuvroom:AddItem(capot)
	capot.Activated = function(sender, item, index)
		ToggleDoorData(4)
	end

	local coffre = NativeUI.CreateItem("Coffre", "Permet d'ouvrir/fermer le coffre du véhicule")
	menuvroom:AddItem(coffre)
	coffre.Activated = function(sender, item, index)
		ToggleDoorData(5)
	end

	local portecond = NativeUI.CreateItem("Porte conducteur", "Permet d'ouvrir/fermer les portes du véhicule")
	menuvroom:AddItem(portecond)
	portecond.Activated = function(sender, item, index)
		ToggleDoorData(0)
	end

	local portepass = NativeUI.CreateItem("Porte passager", "Permet d'ouvrir/fermer les portes du véhicule")
	menuvroom:AddItem(portepass)
	portepass.Activated = function(sender, item, index)
		ToggleDoorData(1)
	end

	local portecondarr = NativeUI.CreateItem("Porte conducteur arrière", "Permet d'ouvrir/fermer les portes du véhicules")
	menuvroom:AddItem(portecondarr)
	portecondarr.Activated = function(sender, item, index)
		ToggleDoorData(2)
	end

	local portepassarr = NativeUI.CreateItem("Porte passager arrière", "Permet d'ouvrir/fermer les portes du véhicules")
	menuvroom:AddItem(portepassarr)
	portepassarr.Activated = function(sender, item, index)
		ToggleDoorData(3)
	end

end

local oldShoes = 34
local oldShoesTexture = 0
local oldVest = 15
local oldVestTexture = 0
local oldShirt = 15
local oldShirtTexture = 0
local oldArms = 15
local oldAccessoire = 4
local oldAccessoireTexture = 0
local oldPants = 61
local oldPantsTexture = 0

function AddMenuVetements(menu)
	local vet = _menuPool:AddSubMenu(menu, "👔 Vêtements et accessoires", "Retire vos vêtements, prendre un cigar...")

	local chapeau = NativeUI.CreateItem("Chapeau", "")
	vet:AddItem(chapeau)
	chapeau.Activated = function(sender, item, index)
		local ped = GetPlayerPed(-1)
		local ad = "missfbi4"
		loadAnimDict(ad)
		TaskPlayAnim(ped, ad, "takeoff_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
		RemoveAnimDict(ad)
		Wait(1000)
		ClearPedTasks(PlayerPedId())
		TriggerEvent('avanyacloth:toggleHat')
	end

	local lunettes = NativeUI.CreateItem("Lunettes", "")
	vet:AddItem(lunettes)
	lunettes.Activated = function(sender, item, index)
		local ped = GetPlayerPed(-1)
		local ad = "clothingspecs"
		loadAnimDict(ad)
		TaskPlayAnim(ped, ad, "try_glasses_positive_a", 8.0, 8.0, -1, 49, 0, 0, 0, 0)
		RemoveAnimDict(ad)
		Wait(2000)
		ClearPedTasks(PlayerPedId())
		TriggerEvent('avanyacloth:toggleGlasses')
	end

	local masque = NativeUI.CreateItem("Masque", "")
	vet:AddItem(masque)
	masque.Activated = function(sender, item, index)
		local ped = GetPlayerPed(-1)
		local ad = "missfbi4"
		loadAnimDict(ad)
		TaskPlayAnim(ped, ad, "takeoff_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
		RemoveAnimDict(ad)
		Wait(1000)
		ClearPedTasks(PlayerPedId())
		TriggerEvent('avanyacloth:toggleMask')
	end

	local top = NativeUI.CreateItem("Le haut", "")
	vet:AddItem(top)
	top.Activated = function(sender, item, index)
		local ped = GetPlayerPed(-1)
		local ad = "clothingtie"

		loadAnimDict(ad)
		TaskPlayAnim(ped, ad, "try_tie_neutral_a", 8.0, 8.0, -1, 49, 0, 0, 0, 0)
		RemoveAnimDict(ad)

		Wait(1500)
		ClearPedTasks(PlayerPedId())

		if GetPedDrawableVariation(ped, 11) == 15 and GetPedDrawableVariation(ped, 8) == 15 then
			SetPedComponentVariation(ped, 11, oldVest, oldVestTexture, 0);
			SetPedComponentVariation(ped, 8, oldShirt, oldShirtTexture, 0);
			SetPedComponentVariation(ped, 3, oldArms, 0, 0);
		else
			oldVest = GetPedDrawableVariation(ped, 11)
			oldVestTexture = GetPedTextureVariation(ped, 11)
			oldShirt = GetPedDrawableVariation(ped, 8)
			oldShirtTexture= GetPedTextureVariation(ped, 8)
			oldArms = GetPedDrawableVariation(ped, 3)

			SetPedComponentVariation(ped, 8, 15, 0, 0)
			SetPedComponentVariation(ped, 3, 15, 0, 0)

			if(GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) then 
				SetPedComponentVariation(ped, 11, 15, 0, 0)
			else
				local randomTexture = math.random(0, 15)
				SetPedComponentVariation(ped, 11, 15, randomTexture, 0)
			end
		end
	end

	local pants = NativeUI.CreateItem("Pantalon", "")
	vet:AddItem(pants)
	pants.Activated = function(sender, item, index)
		local ped = GetPlayerPed(-1)
		local ad = "pickup_object"

		loadAnimDict(ad)
		TaskPlayAnim(ped, ad, "pickup_low", 4.0, 4.0, -1, 49, 0, 0, 0, 0)
		RemoveAnimDict(ad)

		Wait(1100)
		ClearPedTasks(PlayerPedId())

		if (GetPedDrawableVariation(ped, 4) == 61 and GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) or (GetPedDrawableVariation(ped, 4) == 17 and GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01"))then
			SetPedComponentVariation(ped, 4, oldPants, oldPantsTexture, 0);
		else
			oldPants = GetPedDrawableVariation(ped, 4)
			oldPantsTexture = GetPedTextureVariation(ped, 4)

			if(GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) then 
				local randomUnderwearTexture = math.random(0, 13)
				SetPedComponentVariation(ped, 4, 61, randomUnderwearTexture, 0)
			else
				local randomUnderwearTexture = math.random(0, 11)
				SetPedComponentVariation(ped, 4, 17, randomUnderwearTexture, 0)
			end
		end
	end

	local shoes = NativeUI.CreateItem("Chaussures", "")
	vet:AddItem(shoes)
	shoes.Activated = function(sender, item, index)
		local ped = GetPlayerPed(-1)
		local ad = "pickup_object"

		loadAnimDict(ad)
		TaskPlayAnim(ped, ad, "pickup_low", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
		RemoveAnimDict(ad)

		Wait(1100)
		ClearPedTasks(PlayerPedId())

		if (GetPedDrawableVariation(ped, 6) == 34 and GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) or (GetPedDrawableVariation(ped, 6) == 35 and GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01"))then
			SetPedComponentVariation(ped, 6, oldShoes, oldShoesTexture, 0);
		else
			oldShoes = GetPedDrawableVariation(ped, 6)
			oldShoesTexture = GetPedTextureVariation(ped, 6)

			if(GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) then
				SetPedComponentVariation(ped, 6, 34, 0, 0)
			else
				SetPedComponentVariation(ped, 6, 35, 0, 0)
			end
		end
	end

	local access = _menuPool:AddSubMenu(vet, "Accessoire", "Une liste d'accessoire")

	local cigar = NativeUI.CreateItem("Cigar", "")
	access:AddItem(cigar)
	cigar.Activated = function(sender, item, index)
		local ped = GetPlayerPed(-1)
		local cigaranim = "amb@world_human_smoking@male@male_a@enter"
		loadAnimDict(cigaranim)
		TaskPlayAnim(ped, cigaranim, "enter", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
		RemoveAnimDict(cigaranim)
		Wait(2600)
		ClearPedTasks(PlayerPedId())

		local cigar_name = cigar_name or 'prop_cigar_01'
		if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
			if IsCigar then
				Wait(500)
				DetachEntity(cigar, 1, 1)
				DeleteObject(cigar)
				IsCigar = false
			else
				IsCigar = true
				Wait(500)
				local x,y,z = table.unpack(GetEntityCoords(ped))
				cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2, true, true, true)
				DecorRegister("Avanya", 2)
				DecorSetBool(cigar, "Avanya", true)
				AttachEntityToEntity(cigar, ped, GetPedBoneIndex(ped, 47419), 0.015, -0.0001, 0.003, 55.0, 0.0, -85.0, true, true, false, true, 1, true)
			end
		end
	end

	local joint = NativeUI.CreateItem("Joint", "")
	access:AddItem(joint)
	joint.Activated = function(sender, item, index)
		local ped = GetPlayerPed(-1)
		local jointanim = "amb@world_human_smoking@male@male_a@enter"
		loadAnimDict(jointanim)
		TaskPlayAnim(ped, jointanim, "enter", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
		RemoveAnimDict(jointanim)
		Wait (2600)
		ClearPedTasks(PlayerPedId())

		local cigar_name = cigar_name or 'p_cs_joint_02' -- pas de prop				
		if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then 
			if IsCigar then
				Wait(500)
				DetachEntity(cigar, 1, 1)
				DeleteObject(cigar)
				IsCigar = false
			else
				IsCigar = true
				Wait(500)
				local x,y,z = table.unpack(GetEntityCoords(ped))
				cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
				DecorRegister("Avanya", 2)
				DecorSetBool(cigar, "Avanya", true)
				AttachEntityToEntity(cigar, ped, GetPedBoneIndex(ped, 47419), 0.015, -0.009, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
			end     
		end
	end
	
	local cigarette = NativeUI.CreateItem("Cigarette", "")
	access:AddItem(cigarette)
	cigarette.Activated = function(sender, item, index)
		local ped = GetPlayerPed(-1)
		local cigarette = "amb@world_human_smoking@male@male_a@enter"
		loadAnimDict(cigarette)
		TaskPlayAnim(ped, cigarette, "enter", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
		RemoveAnimDict(cigarette)
		Wait (2600)
		ClearPedTasks(PlayerPedId())

		local cigar_name = cigar_name or 'prop_amb_ciggy_01' -- pas de prop				
		if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then 
			if IsCigar then
				Wait(500)
				DetachEntity(cigar, 1, 1)
				DeleteObject(cigar)
				IsCigar = false
			else
				IsCigar = true
				Wait(500)
				local x,y,z = table.unpack(GetEntityCoords(ped))
				cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
				DecorRegister("Avanya", 2)
				DecorSetBool(cigar, "Avanya", true)
				AttachEntityToEntity(cigar, ped, GetPedBoneIndex(ped, 47419), 0.015, -0.009, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
			end     
		end
	end

end

function AddMenuComa(menu)
	local coma = _menuPool:AddSubMenu(menu, "💊 Prendre une pillule (Coma)", "Tomber dans le coma")

	local suicide = NativeUI.CreateItem("Confirmer le coma", "DANGER : Vous allez perdre argent et objets.")
	coma:AddItem(suicide)
	suicide.Activated = function(sender, item, index)
		RequestAnimDict("mp_suicide")
		while not HasAnimDictLoaded("mp_suicide") do
			Citizen.Wait(100)
		end
		
		TaskPlayAnim(GetPlayerPed(-1), "mp_suicide", "pill", 8.0, 1.0, 6000, 1, 0.0, 0, 0, 0)
		RemoveAnimDict("mp_suicide")
		Citizen.Wait(6000)
		SetEntityHealth(GetPlayerPed(-1), 0)
		mainMenu:Visible(false)
		coma:Visible(false)
	end
end

local isMoneyHidden = true
local isJobHidden = false

function AddMenuHUD(menu)
	local hud = _menuPool:AddSubMenu(menu, "💻 Cacher l'affichage", "Permet de cacher l'argent, la nourriture, la carte...")

	local nourriture = NativeUI.CreateItem("Barre de nutrition", "Permet de cacher/afficher la barre de nutrition")
	hud:AddItem(nourriture)
	nourriture.Activated = function(sender, item, index)
		TriggerEvent("player_state:boolean")
	end

	local hideGang = NativeUI.CreateItem("Gang", "Permet de cacher/afficher son gang")
	hud:AddItem(hideGang)
	hideGang.Activated = function(sender, item, index)
		TriggerEvent("gang:hideScreen")
	end

	local voyant = NativeUI.CreateItem("Voyant de discussion", "Permet de cacher/afficher le voyant de discussion")
	hud:AddItem(voyant)
	voyant.Activated = function(sender, item, index)
		TriggerEvent("hud:active")
	end

	local jeu = NativeUI.CreateItem("Monde", "Permet de cacher/afficher la carte, les armes")
	hud:AddItem(jeu)
	jeu.Activated = function(sender, item, index)
		TriggerEvent("hud:activeJeu")
	end
	
	--[[local jeu = NativeUI.CreateItem("Hud", "Permet de cacher/afficher l'hud")
	hud:AddItem(jeu)
	jeu.Activated = function(sender, item, index)
		TriggerEvent("hud:activeJeu")
	end--]]
end

AddMenuId(mainMenu)
AddMenuPersonnel(mainMenu)
AddMenuMoney(mainMenu)
AddMenuArmes(mainMenu)
AddMenuVapot(mainMenu)
AddMenuAnim(mainMenu)
AddMenuActions(mainMenu)
AddMenuVoiture(mainMenu)
AddMenuVetements(mainMenu)
AddMenuComa(mainMenu)
AddMenuHUD(mainMenu)

_menuPool:ControlDisablingEnabled(false)
_menuPool:MouseEdgeEnabled(false)
_menuPool:MouseControlsEnabled(false)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 170) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function loadAnimDict(dict)

	while (not HasAnimDictLoaded(dict)) do

		RequestAnimDict(dict)

		Citizen.Wait(5)

	end

end

function SetMovementAnim(pHash)
	local playerPed = PlayerPedId()
	RequestAnimSet(pHash)
	while not HasAnimSetLoaded(pHash) do
		Citizen.Wait(0)
	end
	SetPedMovementClipset(playerPed, pHash, 1.0)
	SetModelAsNoLongerNeeded(pHash)
end

Citizen.CreateThread(function()

	while true do

		Citizen.Wait(0)



		if IsControlJustReleased(0, 47) and IsInputDisabled(0) and not isDead then

			ClearPedTasks(PlayerPedId())

			ClearPedSecondaryTask(GetPlayerPed(-1))

		end

	end

end)

Citizen.CreateThread(function(prop_name, secondaryprop_name)

	while true do

		Citizen.Wait(500)

		if IsPedRagdoll(PlayerPedId()) then 

			local playerPed = PlayerPedId()

			local prop_name = prop_name

			local secondaryprop_name = secondaryprop_name

			DetachEntity(prop, 1, 1)

			DeleteObject(prop)

			DetachEntity(secondaryprop, 1, 1)

			DeleteObject(secondaryprop)

		end

	end

end)

--- Hands up !

local handstate = 1

local dictUp = "random@mugging3"

local animUp = "handsup_standing_base"



local dictHead = "random@arrests@busted"

local animHead = "idle_a"



local function CallAnim(dict, anim)

	RequestAnimDict(dict)



	while not HasAnimDictLoaded(dict) do

		Citizen.Wait(100)

	end



	TaskPlayAnim(GetPlayerPed(-1), dict, anim, 4.0, 4.0, -1, 50, 0, 0, 0, 0)



	RemoveAnimDict(dict)

end



Citizen.CreateThread(function()

	Citizen.Wait(12000)



	while true do

		if IsControlJustPressed(1, 47) then

			handstate = 1

		end



		if IsControlJustPressed(1, 323) then

			local lPed = GetPlayerPed(-1)

			if not IsPedInAnyVehicle(lPed, false) and not IsPedSwimming(lPed) and not IsPedShooting(lPed) and not IsPedClimbing(lPed) and not IsPedCuffed(lPed) and not IsPedDiving(lPed) and not IsPedFalling(lPed) and not IsPedJumping(lPed) and not IsPedJumpingOutOfVehicle(lPed) and IsPedOnFoot(lPed) and not IsPedRunning(lPed) and not IsPedUsingAnyScenario(lPed) and not IsPedInParachuteFreeFall(lPed) then

				if handstate == 1 then

					handstate = 2

					CallAnim(dictUp, animUp)

				elseif handstate == 2 then

					handstate = 3

					CallAnim(dictHead, animHead)

				elseif handstate == 3 then

					handstate = 1

					ClearPedTasks(lPed)

				end

			end

		end



		Citizen.Wait(0)

	end

end)