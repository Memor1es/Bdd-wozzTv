local pedLocations = 

{

	--- BALLAS

	{ scenario = "WORLD_HUMAN_SMOKING_POT",	dict = "", anim="", currentPed = nil, name= "",	ped = `ig_ballasog`,	x = 113.2072,	y = -1961.675,	z = 19.94546,	h = 21.973329544067}, -- Ballas 1

	{ scenario = "WORLD_HUMAN_SMOKING_POT",	dict = "", anim="", currentPed = nil, name= "",	ped = `g_f_y_ballas_01`,	x = 80.81818,	y = -1930.089,	z = 19.73343,	h = 223.69276428223}, -- Ballas 2

	{ scenario = "WORLD_HUMAN_STAND_IMPATIENT",	dict = "", anim="", currentPed = nil, name= "",	ped = `g_m_y_ballaeast_01`,	x = 81.84317,	y = -1930.968,	z = 19.72986,	h = 42.907222747803}, -- Ballas 3

	{ scenario = "WORLD_HUMAN_STAND_IMPATIENT",	dict = "", anim="", currentPed = nil, name= "",	ped = `g_m_y_ballasout_01`,	x = 75.67432,	y = -1902.348,	z = 20.58312,	h = 94.247467041016}, -- Ballas 4

	--- VAGOS

	{ scenario = "WORLD_HUMAN_SMOKING_POT",	dict = "", anim="", currentPed = nil, name= "",	ped = `g_m_y_mexgoon_01`,	x = 305.1373,	y = -2004.979,	z = 19.51609,	h = 181.93898010254}, -- Vagos 1

	{ scenario = "WORLD_HUMAN_STAND_IMPATIENT",	dict = "", anim="", currentPed = nil, name= "",	ped = `g_f_y_vagos_01`,	x = 305.4985,	y = -2006.881,	z = 19.44575,	h = 7.8453812599182}, -- Vagos 2

	{ scenario = "WORLD_HUMAN_SMOKING_POT",	dict = "", anim="", currentPed = nil, name= "",	ped = `g_m_m_mexboss_02`,	x = 334.3273,	y = -2020.111,	z = 20.93836,	h = 135.33587646484}, -- Vagos 3
	
	{ scenario = "WORLD_HUMAN_DRINKING",	dict = "", anim="", currentPed = nil, name= "",	ped = `g_m_y_mexgoon_03`,	x = 351.2402,	y = -1974.572,	z = 23.51277,	h = 278.47494506836}, -- Vagos 5

	{ scenario = "WORLD_HUMAN_DRINKING",	dict = "", anim="", currentPed = nil, name= "",	ped = `g_m_y_mexgoon_02`,	x = 352.2018,	y = -1975.323,	z = 23.49956,	h = 350.533203125}, -- Vagos 6

	--- LESTER

	{ scenario = "WORLD_HUMAN_AA_COFFEE",	dict = "", anim="", currentPed = nil, name= "",	ped = `ig_lestercrest`,	x = 1268.616,	y = -1710.157,	z = 53.77149,	h = 291.11486816406}, -- Lester
	{ scenario = "WORLD_HUMAN_SMOKING_POT",	dict = "", anim="", currentPed = nil, name= "",	ped = `s_m_y_marine_02`,	x = 18.44899,	y = -2746.266,	z = 11.00709,	h = 300.11486816406}, -- Black market
	--{ scenario = "WORLD_HUMAN_SMOKING_POT",	dict = "", anim="", currentPed = nil, name= "",	ped = `mp_m_meth_01`,	x = 3609.894,	y = 3746.286,	z = 27.70,	h = 230.11486816406}, -- Traitement Meth
	{ scenario = "WORLD_HUMAN_SMOKING_POT",	dict = "", anim="", currentPed = nil, name= "",	ped = `cs_terry`,	x = 1983.955,	y = 5176.729,	z = 46.63908,	h = 150.11486816406}, -- Vente Meth
    { scenario = "WORLD_HUMAN_STAND_IMPATIENT",	dict = "", anim="", currentPed = nil, name= "",	ped = `mp_m_exarmy_01`,	x = -172.0335,	y = 6393.347,	z = 30.49363,	h = 350.11486816406}, -- Vente Heroine
    { scenario = "WORLD_HUMAN_STAND_IMPATIENT",	dict = "", anim="", currentPed = nil, name= "",	ped = `csb_ramp_mex`,	x = 2709.6,	y = 4316.566,	z = 45.08146,	h = 350.11486816406}, -- Vente Ecstasy
    { scenario = "WORLD_HUMAN_STAND_IMPATIENT",	dict = "", anim="", currentPed = nil, name= "",	ped = `cs_movpremmale`,	x = 859.1207,	y = 2877.289,	z = 56.98275,	h = 200.11486816406}, -- Blanchissement
    { scenario = "WORLD_HUMAN_STAND_IMPATIENT",	dict = "", anim="", currentPed = nil, name= "",	ped = `cs_terry`,	x = 94.9258,	y = 3756.912,	z = 39.77077,	h = 150.11486816406}, -- Recolte Meth
    { scenario = "WORLD_HUMAN_STAND_IMPATIENT",	dict = "", anim="", currentPed = nil, name= "",	ped = `csb_prologuedriver`,	x = 608.6334,	y = -459.4331,	z = 23.74493,	h = 150.11486816406}, -- Recolte Joint	
    { scenario = "WORLD_HUMAN_STAND_IMPATIENT",	dict = "", anim="", currentPed = nil, name= "",	ped = `csb_prologuedriver`,	x = 1500.948,	y = -2123.516,	z = 75.02202,	h = 150.11486816406}, -- Vente Joint		
    { scenario = "WORLD_HUMAN_STAND_IMPATIENT",	dict = "", anim="", currentPed = nil, name= "",	ped = `csb_ramp_mex`,	x = 1545.252,	y = 2226.291,	z = 76.54782 ,	h = 150.11486816406}, -- Recolte Ecstasy
	{ scenario = "WORLD_HUMAN_STAND_IMPATIENT",	dict = "", anim="", currentPed = nil, name= "",	ped = `mp_m_exarmy_01`,	x = -1146.555,	y = 4940.999,	z = 221.2687 ,	h = 150.11486816406}, -- Recolte Heroine

}

