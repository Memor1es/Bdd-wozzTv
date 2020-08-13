local isAgoto = false

local blipQGgoto

local blipAreagoto

--local chestPosgoto = { ['x'] = 113.52129, ['y'] = -1970.612, ['z'] = 20.3276 }

local qgPosgoto = { ['x'] = -953.5475, ['y'] = 188.4476, ['z'] = 66.59413 }

local kevlarList = 

{

	{name = "Aucun", drawableIndex = 0, textureIndex = 0},

	{name = "Basique", drawableIndex = 11, textureIndex = 1},

	{name = "Moyen", drawableIndex = 12, textureIndex = 0},

	{name = "Lourd", drawableIndex = 27, textureIndex = 5},

}



local currentKevlarIndex = 1



local kevlarPos = {x = -941.5101, y = 199.6468, z = 66.86489} -- goto

--[[function OpenChestgoto()

	MenuChestgoto.initMenu()

	MenuChestgoto.isOpen = not MenuChestgoto.isOpen

end]]


function DisplayBlipgoto()

	blipQGgoto = AddBlipForCoord(qgPosgoto.x, qgPosgoto.y, qgPosgoto.z)

	SetBlipSprite(blipQGgoto, 437)

	SetBlipScale(blipQGgoto, 1.4)

	SetBlipAsShortRange(blipQGgoto, true)

	BeginTextCommandSetBlipName("STRING")

	AddTextComponentString("Goto")

	EndTextCommandSetBlipName(blipQGgoto)
	
	-- Area blipQGgoto

	blipAreagoto = AddBlipForRadius(qgPosgoto.x, qgPosgoto.y, qgPosgoto.z, 145.0)

	SetBlipSprite(blipAreagoto, 9)

	SetBlipAlpha(blipAreagoto, 100)

	SetBlipColour(blipAreagoto, 4)

end

Citizen.CreateThread(function()

	Citizen.Wait(15000)

	DisplayBlipgoto()

	while true do

		if isAgoto then

			DisplayOnScreen("Goto", 0.90, 0.22)



			--[[if(Vdist(chestPosgoto.x, chestPosgoto.y, chestPosgoto.z, currentPos.x, currentPos.y, currentPos.z) < 20.0) then

				DrawMarker(25, chestPosgoto.x, chestPosgoto.y, chestPosgoto.z + 0.025, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0,0, 0,0)

				if(Vdist(chestPosgoto.x, chestPosgoto.y, chestPosgoto.z, currentPos.x, currentPos.y, currentPos.z) < 1.5) then

					DisplayHelpText("~INPUT_CONTEXT~ Coffre de gang")

					if(IsControlJustReleased(1, 51))then

						OpenChestgoto()

					end

					if MenuChestgoto.isOpen then

						MenuChestgoto.draw()

						MenuChestgoto.keyControl()

					end

				end

			end]]



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



RegisterNetEvent("goto:setInfos")

AddEventHandler("goto:setInfos", function(data)

	isAgoto = true

end)

RegisterNetEvent("goto:receiveIsgoto")

AddEventHandler('goto:receiveIsgoto', function(result)

	if(result == "inconnu") then

		isAgoto = false

	else

		isAgoto = true

		identifier = result

	end


end)



RegisterNetEvent("goto:removeGang")

AddEventHandler("goto:removeGang", function(data)

	isAgoto = false

end)



RegisterNetEvent("goto:moneyAdd")

AddEventHandler("goto:moneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('goto:addMoneyServer', value, 0)

	end

end)



RegisterNetEvent("goto:moneyRem")

AddEventHandler("goto:moneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0  then

		TriggerServerEvent('goto:removeMoneyServer', value, 0)

	end

end)



RegisterNetEvent("goto:dirtyMoneyAdd")

AddEventHandler("goto:dirtyMoneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('goto:addDirtyMoneyServer', 0, value)

	end

end)





RegisterNetEvent("goto:dirtyMoneyRem")

AddEventHandler("goto:dirtyMoneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('goto:removeDirtyMoneyServer', 0, value)

	end

end)



RegisterNetEvent("goto:moneyShow")

AddEventHandler("goto:moneyShow", function(data)

	TriggerServerEvent('goto:getMoneyInfos')

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

		TriggerServerEvent('goto:checkIsgoto')

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

MenuChestgoto = {}

MenuChestgoto.item = {

    ['Title'] = 'Coffre des Goto',

    ['Items'] = {

        {['Title'] = 'Argent propre', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent propre',			

                ['Items'] = {

                    { ['Title'] = 'Deposer', ['EventBuy'] = 'goto:moneyAdd', ['Close'] = true},

                    { ['Title'] = 'Retirer', ['EventBuy'] = 'goto:moneyRem', ['Close'] = true},

				}

            }

        },

		{['Title'] = 'Argent sale', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent sale',			

                ['Items'] = {

					{ ['Title'] = 'Deposer', ['EventBuy'] = 'goto:dirtyMoneyAdd', ['Close'] = true},

					{ ['Title'] = 'Retirer', ['EventBuy'] = 'goto:dirtyMoneyRem', ['Close'] = true},

				}																														   

			}																																 

        },

		{['Title'] = 'Consulter', ['EventBuy'] = 'goto:moneyShow',	['Close'] = false},

    }

}







--====================================================================================

--  Option Menu

--====================================================================================

MenuChestgoto.backgroundColor = { 0, 0, 0, 125 }

MenuChestgoto.backgroundColorActive = { 179, 71, 0, 255 }

MenuChestgoto.tileTextColor = { 255, 255, 255, 255 }

MenuChestgoto.tileBackgroundColor = { 255, 102, 0, 255 }

