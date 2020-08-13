



MenuEventSpawn = {}

MenuEventSpawn.item = {

    ['Title'] = 'Menu Evenementiel',

    ['Items'] = {

        {['Title'] = 'Vehicules de fonction', ['SubMenu'] = {

            ['Title'] = 'Vehicule de fonction',			

                ['Items'] = {

					{['Title'] = 'Van',					['Function'] = spawnEventVehicle,	['VehicleName'] = "speedo2",	['Close'] = true},

					{['Title'] = 'Limousine',			['Function'] = spawnEventVehicle,	['VehicleName'] = "stretch",	['Close'] = true},

					{['Title'] = 'Corbillard',			['Function'] = spawnEventVehicle,	['VehicleName'] = "Romero",		['Close'] = true},

					{['Title'] = 'Bus de fete',			['Function'] = spawnEventVehicle,	['VehicleName'] = "pbus2",		['Close'] = true},

                    {['Title'] = 'Mini-Bus',			['Function'] = spawnEventVehicle,	['VehicleName'] = "tourbus",	['Close'] = true},

					{['Title'] = 'Helico - Buzzard',	['Function'] = spawnEventVehicle,	['VehicleName'] = "buzzard2",	['Close'] = true},

				}

            }

        },

		{['Title'] = "Vehicule d'evenement", ['SubMenu'] = {

            ['Title'] = "Vehicule d'evenement",			

                ['Items'] = {

					{['Title'] = "Vehicule marin", ['SubMenu'] = {

						['Title'] = "Vehicule marin",			

							['Items'] = {

								{['Title'] = 'Jetski',			['Function'] = spawnEventVehicle,	['VehicleName'] = "Seashark",		['Close'] = true},

								{['Title'] = 'Jetski 2',		['Function'] = spawnEventVehicle,	['VehicleName'] = "Seashark3",		['Close'] = true},

								{['Title'] = 'Marquis',			['Function'] = spawnEventVehicle,	['VehicleName'] = "marquis",		['Close'] = true},

								{['Title'] = 'Sous-marin',		['Function'] = spawnEventVehicle,	['VehicleName'] = "submersible2",	['Close'] = true},

							}																														   

						}																																 

					},



					{['Title'] = "Deux roues", ['SubMenu'] = {

						['Title'] = "Deux roues",			

							['Items'] = {

								{['Title'] = 'Cross - Sanchez 1',	['Function'] = spawnEventVehicle,	['VehicleName'] = "Sanchez",		['Close'] = true},

								{['Title'] = 'Cross - Sanchez 2',	['Function'] = spawnEventVehicle,	['VehicleName'] = "Sanchez2",		['Close'] = true},

								{['Title'] = 'Cross - BF400',		['Function'] = spawnEventVehicle,	['VehicleName'] = "BF400",			['Close'] = true},

								{['Title'] = 'BMX',					['Function'] = spawnEventVehicle,	['VehicleName'] = "BMX",			['Close'] = true},

								{['Title'] = 'Velo classique',		['Function'] = spawnEventVehicle,	['VehicleName'] = "cruiser",		['Close'] = true},

								{['Title'] = 'Velo course',			['Function'] = spawnEventVehicle,	['VehicleName'] = "TriBike3",		['Close'] = true},

							}																														   

						}																																 

					},



					{['Title'] = "Muscle car", ['SubMenu'] = {

						['Title'] = "Muscle car",			

							['Items'] = {

								{['Title'] = 'Dominator',		['Function'] = spawnEventVehicle,	['VehicleName'] = "Dominator2",	['Close'] = true},

								{['Title'] = 'Gauntlet',		['Function'] = spawnEventVehicle,	['VehicleName'] = "Gauntlet2",	['Close'] = true},

							}																														   

						}																																 

					},



					{['Title'] = "Tout terrain", ['SubMenu'] = {

						['Title'] = "Tout terrain",			

							['Items'] = {

								{['Title'] = 'Quad Blazer',		['Function'] = spawnEventVehicle,	['VehicleName'] = "Blazer4",		['Close'] = true},

								{['Title'] = 'Quad',			['Function'] = spawnEventVehicle,	['VehicleName'] = "blazer",			['Close'] = true},

							}																														   

						}																																 

					},



					{['Title'] = "Sportive", ['SubMenu'] = {

						['Title'] = "Sportive",			

							['Items'] = {

								{['Title'] = 'Buffalo 3',		['Function'] = spawnEventVehicle,	['VehicleName'] = "buffalo3",	['Close'] = true},

								{['Title'] = 'Omnis',			['Function'] = spawnEventVehicle,	['VehicleName'] = "omnis",		['Close'] = true},

							}																														   

						}																																 

					},



					{['Title'] = "Autres", ['SubMenu'] = {

						['Title'] = "Autres",			

							['Items'] = {

								{['Title'] = 'Caddy',				['Function'] = spawnEventVehicle,	['VehicleName'] = "caddy",		['Close'] = true},

								{['Title'] = 'Caddy 2',				['Function'] = spawnEventVehicle,	['VehicleName'] = "caddy2",		['Close'] = true},

								{['Title'] = 'Caddy 3',				['Function'] = spawnEventVehicle,	['VehicleName'] = "caddy3",		['Close'] = true},

								{['Title'] = 'Chariot elevateur',	['Function'] = spawnEventVehicle,	['VehicleName'] = "forklift",	['Close'] = true},

							}																														   

						}																																 

					},

				}																														   

			}																																 

        },

    }

}