currentPed = nil

currentPos = nil



Citizen.CreateThread(function()

	while true do

		currentPed = GetPlayerPed(-1)

		currentPos = GetEntityCoords(currentPed, false)

		Citizen.Wait(500)

	end

end)

Citizen.CreateThread(function()

	Citizen.Wait(500)



	while true do

		for _, item in pairs(pedLocations) do

			local distance = GetDistanceBetweenCoords(item.x, item.y, item.z, currentPos.x, currentPos.y, currentPos.z, true)

			if(distance < 120) then

				if not DoesEntityExist(item.currentPed) then

					RequestModel(item.ped)

					while not HasModelLoaded(item.ped) do

						Citizen.Wait(1)

					end



					item.currentPed = CreatePed(5, item.ped, item.x, item.y, item.z, item.h, false, false)

					DecorRegister("RainbowLand", 2)

					DecorSetBool(item.currentPed, "RainbowLand", true)



					SetModelAsNoLongerNeeded(item.ped)



					SetPedCombatAttributes(item.currentPed, 46, true)

					SetPedFleeAttributes(item.currentPed, 0, 0)

					SetPedRelationshipGroupHash(item.currentPed, GetHashKey("CIVMALE"))

					SetEntityInvincible(item.currentPed, true)

					FreezeEntityPosition(item.currentPed, true)	

					SetBlockingOfNonTemporaryEvents(item.currentPed, true)



					SetEntityHealth(item.currentPed, 100)



					if string.len(item.dict) > 0 then

						RequestAnimDict(item.dict)

						while not HasAnimDictLoaded(item.dict) do

							Citizen.Wait(200)

						end

					

						TaskPlayAnim(item.currentPed, item.dict, item.anim, 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)

						RemoveAnimDict(item.dict)

					end

					if string.len(item.scenario) > 0 then

						TaskStartScenarioInPlace(item.currentPed, item.scenario, -1, true)

					end

				end

			end

		end



		Citizen.Wait(5000)

	end

end)



Citizen.CreateThread(function()

	Citizen.Wait(500)



	while true do

		for _, item in pairs(pedLocations) do

			local distance = GetDistanceBetweenCoords(item.x, item.y, item.z, currentPos.x, currentPos.y, currentPos.z, true)

			if(distance > 120) then

				if item.currentPed ~= nil then

					if DoesEntityExist(item.currentPed) then

						DeleteEntity(item.currentPed)

						item.currentPed = nil

					end

				end

			end

		end



		Citizen.Wait(20000)

	end

end)

function DrawText3D(x,y,z, text, r,g,b) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)

    local px,py,pz=table.unpack(GetGameplayCamCoords())

    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

 

    local scale = (1/dist)*2

    local fov = (1/GetGameplayCamFov())*100

    local scale = scale*fov

   

    if onScreen then

        SetTextScale(0.0*scale, 0.55*scale)

        SetTextFont(0)

        SetTextProportional(1)

        SetTextColour(r, g, b, 255)

        SetTextDropshadow(0, 0, 0, 0, 255)

        SetTextEdge(2, 0, 0, 0, 150)

        SetTextDropShadow()

        SetTextOutline()

        SetTextEntry("STRING")

        SetTextCentre(1)

        AddTextComponentString(text)

        DrawText(_x,_y)

    end

end