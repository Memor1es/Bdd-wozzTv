local function deleteVehicle()

    if vehicle ~= nil then

        DeleteVehicle(vehicle)

        vehicle = nil

    end

end



RegisterNetEvent('utils:VehicleSpawn')

AddEventHandler('utils:VehicleSpawn', function(vehicleName)

	deleteVehicle()

    -- Verifie que le vehicule existe bien dans GTA

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then

		

		TriggerEvent('chat:addMessage', {

			args = { "Oups, le vehicule : " .. vehicleName .. " n'existe pas!" }

		})



        return

    end



    -- Charge le model

    RequestModel(vehicleName)



	print(vehicleName)

	print(GetHashKey(vehicleName))



    -- Patiente pendant le chargement du model

    while not HasModelLoaded(vehicleName) do

        Wait(500)

    end



    local playerPed = PlayerPedId()

    local pos = GetEntityCoords(playerPed)



    -- Creer le vehicule

    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

	DecorRegister("Avanya", 2)

	DecorSetBool(vehicle, "Avanya", true)



    -- Place le joueur dans le vehicule

    SetPedIntoVehicle(playerPed, vehicle, -1)



	-- SetEntityAsNoLongerNeeded(vehicle)

	SetModelAsNoLongerNeeded(vehicleName)



	return

end)