MenuChestgoto.textColor = { 255,255,255,255 }

MenuChestgoto.textColorActive = { 255,255,255, 255 }



MenuChestgoto.keyOpenMenu = 170 -- F3    

MenuChestgoto.keyUp = 172 -- PhoneUp

MenuChestgoto.keyDown = 173 -- PhoneDown

MenuChestgoto.keyLeft = 174 -- PhoneLeft || Not use next release Maybe 

MenuChestgoto.keyRight =	175 -- PhoneRigth || Not use next release Maybe 

MenuChestgoto.keySelect = 176 -- PhoneSelect

MenuChestgoto.KeyCancel = 177 -- PhoneCancel



MenuChestgoto.posX = 0.17

MenuChestgoto.posY = 0.018



MenuChestgoto.ItemWidth = 0.19

MenuChestgoto.ItemHeight = 0.03



MenuChestgoto.isOpen = false   -- /!\ Ne pas toucher

MenuChestgoto.currentPos = {1} -- /!\ Ne pas toucher



--====================================================================================

--  Menu System

--====================================================================================



function MenuChestgoto.drawRect(posX, posY, width, heigh, color)

    DrawRect(posX + width / 2, posY + heigh / 2, width, heigh, color[1], color[2], color[3], color[4])

end



function MenuChestgoto.initText(textColor, font, scale)

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



function MenuChestgoto.draw() 

    -- Draw Rect

    local pos = 0

    local lMenuChestgoto = MenuChestgoto.getCurrentMenu()

    local selectValue = MenuChestgoto.currentPos[#MenuChestgoto.currentPos]

    local nbItem = #lMenuChestgoto.Items

    -- draw background title & title

    MenuChestgoto.drawRect(MenuChestgoto.posX, MenuChestgoto.posY , MenuChestgoto.ItemWidth, MenuChestgoto.ItemHeight * 2, MenuChestgoto.tileBackgroundColor)    

    MenuChestgoto.initText(MenuChestgoto.tileTextColor, 4, 0.7)

    AddTextComponentString(lMenuChestgoto.Title)

    DrawText(MenuChestgoto.posX + MenuChestgoto.ItemWidth/2, MenuChestgoto.posY)



    -- draw bakcground items

    MenuChestgoto.drawRect(MenuChestgoto.posX, MenuChestgoto.posY + MenuChestgoto.ItemHeight * 2, MenuChestgoto.ItemWidth, MenuChestgoto.ItemHeight + (nbItem-1)*MenuChestgoto.ItemHeight, MenuChestgoto.backgroundColor)

    -- draw all items

    for pos, value in pairs(lMenuChestgoto.Items) do

        if pos == selectValue then

            MenuChestgoto.drawRect(MenuChestgoto.posX, MenuChestgoto.posY + MenuChestgoto.ItemHeight * (1+pos), MenuChestgoto.ItemWidth, MenuChestgoto.ItemHeight, MenuChestgoto.backgroundColorActive)

            MenuChestgoto.initText(MenuChestgoto.textColorActive)

        else

            MenuChestgoto.initText(MenuChestgoto.textColor)

        end

        AddTextComponentString(value.Title)

        DrawText(MenuChestgoto.posX + MenuChestgoto.ItemWidth/2, MenuChestgoto.posY + MenuChestgoto.ItemHeight * (pos+1))

    end

    

end



function MenuChestgoto.getCurrentMenu()

    local currentMenu = MenuChestgoto.item

    for i=1, #MenuChestgoto.currentPos - 1 do

        local val = MenuChestgoto.currentPos[i]

        currentMenu = currentMenu.Items[val].SubMenu

    end

    return currentMenu

end



function MenuChestgoto.initMenu()

    MenuChestgoto.currentPos = {1}

end



function MenuChestgoto.keyControl()

    if IsControlJustPressed(1, MenuChestgoto.keyDown) then 

        local cMenu = MenuChestgoto.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestgoto.currentPos

        MenuChestgoto.currentPos[slcp] = (MenuChestgoto.currentPos[slcp] % size) + 1



		local cSelect = MenuChestgoto.currentPos[#MenuChestgoto.currentPos]

        local cMenu = MenuChestgoto.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestgoto.keyUp) then 

        local cMenu = MenuChestgoto.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestgoto.currentPos

        MenuChestgoto.currentPos[slcp] = ((MenuChestgoto.currentPos[slcp] - 2 + size) % size) + 1



		local cSelect = MenuChestgoto.currentPos[#MenuChestgoto.currentPos]

        local cMenu = MenuChestgoto.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestgoto.KeyCancel) then 

        table.remove(MenuChestgoto.currentPos)

        if #MenuChestgoto.currentPos == 0 then

            MenuChestgoto.isOpen = false 

        end



    elseif IsControlJustPressed(1, MenuChestgoto.keySelect)  then

        local cSelect = MenuChestgoto.currentPos[#MenuChestgoto.currentPos]

        local cMenu = MenuChestgoto.getCurrentMenu()

        if cMenu.Items[cSelect].SubMenu ~= nil then

            MenuChestgoto.currentPos[#MenuChestgoto.currentPos + 1] = 1

        else

            if cMenu.Items[cSelect].Function ~= nil then

                cMenu.Items[cSelect].Function(cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].EventBuy ~= nil then

                TriggerEvent(cMenu.Items[cSelect].EventBuy, cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].Close == nil or cMenu.Items[cSelect].Close == true then

                MenuChestgoto.isOpen = false

            end

        end



		local cSelect = MenuChestgoto.currentPos[#MenuChestgoto.currentPos]

        local cMenu = MenuChestgoto.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end

    end



end




