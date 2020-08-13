-- [Id] = calories, water, needs

menus = {

	[22] = {

		calories=15,

		water=0,

		needs=-3,

		drunk=0

	},

	[30] = {

		calories=15,

		water=0,

		needs=-5,

		drunk=0,

		sandwich=1

	},

	[25] = {

		calories=0,

		water=15,

		needs=-8,

		drunk=1

	},

	[26] = {

		calories=6,

		water=3,

		needs=-2,

		drunk=0,

		grapes=1

	},

	[27] = {

		calories=0,

		water=35,

		needs=-8,

		drunk=1

	},

	[6] = {

		calories=0,

		water=15,

		needs=-4,

		drunk=0,

		eau=1

	},

    [41] = {

		calories=60,

		water=0,

		needs=-5,

		drunk=0,

		frite=1

	},

    [42] = {

		calories=0,

		water=20,

		needs=-4,

		drunk=0,

		soda=1

	},

    [43] = {

		calories=20,

		water=0,

		needs=-4,

		drunk=0,

		pizza=1

	},

    [44] = {

		calories=0,

		water=20,

		needs=-4,

		drunk=1

	},

	[47] = {

	    calories=0,

		water=0,

		needs=0,

		repair=1

	},

	[48] = {

	    calories=0,

		water=0,

		needs=0,

		lockpick=1

	},

	[49] = {

	    calories=0,

		water=0,

		needs=0,

		tel=1

	},

	[50] = {

		calories=0,

		water=60,

		needs=-4,

		drunk=0,

		coffe=1,

	},

	[52] = {

		calories=0,

		water=20,

		needs=-4,

		drunk=1

	},

	[53] = {

		calories=0,

		water=60,

		needs=-4,

		drunk=0,

		soda=1

	},

	[54] = {

		calories=0,

		water=60,

		needs=-4,

		drunk=0,

		fanta=1

	},

	[56] = {

		calories=0,

		water=60,

		needs=-4,

		drunk=0,

		soda=1

	},

	[51] = {

		calories=60,

		water=0,

		needs=-4,

		drunk=0,

		burger=1,

	},

	[55] = {

		calories=60,

		water=0,

		needs=-4,

		drunk=0,

		tacos=1

	},

	[57] = {

		calories=60,

		water=0,

		needs=-4,

		drunk=0,

		nugets=1,

	},

	[58] = {

		calories=60,

		water=0,

		needs=-4,

		drunk=0,

		donuts=1,

	},

	[59] = {

		calories=20,

		water=0,

		needs=-4,

		drunk=0

	},

	[8] = {

	    calories=0,

		water=0,

		needs=0,

		joint=1

	},

	[12] = {

	    calories=0,

		water=0,

		needs=0,

	},

	[28] = {

	    calories=0,

		water=0,

		needs=0,

	},

	[60] = {

	    calories=0,

		water=0,

		needs=0,

		zip=1

	},

	[61] = {

	    calories=0,

		water=0,

		needs=0,

		cigarette=1

	},

	[62] = {

	    calories=0,

		water=0,

		needs=0,

		sac=1

	},

	[65] = {

	    calories=0,

		water=0,

		needs=0,

		radio=1

	},

	[66] = {

	    calories=0,

		water=0,

		needs=0,

		sac1=1

	},

	[67] = {

	    calories=0,

		water=0,

		needs=0,

		compteur=1

	},

	[100] = {

	    calories=0,

		water=0,

		needs=0,

		pillule=1

	},

	[68] = {

	    calories=0,

		water=0,

		needs=0,

		scotch=1

	},

	[70] = {

	    calories=0,

		water=0,

		needs=0,

		silencer=1

	},

	[73] = {

	    calories=0,

		water=0,

		needs=0,

		gilet=1

	},

	[74] = {

	    calories=0,

		water=0,

		needs=0,

		foreuse=1

	},

	[75] = {

	    calories=0,

		water=0,

		needs=0,

		medkit=1

	},

	[80] = {

	    calories=0,

		water=0,

		needs=0,

		hack=1,

	},

	[72] = {

	    calories=0,

		water=0,

		needs=0,

		recycleur=1

	},

	[71] = {

	    calories=0,

		water=0,

		needs=0,

		clip=1

	}

}



