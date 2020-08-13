--====================================================================================

-- #Author: Jonathan D @ Gannon

--

-- Développée pour la communauté n3mtv

--      https://www.twitch.tv/n3mtv

--      https://twitter.com/n3m_tv

--      https://www.facebook.com/lan3mtv

--====================================================================================

 

 

 

 

 

--===================================================================================================================================================--

--                Build Menu -- playAmination = joue l'aniamtion une fois et playAminationLoop pour jouer l'animation en boucle.                     --

-- site des emotes = http://docs.ragepluginhook.net/html/62951c37-a440-478c-b389-c471230ddfc5.htm#amb@code_human_wander_idles_cop@male@staticSection --

--===================================================================================================================================================--

local KeyOpenJobsMenu = 166 -- F5

local currentJobs = ''

local hasMenuJob = false

local assis = false

RegisterNetEvent('metiers:updateJob')

AddEventHandler('metiers:updateJob', function(nameJob)

    if hasMenuJob then

        table.remove(Menu.item.Items, 1)

    end

    hasMenuJob = false

 

    if nameJob == 'Cadet' or

       nameJob == 'Agent' or

       nameJob == 'Sergent' or

       nameJob == 'Sergent-chef' or

       nameJob == 'Lieutenant' or

       nameJob == 'Capitaine' or

	   nameJob == 'Sheriff-Cadet' or

	   nameJob == 'Sheriff-Officier' or

	   nameJob == 'Sheriff-Sergent' or

	   nameJob == 'Sheriff-Lieutenant' or

	   nameJob == 'Sheriff-Capitaine' or

       nameJob == 'Ambulancier' or

       nameJob == 'Ambulancier-Recrue' or

       nameJob == 'Ambulancier-Medecin' or

       nameJob == 'Taxi' or

       nameJob == 'Taxi-Recrue' or

       nameJob == 'Taxi-Patron' or

       nameJob == 'Pompier' or

       nameJob == 'Burgershot' or

       nameJob == 'Mecano' or

       nameJob == 'Evenementiel' or

       nameJob == 'Journaliste' or

       nameJob == 'Patron-burgershot' or

       nameJob == 'Patron-mecano' or

       nameJob == 'Bar' or

       nameJob == 'Patron-bar' or

       nameJob == 'Patron-brinks' or

       nameJob == 'Avocat' then

       table.insert(Menu.item.Items, 1, {['Title'] = 'Menu ' .. nameJob, ['Function'] = openMenuJobs } )

       hasMenuJob = true

       --Citizen.Trace('-----------------------')

    end

    if nameJob == 'Cadet' or

       nameJob == 'Agent' or

       nameJob == 'Sergent' or

       nameJob == 'Sergent-chef' or

       nameJob == 'Lieutenant' or

       nameJob == 'Capitaine' or

       nameJob == 'Commandant' or

	   nameJob == 'Sheriff-Cadet' or

	   nameJob == 'Sheriff-Officier' or

	   nameJob == 'Sheriff-Sergent' or

	   nameJob == 'Sheriff-Lieutenant' or

	   nameJob == 'Sheriff-Capitaine' then

        currentJobs = 'police'
    
    elseif nameJob == 'Patron-mecano' then

        currentJobs = 'mecano'
    
    elseif nameJob == 'Patron-burgershot' then

        currentJobs = 'burgershot'
    
    elseif nameJob == 'Patron-bar' then

        currentJobs = 'bar'

    elseif nameJob == 'Patron-brinks' then

        currentJobs = 'brinks'

    elseif nameJob == 'Procureur' or

        nameJob == 'Enqueteur' or

        nameJob == 'Juge' or

        nameJob == 'Gouverneur' or

        nameJob == 'Gouverneur-adjoint' then

        currentJobs = 'avocat'

    else

        currentJobs = string.lower(nameJob)

    end

end)

 

function openMenuJobs()

    TriggerEvent(currentJobs .. ':openMenu')

end

 

Menu = {}

