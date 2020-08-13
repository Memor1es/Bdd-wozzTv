local isAfamilies = false

local blipQGfamilies

local blipAreafamilies

local chestPosfamilies = { ['x'] = 113.52129, ['y'] = -1970.612, ['z'] = 20.3276 }

local qgPosfamilies = { ['x'] = -178.3437, ['y'] = -1594.314, ['z'] = 34.47992 }

local kevlarList = 

{

	{name = "Aucun", drawableIndex = 0, textureIndex = 0},

	-- {name = "Basique", drawableIndex = 11, textureIndex = 1},

	-- {name = "Moyen", drawableIndex = 12, textureIndex = 0},

	{name = "Lourd", drawableIndex = 27, textureIndex = 5},

}



local currentKevlarIndex = 1



local kevlarPos = {x = -167.6751, y = -1534.63, z = 37.32977} -- families

function OpenChestfamilies()

	MenuChestfamilies.initMenu()

	MenuChestfamilies.isOpen = not MenuChestfamilies.isOpen

end


function DisplayBlipfamilies()

	blipQGfamilies = AddBlipForCoord(qgPosfamilies.x, qgPosfamilies.y, qgPosfamilies.z)

	SetBlipSprite(blipQGfamilies, 445)

	SetBlipScale(blipQGfamilies, 1.1)

	SetBlipAsShortRange(blipQGfamilies, true)

	BeginTextCommandSetBlipName("STRING")

	AddTextComponentString("Families")

	EndTextCommandSetBlipName(blipQGfamilies)
	
	-- Area blipQGfamilies

	blipAreafamilies = AddBlipForRadius(qgPosfamilies.x, qgPosfamilies.y, qgPosfamilies.z, 145.0)

	SetBlipSprite(blipAreafamilies, 9)

	SetBlipAlpha(blipAreafamilies, 100)

	SetBlipColour(blipAreafamilies, 52)

end

Citizen.CreateThread(function()

	Citizen.Wait(15000)

	DisplayBlipfamilies()

	while true do

		if isAfamilies then

			DisplayOnScreen("Families", 0.90, 0.22)



			if(Vdist(chestPosfamilies.x, chestPosfamilies.y, chestPosfamilies.z, currentPos.x, currentPos.y, currentPos.z) < 20.0) then

				DrawMarker(25, chestPosfamilies.x, chestPosfamilies.y, chestPosfamilies.z + 0.025, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0,0, 0,0)

				if(Vdist(chestPosfamilies.x, chestPosfamilies.y, chestPosfamilies.z, currentPos.x, currentPos.y, currentPos.z) < 1.5) then

					DisplayHelpText("~INPUT_CONTEXT~ Coffre de gang")

					if(IsControlJustReleased(1, 51))then

						OpenChestfamilies()

					end

					if MenuChestfamilies.isOpen then

						MenuChestfamilies.draw()

						MenuChestfamilies.keyControl()

					end

				end

			end



			if(Vdist(kevlarPos.x, kevlarPos.y, kevlarPos.z, currentPos.x, currentPos.y, currentPos.z) < 20.0) then

				DrawMarker(25, kevlarPos.x, kevlarPos.y, kevlarPos.z + 0.025, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0,0, 0,0)

				if(Vdist(kevlarPos.x, kevlarPos.y, kevlarPos.z, currentPos.x, currentPos.y, currentPos.z) < 1.2) then

					DisplayHelpText("~INPUT_CONTEXT~ Porter un gilet : " .. kevlarList[currentKevlarIndex].name .. " ~INPUT_REPLAY_ADVANCE~")

					if(IsControlJustReleased(1, 51))then

						if currentKevlarIndex == 1 then

							SetPedArmour(GetPlayerPed(-1), 0)

						else

							SetPedArmour(GetPlayerPed(-1), 100)

						end

						if (GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) then

							SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(kevlarList[currentKevlarIndex].drawableIndex), tonumber(kevlarList[currentKevlarIndex].textureIndex), 2)

						else

							SetPedComponentVariation(GetPlayerPed(-1), 9, 9, 1, 2)

						end

					end



					if (IsControlJustReleased(1, 307)) then

						currentKevlarIndex = currentKevlarIndex + 1

						if currentKevlarIndex > #kevlarList then

							currentKevlarIndex = 1

						end

					end

					if (IsControlJustReleased(1, 308)) then

						currentKevlarIndex = currentKevlarIndex - 1

						if currentKevlarIndex < 1 then

							currentKevlarIndex = #kevlarList

						end

					end

				end

			end



			Citizen.Wait(0)

		else

			Citizen.Wait(5000)

		end

	end

end)



RegisterNetEvent("families:setInfos")

AddEventHandler("families:setInfos", function(data)

	isAfamilies = true

end)

RegisterNetEvent("families:receiveIsfamilies")

AddEventHandler('families:receiveIsfamilies', function(result)

	if(result == "inconnu") then

		isAfamilies = false

	else

		isAfamilies = true

		identifier = result

	end


end)



