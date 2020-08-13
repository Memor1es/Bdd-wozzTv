local currentPed = nil

local currentPos = nil



Citizen.CreateThread(function()

	while true do

		currentPed = GetPlayerPed(-1)

		currentPos = GetEntityCoords(currentPed, false)

		Citizen.Wait(500)

	end

end)



local normalShopOpen = false

local nBurgershotAvailable = 0



local normalItems = 

{

	{label = "Sandwich",	itemID = 30,	price = 90},

	{label = "Eau",			itemID = 6,		price = 90},

	{label = "Recycleur", itemID = 72, price = 1000},

}



local blackMarketItems = 

{

	{label = "Zip Tie",				itemID = 60,	price = 100},

	{label = "Sac tete",			itemID = 66,	price = 500},

	{label = "Silencieux",			itemID = 70,	price = 3000},

	{label = "Chargeur",			itemID = 71,	price = 5000},

}



local normalShops = 

{

	{ myBlip = nil, display = true, ['x'] = 1961.1140136719, ['y'] = 3741.4494628906, ['z'] = 32.34375 },

	{ myBlip = nil, display = true, ['x'] = 1392.4129638672, ['y'] = 3604.47265625, ['z'] = 34.980926513672 },

	{ myBlip = nil, display = true, ['x'] = 546.98962402344, ['y'] = 2670.3176269531, ['z'] = 42.156539916992 },

	{ myBlip = nil, display = true, ['x'] = 2556.2534179688, ['y'] = 382.876953125, ['z'] = 108.62294769287 },

	{ myBlip = nil, display = true, ['x'] = -1821.9542236328, ['y'] = 792.40191650391, ['z'] = 138.13920593262 },

	{ myBlip = nil, display = false, ['x'] = -1223.6690673828, ['y'] = -906.67517089844, ['z'] = 12.326356887817 },

	{ myBlip = nil, display = true, ['x'] = -708.19256591797, ['y'] = -914.65264892578, ['z'] = 19.215591430664 },

	{ myBlip = nil, display = true, ['x'] = 26.419162750244, ['y'] = -1347.5804443359, ['z'] = 29.497024536133 },

	{ myBlip = nil, display = true, ['x'] = 1729.24, ['y'] = 6415.23, ['z'] = 35.0372 },

	{ myBlip = nil, display = true, ['x'] = 1698.56, ['y'] = 4924.24, ['z'] = 42.063 },

	{ myBlip = nil, display = true, ['x'] = -3242.78, ['y'] = 1001.47, ['z'] = 12.8307 },

	{ myBlip = nil, display = true, ['x'] = 462.16864013672, ['y'] = -700.75634765625, ['z'] = 27.38307762146 },

	{ myBlip = nil, display = true, ['x'] = -2967.85861206055, ['y'] = 391.25134277344, ['z'] = 15.492092132568},

	{ myBlip = nil, display = true, ['x'] = -48.85861206055, ['y'] = -1757.25134277344, ['z'] = 29.492092132568},

	{ myBlip = nil, display = true, ['x'] = 1136.85861206055, ['y'] = -982.25134277344, ['z'] = 46.492092132568},

	{ myBlip = nil, display = true, ['x'] = 2678.85861206055, ['y'] = 3282.25134277344, ['z'] = 55.492092132568},

	{ myBlip = nil, display = true, ['x'] = 1166.85861206055, ['y'] = 2710.25134277344, ['z'] = 38.492092132568},

	{ myBlip = nil, display = true, ['x'] = -3039.85861206055, ['y'] = 587.25134277344, ['z'] = 7.492092132568},

	--{ myBlip = nil, display = true, ['x'] = 265.0213, ['y'] = -784.8311, ['z'] = 30.48}, -- Parking central

	{ myBlip = nil, display = false, ['x'] = 290.07135, ['y'] = -3172.6235, ['z'] = 7.246150}, -- Car race

}



local blackmarketShops = 

{

	{ myBlip = nil, display = false, ['x'] = 19.08965, ['y'] = -2745.678, ['z'] = 11.69000 },

}



function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end



function DisplayBlips()

	for k,v in ipairs(normalShops)do

		RemoveBlip(v.myBlip)

		v.myBlip = nil

	end



	for k,v in ipairs(normalShops)do

		if v.display then

			v.myBlip = AddBlipForCoord(v.x, v.y, v.z)

			SetBlipSprite(v.myBlip, 52)

			SetBlipScale(v.myBlip, 0.8)

			SetBlipAsShortRange(v.myBlip, true)

			BeginTextCommandSetBlipName("STRING")

			AddTextComponentString("Magasin d'alimentation")

			EndTextCommandSetBlipName(v.myBlip)

		end

	end

end



function RemoveBlips()

	for k,v in ipairs(normalShops)do

		if v.display then

			RemoveBlip(v.myBlip)

			v.myBlip = nil

		end

	end

end



