local isAballas = false

local blipAreaballas
local blipQGballas

local chestPosballas = { ['x'] = 113.52129, ['y'] = -1970.612, ['z'] = 20.3276 }
local qgPosballas = { ['x'] = 95.3324, ['y'] = -1810.800, ['z'] = 29.4584 }

local kevlarList = 

{

	{name = "Aucun", drawableIndex = 0, textureIndex = 0},

	-- {name = "Basique", drawableIndex = 11, textureIndex = 1},

	-- {name = "Moyen", drawableIndex = 12, textureIndex = 0},

	{name = "Lourd", drawableIndex = 27, textureIndex = 5},

}



local currentKevlarIndex = 1



local kevlarPos = {x = 109.568, y = -1981.918, z = 19.9626} -- BALLAS

function OpenChestballas()

	MenuChestballas.initMenu()

	MenuChestballas.isOpen = not MenuChestballas.isOpen

end

function DisplayBlipballas()

	blipQGballas = AddBlipForCoord(qgPosballas.x, qgPosballas.y, qgPosballas.z)

	SetBlipSprite(blipQGballas, 382)

	SetBlipScale(blipQGballas, 1.4)

	SetBlipAsShortRange(blipQGballas, true)

	BeginTextCommandSetBlipName("STRING")

	AddTextComponentString("Ballas")

	EndTextCommandSetBlipName(blipQGballas)
	
	-- Area blipQGballas

	blipAreaballas = AddBlipForRadius(qgPosballas.x, qgPosballas.y, qgPosballas.z, 145.0)

	SetBlipSprite(blipAreaballas, 9)

	SetBlipAlpha(blipAreaballas, 80)

	SetBlipColour(blipAreaballas, 83)

end




Citizen.CreateThread(function()

	Citizen.Wait(15000)

	DisplayBlipballas()

	while true do

		if isAballas then

			DisplayOnScreen("Ballas", 0.90, 0.22)



			if(Vdist(chestPosballas.x, chestPosballas.y, chestPosballas.z, currentPos.x, currentPos.y, currentPos.z) < 20.0) then

				DrawMarker(25, chestPosballas.x, chestPosballas.y, chestPosballas.z + 0.025, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0,0, 0,0)

				if(Vdist(chestPosballas.x, chestPosballas.y, chestPosballas.z, currentPos.x, currentPos.y, currentPos.z) < 1.5) then

					DisplayHelpText("~INPUT_CONTEXT~ Coffre de gang")

					if(IsControlJustReleased(1, 51))then

						OpenChestballas()

					end

					if MenuChestballas.isOpen then

						MenuChestballas.draw()

						MenuChestballas.keyControl()

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



RegisterNetEvent("ballas:setInfos")

AddEventHandler("ballas:setInfos", function(data)

	isAballas = true

end)

RegisterNetEvent("ballas:receiveIsBallas")

AddEventHandler('ballas:receiveIsBallas', function(result)

	if(result == "inconnu") then

		isAballas = false

	else

		isAballas = true

		identifier = result

	end


end)



RegisterNetEvent("ballas:removeGang")

AddEventHandler("ballas:removeGang", function(data)

	isAballas = false

end)



RegisterNetEvent("ballas:moneyAdd")

AddEventHandler("ballas:moneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('ballas:addMoneyServer', value, 0)

	end

end)



RegisterNetEvent("ballas:moneyRem")

AddEventHandler("ballas:moneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0  then

		TriggerServerEvent('ballas:removeMoneyServer', value, 0)

	end

end)



RegisterNetEvent("ballas:dirtyMoneyAdd")

AddEventHandler("ballas:dirtyMoneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('ballas:addDirtyMoneyServer', 0, value)

	end

end)





RegisterNetEvent("ballas:dirtyMoneyRem")

AddEventHandler("ballas:dirtyMoneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('ballas:removeDirtyMoneyServer', 0, value)

	end

end)



RegisterNetEvent("ballas:moneyShow")

AddEventHandler("ballas:moneyShow", function(data)

	TriggerServerEvent('ballas:getMoneyInfos')

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

		TriggerServerEvent('ballas:checkIsBallas')

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

MenuChestballas = {}

MenuChestballas.item = {

    ['Title'] = 'Coffre des ballas',

    ['Items'] = {

        {['Title'] = 'Argent propre', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent propre',			

                ['Items'] = {

                    { ['Title'] = 'Deposer', ['EventBuy'] = 'ballas:moneyAdd', ['Close'] = true},

                    { ['Title'] = 'Retirer', ['EventBuy'] = 'ballas:moneyRem', ['Close'] = true},

				}

            }

        },

		{['Title'] = 'Argent sale', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent sale',			

                ['Items'] = {

					{ ['Title'] = 'Deposer', ['EventBuy'] = 'ballas:dirtyMoneyAdd', ['Close'] = true},

					{ ['Title'] = 'Retirer', ['EventBuy'] = 'ballas:dirtyMoneyRem', ['Close'] = true},

				}																														   

			}																																 

        },

		{['Title'] = 'Consulter', ['EventBuy'] = 'ballas:moneyShow',	['Close'] = false},

    }

}







--====================================================================================

--  Option Menu

--====================================================================================

MenuChestballas.backgroundColor = { 0, 0, 0, 125 }

MenuChestballas.backgroundColorActive = { 179, 71, 0, 255 }

MenuChestballas.tileTextColor = { 255, 255, 255, 255 }

