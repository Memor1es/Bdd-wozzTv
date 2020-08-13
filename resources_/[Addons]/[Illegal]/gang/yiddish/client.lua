local isAyiddish = false

local blipAreayiddish
local blipQGyiddish

local chestPosyiddish = { ['x'] = -57.95784, ['y'] = 981.9795, ['z'] = 234.5773 }
local qgPosyiddish = { ['x'] = 95.3324, ['y'] = -1810.800, ['z'] = 29.4584 }

local kevlarList = 

{

	{name = "Aucun", drawableIndex = 0, textureIndex = 0},

	-- {name = "Basique", drawableIndex = 11, textureIndex = 1},

	-- {name = "Moyen", drawableIndex = 12, textureIndex = 0},

	{name = "Lourd", drawableIndex = 27, textureIndex = 5},

}



local currentKevlarIndex = 1



local kevlarPos = {x = -78.42978, y = 1002.846, z = 230.61} -- yiddish

function OpenChestyiddish()

	MenuChestyiddish.initMenu()

	MenuChestyiddish.isOpen = not MenuChestyiddish.isOpen

end

function DisplayBlipyiddish()

	blipQGyiddish = AddBlipForCoord(qgPosyiddish.x, qgPosyiddish.y, qgPosyiddish.z)

	SetBlipSprite(blipQGyiddish, 382)

	SetBlipScale(blipQGyiddish, 1.4)

	SetBlipAsShortRange(blipQGyiddish, true)

	BeginTextCommandSetBlipName("STRING")

	AddTextComponentString("yiddish")

	EndTextCommandSetBlipName(blipQGyiddish)
	
	-- Area blipQGyiddish

	blipAreayiddish = AddBlipForRadius(qgPosyiddish.x, qgPosyiddish.y, qgPosyiddish.z, 145.0)

	SetBlipSprite(blipAreayiddish, 9)

	SetBlipAlpha(blipAreayiddish, 80)

	SetBlipColour(blipAreayiddish, 83)

end




Citizen.CreateThread(function()

	Citizen.Wait(15000)

	DisplayBlipyiddish()

	while true do

		if isAyiddish then

			DisplayOnScreen("yiddish", 0.90, 0.22)



			if(Vdist(chestPosyiddish.x, chestPosyiddish.y, chestPosyiddish.z, currentPos.x, currentPos.y, currentPos.z) < 20.0) then

				DrawMarker(25, chestPosyiddish.x, chestPosyiddish.y, chestPosyiddish.z + 0.025, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0,0, 0,0)

				if(Vdist(chestPosyiddish.x, chestPosyiddish.y, chestPosyiddish.z, currentPos.x, currentPos.y, currentPos.z) < 1.5) then

					DisplayHelpText("~INPUT_CONTEXT~ Coffre de gang")

					if(IsControlJustReleased(1, 51))then

						OpenChestyiddish()

					end

					if MenuChestyiddish.isOpen then

						MenuChestyiddish.draw()

						MenuChestyiddish.keyControl()

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



RegisterNetEvent("yiddish:setInfos")

AddEventHandler("yiddish:setInfos", function(data)

	isAyiddish = true

end)

RegisterNetEvent("yiddish:receiveIsyiddish")

AddEventHandler('yiddish:receiveIsyiddish', function(result)

	if(result == "inconnu") then

		isAyiddish = false

	else

		isAyiddish = true

		identifier = result

	end


end)



RegisterNetEvent("yiddish:removeGang")

AddEventHandler("yiddish:removeGang", function(data)

	isAyiddish = false

end)



RegisterNetEvent("yiddish:moneyAdd")

AddEventHandler("yiddish:moneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('yiddish:addMoneyServer', value, 0)

	end

end)



RegisterNetEvent("yiddish:moneyRem")

AddEventHandler("yiddish:moneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0  then

		TriggerServerEvent('yiddish:removeMoneyServer', value, 0)

	end

end)



RegisterNetEvent("yiddish:dirtyMoneyAdd")

AddEventHandler("yiddish:dirtyMoneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('yiddish:addDirtyMoneyServer', 0, value)

	end

end)





RegisterNetEvent("yiddish:dirtyMoneyRem")

AddEventHandler("yiddish:dirtyMoneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('yiddish:removeDirtyMoneyServer', 0, value)

	end

end)



RegisterNetEvent("yiddish:moneyShow")

AddEventHandler("yiddish:moneyShow", function(data)

	TriggerServerEvent('yiddish:getMoneyInfos')

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

		TriggerServerEvent('yiddish:checkIsyiddish')

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

MenuChestyiddish = {}

MenuChestyiddish.item = {

    ['Title'] = 'Coffre des yiddish',

    ['Items'] = {

        {['Title'] = 'Argent propre', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent propre',			

                ['Items'] = {

                    { ['Title'] = 'Deposer', ['EventBuy'] = 'yiddish:moneyAdd', ['Close'] = true},

                    { ['Title'] = 'Retirer', ['EventBuy'] = 'yiddish:moneyRem', ['Close'] = true},

				}

            }

        },

		{['Title'] = 'Argent sale', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent sale',			

                ['Items'] = {

					{ ['Title'] = 'Deposer', ['EventBuy'] = 'yiddish:dirtyMoneyAdd', ['Close'] = true},

					{ ['Title'] = 'Retirer', ['EventBuy'] = 'yiddish:dirtyMoneyRem', ['Close'] = true},

				}																														   

			}																																 

        },

		{['Title'] = 'Consulter', ['EventBuy'] = 'yiddish:moneyShow',	['Close'] = false},

    }

}







