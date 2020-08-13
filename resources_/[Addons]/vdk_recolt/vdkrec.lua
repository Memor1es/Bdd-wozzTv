--Variables
local recoltDistance = 5
local timeForRecolt = 5000 --1000 for 1 second
--
nbPolice = 0
local near
local jobId
JOBS = {}

RegisterNetEvent("jobs:getJobs")
RegisterNetEvent("cli:getJobs")
RegisterNetEvent("recolt:getcop")

-- Get the list of all jobs in the database and create the blip associated
AddEventHandler("cli:getJobs", function(listJobs)
    JOBS = listJobs
    --Citizen.CreateThread(function()
    --    for _, item in pairs(JOBS) do
	--		print("Raw id : "  .. item.raw_id .. " x : " .. item.fx .. " y : " .. item.fy .. " z : " .. item.fz)
    --    end
    --end)
end)

-- Control if the player of is near of a place of job
function IsNear()
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)
    for k, item in ipairs(JOBS) do
        local distance_field = GetDistanceBetweenCoords(item.fx, item.fy, item.fz, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
        local distance_treatment = GetDistanceBetweenCoords(item.tx, item.ty, item.tz, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
        local distance_seller = GetDistanceBetweenCoords(item.sx, item.sy, item.sz, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
        if (distance_field <= recoltDistance) then
            jobId = k
            return 'field'
        elseif (distance_treatment <= recoltDistance) then
            jobId = k
            return 'treatment'
        elseif (distance_seller <= recoltDistance) then
            jobId = k
            return 'seller'
        end
    end
end

function recolt(text, rl)
    if (text == 'Récolte') then
        TriggerEvent("mt:missiontext", "Tentative de recolte de ~g~" .. tostring(JOBS[jobId].raw_item) .. '~s~...', timeForRecolt - 800)
        Citizen.Wait(timeForRecolt - 800)
		TriggerEvent("player:receiveItem", tonumber(JOBS[jobId].raw_id), 1, false)
        TriggerEvent("mt:missiontext", rl .. ' ~g~' .. tostring(JOBS[jobId].raw_item) .. '~s~...', 800)
  --[[  elseif (text == 'Traitement') then
        TriggerEvent("mt:missiontext", "Tentative de traitement de ~g~" .. tostring(JOBS[jobId].raw_item) .. '~s~...', timeForRecolt - 800)
        Citizen.Wait(timeForRecolt - 800)
		TriggerEvent("player:looseItem", tonumber(JOBS[jobId].raw_id), 1, false)
        TriggerEvent("player:receiveItem", tonumber(JOBS[jobId].treat_id), 1, false)
        TriggerEvent("mt:missiontext", rl .. ' ~g~' .. tostring(JOBS[jobId].treat_item) .. '~s~...', 800)]]
    elseif (text == 'Vente') then
			TriggerEvent("mt:missiontext", text .. ' en cours de ~g~' .. tostring(JOBS[jobId].raw_item) .. '~s~...', timeForRecolt - 800)
			
			Citizen.Wait(timeForRecolt - 800)
			
			local price = tonumber(JOBS[jobId].price)
			TriggerEvent("player:sellItemSale", tonumber(JOBS[jobId].raw_id), tonumber(math.floor(price)))
			TriggerEvent("mt:missiontext", rl .. ' ~g~' .. tostring(JOBS[jobId].raw_item) .. '~s~...', 800)
    end
    Citizen.Wait(800)
end

function setBlip(x, y, z, num)
    local blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, tonumber(num))
    SetBlipAsShortRange(blip, true)
end

local iscop

Citizen.CreateThread(function()
	Citizen.Wait(60000)
	if exports.metiers:getIsCop() then
	    iscop = true
	end
end)

local PlayerPedId = PlayerPedId

-- Constantly check the position of the player
Citizen.CreateThread(function()
	TriggerServerEvent("jobs:getJobs")

    Citizen.Wait(5000)

    while true do
        Citizen.Wait(10)
		if iscop then
		    break
		end

        near = IsNear()
        if (near == 'field') then
			if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
				RequestAnimDict("pickup_object")
				while not HasAnimDictLoaded("pickup_object") do
					Citizen.Wait(0)
				end
	
				local myPed = PlayerPedId()
				local flags = 16 -- only play the animation on the upper body
				TaskPlayAnim(myPed, "pickup_object", "pickup_low", 8.0, -8, -1, flags, 0, 0, 0, 0)
				RemoveAnimDict("pickup_object")

				recolt('Récolte', '+1')
			end
        elseif (near == 'treatment') then
			if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
				recolt('Traitement', '+1')
			end
        elseif (near == 'seller') then
			if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
				recolt('Vente', '-1')
			end
        end
    end
end)
			
			
function Chat(debugg)
    TriggerEvent("chatMessage", '', { 0, 0x99, 255 }, tostring(debugg))
end