function Chat(t)

	TriggerEvent("chatMessage", 'TRUCKER', { 0, 255, 255}, "" .. tostring(t))

end



local beer_net = nil

local bottleModel = "prop_amb_beer_bottle"

local burger_net = nil

local burgerModel = "prop_cs_burger_01"

local sandwich_net = nil

local sandwichModel = "prop_sandwich_01"

local grapes_net = nil

local grapesModel = "prop_grapes_02"

local eau_net = nil

local eauModel = "prop_ld_flow_bottle"

local frite_net = nil

local friteModel = "prop_food_bs_chips"

local soda_net = nil

local sodaModel = "prop_ecola_can"

local fanta_net = nil

local fantaModel = "prop_orang_can_01"

local pizza_net = nil

local pizzaModel = "prop_taco_01"



local tacos_net = nil

local tacosModel = "prop_taco_01"

local nugets_net = nil

local nugetsModel = "prop_food_cb_nugets"

local donuts_net = nil

local donutsModel = "prop_food_cb_donuts"



local coffe_net = nil

local coffeModel = "ng_proc_coffee_01a"





local isDrikingOrEating = false

RegisterNetEvent("item:drunk")

AddEventHandler("item:drunk", function(item)

	local player = GetPlayerPed(-1)

	local pos = GetEntityCoords(player, 1 )

	local car = GetClosestVehicle( pos.x, pos.y, pos.z, 3.000, 0, 70)

	

	local currentHealth = GetEntityHealth(player)

	local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)



	if not isDrikingOrEating then

		if menus[item].drunk == 1 then

			isDrikingOrEating = true

			oldItem = CreateObject(GetHashKey(bottleModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid = ObjToNet(oldItem)

			SetNetworkIdExistsOnAllMachines(netid, true)

			SetNetworkIdCanMigrate(netid, false)

			SetTimecycleModifier("spectator5")

			SetPedMotionBlur(player, true)

			SetPedMovementClipset(player, "MOVE_M@DRUNK@VERYDRUNK", true)

			SetPedIsDrunk(player, true)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0, 0, 0, 0.0, 0.0, true, true, false, false, 2, true)

			oldItem_id = netid

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

			Citizen.Wait(45000)

			ClearTimecycleModifier()

			ResetScenarioTypesEnabled()

			ResetPedMovementClipset(player, false)

			SetPedIsDrunk(player, false)

			SetPedMotionBlur(player, false)

		elseif menus[item].burger == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(burgerModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid1 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid1, true)

			SetNetworkIdCanMigrate(netid1, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0, 0, 0, 0.0, 0.0, true, true, false, false, 2, true)

			oldItem_id = netid1

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		elseif menus[item].tacos == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(tacosModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid1 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid1, true)

			SetNetworkIdCanMigrate(netid1, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0.0, -0.005, 0.0, 80.0, 30.0, true, true, false, false, 2, true)

			oldItem_id = netid1

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		elseif menus[item].nugets == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(nugetsModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid1 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid1, true)

			SetNetworkIdCanMigrate(netid1, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0.0, 0.0, 90.0, 90.0, -20.0, true, true, false, false, 2, true)

			oldItem_id = netid1

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		elseif menus[item].donuts == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(donutsModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid1 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid1, true)

			SetNetworkIdCanMigrate(netid1, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0.0, 0.0, 90.0, 90.0, -20.0, true, true, false, false, 2, true)

			oldItem_id = netid1

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		elseif menus[item].sandwich == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(sandwichModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid1 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid1, true)

			SetNetworkIdCanMigrate(netid1, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0, 0, 0, 0.0, 0.0, true, true, false, false, 2, true)

			oldItem_id = netid1

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		elseif menus[item].grapes == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(grapesModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid2 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid2, true)

			SetNetworkIdCanMigrate(netid2, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0, 0, 0, 0.0, 0.0, true, true, false, false, 2, true)

			oldItem_id = netid2

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		elseif menus[item].eau == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(eauModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid3 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid3, true)

			SetNetworkIdCanMigrate(netid3, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0, 0, 0, 0.0, 0.0, true, true, false, false, 2, true)

			oldItem_id = netid3

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		elseif menus[item].frite == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(friteModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid4 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid4, true)

			SetNetworkIdCanMigrate(netid4, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), -0.05, -0.025, 0.0, 90.0, 80.0, 0.0, true, true, false, false, 2, true)

			oldItem_id = netid4

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		elseif menus[item].soda == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(sodaModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid5 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid5, true)

			SetNetworkIdCanMigrate(netid5, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0, 0, 0, 0.0, 0.0, true, true, false, false, 2, true)

			oldItem_id = netid5

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		elseif menus[item].fanta == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(fantaModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid5 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid5, true)

			SetNetworkIdCanMigrate(netid5, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0, 0, 0, 0.0, 0.0, true, true, false, false, 2, true)

			oldItem_id = netid5

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		elseif menus[item].coffe == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(coffeModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid5 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid5, true)

			SetNetworkIdCanMigrate(netid5, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0, 0, 0, 0.0, 0.0, true, true, false, false, 2, true)

			oldItem_id = netid5

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		elseif menus[item].pizza == 1 then

			isDrikingOrEating = true

			local oldItem = CreateObject(GetHashKey(pizzaModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)

			DecorSetBool(oldItem, "Arcadia", true)

			Citizen.Wait(1000)

			local netid6 = ObjToNet(oldItem) 

			SetNetworkIdExistsOnAllMachines(netid6, true)

			SetNetworkIdCanMigrate(netid6, false)

			AttachEntityToEntity(oldItem, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0, 0, 0, 0.0, 0.0, true, true, false, false, 2, true)

			oldItem_id = netid6

			Citizen.Wait(5000)

			ClearPedSecondaryTask(GetPlayerPed(PlayerId()))

			DetachEntity(NetToObj(oldItem_id), 1, 1)

			DeleteEntity(NetToObj(oldItem_id))

			oldItem_id = nil

			isDrikingOrEating = false

		end

	end



	if DoesEntityExist(car) and menus[item].repair == 1 then

		local myPed = GetPlayerPed(-1)

		--local scenario = 'WORLD_HUMAN_VEHICLE_MECHANIC'

		--local h = GetEntityHeading(myPed)

		--TaskStartScenarioAtPosition(myPed, scenario, pos.x, pos.y, pos.z, h-180, 0, 0, 1)     

		

		RequestAnimDict("mini@repair")

        while not HasAnimDictLoaded("mini@repair") do

            Citizen.Wait(100)

        end

		TaskPlayAnim(GetPlayerPed(-1), "mini@repair", "fixing_a_player", 8.0, 1.0, 9000, 1, 0.0, 0, 0, 0)

		RemoveAnimDict("mini@repair")

		Citizen.Wait(10000)

		ClearPedTasks(myPed)       

		SetVehicleFixed(car)                                             

		SetVehicleEngineHealth(car, 1000.0)                              

		SetVehicleBodyHealth(car, 1000.0)                              

		SetVehicleEngineOn(car, true, false, true)

		DrawNotif("Le véhicule est ~g~réparé")

	elseif menus[item].tel == 1 then

		Citizen.Wait(500)

		TriggerEvent("gcPhone:forceOpenPhone", _myPhoneNumber)

		Citizen.Wait(500)

		TriggerEvent("player:receiveItem", 49, 1)

	elseif menus[item].joint == 1 then

		Citizen.Wait(500)

	elseif menus[item].zip == 1 then

		Citizen.Wait(500)

		TriggerEvent("cookganghandcuff:tryHandcuff")

		Citizen.Wait(500)

		local randomValue = math.random(1, 12)

		if randomValue > 1 then

			TriggerEvent("player:receiveItem", 60, 1)

		else

			notif("Le zip est abime, il sera surement casse apres l'utilisation...")

		end

	elseif menus[item].medkit == 1 then

		Citizen.Wait(500)

		MedKit()

		Citizen.Wait(500)

	elseif menus[item].cigarette == 1 then

		PlayScenario1("WORLD_HUMAN_SMOKING")                  

		Wait(20000)

		SetEntityHealth(player, currentHealth - 1)

		DrawNotif("Tu as fumé une ~g~cigarette") 

	elseif menus[item].radio == 1 then

		Citizen.Wait(500)

		TriggerEvent("boombox:ToggleBoombox")

		Citizen.Wait(500)

		TriggerEvent("player:receiveItem", 65, 1)

	elseif menus[item].sac == 1 then

		Citizen.Wait(500)

		TriggerEvent("Bag:ToggleBag")

		Citizen.Wait(500)

		TriggerEvent("player:receiveItem", 62, 1)

	elseif menus[item].silencer == 1 then

		Citizen.Wait(500)

		TriggerEvent("avanyaguns:ToggleSilencers")

		Citizen.Wait(500)

		TriggerEvent("player:receiveItem", 70, 1)

	elseif menus[item].clip == 1 then

		Citizen.Wait(500)

		TriggerEvent("avanyaguns:ToggleClips")

		Citizen.Wait(500)

		TriggerEvent("player:receiveItem", 71, 1)

	elseif menus[item].hack == 1 then

		notif("Cet objet doit etre utilise au bon endroit...")

		Citizen.Wait(500)

		TriggerEvent("player:receiveItem", 80, 1)

	elseif menus[item].recycleur == 1 then

		Citizen.Wait(500)

		TriggerEvent("avanyaguns:ToggleRecycleur")

		Citizen.Wait(500)

		TriggerEvent("player:receiveItem", 72, 1)

	elseif menus[item].gilet == 1 then

		Citizen.Wait(500)

		TriggerEvent("cookweapons:ToggleArmor")

		TriggerEvent("player:receiveItem", 73, 1)

	elseif menus[item].foreuse == 1 then

		Citizen.Wait(500)

		TriggerEvent("es_bank:openDoor")



		local randomValue = math.random(1, 10)

		if randomValue > 1 then

			TriggerEvent("player:receiveItem", 74, 1)

		else

			notif("La foreuse est abimee, elle sera surement cassee apres l'utilisation...")

		end

	elseif menus[item].sac1 == 1 then

		Citizen.Wait(500)

		TriggerEvent("es_worek:start")

		Citizen.Wait(500)

		TriggerEvent("player:receiveItem", 66, 1)

	elseif menus[item].compteur == 1 then

		Citizen.Wait(500)

		TriggerEvent("taxi:toggleDisplay")

		Citizen.Wait(500)

		TriggerEvent("player:receiveItem", 67, 1)

	elseif menus[item].pillule == 1 then

		Citizen.Wait(500)

		--SetEntityHealth(player, 0)

	elseif menus[item].lockpick == 1 then

		if DoesEntityExist(car) then

			Lockpick(car)

		end

	elseif menus[item].scotch == 1 then

		Citizen.Wait(500)

		TriggerEvent("Fax:start")

		Citizen.Wait(500)

		TriggerEvent("player:receiveItem", 68, 1)

	end

end)