--====================================================================================

--  Option Menu

--====================================================================================

MenuEventSpawn.backgroundColor = { 0, 0, 0, 125 }

MenuEventSpawn.backgroundColorActive = { 179, 71, 0, 255 }

MenuEventSpawn.tileTextColor = { 255, 255, 255, 255 }

MenuEventSpawn.tileBackgroundColor = { 255, 102, 0, 255 }

MenuEventSpawn.textColor = { 255,255,255,255 }

MenuEventSpawn.textColorActive = { 255,255,255, 255 }



MenuEventSpawn.keyOpenMenu = 170 -- F3    

MenuEventSpawn.keyUp = 172 -- PhoneUp

MenuEventSpawn.keyDown = 173 -- PhoneDown

MenuEventSpawn.keyLeft = 174 -- PhoneLeft || Not use next release Maybe 

MenuEventSpawn.keyRight =	175 -- PhoneRigth || Not use next release Maybe 

MenuEventSpawn.keySelect = 176 -- PhoneSelect

MenuEventSpawn.KeyCancel = 177 -- PhoneCancel



MenuEventSpawn.posX = 0.17

MenuEventSpawn.posY = 0.018



MenuEventSpawn.ItemWidth = 0.19

MenuEventSpawn.ItemHeight = 0.03



MenuEventSpawn.isOpen = false   -- /!\ Ne pas toucher

MenuEventSpawn.currentPos = {1} -- /!\ Ne pas toucher



--====================================================================================

--  Menu System

--====================================================================================



function MenuEventSpawn.drawRect(posX, posY, width, heigh, color)

    DrawRect(posX + width / 2, posY + heigh / 2, width, heigh, color[1], color[2], color[3], color[4])

end



function MenuEventSpawn.initText(textColor, font, scale)

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