RegisterNetEvent("families:removeGang")

AddEventHandler("families:removeGang", function(data)

	isAfamilies = false

end)



RegisterNetEvent("families:moneyAdd")

AddEventHandler("families:moneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('families:addMoneyServer', value, 0)

	end

end)



RegisterNetEvent("families:moneyRem")

AddEventHandler("families:moneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0  then

		TriggerServerEvent('families:removeMoneyServer', value, 0)

	end

end)



RegisterNetEvent("families:dirtyMoneyAdd")

AddEventHandler("families:dirtyMoneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('families:addDirtyMoneyServer', 0, value)

	end

end)





RegisterNetEvent("families:dirtyMoneyRem")

AddEventHandler("families:dirtyMoneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('families:removeDirtyMoneyServer', 0, value)

	end

end)



RegisterNetEvent("families:moneyShow")

AddEventHandler("families:moneyShow", function(data)

	TriggerServerEvent('families:getMoneyInfos')

end)

----------------------------------------

currentPed = nil

currentPos = nil



function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end



function GetValue()

	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8S", "", "", "", "", "", 20)

	while (UpdateOnscreenKeyboard() == 0) do

		DisableAllControlActions(0);

		Wait(0);

	end

	if (GetOnscreenKeyboardResult()) then

		local res = tonumber(GetOnscreenKeyboardResult())

		if(res ~= nil and res ~= 0) then 

			return res		

		end

	end

	return 0

end



local isVisible = true

function DisplayOnScreen(componentName, posX, posY)

	if isVisible then

		SetTextFont(0)

		SetTextProportional(1)

		SetTextScale(0.5, 0.5)

		SetTextColour(255, 255, 255, 255)

		SetTextDropShadow(0, 0, 0, 0,255)

		SetTextEdge(1, 0, 0, 0, 255)

		SetTextDropShadow()

		SetTextOutline()

		SetTextEntry("STRING")

		AddTextComponentString(componentName)

		DrawText(posX, posY)

	end

end



Citizen.CreateThread(function()

	Citizen.Wait(15000)

	

	while true do

		TriggerServerEvent('families:checkIsfamilies')

		local randomWaitBetweenGang = math.random(60000, 120000)

		Citizen.Wait(randomWaitBetweenGang)

	end

end)



RegisterNetEvent("gang:hideScreen")

AddEventHandler("gang:hideScreen", function()

	isVisible = not isVisible

end)



Citizen.CreateThread(function()

	while true do

		currentPed = GetPlayerPed(-1)

		currentPos = GetEntityCoords(currentPed, false)

		Citizen.Wait(500)

	end

end)

--

MenuChestfamilies = {}

MenuChestfamilies.item = {

    ['Title'] = 'Coffre des families',

    ['Items'] = {

        {['Title'] = 'Argent propre', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent propre',			

                ['Items'] = {

                    { ['Title'] = 'Deposer', ['EventBuy'] = 'families:moneyAdd', ['Close'] = true},

                    { ['Title'] = 'Retirer', ['EventBuy'] = 'families:moneyRem', ['Close'] = true},

				}

            }

        },

		{['Title'] = 'Argent sale', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent sale',			

                ['Items'] = {

					{ ['Title'] = 'Deposer', ['EventBuy'] = 'families:dirtyMoneyAdd', ['Close'] = true},

					{ ['Title'] = 'Retirer', ['EventBuy'] = 'families:dirtyMoneyRem', ['Close'] = true},

				}																														   

			}																																 

        },

		{['Title'] = 'Consulter', ['EventBuy'] = 'families:moneyShow',	['Close'] = false},

    }

}







--====================================================================================

--  Option Menu

--====================================================================================

MenuChestfamilies.backgroundColor = { 0, 0, 0, 125 }

MenuChestfamilies.backgroundColorActive = { 179, 71, 0, 255 }

MenuChestfamilies.tileTextColor = { 255, 255, 255, 255 }

MenuChestfamilies.tileBackgroundColor = { 255, 102, 0, 255 }

MenuChestfamilies.textColor = { 255,255,255,255 }

MenuChestfamilies.textColorActive = { 255,255,255, 255 }



MenuChestfamilies.keyOpenMenu = 170 -- F3    

MenuChestfamilies.keyUp = 172 -- PhoneUp

MenuChestfamilies.keyDown = 173 -- PhoneDown

MenuChestfamilies.keyLeft = 174 -- PhoneLeft || Not use next release Maybe 

MenuChestfamilies.keyRight =	175 -- PhoneRigth || Not use next release Maybe 

MenuChestfamilies.keySelect = 176 -- PhoneSelect

MenuChestfamilies.KeyCancel = 177 -- PhoneCancel



MenuChestfamilies.posX = 0.17

MenuChestfamilies.posY = 0.018



MenuChestfamilies.ItemWidth = 0.19

MenuChestfamilies.ItemHeight = 0.03