function MedKit()

	TriggerEvent("mythic_progbar:client:progress", {

        name = "usemedkitmythic",

        duration = 20000,

        label = "Application du Medikit",

        useWhileDead = false,

        canCancel = false,

        controlDisables = {

            disableMovement = true,

            disableCarMovement = true,

            disableMouse = false,

            disableCombat = true,

        },

		animation = {

			animDict = "missheistdockssetup1clipboard@idle_a",

			anim = "idle_a",

			flags = 49,

		},

		prop = {

			model = "prop_ld_health_pack"

		}

    }, function(status)

        if not status then

			SetEntityHealth(GetPlayerPed(-1), 200)

        end

    end)

end



function Lockpick(myVehicle)

	RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')

    while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@') do

        Citizen.Wait(100)

    end



	TriggerEvent("mythic_progbar:client:progress", 

		{

			name = "lockpickcar",

			duration = 10000,

			label = "Tentative de crochetage - Phase 1/3",

			useWhileDead = false,

			canCancel = true,

			controlDisables = 

			{

				disableMovement = true,

				disableCarMovement = true,

				disableMouse = false,

				disableCombat = true,

			},

			animation = {

				animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",

				anim = "machinic_loop_mechandplayer",

				flags = 49,

			},

		}, function(status)

		if not status then

			ClearPedTasks(GetPlayerPed(-1))



			SetVehicleAlarm(myVehicle, true)

			SetVehicleAlarmTimeLeft(myVehicle, 60000)



			TriggerServerEvent("police:callLockPickingCar", GetVehicleNumberPlateText(myVehicle), GetEntityCoords(myVehicle))



			local isWaitingForNextPhase = true



			while isWaitingForNextPhase do

				local carPos = GetEntityCoords(myVehicle)

				local playerPos = GetEntityCoords(GetPlayerPed(-1))

				local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, carPos.x, carPos.y, carPos.z, true)

				if(distance < 5.0) then

					DisplayHelpText("~INPUT_CONTEXT~ Passer a la phase 2/3")

					if IsControlJustPressed(1,51) then

						RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')



						isWaitingForNextPhase = false

					end

				else

					return

				end



				Citizen.Wait(0)

			end



			TriggerEvent("mythic_progbar:client:progress", 

				{

					name = "lockpickcar",

					duration = 10000,

					label = "Tentative de crochetage - Phase 2/3",

					useWhileDead = false,

					canCancel = true,

					controlDisables = 

					{

						disableMovement = true,

						disableCarMovement = true,

						disableMouse = false,

						disableCombat = true,

					},

					animation = {

						animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",

						anim = "machinic_loop_mechandplayer",

						flags = 49,

					},

				}, function(status)

				if not status then

					ClearPedTasks(GetPlayerPed(-1))



					local isWaitingForNextPhase = true



					while isWaitingForNextPhase do

						local carPos = GetEntityCoords(myVehicle)

						local playerPos = GetEntityCoords(GetPlayerPed(-1))

						local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, carPos.x, carPos.y, carPos.z, true)

						if(distance < 5.0) then

							DisplayHelpText("~INPUT_CONTEXT~ Passer a la phase 3/3")

							if IsControlJustPressed(1,51) then

								isWaitingForNextPhase = false

							end

						else

							return

						end



						Citizen.Wait(0)

					end



					TriggerEvent("mythic_progbar:client:progress", 

						{

							name = "lockpickcar",

							duration = 10000,

							label = "Tentative de crochetage - Phase 3/3",

							useWhileDead = false,

							canCancel = true,

							controlDisables = 

							{

								disableMovement = true,

								disableCarMovement = true,

								disableMouse = false,

								disableCombat = true,

							},

							animation = {

								animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",

								anim = "machinic_loop_mechandplayer",

								flags = 49,

							},

						}, function(status)

						if not status then

							ClearPedTasks(GetPlayerPed(-1))

							RemoveAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")



							SetVehicleDoorsLockedForAllPlayers(myVehicle, false)

							SetVehicleDoorsLocked(myVehicle, 1)

							TaskWarpPedIntoVehicle(GetPlayerPed(-1), myVehicle, -1)

						end

					end)



					TaskPlayAnim(GetPlayerPed(-1), 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@' , 'machinic_loop_mechandplayer', 8.0, -8.0, -1, 1, 0, false, false, false)

					RemoveAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")

				end

			end)



			TaskPlayAnim(GetPlayerPed(-1), 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@' , 'machinic_loop_mechandplayer', 8.0, -8.0, -1, 1, 0, false, false, false)

		end

	end)



	TaskPlayAnim(GetPlayerPed(-1), 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@' , 'machinic_loop_mechandplayer', 8.0, -8.0, -1, 1, 0, false, false, false)

end



function Toxicated()

          TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_DRUG_DEALER", 0, 1)

          Citizen.Wait(2000)

          DoScreenFadeOut(500)

          Citizen.Wait(500)

          ClearPedTasksImmediately(GetPlayerPed(-1))

          SetTimecycleModifier("spectator5")

          SetPedMotionBlur(GetPlayerPed(-1), true)

          SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)

          SetPedIsDrunk(GetPlayerPed(-1), true)

          DoScreenFadeIn(500)