Citizen.CreateThread(function()

	Citizen.Wait(7500)

	

	DisplayBlips()



	while true do

		Citizen.Wait(0)



		for k,v in ipairs(normalShops) do

			if(Vdist(v.x, v.y, v.z, currentPos.x, currentPos.y, currentPos.z) < 20.0)then

				DrawMarker(25, v.x, v.y, v.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 108, 182, 255, 50, 0, 0, 2, 0, 0, 0, 0)



				if not normalShopOpen then

					if(Vdist(v.x, v.y, v.z, currentPos.x, currentPos.y, currentPos.z) < 1.5)then

						if nBurgershotAvailable > 0 then

							DisplayHelpText("Les stocks sont epuises, veuillez contacter le Burgershot")

						else

							DisplayHelpText("~INPUT_CONTEXT~ Ouvrir la superette")

							if(IsControlJustReleased(1, 51))then

								normalShopOpen = true

							end

						end

					end

				end

			end

		end



		for k,v in ipairs(blackmarketShops) do

				if(Vdist(v.x, v.y, v.z, currentPos.x, currentPos.y, currentPos.z) < 20.0)then

					
					DrawMarker(25, v.x, v.y, v.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 108, 182, 255, 50, 0, 0, 2, 0, 0, 0, 0)



					if not blackMarketOpen then

						if(Vdist(v.x, v.y, v.z, currentPos.x, currentPos.y, currentPos.z) < 1.5)then

							DisplayHelpText("~INPUT_CONTEXT~ Ouvrir le marcher noir")

							if(IsControlJustReleased(1, 51))then

								blackMarketOpen = true

							end

						end

					end

				end

		end

		

	end

end)



local currentItemIndex = 1

local qty = 1



local currentItemIndexMarcheNoir = 1

local qtyMarcheNoir = 1

Citizen.CreateThread(function()

	while true do

		Citizen.Wait(0)



		if normalShopOpen then

			local isInRange = false

			for k,v in ipairs(normalShops) do

				if(Vdist(v.x, v.y, v.z, currentPos.x, currentPos.y, currentPos.z) < 2.0)then

					isInRange = true

				end

			end



			if isInRange then

				DisplayHelpText("Superette\n~INPUT_FRONTEND_UP~ x" .. qty .. " " .. normalItems[currentItemIndex].label .. " ~INPUT_REPLAY_ADVANCE~ " .. normalItems[currentItemIndex].price * qty .. "$ ~INPUT_CONTEXT~")

				if IsControlJustPressed(0, 51) then

					for i = 1, qty do

						TriggerServerEvent('avanyashop:testprix', normalItems[currentItemIndex].itemID, normalItems[currentItemIndex].price)

						Citizen.Wait(500)

					end

				end

				if IsControlJustPressed(0, 307) then

					currentItemIndex = currentItemIndex + 1



					if currentItemIndex > 3 then

						currentItemIndex = 1

					end

				end

				if IsControlJustPressed(0, 308) then

					currentItemIndex = currentItemIndex - 1



					if currentItemIndex == 0 then

						currentItemIndex = 3

					end

				end



				if IsControlJustPressed(0, 188) then

					qty = qty + 1

				end

				if IsControlJustPressed(0, 187) then

					qty = qty - 1

					if qty < 1 then qty = 1 end

				end

			else

				normalShopOpen = false

			end

		end



		if blackMarketOpen then

			local isInRange = false

			for k,v in ipairs(blackmarketShops) do

				if(Vdist(v.x, v.y, v.z, currentPos.x, currentPos.y, currentPos.z) < 2.0)then

					isInRange = true

				end

			end



			if isInRange then

				DisplayHelpText("Marche noir\n~INPUT_FRONTEND_UP~ x" .. qtyMarcheNoir .. " " .. blackMarketItems[currentItemIndexMarcheNoir].label .. " ~INPUT_REPLAY_ADVANCE~ " .. blackMarketItems[currentItemIndexMarcheNoir].price * qtyMarcheNoir .. "$ ~INPUT_CONTEXT~")

				if IsControlJustPressed(0, 51) then

					for i = 1, qtyMarcheNoir do

						TriggerServerEvent('avanyashop:testprix', blackMarketItems[currentItemIndexMarcheNoir].itemID, blackMarketItems[currentItemIndexMarcheNoir].price)

						Citizen.Wait(500)

					end

				end

				if IsControlJustPressed(0, 307) then

					currentItemIndexMarcheNoir = currentItemIndexMarcheNoir + 1



					if currentItemIndexMarcheNoir > 4 then

						currentItemIndexMarcheNoir = 1

					end

				end

				if IsControlJustPressed(0, 308) then

					currentItemIndexMarcheNoir = currentItemIndexMarcheNoir - 1



					if currentItemIndexMarcheNoir == 0 then

						currentItemIndexMarcheNoir = 4

					end

				end



				if IsControlJustPressed(0, 188) then

					qtyMarcheNoir = qtyMarcheNoir + 1

				end

				if IsControlJustPressed(0, 187) then

					qtyMarcheNoir = qtyMarcheNoir - 1

					if qtyMarcheNoir < 1 then qtyMarcheNoir = 1 end

				end

			else

				blackMarketOpen = false

			end

		end

	end

end)

RegisterNetEvent("avanyashop:getItem")
AddEventHandler("avanyashop:getItem", function(item)
	TriggerEvent('player:receiveItem',item,1)
end)