local teleportPos = 

{

	{ needAsk = false, name1="Entrer dans l'armurerie", x = 451.8954, y = -982.6629, z = 29.6896, name2="Sortir de l'armurerie", x2 = 454.3387, y2 = -982.4656, z2 = 29.6896},

	{ needAsk = true, name1="Descendre", x = -75.721, y = -826.93, z = 242.3858, name2="Monter", x2 = -70.92, y2 = -801.096, z2 = 43.22},

	{ needAsk = true, name1="Descendre du toit", x = -75.41, y = -824.9234, z = 320.2919, name2="Monter sur le toit", x2 = -78.31702, y2 = -829.5018, z2 = 242.3858},

	{ needAsk = true, name1="Descendre au garage", x = -77.43102, y = -826.4904, z = 242.3859, name2="Monter", x2 = -84.46953, y2 = -822.4301, z2 = 35.02803},

	{ needAsk = false, name1="Entrer dans le local", x = -1569.44140625, y = -425.3200378418, z = 37.5, name2="Sortir du local", x2 = -1570.9266357422, y2 = -426.92770385742, z2 = 37.5},

	{ needAsk = false, name1="Entrer dans la maison", x = -152.3795928955, y = 911.3369140625, z = 234.65557861328, name2="Sortir de la maison", x2 = -786.8663, y2 = 315.7642, z2 = 216.6385},

	{ needAsk = true, name1="Descendre", x = -1579.677, y = -565.0689, z = 107.5229, name2="Monter", x2 = -1581.4193115234, y2 = -557.91821289062, z2 = 33.953102111816},

	{ needAsk = true, name1="Monter sur le toit", x = -1577.968, y = -563.8351, z = 107.5229, name2="Descendre", x2 = -1570.2042236, y2 = -576.3468627, z2 = 113.4484100341},

	{ needAsk = false, name1="Rentrer dans l'appart", x = 342.374, y = -2075.4196, z = 19.93869, name2="Sortir de l'appart", x2 = 266.0168457, y2 = -1007.29089, z2 = -102.0085},

	{ needAsk = true, name1="Monter sur le toit", x = -9.936, y = 530.99, z = 169.617, name2="Descendre du toit", x2 = 26.7228, y2 = 545.171, z2 = 178.5587},

	{ needAsk = false, name1="Rentrer dans la cellule", x = -2673.279, y = 1326.37, z = 144.2577, name2="Sortir de la cellule", x2 = -2674.89, y2 = 1326.042, z2 =  144.2577},

	{ needAsk = false, name1="Prendre l'echelle", x = -155.832, y = 888.6982, z = 241.200378, name2="Descendre l'echelle", x2 = -154.62355, y2 = 887.4578857, z2 = 238.020309448},

	{ needAsk = false, name1="Monter a l'heliport", x = 2483.5371, y = -350.853118, z = 92.73506, name2="Descendre", x2 = 2504.77172, y2 = -339.82199, z2 = 117.02440},

	{ needAsk = false, name1="Rentrer dans le garage", x = 194.384979248, y = -1024.20568847, z = -99.99993896, name2="Sortir du garage", x2 = 315.394561767, y2 = -1104.8344726, z2 = 28.40332031},

	{ needAsk = true, name1="Rentrer dans le sous-marin", x = 3149.833, y = 2218.951, z = 3.034796, name2="Sortir du sous-marin", x2 = 516.7464, y2 = 4827.05, z2 = -62.58655},

	{ needAsk = false, name1="Entrer dans l'appart", x = 513.979248, y = -1780.92797, z = 27.913978, name2="Sortir de l'appart", x2 = 346.526947, y2 = -1012.6984, z2 = -100.19617},



	{ needAsk = false, name1="Decendre - Humane labs", x = 3541.7028, y = 3674.2761, z = 28.1211, name2="Monter - Humane labs", x2 = 3541.7314, y2 = 3674.2619, z2 = 20.9917},

	{ needAsk = false, name1="Monter - Arcadius Buisiness", x = -117.2135, y = -604.5497, z = 36.2807, name2="Decendre - Arcadius Buisiness", x2 = -134.0843, y2 = -584.5471, z2 = 201.7355},

	{ needAsk = true, name1="Monter - Bureau du FIB", x = 136.0994, y = -761.8452, z = 45.7520, name2="Decendre - Bureau du FIB", x2 = 136.7892, y2 = -761.4996, z2 = 242.1518},

	{ needAsk = true,  name1="Entrer - Agence de d�tective", x = -1011.65, y = -480.061, z = 38.9706, name2="Sortir - Agence de d�tective", x2 = -1002.81, y2 = -477.794, z2 = 49.0273},

	{ needAsk = false, name1="Entrer - FIB", x = 105.15348, y = -744.5685, z = 44.75476, name2="Sortir - FIB", x2 = 107.29998, y2 = -744.83062, z2 = 44.7547},

	{ needAsk = true, name1="Passage secret vers le bunker", x = 2939.42, y = 1468.93, z = -15.65292, name2="Reprendre le passage", x2 = 902.6841, y2 = -3182.355, z2 = -98.05678},

	{ needAsk = true, name1="Entrer dans le garage", x = 510.74816, y = -1951.47961, z = 23.9851, name2="Sortir du garage", x2 = 992.555, y2 = -3097.809, z2 = -39.9958},

	{ needAsk = true, name1="Sortir", x = 3832.605, y = 3664.766, z = -23.27225, name2="Entrer", x2 = 3834.564, y2 = 3669.056, z2 = -23.0239},

	{ needAsk = false, name1="Sortir", x = 997.4722, y = -3158.15, z = -39.9, name2="Entrer", x2 = 419.840, y2 = -2063.6577, z2 = 21.1175},

	{ needAsk = false, name1="Hopital top", x = 339.333, y = -584.1358, z = 73.165, name2="Hopital bottom", x2 = 329.6309, y2 = -600.8811, z2 = 42.284}, -- Helico

	{ needAsk = false, name1="Hopital top", x = 331.4966, y = -595.384, z = 42.2840, name2="Hopital bottom", x2 = 319.553, y2 = -559.933, z2 = 27.7434}, -- Garage voiture



	{ needAsk = false, name1="Monter", x = 10.13, y = -667.72, z = 32.449, name2="Descendre", x2 = 1.022, y2 = -702.70, z2 = 15.131},
	{ needAsk = true, name1="Entrer dans le Casino", x = 925.0, y = 47.0, z = 80.15, name2="Sortir du Casino", x2 = 1090.00, y2 = 207.00, z2 = -49.9}, --Casino entrer sortir
	{ needAsk = true, name1="Entrer dans la Zone VIP", x = 1085.969, y = 214.9149, z = -50.20, name2="Sortir de la Zone VIP", x2 = 980.00, y2 = 57.00, z2 = 115.30}, --Casino Carré VIP
    { needAsk = true, name1="Aller sur la terrasse", x = 969.6088, y = 63.0379, z = 111.5556, name2="Revenir dans la Zone VIP", x2 = 967.7839, y2 = 63.70856, z2 = 111.5556}, --ALLER SUR LA TERASSE
    { needAsk = true, name1="Sortir dans l'Acceuil", x = 1120.721, y = 221.9984, z = -50.4, name2="Aller dans l'Acceuil", x2 = 1120.911, y2 = 214.8438, z2 = -50.4}, --Sortir de l'acceuil


	--{ needAsk = false, name1="Sortir", x = -785.3962, y = -13.99, z = -17.77, name2="Sortir", x2 = -766.58, y2 = -23.989, z2 = 40.0799}, -- Eglise



	{ needAsk = false, name1="Entrer dans le gouvernement",  x = 2476.59, y = -384.0, z = 93.4, name2="Sortir", x2 =  440.242, y2 = 4823.40, z2 = -59.99},




	-- Gang apps

	--{ needAsk = false, name1="XX",  x = 132.8508, y = 271.2639, z = 108.9741, name2="XX", x2 = 997.52, y2 = -3200.74, z2 = -37.39},		-- Labo Meth

	{ needAsk = false, name1="XX",  x = 1546.07, y = 2166.53, z = 77.73, name2="XX", x2 = 1065.76, y2 = -3183.48, z2 = -40.16},			-- Labo weed

	--{ needAsk = false, name1="XX",  x = -949.3129, y = 196.4629, z = 66.39031, name2="XX", x2 = -787.0134, y2 = 315.7475, z2 = 186.9135},	-- Appart  - Goto

	--{ needAsk = false, name1="XX",  x = -957.8414, y = 204.2543, z = 66.74501, name2="XX", x2 = -947.3008, y2 = 195.1086, z2 = 70.16492}, -- Goto - Balcon

}



