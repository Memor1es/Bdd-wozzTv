local isAgarduna = false

local blipAreagarduna
local blipQGgarduna

local chestPosgarduna = { ['x'] = -1865.604, ['y'] = -2061.167, ['z'] = 135.4344 }
local qgPosgarduna = { ['x'] = 95.3324, ['y'] = -1810.800, ['z'] = 29.4584 }

local kevlarList = 

{

	{name = "Aucun", drawableIndex = 0, textureIndex = 0},

	-- {name = "Basique", drawableIndex = 11, textureIndex = 1},

	-- {name = "Moyen", drawableIndex = 12, textureIndex = 0},

	{name = "Lourd", drawableIndex = 27, textureIndex = 5},

}



local currentKevlarIndex = 1



local kevlarPos = {x = -1871.091, y = 2057.741, z = 135.45} -- garduna

function OpenChestgarduna()

	MenuChestgarduna.initMenu()

	MenuChestgarduna.isOpen = not MenuChestgarduna.isOpen

end

function DisplayBlipgarduna()

	blipQGgarduna = AddBlipForCoord(qgPosgarduna.x, qgPosgarduna.y, qgPosgarduna.z)

	SetBlipSprite(blipQGgarduna, 382)

	SetBlipScale(blipQGgarduna, 1.4)

	SetBlipAsShortRange(blipQGgarduna, true)

	BeginTextCommandSetBlipName("STRING")

	AddTextComponentString("garduna")

	EndTextCommandSetBlipName(blipQGgarduna)
	
	-- Area blipQGgarduna

	blipAreagarduna = AddBlipForRadius(qgPosgarduna.x, qgPosgarduna.y, qgPosgarduna.z, 145.0)

	SetBlipSprite(blipAreagarduna, 9)

	SetBlipAlpha(blipAreagarduna, 80)

	SetBlipColour(blipAreagarduna, 83)

end




Citizen.CreateThread(function()

	Citizen.Wait(15000)

	DisplayBlipgarduna()

	while true do

		if isAgarduna then

			DisplayOnScreen("garduna", 0.90, 0.22)



			if(Vdist(chestPosgarduna.x, chestPosgarduna.y, chestPosgarduna.z, currentPos.x, currentPos.y, currentPos.z) < 20.0) then

				DrawMarker(25, chestPosgarduna.x, chestPosgarduna.y, chestPosgarduna.z + 0.025, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0,0, 0,0)

				if(Vdist(chestPosgarduna.x, chestPosgarduna.y, chestPosgarduna.z, currentPos.x, currentPos.y, currentPos.z) < 1.5) then

					DisplayHelpText("~INPUT_CONTEXT~ Coffre de gang")

					if(IsControlJustReleased(1, 51))then

						OpenChestgarduna()

					end

					if MenuChestgarduna.isOpen then

						MenuChestgarduna.draw()

						MenuChestgarduna.keyControl()

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



RegisterNetEvent("garduna:setInfos")

AddEventHandler("garduna:setInfos", function(data)

	isAgarduna = true

end)

RegisterNetEvent("garduna:receiveIsgarduna")

AddEventHandler('garduna:receiveIsgarduna', function(result)

	if(result == "inconnu") then

		isAgarduna = false

	else

		isAgarduna = true

		identifier = result

	end


end)



RegisterNetEvent("garduna:removeGang")

AddEventHandler("garduna:removeGang", function(data)

	isAgarduna = false

end)



RegisterNetEvent("garduna:moneyAdd")

AddEventHandler("garduna:moneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('garduna:addMoneyServer', value, 0)

	end

end)



RegisterNetEvent("garduna:moneyRem")

AddEventHandler("garduna:moneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0  then

		TriggerServerEvent('garduna:removeMoneyServer', value, 0)

	end

end)



RegisterNetEvent("garduna:dirtyMoneyAdd")

AddEventHandler("garduna:dirtyMoneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('garduna:addDirtyMoneyServer', 0, value)

	end

end)





RegisterNetEvent("garduna:dirtyMoneyRem")

AddEventHandler("garduna:dirtyMoneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('garduna:removeDirtyMoneyServer', 0, value)

	end

end)



RegisterNetEvent("garduna:moneyShow")

AddEventHandler("garduna:moneyShow", function(data)

	TriggerServerEvent('garduna:getMoneyInfos')

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

		TriggerServerEvent('garduna:checkIsgarduna')

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

MenuChestgarduna = {}

MenuChestgarduna.item = {

    ['Title'] = 'Coffre des garduna',

    ['Items'] = {

        {['Title'] = 'Argent propre', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent propre',			

                ['Items'] = {

                    { ['Title'] = 'Deposer', ['EventBuy'] = 'garduna:moneyAdd', ['Close'] = true},

                    { ['Title'] = 'Retirer', ['EventBuy'] = 'garduna:moneyRem', ['Close'] = true},

				}

            }

        },

		{['Title'] = 'Argent sale', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent sale',			

                ['Items'] = {

					{ ['Title'] = 'Deposer', ['EventBuy'] = 'garduna:dirtyMoneyAdd', ['Close'] = true},

					{ ['Title'] = 'Retirer', ['EventBuy'] = 'garduna:dirtyMoneyRem', ['Close'] = true},

				}																														   

			}																																 

        },

		{['Title'] = 'Consulter', ['EventBuy'] = 'garduna:moneyShow',	['Close'] = false},

    }

}







