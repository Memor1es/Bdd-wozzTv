local isAvagos = false

local blipQGvagos

local blipAreavagos

local chestPosvagos = { ['x'] = 113.52129, ['y'] = -1970.612, ['z'] = 20.3276 }

local qgPosvagos = { ['x'] = 324.5355, ['y'] = -2031.615, ['z'] = 20.86167 }

local kevlarList = 

{

	{name = "Aucun", drawableIndex = 0, textureIndex = 0},

	-- {name = "Basique", drawableIndex = 11, textureIndex = 1},

	-- {name = "Moyen", drawableIndex = 12, textureIndex = 0},

	{name = "Lourd", drawableIndex = 27, textureIndex = 5},

}



local currentKevlarIndex = 1



local kevlarPos = {x = 337.9778, y = -2012.519, z = 21.39496} -- Vagos

function OpenChestvagos()

	MenuChestvagos.initMenu()

	MenuChestvagos.isOpen = not MenuChestvagos.isOpen

end


function DisplayBlipvagos()

	blipQGvagos = AddBlipForCoord(qgPosvagos.x, qgPosvagos.y, qgPosvagos.z)

	SetBlipSprite(blipQGvagos, 459)

	SetBlipScale(blipQGvagos, 1.1)

	SetBlipAsShortRange(blipQGvagos, true)

	BeginTextCommandSetBlipName("STRING")

	AddTextComponentString("Los Vagos")

	EndTextCommandSetBlipName(blipQGvagos)
	
	-- Area blipQGvagos

	blipAreavagos = AddBlipForRadius(qgPosvagos.x, qgPosvagos.y, qgPosvagos.z, 145.0)

	SetBlipSprite(blipAreavagos, 9)

	SetBlipAlpha(blipAreavagos, 100)

	SetBlipColour(blipAreavagos, 46)

end