--====================================================================================

--  Option Menu

--====================================================================================

MenuChestyiddish.backgroundColor = { 0, 0, 0, 125 }

MenuChestyiddish.backgroundColorActive = { 179, 71, 0, 255 }

MenuChestyiddish.tileTextColor = { 255, 255, 255, 255 }

MenuChestyiddish.tileBackgroundColor = { 255, 102, 0, 255 }

MenuChestyiddish.textColor = { 255,255,255,255 }

MenuChestyiddish.textColorActive = { 255,255,255, 255 }



MenuChestyiddish.keyOpenMenu = 170 -- F3    

MenuChestyiddish.keyUp = 172 -- PhoneUp

MenuChestyiddish.keyDown = 173 -- PhoneDown

MenuChestyiddish.keyLeft = 174 -- PhoneLeft || Not use next release Maybe 

MenuChestyiddish.keyRight =	175 -- PhoneRigth || Not use next release Maybe 

MenuChestyiddish.keySelect = 176 -- PhoneSelect

MenuChestyiddish.KeyCancel = 177 -- PhoneCancel



MenuChestyiddish.posX = 0.17

MenuChestyiddish.posY = 0.018



MenuChestyiddish.ItemWidth = 0.19

MenuChestyiddish.ItemHeight = 0.03



MenuChestyiddish.isOpen = false   -- /!\ Ne pas toucher

MenuChestyiddish.currentPos = {1} -- /!\ Ne pas toucher



--====================================================================================

--  Menu System

--====================================================================================



function MenuChestyiddish.drawRect(posX, posY, width, heigh, color)

    DrawRect(posX + width / 2, posY + heigh / 2, width, heigh, color[1], color[2], color[3], color[4])

end



function MenuChestyiddish.initText(textColor, font, scale)

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