--====================================================================================

--  Option Menu

--====================================================================================

MenuChestgarduna.backgroundColor = { 0, 0, 0, 125 }

MenuChestgarduna.backgroundColorActive = { 179, 71, 0, 255 }

MenuChestgarduna.tileTextColor = { 255, 255, 255, 255 }

MenuChestgarduna.tileBackgroundColor = { 255, 102, 0, 255 }

MenuChestgarduna.textColor = { 255,255,255,255 }

MenuChestgarduna.textColorActive = { 255,255,255, 255 }



MenuChestgarduna.keyOpenMenu = 170 -- F3    

MenuChestgarduna.keyUp = 172 -- PhoneUp

MenuChestgarduna.keyDown = 173 -- PhoneDown

MenuChestgarduna.keyLeft = 174 -- PhoneLeft || Not use next release Maybe 

MenuChestgarduna.keyRight =	175 -- PhoneRigth || Not use next release Maybe 

MenuChestgarduna.keySelect = 176 -- PhoneSelect

MenuChestgarduna.KeyCancel = 177 -- PhoneCancel



MenuChestgarduna.posX = 0.17

MenuChestgarduna.posY = 0.018



MenuChestgarduna.ItemWidth = 0.19

MenuChestgarduna.ItemHeight = 0.03



MenuChestgarduna.isOpen = false   -- /!\ Ne pas toucher

MenuChestgarduna.currentPos = {1} -- /!\ Ne pas toucher



--====================================================================================

--  Menu System

--====================================================================================



function MenuChestgarduna.drawRect(posX, posY, width, heigh, color)

    DrawRect(posX + width / 2, posY + heigh / 2, width, heigh, color[1], color[2], color[3], color[4])

end



function MenuChestgarduna.initText(textColor, font, scale)

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