Citizen.CreateThread(function()

	Citizen.Wait(15000)

	DisplayBlipvagos()

	while true do

		if isAvagos then

			DisplayOnScreen("Vagos", 0.90, 0.22)



			if(Vdist(chestPosvagos.x, chestPosvagos.y, chestPosvagos.z, currentPos.x, currentPos.y, currentPos.z) < 20.0) then

				DrawMarker(25, chestPosvagos.x, chestPosvagos.y, chestPosvagos.z + 0.025, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0,0, 0,0)

				if(Vdist(chestPosvagos.x, chestPosvagos.y, chestPosvagos.z, currentPos.x, currentPos.y, currentPos.z) < 1.5) then

					DisplayHelpText("~INPUT_CONTEXT~ Coffre de gang")

					if(IsControlJustReleased(1, 51))then

						OpenChestvagos()

					end

					if MenuChestvagos.isOpen then

						MenuChestvagos.draw()

						MenuChestvagos.keyControl()

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



RegisterNetEvent("vagos:setInfos")

AddEventHandler("vagos:setInfos", function(data)

	isAvagos = true

end)

RegisterNetEvent("vagos:receiveIsvagos")

AddEventHandler('vagos:receiveIsvagos', function(result)

	if(result == "inconnu") then

		isAvagos = false

	else

		isAvagos = true

		identifier = result

	end


end)



RegisterNetEvent("vagos:removeGang")

AddEventHandler("vagos:removeGang", function(data)

	isAvagos = false

end)



RegisterNetEvent("vagos:moneyAdd")

AddEventHandler("vagos:moneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('vagos:addMoneyServer', value, 0)

	end

end)



RegisterNetEvent("vagos:moneyRem")

AddEventHandler("vagos:moneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0  then

		TriggerServerEvent('vagos:removeMoneyServer', value, 0)

	end

end)



RegisterNetEvent("vagos:dirtyMoneyAdd")

AddEventHandler("vagos:dirtyMoneyAdd", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('vagos:addDirtyMoneyServer', 0, value)

	end

end)





RegisterNetEvent("vagos:dirtyMoneyRem")

AddEventHandler("vagos:dirtyMoneyRem", function(data)

	local value = GetValue()

	if value ~= 0 and value > 0 then

		TriggerServerEvent('vagos:removeDirtyMoneyServer', 0, value)

	end

end)



RegisterNetEvent("vagos:moneyShow")

AddEventHandler("vagos:moneyShow", function(data)

	TriggerServerEvent('vagos:getMoneyInfos')

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

		TriggerServerEvent('vagos:checkIsvagos')

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

MenuChestvagos = {}

MenuChestvagos.item = {

    ['Title'] = 'Coffre des vagos',

    ['Items'] = {

        {['Title'] = 'Argent propre', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent propre',			

                ['Items'] = {

                    { ['Title'] = 'Deposer', ['EventBuy'] = 'vagos:moneyAdd', ['Close'] = true},

                    { ['Title'] = 'Retirer', ['EventBuy'] = 'vagos:moneyRem', ['Close'] = true},

				}

            }

        },

		{['Title'] = 'Argent sale', ['SubMenu'] = {

            ['Title'] = 'Coffre de gang - Argent sale',			

                ['Items'] = {

					{ ['Title'] = 'Deposer', ['EventBuy'] = 'vagos:dirtyMoneyAdd', ['Close'] = true},

					{ ['Title'] = 'Retirer', ['EventBuy'] = 'vagos:dirtyMoneyRem', ['Close'] = true},

				}																														   

			}																																 

        },

		{['Title'] = 'Consulter', ['EventBuy'] = 'vagos:moneyShow',	['Close'] = false},

    }

}







--====================================================================================

--  Option Menu

--====================================================================================

MenuChestvagos.backgroundColor = { 0, 0, 0, 125 }

MenuChestvagos.backgroundColorActive = { 179, 71, 0, 255 }

MenuChestvagos.tileTextColor = { 255, 255, 255, 255 }

MenuChestvagos.tileBackgroundColor = { 255, 102, 0, 255 }

MenuChestvagos.textColor = { 255,255,255,255 }

MenuChestvagos.textColorActive = { 255,255,255, 255 }



MenuChestvagos.keyOpenMenu = 170 -- F3    

MenuChestvagos.keyUp = 172 -- PhoneUp

MenuChestvagos.keyDown = 173 -- PhoneDown

MenuChestvagos.keyLeft = 174 -- PhoneLeft || Not use next release Maybe 

MenuChestvagos.keyRight =	175 -- PhoneRigth || Not use next release Maybe 

MenuChestvagos.keySelect = 176 -- PhoneSelect

MenuChestvagos.KeyCancel = 177 -- PhoneCancel



MenuChestvagos.posX = 0.17

MenuChestvagos.posY = 0.018



MenuChestvagos.ItemWidth = 0.19

MenuChestvagos.ItemHeight = 0.03



MenuChestvagos.isOpen = false   -- /!\ Ne pas toucher

MenuChestvagos.currentPos = {1} -- /!\ Ne pas toucher



--====================================================================================

--  Menu System

--====================================================================================



function MenuChestvagos.drawRect(posX, posY, width, heigh, color)

    DrawRect(posX + width / 2, posY + heigh / 2, width, heigh, color[1], color[2], color[3], color[4])

end



function MenuChestvagos.initText(textColor, font, scale)

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



function MenuChestvagos.draw() 

    -- Draw Rect

    local pos = 0

    local lMenuChestvagos = MenuChestvagos.getCurrentMenu()

    local selectValue = MenuChestvagos.currentPos[#MenuChestvagos.currentPos]

    local nbItem = #lMenuChestvagos.Items

    -- draw background title & title

    MenuChestvagos.drawRect(MenuChestvagos.posX, MenuChestvagos.posY , MenuChestvagos.ItemWidth, MenuChestvagos.ItemHeight * 2, MenuChestvagos.tileBackgroundColor)    

    MenuChestvagos.initText(MenuChestvagos.tileTextColor, 4, 0.7)

    AddTextComponentString(lMenuChestvagos.Title)

    DrawText(MenuChestvagos.posX + MenuChestvagos.ItemWidth/2, MenuChestvagos.posY)



    -- draw bakcground items

    MenuChestvagos.drawRect(MenuChestvagos.posX, MenuChestvagos.posY + MenuChestvagos.ItemHeight * 2, MenuChestvagos.ItemWidth, MenuChestvagos.ItemHeight + (nbItem-1)*MenuChestvagos.ItemHeight, MenuChestvagos.backgroundColor)

    -- draw all items

    for pos, value in pairs(lMenuChestvagos.Items) do

        if pos == selectValue then

            MenuChestvagos.drawRect(MenuChestvagos.posX, MenuChestvagos.posY + MenuChestvagos.ItemHeight * (1+pos), MenuChestvagos.ItemWidth, MenuChestvagos.ItemHeight, MenuChestvagos.backgroundColorActive)

            MenuChestvagos.initText(MenuChestvagos.textColorActive)

        else

            MenuChestvagos.initText(MenuChestvagos.textColor)

        end

        AddTextComponentString(value.Title)

        DrawText(MenuChestvagos.posX + MenuChestvagos.ItemWidth/2, MenuChestvagos.posY + MenuChestvagos.ItemHeight * (pos+1))

    end

    

end



function MenuChestvagos.getCurrentMenu()

    local currentMenu = MenuChestvagos.item

    for i=1, #MenuChestvagos.currentPos - 1 do

        local val = MenuChestvagos.currentPos[i]

        currentMenu = currentMenu.Items[val].SubMenu

    end

    return currentMenu

end



function MenuChestvagos.initMenu()

    MenuChestvagos.currentPos = {1}

end



function MenuChestvagos.keyControl()

    if IsControlJustPressed(1, MenuChestvagos.keyDown) then 

        local cMenu = MenuChestvagos.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestvagos.currentPos

        MenuChestvagos.currentPos[slcp] = (MenuChestvagos.currentPos[slcp] % size) + 1



		local cSelect = MenuChestvagos.currentPos[#MenuChestvagos.currentPos]

        local cMenu = MenuChestvagos.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestvagos.keyUp) then 

        local cMenu = MenuChestvagos.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuChestvagos.currentPos

        MenuChestvagos.currentPos[slcp] = ((MenuChestvagos.currentPos[slcp] - 2 + size) % size) + 1



		local cSelect = MenuChestvagos.currentPos[#MenuChestvagos.currentPos]

        local cMenu = MenuChestvagos.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuChestvagos.KeyCancel) then 

        table.remove(MenuChestvagos.currentPos)

        if #MenuChestvagos.currentPos == 0 then

            MenuChestvagos.isOpen = false 

        end



    elseif IsControlJustPressed(1, MenuChestvagos.keySelect)  then

        local cSelect = MenuChestvagos.currentPos[#MenuChestvagos.currentPos]

        local cMenu = MenuChestvagos.getCurrentMenu()

        if cMenu.Items[cSelect].SubMenu ~= nil then

            MenuChestvagos.currentPos[#MenuChestvagos.currentPos + 1] = 1

        else

            if cMenu.Items[cSelect].Function ~= nil then

                cMenu.Items[cSelect].Function(cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].EventBuy ~= nil then

                TriggerEvent(cMenu.Items[cSelect].EventBuy, cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].Close == nil or cMenu.Items[cSelect].Close == true then

                MenuChestvagos.isOpen = false

            end

        end



		local cSelect = MenuChestvagos.currentPos[#MenuChestvagos.currentPos]

        local cMenu = MenuChestvagos.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end

    end



end




