local firstspawn = 0
local activehud = true

local localfood = 100
local localwater = 100
local localwc = 100
local initialized = false

local falpha = 200
local walpha = 200
local fualpha = 200

local boolean = true


AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		firstspawn = 1
	else
		TriggerServerEvent('player_state:setdefaultneeds')
	end
	Citizen.Wait(5000)
	initialized = true
end)

AddEventHandler('player_state:chekwnews', function(bool)
	activehud = bool
end)

RegisterNetEvent('player_state:death')
AddEventHandler('player_state:death', function()
	SetEntityHealth(GetPlayerPed(-1), 0)
end)

RegisterNetEvent('player_state:boolean')
AddEventHandler('player_state:boolean', function()
 boolean = not boolean
end)

local DrawRect = DrawRect

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if boolean then
			DrawRect(0.0855,0.8,0.142,0.015,0,0,0,150)
			DrawRect(0.087 + (0.069)/2,0.8,0.069,0.008295,10,100,255,75)
        	DrawRect(0.087 + (localwater/1449.27536232)/2,0.8,localwater/1449.27536232,0.008295,10,100,255,walpha)
        	drawHelpTxt(0.165,0.837 ,0.1,0.1,0.2, "SOIF", 255,255,255,255,6)
        	DrawRect(0.0148 + (0.07)/2,0.8,0.07,0.008295,255,165,0,75)
        	DrawRect(0.0148 + (localfood/1428.57142857)/2,0.8,localfood/1428.57142857,0.008295,255,165,0,falpha)
        	drawHelpTxt(0.094,0.837 ,0.1,0.1,0.2, "FAIM", 255,255,255,255,6)

		end
    end
end)



            
function drawHelpTxt(x,y ,width,height,scale, text, r,g,b,a,font)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

local wateralpha = false
local foodalpha = false

Citizen.CreateThread(function()
    while true do
    	Citizen.Wait(0)
		if boolean then
        if localwater < 20 then
        	wateralpha = not wateralpha
        	Wait(500)
        	if wateralpha then
        		walpha = 100
        	else
        		walpha = 200
        	end
        end
    end
	end
end)

Citizen.CreateThread(function()
    while true do
    	Citizen.Wait(0)
		if boolean then
        if localfood < 20 then
        	foodalpha = not foodalpha
        	Wait(500)
        	if foodalpha then
        		falpha = 100
        	else
        		falpha = 200
        	end
        end
    end
	end
end)


-- FOOD
RegisterNetEvent('player_state:set')
AddEventHandler('player_state:set', function(state)
	localfood = state.food
	localwater = state.water
	
	-- print(tostring("food " .. localfood), tostring("localwater " .. localwater),tostring("localwc " .. localwc))
	
	
	--SendNUIMessage({ state = json.encode({food = state.food, water = state.water, needs = state.needs, status = true})
	--})
end)

-- EMOTES
RegisterNetEvent('player_state:drink')
AddEventHandler('player_state:drink', function()
	ped = GetPlayerPed(-1)
	if ped then
		Citizen.CreateThread(function()
			RequestAnimDict('amb@world_human_drinking_fat@beer@male@idle_a')
		    local pedid = PlayerPedId()
			TaskPlayAnim(pedid, 'amb@world_human_drinking_fat@beer@male@idle_a', 'idle_a', 8.0, -8, -1, 16, 0, 0, 0, 0)
			RemoveAnimDict("amb@world_human_drinking_fat@beer@male@idle_a")
			Citizen.Wait(5000)
			ClearPedTasks(ped)
		end)
	end
end)

RegisterNetEvent('player_state:eat')
AddEventHandler('player_state:eat', function()
	ped = GetPlayerPed(-1)
	if ped then
		Citizen.CreateThread(function()
			RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
		    local pedid = PlayerPedId()
			TaskPlayAnim(pedid, 'amb@code_human_wander_eating_donut@male@idle_a', 'idle_c', 8.0, -8, -1, 16, 0, 0, 0, 0)
			RemoveAnimDict("amb@code_human_wander_eating_donut@male@idle_a")
			Citizen.Wait(5000)
			ClearPedTasks(ped)
		end)
	end
end)

RegisterNetEvent('player_state:pee')
AddEventHandler('player_state:pee', function()
	ped = GetPlayerPed(-1)
	local hashSkin = GetHashKey("mp_m_freemode_01")
	if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
		if ped then
			if(GetEntityModel(GetPlayerPed(-1)) ~= hashSkin) then
				TriggerEvent('poop:caca')
			else
			TriggerEvent('pee:pipi')
			end
		end
	else
		TriggerEvent("es_freeroam:notify", "CHAR_MP_STRIPCLUB_PR", 1, "Mairie", false, "ca serai pas mieux en dehors du vehicule?")
	end
end)

RegisterNetEvent('pee:pipi')
AddEventHandler('pee:pipi', function()
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
  bone   = GetPedBoneIndex(GetPlayerPed(-1), 11816)
  TaskPlayAnim(GetPlayerPed(-1), animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
  RemoveAnimDict(animDictionary)
  effect = StartParticleFxLoopedOnPedBone(particleName, GetPlayerPed(-1), 0.0, 0.0, -0.1, 90.0, 90.0, 20.0, bone, 2.0, false, false, false);
  Wait(5500)
  StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent('poop:caca')
AddEventHandler('poop:caca', function()
  local particleDictionary = "scr_amb_chop"
  local particleName = "ent_anim_dog_poo"
  local animDictionary = 'switch@trevor@on_toilet'
  local animName = 'trev_on_toilet_exit'

  RequestNamedPtfxAsset(particleDictionary)
  while not HasNamedPtfxAssetLoaded(particleDictionary) do
     Citizen.Wait(0)
  end

  RequestAnimDict(animDictionary)

  while not HasAnimDictLoaded(animDictionary) do
    Citizen.Wait(0)
  end

  SetPtfxAssetNextCall(particleDictionary)
  bone   = GetPedBoneIndex(GetPlayerPed(-1), 11816)

  TaskPlayAnim(GetPlayerPed(-1), animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
  RemoveAnimDict(animDictionary)
  effect = StartParticleFxLoopedOnPedBone(particleName, GetPlayerPed(-1), 0.0, -0.9, -0.5, 0.0, 0.0, 20.0, bone, 2.0, false, false, false);
  Wait(2000)
  StopParticleFxLooped(effect, 0)
end)



local activehud = true
local hudactivationnotbool = false

RegisterNetEvent('hud:active')
AddEventHandler('hud:active',function()
	
	if not hudactivationnotbool then
		hudactivationnotbool = true
		activehud = false
	else
		hudactivationnotbool = false
		activehud = true
	end
end)

--Citizen.CreateThread(function()
--	while true do
--		Citizen.Wait(500)
--		if IsPauseMenuActive() or not activehud then
--			if not pauseactivated then
--				SendNUIMessage({ setDisplay = true,	opacityIcon = 0, state = json.encode({food = localfood, water = localwater, needs = localwc, status = true})})
--			end
--			pauseactivated = true
--		elseif pauseactivated then
--			SendNUIMessage({ setDisplay = true,	opacityIcon = 1, state = json.encode({food = localfood, water = localwater, needs = localwc, status = true})})
--			pauseactivated = false
--		end
--	end
--end)
Citizen.CreateThread(function()
	while true do
		if initialized then
			TriggerServerEvent('player_state:check')
			Citizen.Wait(600000) -- 120000
		else
			Citizen.Wait(1000)
			TriggerServerEvent('player_state:check')
			initialized = true
		end
	end
end)