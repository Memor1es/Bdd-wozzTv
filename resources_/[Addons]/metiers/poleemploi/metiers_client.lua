	

Drawing = setmetatable({}, Drawing)

Drawing.__index = Drawing



	function DisplayHelpText(str)

		SetTextComponentFormat("STRING")

		AddTextComponentString(str)

		DisplayHelpTextFromStringLabel(0, 0, 1, -1)

	end



	function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)

		local px,py,pz=table.unpack(GetGameplayCamCoords())

		local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)



		local scale = (1/dist)*20

		local fov = (1/GetGameplayCamFov())*100

		local scale = scale*fov



		SetTextScale(scaleX*scale, scaleY*scale)

		SetTextFont(fontId)

		SetTextProportional(1)

		SetTextColour(r, g, b, a)

		SetTextDropshadow(0, 0, 0, 0, 255)

		SetTextEdge(2, 0, 0, 0, 150)

		SetTextDropShadow()

		SetTextOutline()

		SetTextEntry("STRING")

		SetTextCentre(1)

		AddTextComponentString(textInput)

		SetDrawOrigin(x,y,z+2, 0)

		DrawText(0.0, 0.0)

		ClearDrawOrigin()

	end



	function metier_callSE(id)

		Menu.hidden = not Menu.hidden

		TriggerServerEvent("metiers:jobs", id)

	end

	

	function menuJobsChomeur()

		local MenujobsList = {

			{name="Joaillier", id=18},

			{name="Pecheur", id=10},

			{name="Taxi", id=17},

			--{name="Burgershot", id=98},

			--{name ="Brinks", id=99},

			--{name="Pompiste", id=26},

		    --{name="Fermier", id=6},

			--{name="Bucheron", id=7},

			--{name="Mineur", id=9},

			--{name="Brasseur", id=12},

			--{name="Vigneron", id=13},

			--{name="Bar", id=19},

			--{name="Evenementiel", id=100},

			--{name="Journaliste", id=101},

			--{name="Patron-burgershot", id=102},

			--{name="Patron-mécano", id=103},

			--{name="Patron-evenementiel", id=104},

			--{name="Patron-journaliste", id=105},

			--{name="Patron-bar", id=106},

			--{name="Patron-brinks", id=107},

		}

		MenuTitle = "Metiers"

		ClearMenu()

		for _, item in pairs(MenujobsList) do

			Menu.addButton(item.name, "metier_callSE", item.id)

		end

	end



	function menuJobs()

		local MenujobsList = {

			{name="Démissionner", id=1}

		}

		MenuTitle = "Metiers"

		ClearMenu()

		for _, item in pairs(MenujobsList) do

			Menu.addButton(item.name, "metier_callSE", item.id)

		end

	end

	

	function IsNearPlaces()

		local playerCoords = GetEntityCoords(GetPlayerPed(-1), 0)

		for _, item in pairs(metiers_blips) do

			if(Vdist(playerCoords["x"], playerCoords["y"], playerCoords["z"], item.x, item.y, item.z) < 20.0)then

				DrawMarker(25, item.x, item.y, item.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 168, 183, 50, 0, 0, 0,0)

				if(Vdist(playerCoords["x"], playerCoords["y"], playerCoords["z"], item.x, item.y, item.z) < 5.0)then

					Drawing.draw3DText(item.x, item.y, item.z - 0.5, "choisir son metier", 1, 0.2, 0.1, 0, 168, 183, 215)

					if(Vdist(playerCoords["x"], playerCoords["y"], playerCoords["z"],  item.x, item.y, item.z) < 2.0)then

						return true

					end

				end

			end

		end

	end

	

	RegisterNetEvent('metiers:defineJobMenu')

	AddEventHandler('metiers:defineJobMenu', function(jobId)

		if jobId == 1 then

			menuJobsChomeur()

		else  	

			menuJobs()

		end

	end)

	

	RegisterNetEvent('metiers:getmyjob')

	AddEventHandler('metiers:getmyjob', function(id)

		TriggerServerEvent("metiers:jobs", id)

	end)
	

	local currentJob = ""

	RegisterNetEvent('metiers:updateJob')

	AddEventHandler('metiers:updateJob', function(nameJob)

		local id = PlayerId()

		local playerName = GetPlayerName(id)

		

		currentJob = nameJob



		SendNUIMessage({

			updateJob = true,

			job = nameJob,

			player = playerName,

			needHide = false

		})

	end)



	RegisterNetEvent('metiers:hideHud')

	AddEventHandler('metiers:hideHud', function(isJobHidden)

		local id = PlayerId()

		local playerName = GetPlayerName(id)

		SendNUIMessage({

			updateJob = true,

			job = currentJob,

			player = playerName,

			needHide = isHidden

		})

	end)

	

	Citizen.CreateThread( function()	

		for key, item in pairs(metiers_blips) do

			local blip = AddBlipForCoord(item.x, item.y, item.z)

			SetBlipSprite(blip, item.id)

			SetBlipAsShortRange(blip, true)

			SetBlipColour(blip, 1)

			BeginTextCommandSetBlipName("STRING")

			AddTextComponentString(key)

			EndTextCommandSetBlipName(blip)

		end

		while true do

			Citizen.Wait(5)	

			if (IsNearPlaces() == true) then		

				DisplayHelpText("~INPUT_CONTEXT~ pour selectionner un ~b~metier")

				if IsControlJustPressed(1, 51) then

					Menu.hidden = not Menu.hidden 

					TriggerServerEvent('metiers:isChomeur')

				end

				Menu.renderGUI()

			end

		end

	end)

	

	