function MenuChestgarduna.draw() 

    -- Draw Rect

    local pos = 0

    local lMenuChestgarduna = MenuChestgarduna.getCurrentMenu()

    local selectValue = MenuChestgarduna.currentPos[#MenuChestgarduna.currentPos]

    local nbItem = #lMenuChestgarduna.Items

    -- draw background title & title

    MenuChestgarduna.drawRect(MenuChestgarduna.posX, MenuChestgarduna.posY , MenuChestgarduna.ItemWidth, MenuChestgarduna.ItemHeight * 2, MenuChestgarduna.tileBackgroundColor)    

    MenuChestgarduna.initText(MenuChestgarduna.tileTextColor, 4, 0.7)

    AddTextComponentString(lMenuChestgarduna.Title)

    DrawText(MenuChestgarduna.posX + MenuChestgarduna.ItemWidth/2, MenuChestgarduna.posY)



    -- draw bakcground items

    MenuChestgarduna.drawRect(MenuChestgarduna.posX, MenuChestgarduna.posY + MenuChestgarduna.ItemHeight * 2, MenuChestgarduna.ItemWidth, MenuChestgarduna.ItemHeight + (nbItem-1)*MenuChestgarduna.ItemHeight, MenuChestgarduna.backgroundColor)

    -- draw all items

    for pos, value in pairs(lMenuChestgarduna.Items) do

        if pos == selectValue then

            MenuChestgarduna.drawRect(MenuChestgarduna.posX, MenuChestgarduna.posY + MenuChestgarduna.ItemHeight * (1+pos), MenuChestgarduna.ItemWidth, MenuChestgarduna.ItemHeight, MenuChestgarduna.backgroundColorActive)

            MenuChestgarduna.initText(MenuChestgarduna.textColorActive)

        else

            MenuChestgarduna.initText(MenuChestgarduna.textColor)

        end

        AddTextComponentString(value.Title)

        DrawText(MenuChestgarduna.posX + MenuChestgarduna.ItemWidth/2, MenuChestgarduna.posY + MenuChestgarduna.ItemHeight * (pos+1))

    end

    

end



function MenuChestgarduna.getCurrentMenu()

    local currentMenu = MenuChestgarduna.item

    for i=1, #MenuChestgarduna.currentPos - 1 do

        local val = MenuChestgarduna.currentPos[i]

        currentMenu = currentMenu.Items[val].SubMenu

    end

    return currentMenu

end



function MenuChestgarduna.initMenu()

    MenuChestgarduna.currentPos = {1}

end



function MenuChestgarduna.keyControl()

    if IsControlJustPressed(1, MenuChestgarduna.keyDown) then 

        local cMenu = MenuChestgarduna.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestgarduna.currentPos

        MenuChestgarduna.currentPos[slcp] = (MenuChestgarduna.currentPos[slcp] % size) + 1



		local cSelect = MenuChestgarduna.currentPos[#MenuChestgarduna.currentPos]

        local cMenu = MenuChestgarduna.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestgarduna.keyUp) then 

        local cMenu = MenuChestgarduna.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestgarduna.currentPos

        MenuChestgarduna.currentPos[slcp] = ((MenuChestgarduna.currentPos[slcp] - 2 + size) % size) + 1



		local cSelect = MenuChestgarduna.currentPos[#MenuChestgarduna.currentPos]

        local cMenu = MenuChestgarduna.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestgarduna.KeyCancel) then 

        table.remove(MenuChestgarduna.currentPos)

        if #MenuChestgarduna.currentPos == 0 then

            MenuChestgarduna.isOpen = false 

        end



    elseif IsControlJustPressed(1, MenuChestgarduna.keySelect)  then

        local cSelect = MenuChestgarduna.currentPos[#MenuChestgarduna.currentPos]

        local cMenu = MenuChestgarduna.getCurrentMenu()

        if cMenu.Items[cSelect].SubMenu ~= nil then

            MenuChestgarduna.currentPos[#MenuChestgarduna.currentPos + 1] = 1

        else

            if cMenu.Items[cSelect].Function ~= nil then

                cMenu.Items[cSelect].Function(cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].EventBuy ~= nil then

                TriggerEvent(cMenu.Items[cSelect].EventBuy, cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].Close == nil or cMenu.Items[cSelect].Close == true then

                MenuChestgarduna.isOpen = false

            end

        end



		local cSelect = MenuChestgarduna.currentPos[#MenuChestgarduna.currentPos]

        local cMenu = MenuChestgarduna.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end

    end



end