end



function reality()

          Citizen.Wait(300000)

          DoScreenFadeOut(1000)

          Citizen.Wait(1000)

          DoScreenFadeIn(1000)

          ClearTimecycleModifier()

          ResetScenarioTypesEnabled()

          ResetPedMovementClipset(GetPlayerPed(-1), 0)

          SetPedIsDrunk(GetPlayerPed(-1), false)

          SetPedMotionBlur(GetPlayerPed(-1), false)

          DrawNotif("~g~Retour à la réalité~s~")

end

 

 

 function PlayScenario1(param1) 

	Citizen.CreateThread(function()

		TaskStartScenarioInPlace(GetPlayerPed(-1), param1, 0, 1)

		Citizen.Wait(20000)

		ClearPedTasksImmediately(GetPlayerPed(-1))

	end)

end



function PlayScenario4(param1) 

	Citizen.CreateThread(function()

		TaskStartScenarioInPlace(GetPlayerPed(-1), param1, 0, 1)

		Citizen.Wait(20000)

		ClearPedTasksImmediately(GetPlayerPed(-1))

	end)

end



--function ResurrectPillule()

--		local playerPed = GetPlayerPed(-1)

--		ResurrectPed(playerPed)

--		SetEntityHealth(playerPed, GetPedMaxHealth(playerPed)/2)