Menu.item = {

    ['Title'] = 'Menue Personnel',

    ['Items'] = {

        {['Title'] = 'Personnel', ['SubMenu'] = {

            ['Title'] = 'Menu',

                ['Items'] = {

                    { ['Title'] = 'Regarder sa carte d\'identité', ['Event'] = 'gcl:openMeIdentity',['Close'] = false},

                    { ['Title'] = 'Montrer carte d\'identité', ['Event'] = 'gcl:showItentity',['Close'] = false},

                    { ['Title'] = 'Regarder son permis de conduire', ['Event'] = 'gcl:openMeLicenceDriver',['Close'] = false},

                    { ['Title'] = 'Montrer permis de conduire', ['Event'] = 'gcl:showMeLicenceDriver',['Close'] = false},

					--{ ['Title'] = 'Sortir Sa Tablette', ['Event'] = 'tab:sortie',['Close'] = true},

					--{ ['Title'] = 'Ranger Sa Tablette', ['Event'] = 'tab:rentrer',['Close'] = false},

                    --{ ['Title'] = 'customise ton perso ici', ['Event'] = 'skin:openSkinCreator'},

                }

            }

        },

        {['Title'] = 'Emote', ['SubMenu'] = {

            ['Title'] = 'Menu',

            ['Items'] = {

				{ ['Title'] = 'Boisson / Cigarette', ['SubMenu'] = {

					['Title'] = 'Animations - Boisson / Cigarette',

					['Items'] = {	

						-- { ['Title'] = "parler",				Function = playAmination,	['dictionaries'] = "mp_facial",		['clip'] = 'mic_chatter'	, ['Close'] = false},

						{ ['Title'] = "Servir un shot",				Function = playAmination,	['dictionaries'] = "mini@drinking",		['clip'] = 'shots_barman_b'	, ['Close'] = false},

						{ ['Title'] = "Boire petite biere",			Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_PARTYING"								, ['Close'] = false	},

						{ ['Title'] = "Boire grande bierre",		Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_DRINKING"								, ['Close'] = false	},

						{ ['Title'] = "Boire un cafe",				Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_AA_COFFEE"								, ['Close'] = false	},

						--{ ['Title'] = "Cigarette",					Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_AA_SMOKE"								, ['Close'] = false	},

						--{ ['Title'] = "Cigarette 2",				Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_SMOKING"								, ['Close'] = false	},

						--{ ['Title'] = "Fumer joint",				Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_SMOKING_POT"							, ['Close'] = false	},

					}

				}},

				{ ['Title'] = 'Prendre une pose', ['SubMenu'] = {

                    ['Title'] = 'Animations - Pose',

                    ['Items'] = {

						{ ['Title'] = "Poser au comptoir",	Function = playEmote,		['EmoteName'] = "PROP_HUMAN_BUM_SHOPPING_CART"		, ['Close'] = false },

						{ ['Title'] = "Pose SDF couche",	Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_BUM_SLUMPED"			, ['Close'] = false }, 

						{ ['Title'] = "Contre le mur",		Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_LEANING"				, ['Close'] = false },

						{ ['Title'] = "Sur le ventre",		Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_SUNBATHE"				, ['Close'] = false	},

						{ ['Title'] = "Assis au sol",		Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_PICNIC"				, ['Close'] = false	},

						{ ['Title'] = "Sur le dos",			Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_SUNBATHE_BACK"			, ['Close'] = false	},

                        { ['Title'] = "S'assoir",			['Event'] = 'sit:chaise'														, ['Close'] = false },                  

						{ ['Title'] = "Au sol",				Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_STUPOR"				, ['Close'] = false	},

                    }

                }},

                { ['Title'] = 'Saluer', ['SubMenu'] = {

                    ['Title'] = 'Animations - Saluer',

                    ['Items'] = {	

                        { ['Title'] = 'Signe de la main',	['Function'] = playAmination,	['dictionaries'] = "friends@frj@ig_1",								['clip'] = 'wave_e',				['Close'] = false},

                        { ['Title'] = "Salut militaire",	Function = playAminationLoop,	dictionaries = "mp_player_int_uppersalute",							clip = "mp_player_int_salute",		['Close'] = false},

						{ ['Title'] = "Dans mes bras",		Function = playAmination,		dictionaries = "anim@mp_player_intcelebrationpaired@m_m_bro_hug",	clip = "bro_hug_right",				['Close'] = false},

                        { ['Title'] = "Serrer la main",		Function = playAmination,		dictionaries = "mp_common",											clip = 'givetake1_a',				['Close'] = false},

                        { ['Title'] = "Dire bonjour",		Function = playAmination,		dictionaries = "gestures@m@standing@casual",						clip = "gesture_hello",				['Close'] = false},

                        { ['Title'] = "High Five",			Function = playAmination,		dictionaries = "mp_ped_interaction",								clip = "highfive_guy_a",			['Close'] = false},

						{ ['Title'] = "Enlacer",			Function = playAmination,		dictionaries = "mp_ped_interaction",								clip = "kisses_guy_a",				['Close'] = false},

						{ ['Title'] = "Mains en l air",		Function = playAminationLoop,	dictionaries = "random@mugging3",									clip = "handsup_standing_base",		['Close'] = false},

                    }

                }},

                { ['Title'] = 'Moquerie', ['SubMenu'] = {

                    ['Title'] = 'Animations - Moquerie',

                    ['Items'] = {

                        { ['Title'] = "Balle dans la tete"	,	Function = playAmination , dictionaries = "mp_suicide",												clip = "pistol",				['Close'] = false },

                        { ['Title'] = "Craquer poings (h)"	,	Function = playAmination , ['dictionaries'] = "anim@mp_player_intcelebrationmale@knuckle_crunch",	['clip'] = 'knuckle_crunch',	['Close'] = false },

						{ ['Title'] = "Craquer poings (f)"	,	Function = playAmination , ['dictionaries'] = "anim@mp_player_intcelebrationfemale@knuckle_crunch",	['clip'] = 'knuckle_crunch',	['Close'] = false },

                        { ['Title'] = "Doigt dans le nez",		Function = playAmination ,  dictionaries = "anim@mp_player_intcelebrationmale@nose_pick",			clip = 'nose_pick',				['Close'] = false},

                        { ['Title'] = "Applaudissement",		Function = playAmination ,  dictionaries = "anim@mp_player_intcelebrationmale@slow_clap",			clip = 'slow_clap',				['Close'] = false},

                        { ['Title'] = "Air guitar",				Function = playAmination ,	dictionaries = "anim@mp_player_intcelebrationmale@air_guitar",			clip = 'air_guitar',			['Close'] = false},

                        { ['Title'] = "Air synth",				Function = playAmination ,	dictionaries = "anim@mp_player_intcelebrationmale@air_synth",			clip = 'air_synth',				['Close'] = false},

                        { ['Title'] = "Face Palm",				Function = playAmination ,  dictionaries = "anim@mp_player_intcelebrationmale@face_palm",			clip = 'face_palm',				['Close'] = false},

						{ ['Title'] = "Branlette",				Function = playAmination ,  dictionaries = "anim@mp_player_intcelebrationmale@wank",				clip = 'wank',					['Close'] = false},

                        { ['Title'] = "Coucou",					Function = playAmination ,  dictionaries = "anim@mp_player_intcelebrationmale@wave",				clip = 'wave',					['Close'] = false},

                        { ['Title'] = "Amour",					Function = playAmination ,	dictionaries = "anim@mp_player_intcelebrationmale@blow_kiss",			clip = 'blow_kiss',				['Close'] = false},

                        { ['Title'] = "Salut",					Function = playAmination ,  dictionaries = "anim@mp_player_intcelebrationmale@salute",				clip = 'salute',				['Close'] = false},

                        { ['Title'] = "Fuck",					Function = playAmination ,  dictionaries = "anim@mp_player_intcelebrationmale@finger",				clip = 'finger',				['Close'] = false},

                        { ['Title'] = "Jazz",					Function = playAmination ,  dictionaries = "anim@mp_player_intcelebrationmale@jazz_hands",			clip = 'jazz_hands',			['Close'] = false},

                        { ['Title'] = "Rock",					Function = playAmination ,  dictionaries = "anim@mp_player_intcelebrationmale@rock",				clip = 'rock',					['Close'] = false},

                        { ['Title'] = "Chut",					Function = playAmination ,  dictionaries = "anim@mp_player_intcelebrationmale@shush",				clip = 'shush',					['Close'] = false},

                        { ['Title'] = "DJ",						Function = playAmination ,  dictionaries = "anim@mp_player_intcelebrationmale@dj",					clip = 'dj',					['Close'] = false},

                    }

                }},

                { ['Title'] = 'Attente', ['SubMenu'] = {

                    ['Title'] = 'Animations - Attente',

                    ['Items'] = {

						{ ['Title'] = "Garde",						Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_GUARD_STAND"			,										['Close'] = false }, 

						{ ['Title'] = "Pensif",						Function = playAmination,		['dictionaries'] = "amb@code_human_police_investigate@idle_a",		clip = 'idle_a',		['Close'] = false },

						{ ['Title'] = "Dealer",						Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_DRUG_DEALER_HARD"		,										['Close'] = false }, 

						{ ['Title'] = "Tennis",						Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_TENNIS_PLAYER"			,										['Close'] = false }, 

						{ ['Title'] = "Golfeur",					Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_GOLF_PLAYER"			,										['Close'] = false }, 

						{ ['Title'] = "guetteur",					Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_GUARD_PATROL"			,										['Close'] = false }, 

						{ ['Title'] = "Mendier",					Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_BUM_FREEWAY"			,										['Close'] = false }, 

						{ ['Title'] = "Impatient",					Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_STAND_IMPATIENT"		,										['Close'] = false }, 

						{ ['Title'] = "Depressif",					Function = playAmination,		['dictionaries'] = "amb@world_human_bum_standing@depressed@idle_a",	 ['clip'] = 'idle_a',   ['Close'] = false},

						{ ['Title'] = "Discussion",					Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_HANG_OUT_STREET"		,										['Close'] = false }, 

						{ ['Title'] = "Telephone",					Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_STAND_MOBILE"			,										['Close'] = false },

						{ ['Title'] = "Pose police",				Function = playEmote,			['EmoteName'] = 'WORLD_HUMAN_COP_IDLES'				,										['Close'] = false },

						{ ['Title'] = "Pose police 2",				Function = playEmote,			['EmoteName'] = "CODE_HUMAN_POLICE_INVESTIGATE"		,										['Close'] = false },

						{ ['Title'] = "Regarder carte",				Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_TOURIST_MAP"			,										['Close'] = false },

						{ ['Title'] = "Statue humaine",				Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_HUMAN_STATUE"			,										['Close'] = false }, 

						{ ['Title'] = "Appareil photo",				Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_PAPARAZZI"				,										['Close'] = false },

						{ ['Title'] = "Prostituee soft",			Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"	,										['Close'] = false }, 

						{ ['Title'] = "Prostituee hard",			Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_PROSTITUTE_LOW_CLASS"	,										['Close'] = false }, 

						{ ['Title'] = "Inspection torche",			Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_SECURITY_SHINE_TORCH"	,										['Close'] = false }, 

						{ ['Title'] = "Filmer scene choquante",		Function = playEmote,			['EmoteName'] = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"	,										['Close'] = false },

                    }

                }},

                { ['Title'] = 'Humeur', ['SubMenu'] = {

                    ['Title'] = 'Animations - Humeur',

                    ['Items'] = {

						{ ['Title'] = "Se gratter les couilles"	, Function = playAmination			, dictionaries = "mp_player_int_uppergrab_crotch"							, clip = "mp_player_int_grab_crotch"	, ['Close'] = false	},

                        { ['Title'] = "Joueur de la musique"	, Function = playEmote				, ['EmoteName'] = "WORLD_HUMAN_MUSICIAN"				, ['Close'] = false },

                        { ['Title'] = "Doigt d'honneur"			, Function = playAmination			, dictionaries = "mp_player_int_upperfinger",								clip = "mp_player_int_finger_01_enter"	, ['Close'] = false },

                        { ['Title'] = 'Faire un doigt'			, ['Function'] = playAmination		, ['dictionaries'] = "mp_player_intfinger",									['clip'] = 'mp_player_int_finger'		, ['Close'] = false },

                        { ['Title'] = "Viens me voir "			, Function = playAmination			, dictionaries = "gestures@m@standing@casual",								clip = "gesture_come_here_soft" 		, ['Close'] = false },

						{ ['Title'] = "Rock and Roll"			, Function = playAminationLoop			, dictionaries = "mp_player_int_upperrock"			, clip = "mp_player_int_rock"			, ['Close'] = false	},

						{ ['Title'] = "Danse Femme"				, Function = playAmination			, dictionaries = "mini@strip_club@private_dance@part1", clip = "priv_dance_p1" 				, ['Close'] = false	},

						{ ['Title'] = "Spectateur"				, Function = playEmote				, ['EmoteName'] = "WORLD_HUMAN_STRIP_WATCH_STAND"		, ['Close'] = false	},

                        { ['Title'] = "Calme toi"				, Function = playAmination			, dictionaries = "gestures@m@standing@casual",								clip = "gesture_easy_now" 				, ['Close'] = false },

						{ ['Title'] = "Applaudir"				, Function = playEmote				, ['EmoteName'] = "WORLD_HUMAN_CHEERING"				, ['Close'] = false	},

						{ ['Title'] = "Branleur"				, Function = playAminationLoop		, dictionaries = "mp_player_int_upperwank",									clip = "mp_player_int_wank_01" 			, ['Close'] = false },

                        { ['Title'] = "Excelent"				, Function = playAmination			, dictionaries = "anim@mp_player_intcelebrationmale@thumbs_up", clip = "thumbs_up" 			, ['Close'] = false	},

                        { ['Title'] = "Dammed "					, Function = playAmination			, dictionaries = "gestures@m@standing@casual",								clip = "gesture_damn" 					, ['Close'] = false },

                        { ['Title'] = "No way"					, Function = playAmination			, dictionaries = "gestures@m@standing@casual",								clip = "gesture_no_way" 				, ['Close'] = false },

                        { ['Title'] = "Danse"					, ['Function'] = playAmination		, ['dictionaries'] = "amb@world_human_partying@female@partying_beer@base", ['clip'] = 'base' 	, ['Close'] = false	},

                        { ['Title'] = "Super"					, Function = playAmination			, dictionaries = "mp_action", clip = "thanks_male_06" 										, ['Close'] = false	},

						{ ['Title'] = 'Oui'						, ['Function'] = playAmination		, ['dictionaries'] = "gestures@m@standing@casual",							['clip'] = 'gesture_pleased'			, ['Close'] = false },

                        { ['Title'] = 'Non'						, ['Function'] = playAmination		, ['dictionaries'] = "gestures@m@standing@casual",							['clip'] = 'gesture_head_no'			, ['Close'] = false },

                    }

                }},

				{ ['Title'] = 'Sportives', ['SubMenu'] = {

                    ['Title'] = 'Animations - Sportives',

                    ['Items'] = {

						{ ['Title'] = "Montrer ses muscles",	Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_MUSCLE_FLEX"			, ['Close'] = false	},

						{ ['Title'] = "Traction prisonnier",	Function = playEmote,		['EmoteName'] = "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON"	, ['Close'] = false	},

						{ ['Title'] = "Traction militaire",		Function = playEmote,		['EmoteName'] = "PROP_HUMAN_MUSCLE_CHIN_UPS_ARMY"	, ['Close'] = false	},

						{ ['Title'] = "Faire des pompes",		Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_PUSH_UPS"				, ['Close'] = false	},

						{ ['Title'] = "Faire des abdos",		Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_SIT_UPS"				, ['Close'] = false	},

						{ ['Title'] = "Barre Biceps",			Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS"	, ['Close'] = false	},

						{ ['Title'] = "Traction",				Function = playEmote,		['EmoteName'] = "PROP_HUMAN_MUSCLE_CHIN_UPS"		, ['Close'] = false	},

                        { ['Title'] = "Jogging",				Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_JOG_STANDING"			, ['Close'] = false	},

						{ ['Title'] = "Yoga",					Function = playEmote,		['EmoteName'] = "WORLD_HUMAN_YOGA"					, ['Close'] = false	},

                    }

                }},

                { ['Title'] = 'Metier', ['SubMenu'] = {

                    ['Title'] = 'Animations Metier',

                    ['Items'] = {

						{ ['Title'] = "Prendre des notes",	Function = playEmote,	['EmoteName'] = "WORLD_HUMAN_CLIPBOARD"				, ['Close'] = false	},

						{ ['Title'] = "Reparer vehicule",	Function = playEmote,	['EmoteName'] = "WORLD_HUMAN_VEHICLE_MECHANIC"		, ['Close'] = false	},

						{ ['Title'] = "Inspecter corps",	Function = playEmote,	['EmoteName'] = "CODE_HUMAN_MEDIC_KNEEL"			, ['Close'] = false	},

						{ ['Title'] = "Toucher corps",		Function = playEmote,	['EmoteName'] = "CODE_HUMAN_MEDIC_TEND_TO_DEAD"		, ['Close'] = false	},

						{ ['Title'] = "Heure du deces",		Function = playEmote,	['EmoteName'] = "CODE_HUMAN_MEDIC_TIME_OF_DEATH"	, ['Close'] = false	},

                        { ['Title'] = 'Marteau piqueur',	Function = playEmote,	['EmoteName'] = 'WORLD_HUMAN_CONST_DRILL'			, ['Close'] = false	},

                        { ['Title'] = 'Circulation',		Function = playEmote,	['EmoteName'] = 'WORLD_HUMAN_CAR_PARK_ATTENDANT'	, ['Close'] = false	},

                        { ['Title'] = 'Souffleur',			Function = playEmote,	['EmoteName'] = 'WORLD_HUMAN_GARDENER_LEAF_BLOWER'	, ['Close'] = false	},

                        { ['Title'] = 'Planter',			Function = playEmote,	['EmoteName'] = 'WORLD_HUMAN_GARDENER_PLANT'		, ['Close'] = false	},

                        { ['Title'] = 'Peche',				Function = playEmote,	['EmoteName'] = 'WORLD_HUMAN_STAND_FISHING'			, ['Close'] = false	},

                        { ['Title'] = 'Soudure',			Function = playEmote,	['EmoteName'] = 'WORLD_HUMAN_WELDING'				, ['Close'] = false	},

                        { ['Title'] = 'Jumelle',			Function = playEmote,	['EmoteName']  = 'WORLD_HUMAN_BINOCULARS'			, ['Close'] = false	},

						{ ['Title'] = "Chercher",			Function = playEmote,	['EmoteName'] = "WORLD_HUMAN_BUM_WASH"				, ['Close'] = false	},

						{ ['Title'] = "Nettoyer",			Function = playEmote,	['EmoteName'] = "WORLD_HUMAN_MAID_CLEAN"			, ['Close'] = false	},

						{ ['Title'] = "Balayer",			Function = playEmote,	['EmoteName'] = "WORLD_HUMAN_JANITOR"				, ['Close'] = false	},

                    }

                }},

				{ ['Title'] = 'Démarches', ['SubMenu'] = {

                    ['Title'] = 'Démarches',

                    ['Items'] = {

                        { ['Title'] = 'Michael', ['Event'] = 'SetCustomMovementStyle:michael' , ['Close'] = false}, 

                        { ['Title'] = 'Jimmy', ['Event'] = 'SetCustomMovementStyle:jimmy' , ['Close'] = false},

						{ ['Title'] = 'Franklin', ['Event'] = 'SetCustomMovementStyle:franklin' , ['Close'] = false},

						{ ['Title'] = 'Lester', ['Event'] = 'SetCustomMovementStyle:lester' , ['Close'] = false},



						{ ['Title'] = 'Enerve', ['Event'] = 'SetCustomMovementStyle:enerve' , ['Close'] = false},

						{ ['Title'] = 'Brave', ['Event'] = 'SetCustomMovementStyle:brave' , ['Close'] = false},

						{ ['Title'] = 'Chic', ['Event'] = 'SetCustomMovementStyle:chic' , ['Close'] = false},

						{ ['Title'] = 'determine', ['Event'] = 'SetCustomMovementStyle:determine' , ['Close'] = false},

						{ ['Title'] = 'Classique', ['Event'] = 'SetCustomMovementStyle:classique' , ['Close'] = false},



						{ ['Title'] = 'Lent', ['Event'] = 'SetCustomMovementStyle:lent' , ['Close'] = false},

						{ ['Title'] = 'Blessé', ['Event'] = 'SetCustomMovementStyle:blesse' , ['Close'] = false},

						{ ['Title'] = 'Accroupi', ['Event'] = 'SetCustomMovementStyle:accroupi' , ['Close'] = false},



						{ ['Title'] = 'Sexy', ['Event'] = 'SetCustomMovementStyle:sexy' , ['Close'] = false},

						{ ['Title'] = 'Effrayée', ['Event'] = 'SetCustomMovementStyle:feffraye' , ['Close'] = false},

						{ ['Title'] = 'Femme', ['Event'] = 'SetCustomMovementStyle:feminine' , ['Close'] = false},



						{ ['Title'] = 'Gangster 1', ['Event'] = 'SetCustomMovementStyle:gangster1' , ['Close'] = false},

						{ ['Title'] = 'Gangster 2', ['Event'] = 'SetCustomMovementStyle:gangster2' , ['Close'] = false},

						{ ['Title'] = 'Gangster 3', ['Event'] = 'SetCustomMovementStyle:gangster3' , ['Close'] = false},



						{ ['Title'] = 'Légèrement ivre', ['Event'] = 'SetCustomMovementStyle:legerementbourre' , ['Close'] = false},

						{ ['Title'] = 'Moyennement Ivre', ['Event'] = 'SetCustomMovementStyle:bourre' , ['Close'] = false},

						{ ['Title'] = 'Complètement ivre', ['Event'] = 'SetCustomMovementStyle:tresbourre', ['Close'] = false},

                    }

                }},

            },

        }},

        --{ ['Title'] = 'Faire Pipi', ['Event'] = 'gabs:enviepipi',['Close'] = true},

		--{ ['Title'] = 'Sac De Boulot', ['Event'] = 'Bag:ToggleBag',['Close'] = true},

        { ['Title'] = "Donner de l'argent", ['Event'] = 'bank:givecash'},

        { ['Title'] = "Donner de l'argent sale", ['Event'] = 'bank:givedirty'},

        -- { ['Title'] = "Anti Despawn vehicule", ['Event'] = 'boot:start'},

		--{ ['Title'] = 'Accessoire', ['SubMenu'] = {

		--	['Title'] = 'Accessoire',

		--	['Items'] = {

		--		{ ['Title'] = 'Mettre un sac sur la tête', ['Event'] = 'es_worek:start',['Close'] = false},

		--		{ ['Title'] = 'Enlever sac sur la tête', ['Event'] = 'es_worek:stop', ['Close'] = false},

		--		}

		--	}

		--},

        { ['Title'] = "Cacher armes", ['Event'] = 'hideweapon:tryHide'},

        -- { ['Title'] = "Bag", ['Event'] = 'BagDirty:ToggleBag'},

		{ ['Title'] = "Donner arme", ['Event'] = 'giveweapon:tryGiveWeapon'},

		{ ['Title'] = "Fouiller", ['Event'] = 'cookgangsearch:trySearch'},

		--{ ['Title'] = "Menotter/Crocheter", ['Event'] = 'cookganghandcuff:tryHandcuff'},

		{ ['Title'] = "Facture", ['Event'] = 'ramexfacture:renterFacture'},

        { ['Title'] = "Genou au sol main sur la tête", ['Event'] = 'KneelHU'},

        { ['Title'] = 'Enlever / Mettre Chapeau', ['Event'] = 'cookcloth:toggleHat',['Close'] = false},

        { ['Title'] = 'Enlever / Mettre Masque', ['Event'] = 'cookcloth:toggleMask' ,['Close'] = false},

        { ['Title'] = 'Enlever / mettre Lunettes', ['Event'] = 'cookcloth:toggleGlasses',['Close'] = false},

        --{ ['Title'] = "Allumer un feux volontairement", ['Event'] = 'lol:firethings'},

		{ ['Title'] = 'Annuler Animation', ['Event'] = 'gc:clearAmination'},

		{ ['Title'] = 'Option', ['SubMenu'] = {

			['Title'] = 'Option',

			['Items'] = {

			    --{ ['Title'] = 'Sauvegarder position vehicule', ['Event'] = 'saveveh',['Close'] = false},

				--{ ['Title'] = 'Sauvegarder position vehicule', ['Event'] = 'saveveh1',['Close'] = false},

			    { ['Title'] = 'Activer/Désactiver ID joueur', ['Event'] = 'head:Toggle',['Close'] = false},

			    -- { ['Title'] = 'Reconnexion', ['Event'] = 'connecting',['Close'] = false},

			    -- { ['Title'] = 'eup', ['Event'] = 'eup',['Close'] = true},

			    -- { ['Title'] = 'Promener/Plus promener chien', ['Event'] = 'togglePet',['Close'] = false},

				{ ['Title'] = 'Activer/Désactiver HUD', ['Event'] = 'player_state:boolean',['Close'] = false},

				--{ ['Title'] = 'Dévérouiller les porte', ['Function'] = unlockVehiculeForAll, ['Close'] = false},

				{ ['Title'] = 'Activer/Désactiver HUD du Jeu', ['Event'] = 'hud:activeJeu', ['Close'] = false},

				--{ ['Title'] = 'Activer/Désactiver Boussole', ['Event'] = 'hud:disableBoussole', ['Close'] = false},

				--{ ['Title'] = 'Activer/Désactiver Nom des rues', ['Event'] = 'hud:DisableStreetName', ['Close'] = false},

				{ ['Title'] = 'Activer/Désactiver le mode Cinema 1', ['Event'] = 'hud:activePanoramique', ['Close'] = false},

				{ ['Title'] = 'Activer/Désactiver le mode Cinema 2', ['Event'] = 'hud:activePanoramique2', ['Close'] = false},

				{ ['Title'] = 'Activer/Désactiver le mode Cinema 3', ['Event'] = 'hud:activePanoramique3', ['Close'] = false},

				--{ ['Title'] = 'Sauvegarder sa position', ['Function'] = savelastpos, Close = false},

				}

			}

		},

        { ['Title'] = 'Se suicider / Respawn', ['SubMenu'] = {

                    ['Title'] = 'Validation suicide:',

                    ['Items'] = {

                                { ['Title'] = 'Quitter' },

                                { ['Title'] = 'Valider le suicide / respawn',['Event'] = 'ambulancier:selfRespawn'},

                                }

                }

        },

    }

}

 



 

------ pour la détection

 

--local function stopSit()

--    local ped = GetPlayerPed(-1)

--    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")

--    if not IsPedInjured(ped) then

--        ClearPedSecondaryTask(ped)

--    end

--    if not IsPedInAnyVehicle(ped, 1) then

--        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)

--    end

--    SetPedConfigFlag(ped, 36, 0)

--    ClearPedSecondaryTask(PlayerPedId())

--    assis = false

--end

 

--AddEventHandler('sit:chaise', function()

--    ped = GetPlayerPed(-1);

   

--    if ped then

--        local pos = GetEntityCoords(GetPlayerPed(-1), false)

--        head = GetEntityHeading(ped);

 

--        local object = GetHashKey('prop_chair_05')

--        local chaise = CreateObject('prop_chair_05', pos['x']+2, pos['y'], pos['z']-1, false, false, false)

--        FreezeEntityPosition(chaise , true)

--        PlaceObjectOnGroundProperly(chaise)

--        local PlayerNearDistrib = GetClosestObjectOfType(pos.x, pos.y, pos.z, 5, object, false, false, false)

--        if PlayerNearDistrib ~= nil then

--           local posobject = GetEntityCoords(chaise, false)

--            TaskStartScenarioAtPosition(ped, "PROP_HUMAN_SEAT_CHAIR", posobject['x'], posobject['y'], posobject['z']+0.5, 180.0, 0, 1, 0)

 

--        end

--        --TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_CHAIR", 0, false);

--        assis = true

--    end

--end)

 



 

------

 

local function stopSit()

    local ped = GetPlayerPed(-1)

    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")

    if not IsPedInjured(ped) then

        ClearPedSecondaryTask(ped)

    end

    if not IsPedInAnyVehicle(ped, 1) then

        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)

    end

    SetPedConfigFlag(ped, 36, 0)

    ClearPedSecondaryTask(PlayerPedId())

    assis = false

end

 

AddEventHandler('sit:chaise', function()

    ped = GetPlayerPed(-1);

   

    if ped then

        pos = GetEntityCoords(ped);

        head = GetEntityHeading(ped);

        TaskStartScenarioAtPosition(ped, "PROP_HUMAN_SEAT_CHAIR", pos['x'], pos['y'], pos['z'] - 1, head, 0, 1, 0);

        --TaskStartScenarioInPlace(ped, "PROP_HUMAN_SEAT_CHAIR", 0, false);

        assis = true

    end

end)



function Notify (text)

	SetNotificationTextEntry('STRING')

	AddTextComponentString(text)

	DrawNotification(false, false)

end



RegisterNetEvent('ramexfacture:renterFacture')

AddEventHandler('ramexfacture:renterFacture', function()

	local t, distance = GetClosestPlayer()

	if(distance ~= -1 and distance < 3) then

		DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8S", "", "", "", "", "", 20)

		while (UpdateOnscreenKeyboard() == 0) do

			DisableAllControlActions(0);

			Wait(0);

		end

		if (GetOnscreenKeyboardResult()) then

			local res = tonumber(GetOnscreenKeyboardResult())

			if(res ~= nil and res ~= 0 and res <= 20000) then	

				TriggerServerEvent("ramexfacture:factureGranted", GetPlayerServerId(t), res)

			else

				Notify("~r~Tu a dépasser le montant maximum autorisé !")				

			end

		end

	else

		Notify("~y~Pas de client à proximité !")

	end

	end)



 

--====================================================================================

--  Option Menu

--====================================================================================

Menu.backgroundColor = { 0, 0, 0, 160 }

Menu.backgroundColorActive = { 184, 184, 184, 205 }

Menu.tileTextColor = { 255, 255, 255, 255 }

Menu.tileBackgroundColor = { 0, 0, 128, 205 }

Menu.textColor = { 255,255,255,255 }

Menu.textColorActive = { 255,255,255, 255 }

 

Menu.keyOpenMenu = 170 -- F3    

Menu.keyUp = 172 -- PhoneUp

Menu.keyDown = 173 -- PhoneDown

Menu.keyLeft = 174 -- PhoneLeft || Not use next release Maybe

Menu.keyRight = 175 -- PhoneRigth || Not use next release Maybe

Menu.keySelect = 176 -- PhoneSelect

Menu.KeyCancel = 177 -- PhoneCancel

 

Menu.posX = 0.05

Menu.posY = 0.05

 

Menu.ItemWidth = 0.20

Menu.ItemHeight = 0.03

 

Menu.isOpen = false   -- /!\ Ne pas toucher

Menu.currentPos = {1} -- /!\ Ne pas toucher

 

--====================================================================================

--  Menu System

--====================================================================================

 

function Menu.drawRect(posX, posY, width, heigh, color)

    DrawRect(posX + width / 2, posY + heigh / 2, width, heigh, color[1], color[2], color[3], color[4])

end

 

function Menu.initText(textColor, font, scale)

    font = font or 0

    scale = scale or 0.35

    SetTextFont(font)

    SetTextScale(0.0,scale)

    SetTextCentre(true)

    SetTextDropShadow(0, 0, 0, 0, 0)

    SetTextEdge(0, 0, 0, 0, 0)

    SetTextColour(textColor[1], textColor[2], textColor[3], textColor[4])

    SetTextEntry("STRING")

end

 

function Menu.draw()

    -- Draw Rect

    local pos = 0

    local menu = Menu.getCurrentMenu()

    local selectValue = Menu.currentPos[#Menu.currentPos]

    local nbItem = #menu.Items

    -- draw background title & title

    Menu.drawRect(Menu.posX, Menu.posY , Menu.ItemWidth, Menu.ItemHeight * 2, Menu.tileBackgroundColor)    

    Menu.initText(Menu.tileTextColor, 4, 0.7)

    AddTextComponentString(menu.Title)

    DrawText(Menu.posX + Menu.ItemWidth/2, Menu.posY)

 

    -- draw bakcground items

    Menu.drawRect(Menu.posX, Menu.posY + Menu.ItemHeight * 2, Menu.ItemWidth, Menu.ItemHeight + (nbItem-1)*Menu.ItemHeight, Menu.backgroundColor)

    -- draw all items

    for pos, value in pairs(menu.Items) do

        if pos == selectValue then

            Menu.drawRect(Menu.posX, Menu.posY + Menu.ItemHeight * (1+pos), Menu.ItemWidth, Menu.ItemHeight, Menu.backgroundColorActive)

            Menu.initText(Menu.textColorActive)

        else

            Menu.initText(Menu.textColor)

        end

        AddTextComponentString(value.Title)

        DrawText(Menu.posX + Menu.ItemWidth/2, Menu.posY + Menu.ItemHeight * (pos+1))

    end

   

end

 

function Menu.getCurrentMenu()

    local currentMenu = Menu.item

    for i=1, #Menu.currentPos - 1 do

        local val = Menu.currentPos[i]

        currentMenu = currentMenu.Items[val].SubMenu

    end

    return currentMenu

end

 

function Menu.initMenu()

    for i,v in ipairs(Menu.item.Items)do

            if( v['Title'] == 'Ambulancier')then

                table.remove(Menu.item.Items,i)

               

            end

    end

    TriggerEvent("ambulancier:menu")

    Menu.currentPos = {1}

   

end

 

function Menu.keyControl()

    if IsControlJustPressed(1, Menu.keyDown) then

        local cMenu = Menu.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #Menu.currentPos

        Menu.currentPos[slcp] = (Menu.currentPos[slcp] % size) + 1

 

    elseif IsControlJustPressed(1, Menu.keyUp) then

        local cMenu = Menu.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #Menu.currentPos

        Menu.currentPos[slcp] = ((Menu.currentPos[slcp] - 2 + size) % size) + 1

 

    elseif IsControlJustPressed(1, Menu.KeyCancel) then

        table.remove(Menu.currentPos)

        if #Menu.currentPos == 0 then

            Menu.isOpen = false

        end

 

    elseif IsControlJustPressed(1, Menu.keySelect)  then

        local cSelect = Menu.currentPos[#Menu.currentPos]

        local cMenu = Menu.getCurrentMenu()

        if cMenu.Items[cSelect].SubMenu ~= nil then

            Menu.currentPos[#Menu.currentPos + 1] = 1

        else

            if cMenu.Items[cSelect].Function ~= nil then

                cMenu.Items[cSelect].Function(cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].Event ~= nil then

                TriggerEvent(cMenu.Items[cSelect].Event, cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].Close == nil or cMenu.Items[cSelect].Close == true then

                Menu.isOpen = false

            end

        end

    end

 

end

 

Citizen.CreateThread(function()

    while true do

        Citizen.Wait(1)

        --if IsControlJustPressed(1, Menu.keyOpenMenu) then

        --    Menu.initMenu()

        --    Menu.isOpen = not Menu.isOpen

        --end

        if Menu.isOpen then

            Menu.draw()

            Menu.keyControl()

        end

        if IsControlJustPressed(1, KeyOpenJobsMenu) then

            openMenuJobs()

        end

    end

end)



local lockAskingFine = false

RegisterNetEvent('ramexfacture:payFacture')

AddEventHandler('ramexfacture:payFacture', function(amount, sender)

	Citizen.CreateThread(function()

		local t, distance = GetClosestPlayer()

		if(lockAskingFine ~= true) then

			lockAskingFine = true

			local notifReceivedAt = GetGameTimer()

			Notify("Appuyez sur ~g~Y~s~ pour accepter la facture de ~g~$"..amount.."~s~, Appuyez sur ~r~K~s~ pour la refuser !")

			while(true) do

				Wait(0)

				

				if (GetTimeDifference(GetGameTimer(), notifReceivedAt) > 15000) then

					TriggerServerEvent('ramexfacture:factureETA', sender, 2)

					Notify("~y~Demande de facturation expirée !")

					lockAskingFine = false

					break

				end

	

				if IsControlPressed(1, 246) then				

					TriggerServerEvent('ramexfacture:givecash', GetPlayerServerId(t), amount)					

					Notify("Vous avez payé la facture de ~g~"..amount.."$~s~.")

					TriggerServerEvent('ramexfacture:factureETA', sender, 0)

					lockAskingFine = false

					break

				end

				

				if IsControlPressed(1, 311) then

					TriggerServerEvent('ramexfacture:factureETA', sender, 3)

					Notify("~r~Vous avez refusé de payer la facture")

					lockAskingFine = false

					break

				end

			end

		else

			TriggerServerEvent('ramexfacture:factureETA', sender, 1)

		end

	end)

end)



function Notify(text)

	SetNotificationTextEntry('STRING')

	AddTextComponentString(text)

	DrawNotification(false, false)

end



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

 

------------------------

--- Montrer du doigt ---

------------------------

local mp_pointing = false

local keyPressed = false

 

local function startPointing()

    local ped = GetPlayerPed(-1)

    RequestAnimDict("anim@mp_point")

    while not HasAnimDictLoaded("anim@mp_point") do

        Wait(10)

    end

    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)

    SetPedConfigFlag(ped, 36, 1)

    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)

    RemoveAnimDict("anim@mp_point")

end

 

local function stopPointing()

    local ped = GetPlayerPed(-1)

    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")

    if not IsPedInjured(ped) then

        ClearPedSecondaryTask(ped)

    end

    if not IsPedInAnyVehicle(ped, 1) then

        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)

    end

    SetPedConfigFlag(ped, 36, 0)

    ClearPedSecondaryTask(PlayerPedId())

end

 

local once = true

local oldval = false

local oldvalped = false

 

Citizen.CreateThread(function()

Citizen.Wait(250)

    while true do

        Wait(10)

 

        if once then

            once = false

        end

 

        if not keyPressed then

            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then

                Wait(200)

                if not IsControlPressed(0, 29) then

                    keyPressed = true

                    startPointing()

                    mp_pointing = true

                else

                    keyPressed = true

                    while IsControlPressed(0, 29) do

                        Wait(50)

                    end

                end

            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then

                keyPressed = true

                mp_pointing = false

                stopPointing()

            end

        end

 

        if keyPressed then

            if not IsControlPressed(0, 29) then

                keyPressed = false

            end

        end

        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then

            stopPointing()

        end

        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then

            if not IsPedOnFoot(PlayerPedId()) then

                stopPointing()

            else

                local ped = GetPlayerPed(-1)

                local camPitch = GetGameplayCamRelativePitch()

                if camPitch < -70.0 then

                    camPitch = -70.0

                elseif camPitch > 42.0 then

                    camPitch = 42.0

                end

                camPitch = (camPitch + 70.0) / 112.0

 

                local camHeading = GetGameplayCamRelativeHeading()

                local cosCamHeading = Cos(camHeading)

                local sinCamHeading = Sin(camHeading)

                if camHeading < -180.0 then

                    camHeading = -180.0

                elseif camHeading > 180.0 then

                    camHeading = 180.0

                end

                camHeading = (camHeading + 180.0) / 360.0

 

                local blocked = 0

                local nn = 0

 

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)

                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);

                nn,blocked,coords,coords = GetRaycastResult(ray)

 

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)

                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)

                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

 

            end

        end

    end

end)

 

-----------------------

--- Lever les mains ---

-----------------------



 

-- Citizen.CreateThread(function()

-- Citizen.Wait(250)

--    local dict = "random@mugging3"

--    

--	RequestAnimDict(dict)

--	while not HasAnimDictLoaded(dict) do

--		Citizen.Wait(100)

--	end

--    local handsup = false

--	while true do

--		local lPed = GetPlayerPed(-1)

--		Citizen.Wait(0)

--		if not IsPedInAnyVehicle(lPed, false) and not IsPedSwimming(lPed) and not IsPedShooting(lPed) and not IsPedClimbing(lPed) and not IsPedCuffed(lPed) and not IsPedDiving(lPed) and not IsPedFalling(lPed) and not IsPedJumping(lPed) and not IsPedJumpingOutOfVehicle(lPed) and IsPedOnFoot(lPed) and not IsPedRunning(lPed) and not IsPedUsingAnyScenario(lPed) and not IsPedInParachuteFreeFall(lPed) then

--		if IsControlJustPressed(1, 323) then --Start holding g

--            if not handsup then

--                TaskPlayAnim(lPed, dict, "handsup_standing_base", 8.0, 8.0, -1, 50, 0, false, false, false)

--                handsup = true

--            else

--                handsup = false

--                ClearPedTasks(lPed)

--            end

--        end

--      end

--	end

--end)

 

-----------------------

--- stop emote ---

-----------------------

--Citizen.CreateThread(function()

--    while true do

--            Citizen.Wait(0)

--        local lPed = GetPlayerPed(-1)

--             if IsControlPressed(1, 38) or IsControlPressed(1, 177) then

--                            ClearPedSecondaryTask(lPed)

--            end

-- 

--            if IsControlPressed(1, 38) and assis == true or IsControlPressed(1, 177) and assis == true or IsControlPressed(1, 30) and assis == true then

--                    ClearPedTasks(GetPlayerPed(-1))

--                    ClearPedSecondaryTask(GetPlayerPed(-1))

--                    stopSit()

-- 

--            end

--    end    

--end)