function MenuEventSpawn.draw() 

    -- Draw Rect

    local pos = 0

    local lMenuEventSpawn = MenuEventSpawn.getCurrentMenu()

    local selectValue = MenuEventSpawn.currentPos[#MenuEventSpawn.currentPos]

    local nbItem = #lMenuEventSpawn.Items

    -- draw background title & title

    MenuEventSpawn.drawRect(MenuEventSpawn.posX, MenuEventSpawn.posY , MenuEventSpawn.ItemWidth, MenuEventSpawn.ItemHeight * 2, MenuEventSpawn.tileBackgroundColor)    

    MenuEventSpawn.initText(MenuEventSpawn.tileTextColor, 4, 0.7)

    AddTextComponentString(lMenuEventSpawn.Title)

    DrawText(MenuEventSpawn.posX + MenuEventSpawn.ItemWidth/2, MenuEventSpawn.posY)



    -- draw bakcground items

    MenuEventSpawn.drawRect(MenuEventSpawn.posX, MenuEventSpawn.posY + MenuEventSpawn.ItemHeight * 2, MenuEventSpawn.ItemWidth, MenuEventSpawn.ItemHeight + (nbItem-1)*MenuEventSpawn.ItemHeight, MenuEventSpawn.backgroundColor)

    -- draw all items

    for pos, value in pairs(lMenuEventSpawn.Items) do

        if pos == selectValue then

            MenuEventSpawn.drawRect(MenuEventSpawn.posX, MenuEventSpawn.posY + MenuEventSpawn.ItemHeight * (1+pos), MenuEventSpawn.ItemWidth, MenuEventSpawn.ItemHeight, MenuEventSpawn.backgroundColorActive)

            MenuEventSpawn.initText(MenuEventSpawn.textColorActive)

        else

            MenuEventSpawn.initText(MenuEventSpawn.textColor)

        end

        AddTextComponentString(value.Title)

        DrawText(MenuEventSpawn.posX + MenuEventSpawn.ItemWidth/2, MenuEventSpawn.posY + MenuEventSpawn.ItemHeight * (pos+1))

    end

    

end



function MenuEventSpawn.getCurrentMenu()

    local currentMenu = MenuEventSpawn.item

    for i=1, #MenuEventSpawn.currentPos - 1 do

        local val = MenuEventSpawn.currentPos[i]

        currentMenu = currentMenu.Items[val].SubMenu

    end

    return currentMenu

end



function MenuEventSpawn.initMenu()

    MenuEventSpawn.currentPos = {1}

end



function MenuEventSpawn.keyControl()

    if IsControlJustPressed(1, MenuEventSpawn.keyDown) then 

        local cMenu = MenuEventSpawn.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuEventSpawn.currentPos

        MenuEventSpawn.currentPos[slcp] = (MenuEventSpawn.currentPos[slcp] % size) + 1



		local cSelect = MenuEventSpawn.currentPos[#MenuEventSpawn.currentPos]

        local cMenu = MenuEventSpawn.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuEventSpawn.keyUp) then 

        local cMenu = MenuEventSpawn.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuEventSpawn.currentPos

        MenuEventSpawn.currentPos[slcp] = ((MenuEventSpawn.currentPos[slcp] - 2 + size) % size) + 1



		local cSelect = MenuEventSpawn.currentPos[#MenuEventSpawn.currentPos]

        local cMenu = MenuEventSpawn.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuEventSpawn.KeyCancel) then 

        table.remove(MenuEventSpawn.currentPos)

        if #MenuEventSpawn.currentPos == 0 then

            MenuEventSpawn.isOpen = false 

        end



    elseif IsControlJustPressed(1, MenuEventSpawn.keySelect)  then

        local cSelect = MenuEventSpawn.currentPos[#MenuEventSpawn.currentPos]

        local cMenu = MenuEventSpawn.getCurrentMenu()

        if cMenu.Items[cSelect].SubMenu ~= nil then

            MenuEventSpawn.currentPos[#MenuEventSpawn.currentPos + 1] = 1

        else

            if cMenu.Items[cSelect].Function ~= nil then

                cMenu.Items[cSelect].Function(cMenu.Items[cSelect].VehicleName)

            end

            if cMenu.Items[cSelect].Close == nil or cMenu.Items[cSelect].Close == true then

                MenuEventSpawn.isOpen = false

            end

        end

    end



end