MenuChestfamilies.isOpen = false   -- /!\ Ne pas toucher

MenuChestfamilies.currentPos = {1} -- /!\ Ne pas toucher



--====================================================================================

--  Menu System

--====================================================================================



function MenuChestfamilies.drawRect(posX, posY, width, heigh, color)

    DrawRect(posX + width / 2, posY + heigh / 2, width, heigh, color[1], color[2], color[3], color[4])

end



function MenuChestfamilies.initText(textColor, font, scale)

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



function MenuChestfamilies.draw() 

    -- Draw Rect

    local pos = 0

    local lMenuChestfamilies = MenuChestfamilies.getCurrentMenu()

    local selectValue = MenuChestfamilies.currentPos[#MenuChestfamilies.currentPos]

    local nbItem = #lMenuChestfamilies.Items

    -- draw background title & title

    MenuChestfamilies.drawRect(MenuChestfamilies.posX, MenuChestfamilies.posY , MenuChestfamilies.ItemWidth, MenuChestfamilies.ItemHeight * 2, MenuChestfamilies.tileBackgroundColor)    

    MenuChestfamilies.initText(MenuChestfamilies.tileTextColor, 4, 0.7)

    AddTextComponentString(lMenuChestfamilies.Title)

    DrawText(MenuChestfamilies.posX + MenuChestfamilies.ItemWidth/2, MenuChestfamilies.posY)



    -- draw bakcground items

    MenuChestfamilies.drawRect(MenuChestfamilies.posX, MenuChestfamilies.posY + MenuChestfamilies.ItemHeight * 2, MenuChestfamilies.ItemWidth, MenuChestfamilies.ItemHeight + (nbItem-1)*MenuChestfamilies.ItemHeight, MenuChestfamilies.backgroundColor)

    -- draw all items

    for pos, value in pairs(lMenuChestfamilies.Items) do

        if pos == selectValue then

            MenuChestfamilies.drawRect(MenuChestfamilies.posX, MenuChestfamilies.posY + MenuChestfamilies.ItemHeight * (1+pos), MenuChestfamilies.ItemWidth, MenuChestfamilies.ItemHeight, MenuChestfamilies.backgroundColorActive)

            MenuChestfamilies.initText(MenuChestfamilies.textColorActive)

        else

            MenuChestfamilies.initText(MenuChestfamilies.textColor)

        end

        AddTextComponentString(value.Title)

        DrawText(MenuChestfamilies.posX + MenuChestfamilies.ItemWidth/2, MenuChestfamilies.posY + MenuChestfamilies.ItemHeight * (pos+1))

    end

    

end



function MenuChestfamilies.getCurrentMenu()

    local currentMenu = MenuChestfamilies.item

    for i=1, #MenuChestfamilies.currentPos - 1 do

        local val = MenuChestfamilies.currentPos[i]

        currentMenu = currentMenu.Items[val].SubMenu

    end

    return currentMenu

end



function MenuChestfamilies.initMenu()

    MenuChestfamilies.currentPos = {1}

end



function MenuChestfamilies.keyControl()

    if IsControlJustPressed(1, MenuChestfamilies.keyDown) then 

        local cMenu = MenuChestfamilies.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestfamilies.currentPos

        MenuChestfamilies.currentPos[slcp] = (MenuChestfamilies.currentPos[slcp] % size) + 1



		local cSelect = MenuChestfamilies.currentPos[#MenuChestfamilies.currentPos]

        local cMenu = MenuChestfamilies.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestfamilies.keyUp) then 

        local cMenu = MenuChestfamilies.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestfamilies.currentPos

        MenuChestfamilies.currentPos[slcp] = ((MenuChestfamilies.currentPos[slcp] - 2 + size) % size) + 1



		local cSelect = MenuChestfamilies.currentPos[#MenuChestfamilies.currentPos]

        local cMenu = MenuChestfamilies.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestfamilies.KeyCancel) then 

        table.remove(MenuChestfamilies.currentPos)

        if #MenuChestfamilies.currentPos == 0 then

            MenuChestfamilies.isOpen = false 

        end



    elseif IsControlJustPressed(1, MenuChestfamilies.keySelect)  then

        local cSelect = MenuChestfamilies.currentPos[#MenuChestfamilies.currentPos]

        local cMenu = MenuChestfamilies.getCurrentMenu()

        if cMenu.Items[cSelect].SubMenu ~= nil then

            MenuChestfamilies.currentPos[#MenuChestfamilies.currentPos + 1] = 1

        else

            if cMenu.Items[cSelect].Function ~= nil then

                cMenu.Items[cSelect].Function(cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].EventBuy ~= nil then

                TriggerEvent(cMenu.Items[cSelect].EventBuy, cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].Close == nil or cMenu.Items[cSelect].Close == true then

                MenuChestfamilies.isOpen = false

            end

        end



		local cSelect = MenuChestfamilies.currentPos[#MenuChestfamilies.currentPos]

        local cMenu = MenuChestfamilies.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end

    end



end