MenuChestballas.tileBackgroundColor = { 255, 102, 0, 255 }

MenuChestballas.textColor = { 255,255,255,255 }

MenuChestballas.textColorActive = { 255,255,255, 255 }



MenuChestballas.keyOpenMenu = 170 -- F3    

MenuChestballas.keyUp = 172 -- PhoneUp

MenuChestballas.keyDown = 173 -- PhoneDown

MenuChestballas.keyLeft = 174 -- PhoneLeft || Not use next release Maybe 

MenuChestballas.keyRight =	175 -- PhoneRigth || Not use next release Maybe 

MenuChestballas.keySelect = 176 -- PhoneSelect

MenuChestballas.KeyCancel = 177 -- PhoneCancel



MenuChestballas.posX = 0.17

MenuChestballas.posY = 0.018



MenuChestballas.ItemWidth = 0.19

MenuChestballas.ItemHeight = 0.03



MenuChestballas.isOpen = false   -- /!\ Ne pas toucher

MenuChestballas.currentPos = {1} -- /!\ Ne pas toucher



--====================================================================================

--  Menu System

--====================================================================================



function MenuChestballas.drawRect(posX, posY, width, heigh, color)

    DrawRect(posX + width / 2, posY + heigh / 2, width, heigh, color[1], color[2], color[3], color[4])

end



function MenuChestballas.initText(textColor, font, scale)

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



function MenuChestballas.draw() 

    -- Draw Rect

    local pos = 0

    local lMenuChestballas = MenuChestballas.getCurrentMenu()

    local selectValue = MenuChestballas.currentPos[#MenuChestballas.currentPos]

    local nbItem = #lMenuChestballas.Items

    -- draw background title & title

    MenuChestballas.drawRect(MenuChestballas.posX, MenuChestballas.posY , MenuChestballas.ItemWidth, MenuChestballas.ItemHeight * 2, MenuChestballas.tileBackgroundColor)    

    MenuChestballas.initText(MenuChestballas.tileTextColor, 4, 0.7)

    AddTextComponentString(lMenuChestballas.Title)

    DrawText(MenuChestballas.posX + MenuChestballas.ItemWidth/2, MenuChestballas.posY)



    -- draw bakcground items

    MenuChestballas.drawRect(MenuChestballas.posX, MenuChestballas.posY + MenuChestballas.ItemHeight * 2, MenuChestballas.ItemWidth, MenuChestballas.ItemHeight + (nbItem-1)*MenuChestballas.ItemHeight, MenuChestballas.backgroundColor)

    -- draw all items

    for pos, value in pairs(lMenuChestballas.Items) do

        if pos == selectValue then

            MenuChestballas.drawRect(MenuChestballas.posX, MenuChestballas.posY + MenuChestballas.ItemHeight * (1+pos), MenuChestballas.ItemWidth, MenuChestballas.ItemHeight, MenuChestballas.backgroundColorActive)

            MenuChestballas.initText(MenuChestballas.textColorActive)

        else

            MenuChestballas.initText(MenuChestballas.textColor)

        end

        AddTextComponentString(value.Title)

        DrawText(MenuChestballas.posX + MenuChestballas.ItemWidth/2, MenuChestballas.posY + MenuChestballas.ItemHeight * (pos+1))

    end

    

end



function MenuChestballas.getCurrentMenu()

    local currentMenu = MenuChestballas.item

    for i=1, #MenuChestballas.currentPos - 1 do

        local val = MenuChestballas.currentPos[i]

        currentMenu = currentMenu.Items[val].SubMenu

    end

    return currentMenu

end



function MenuChestballas.initMenu()

    MenuChestballas.currentPos = {1}

end



function MenuChestballas.keyControl()

    if IsControlJustPressed(1, MenuChestballas.keyDown) then 

        local cMenu = MenuChestballas.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestballas.currentPos

        MenuChestballas.currentPos[slcp] = (MenuChestballas.currentPos[slcp] % size) + 1



		local cSelect = MenuChestballas.currentPos[#MenuChestballas.currentPos]

        local cMenu = MenuChestballas.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestballas.keyUp) then 

        local cMenu = MenuChestballas.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestballas.currentPos

        MenuChestballas.currentPos[slcp] = ((MenuChestballas.currentPos[slcp] - 2 + size) % size) + 1



		local cSelect = MenuChestballas.currentPos[#MenuChestballas.currentPos]

        local cMenu = MenuChestballas.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestballas.KeyCancel) then 

        table.remove(MenuChestballas.currentPos)

        if #MenuChestballas.currentPos == 0 then

            MenuChestballas.isOpen = false 

        end



    elseif IsControlJustPressed(1, MenuChestballas.keySelect)  then

        local cSelect = MenuChestballas.currentPos[#MenuChestballas.currentPos]

        local cMenu = MenuChestballas.getCurrentMenu()

        if cMenu.Items[cSelect].SubMenu ~= nil then

            MenuChestballas.currentPos[#MenuChestballas.currentPos + 1] = 1

        else

            if cMenu.Items[cSelect].Function ~= nil then

                cMenu.Items[cSelect].Function(cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].EventBuy ~= nil then

                TriggerEvent(cMenu.Items[cSelect].EventBuy, cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].Close == nil or cMenu.Items[cSelect].Close == true then

                MenuChestballas.isOpen = false

            end

        end



		local cSelect = MenuChestballas.currentPos[#MenuChestballas.currentPos]

        local cMenu = MenuChestballas.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end

    end



end