Drawing = setmetatable({}, Drawing)

Drawing.__index = Drawing



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

function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end


local opacity = 50



local hasDetect = false

Citizen.CreateThread(function()

	Citizen.Wait(2000)



	while true do

		hasDetect = false



		for _, item in pairs(teleportPos) do
			
			local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			local distance1 = GetDistanceBetweenCoords(item.x, item.y, item.z, x, y, z, true)

			if(distance1 < 5) then

				hasDetect = true

				DrawMarker(25, item.x, item.y, item.z + 0.01, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, opacity, 0, 0, 2, 0, 0, 0, 0)

			end

			--if(distance1 < 5) then

			--	Drawing.draw3DText(item.x, item.y, item.z - 1.100, item.name1, 1, 0.2, 0.1, 255, 255, 255, 215)

			--end

			if(distance1 < 1.2) then

				if item.needAsk then

					DisplayHelpText(item.name1 .. "  ~INPUT_CONTEXT~")

					if(IsControlJustReleased(1, 51))then

						DoScreenFadeOut(300)

						Citizen.Wait(300)

						SetEntityCoords(GetPlayerPed(-1), item.x2, item.y2, item.z2 + 0.5, 0, 0, 0, 0)

						--SetPedCoordsKeepVehicle(currentPed, item.x2, item.y2, item.z2 + 0.5)

						Citizen.Wait(300)

						DoScreenFadeIn(300)

					end

				else

					DoScreenFadeOut(300)

					Citizen.Wait(300)

					SetEntityCoords(GetPlayerPed(-1), item.x2, item.y2, item.z2 + 0.5, 0, 0, 0, 0)

					--SetPedCoordsKeepVehicle(currentPed, item.x2, item.y2, item.z2 + 0.5)

					Citizen.Wait(300)

					DoScreenFadeIn(300)

					Citizen.Wait(3000)

				end

			end



			local distance2 = GetDistanceBetweenCoords(item.x2, item.y2, item.z2, x, y, z, true)

			if(distance2 < 5) then

				hasDetect = true

				DrawMarker(25, item.x2, item.y2, item.z2 + 0.01, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, opacity, 0, 0, 2, 0, 0, 0, 0)

			end

			--if(distance2 < 5) then

			--	Drawing.draw3DText(item.x2, item.y2, item.z2 - 1.100, item.name2, 1, 0.2, 0.1, 255, 255, 255, 215)

			--end

			if(distance2 < 1.2) then

				if item.needAsk then

					DisplayHelpText(item.name2 .. "  ~INPUT_CONTEXT~")

					if(IsControlJustReleased(1, 51))then

						DoScreenFadeOut(300)

						Citizen.Wait(300)

						SetEntityCoords(GetPlayerPed(-1), item.x, item.y, item.z + 0.5, 0, 0, 0, 0)

						Citizen.Wait(300)

						DoScreenFadeIn(300)

					end

				else

					DoScreenFadeOut(300)

					Citizen.Wait(300)

					SetEntityCoords(GetPlayerPed(-1), item.x, item.y, item.z + 0.5, 0, 0, 0, 0)

					--SetPedCoordsKeepVehicle(currentPed, item.x, item.y, item.z + 0.5)

					Citizen.Wait(300)

					DoScreenFadeIn(300)

					Citizen.Wait(3000)

				end

			end

		end



		if hasDetect then

			Citizen.Wait(0)

		else

			Citizen.Wait(250)

		end

	end

end)