--		ClearPedTasksImmediately(playerPed)

--		notif('Vous ne vous rappeler plus de rien...')

--		

--end



function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end



function notif(message)

	Citizen.CreateThread(function()

		Wait(10)

		SetNotificationTextEntry("STRING")

		AddTextComponentString(message)

		DrawNotification(false, false)

	end)

end





Citizen.CreateThread(function()

	while true do

		Wait(10)

		if (IsControlJustPressed(1, 289)) then

			--TriggerServerEvent('tel:serverRequest', "GetTel")

			TriggerEvent("gcPhone:forceOpenPhone", _myPhoneNumber)

		end	

	end

end)

		

RegisterNetEvent('tel:drawGetTel')

AddEventHandler('tel:drawGetTel', function (qteTel)

	if(qteTel == nil) then

		qteTel = 0

	end



	if qteTel >= 1 then

	   TriggerEvent("gcPhone:forceOpenPhone", _myPhoneNumber)

	else

		ClearPrints()

		SetTextEntry_2("STRING")

		AddTextComponentString("~r~Tu n'a pas de télephone va t'en acheter un au magasin !")

		DrawSubtitleTimed(3000, 1)

	end

end)



function DrawMissionText2(m_text, showtime)

    ClearPrints()

	SetTextEntry_2("STRING")

	AddTextComponentString(m_text)

	DrawSubtitleTimed(showtime, 1)

end





function DrawNotif(text)

	SetNotificationTextEntry("STRING")

	AddTextComponentString(text)

	DrawNotification(false, false)

end