function MenuChestyiddish.draw() 

    -- Draw Rect

    local pos = 0

    local lMenuChestyiddish = MenuChestyiddish.getCurrentMenu()

    local selectValue = MenuChestyiddish.currentPos[#MenuChestyiddish.currentPos]

    local nbItem = #lMenuChestyiddish.Items

    -- draw background title & title

    MenuChestyiddish.drawRect(MenuChestyiddish.posX, MenuChestyiddish.posY , MenuChestyiddish.ItemWidth, MenuChestyiddish.ItemHeight * 2, MenuChestyiddish.tileBackgroundColor)    

    MenuChestyiddish.initText(MenuChestyiddish.tileTextColor, 4, 0.7)

    AddTextComponentString(lMenuChestyiddish.Title)

    DrawText(MenuChestyiddish.posX + MenuChestyiddish.ItemWidth/2, MenuChestyiddish.posY)



    -- draw bakcground items

    MenuChestyiddish.drawRect(MenuChestyiddish.posX, MenuChestyiddish.posY + MenuChestyiddish.ItemHeight * 2, MenuChestyiddish.ItemWidth, MenuChestyiddish.ItemHeight + (nbItem-1)*MenuChestyiddish.ItemHeight, MenuChestyiddish.backgroundColor)

    -- draw all items

    for pos, value in pairs(lMenuChestyiddish.Items) do

        if pos == selectValue then

            MenuChestyiddish.drawRect(MenuChestyiddish.posX, MenuChestyiddish.posY + MenuChestyiddish.ItemHeight * (1+pos), MenuChestyiddish.ItemWidth, MenuChestyiddish.ItemHeight, MenuChestyiddish.backgroundColorActive)

            MenuChestyiddish.initText(MenuChestyiddish.textColorActive)

        else

            MenuChestyiddish.initText(MenuChestyiddish.textColor)

        end

        AddTextComponentString(value.Title)

        DrawText(MenuChestyiddish.posX + MenuChestyiddish.ItemWidth/2, MenuChestyiddish.posY + MenuChestyiddish.ItemHeight * (pos+1))

    end

    

end



function MenuChestyiddish.getCurrentMenu()

    local currentMenu = MenuChestyiddish.item

    for i=1, #MenuChestyiddish.currentPos - 1 do

        local val = MenuChestyiddish.currentPos[i]

        currentMenu = currentMenu.Items[val].SubMenu

    end

    return currentMenu

end



function MenuChestyiddish.initMenu()

    MenuChestyiddish.currentPos = {1}

end



function MenuChestyiddish.keyControl()

    if IsControlJustPressed(1, MenuChestyiddish.keyDown) then 

        local cMenu = MenuChestyiddish.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestyiddish.currentPos

        MenuChestyiddish.currentPos[slcp] = (MenuChestyiddish.currentPos[slcp] % size) + 1



		local cSelect = MenuChestyiddish.currentPos[#MenuChestyiddish.currentPos]

        local cMenu = MenuChestyiddish.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestyiddish.keyUp) then 

        local cMenu = MenuChestyiddish.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestyiddish.currentPos

        MenuChestyiddish.currentPos[slcp] = ((MenuChestyiddish.currentPos[slcp] - 2 + size) % size) + 1



		local cSelect = MenuChestyiddish.currentPos[#MenuChestyiddish.currentPos]

        local cMenu = MenuChestyiddish.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestyiddish.KeyCancel) then 

        table.remove(MenuChestyiddish.currentPos)

        if #MenuChestyiddish.currentPos == 0 then

            MenuChestyiddish.isOpen = false 

        end



    elseif IsControlJustPressed(1, MenuChestyiddish.keySelect)  then

        local cSelect = MenuChestyiddish.currentPos[#MenuChestyiddish.currentPos]

        local cMenu = MenuChestyiddish.getCurrentMenu()

        if cMenu.Items[cSelect].SubMenu ~= nil then

            MenuChestyiddish.currentPos[#MenuChestyiddish.currentPos + 1] = 1

        else

            if cMenu.Items[cSelect].Function ~= nil then

                cMenu.Items[cSelect].Function(cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].EventBuy ~= nil then

                TriggerEvent(cMenu.Items[cSelect].EventBuy, cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].Close == nil or cMenu.Items[cSelect].Close == true then

                MenuChestyiddish.isOpen = false

            end

        end



		local cSelect = MenuChestyiddish.currentPos[#MenuChestyiddish.currentPos]

        local cMenu = MenuChestyiddish.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end

    end



end




