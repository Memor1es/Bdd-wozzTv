--====================================================================================

-- #Author: Lee Ping - Cookay

--

-- D�velopp�e pour la communaut� de Melrose

-- Base n3mtv

--====================================================================================



MenuBar = {}

MenuBar.item = {

    ['Title'] = 'Bar',

    ['Items'] = {

		{['Title'] = 'Soda',				['Event'] = 'food:selection',	['itemid']=42,		['price']=20,	['Close']= false},

		{['Title'] = 'Coca',				['Event'] = 'food:selection',	['itemid']=53,		['price']=20,	['Close']= false},

		{['Title'] = 'Fanta',				['Event'] = 'food:selection',	['itemid']=54,		['price']=20,	['Close']= false},

		{['Title'] = 'Redbull',				['Event'] = 'food:selection',	['itemid']=56,		['price']=20,	['Close']= false},

		{['Title'] = 'Grande Biere',		['Event'] = 'food:selection',	['itemid']=25,		['price']=20,	['Close']= false},

		{['Title'] = 'Vodka',				['Event'] = 'food:selection',	['itemid']=44,		['price']=20,	['Close']= false},

		{['Title'] = 'Bouteille de Vin',	['Event'] = 'food:selection',	['itemid']=27,		['price']=20,	['Close']= false},

    }

}







--====================================================================================

--  Option Menu

--====================================================================================

MenuBar.backgroundColor = { 0, 0, 0, 125 }

MenuBar.backgroundColorActive = { 150, 0, 179, 255 }

MenuBar.tileTextColor = { 255, 255, 255, 255 }

MenuBar.tileBackgroundColor = { 214, 0, 255, 255 }

MenuBar.textColor = { 255,255,255,255 }

MenuBar.textColorActive = { 255,255,255, 255 }



MenuBar.keyOpenMenu = 170 -- F3    

MenuBar.keyUp = 172 -- PhoneUp

MenuBar.keyDown = 173 -- PhoneDown

MenuBar.keyLeft = 174 -- PhoneLeft || Not use next release Maybe 

MenuBar.keyRight =	175 -- PhoneRigth || Not use next release Maybe 

MenuBar.keySelect = 176 -- PhoneSelect

MenuBar.KeyCancel = 177 -- PhoneCancel



MenuBar.posX = 0.17

MenuBar.posY = 0.018



MenuBar.ItemWidth = 0.19

MenuBar.ItemHeight = 0.03



MenuBar.isOpen = false   -- /!\ Ne pas toucher

MenuBar.currentPos = {1} -- /!\ Ne pas toucher



--====================================================================================

--  Menu System

--====================================================================================



function MenuBar.drawRect(posX, posY, width, heigh, color)

    DrawRect(posX + width / 2, posY + heigh / 2, width, heigh, color[1], color[2], color[3], color[4])

end



function MenuBar.initText(textColor, font, scale)

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



function MenuBar.draw() 

    -- Draw Rect

    local pos = 0

    local lMenuBar = MenuBar.getCurrentMenu()

    local selectValue = MenuBar.currentPos[#MenuBar.currentPos]

    local nbItem = #lMenuBar.Items

    -- draw background title & title

    MenuBar.drawRect(MenuBar.posX, MenuBar.posY , MenuBar.ItemWidth, MenuBar.ItemHeight * 2, MenuBar.tileBackgroundColor)    

    MenuBar.initText(MenuBar.tileTextColor, 4, 0.7)

    AddTextComponentString(lMenuBar.Title)

    DrawText(MenuBar.posX + MenuBar.ItemWidth/2, MenuBar.posY)



    -- draw bakcground items

    MenuBar.drawRect(MenuBar.posX, MenuBar.posY + MenuBar.ItemHeight * 2, MenuBar.ItemWidth, MenuBar.ItemHeight + (nbItem-1)*MenuBar.ItemHeight, MenuBar.backgroundColor)

    -- draw all items

    for pos, value in pairs(lMenuBar.Items) do

        if pos == selectValue then

            MenuBar.drawRect(MenuBar.posX, MenuBar.posY + MenuBar.ItemHeight * (1+pos), MenuBar.ItemWidth, MenuBar.ItemHeight, MenuBar.backgroundColorActive)

            MenuBar.initText(MenuBar.textColorActive)

        else

            MenuBar.initText(MenuBar.textColor)

        end

        AddTextComponentString(value.Title)

        DrawText(MenuBar.posX + MenuBar.ItemWidth/2, MenuBar.posY + MenuBar.ItemHeight * (pos+1))

    end

    

end



function MenuBar.getCurrentMenu()

    local currentMenu = MenuBar.item

    for i=1, #MenuBar.currentPos - 1 do

        local val = MenuBar.currentPos[i]

        currentMenu = currentMenu.Items[val].SubMenu

    end

    return currentMenu

end



function MenuBar.initMenu()

    MenuBar.currentPos = {1}

end





function MenuBar.keyControl()

    if IsControlJustPressed(1, MenuBar.keyDown) then 

        local cMenu = MenuBar.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuBar.currentPos

        MenuBar.currentPos[slcp] = (MenuBar.currentPos[slcp] % size) + 1



		local cSelect = MenuBar.currentPos[#MenuBar.currentPos]

        local cMenu = MenuBar.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuBar.keyUp) then 

        local cMenu = MenuBar.getCurrentMenu()

        local size = #cMenu.Items

        local slcp = #MenuBar.currentPos

        MenuBar.currentPos[slcp] = ((MenuBar.currentPos[slcp] - 2 + size) % size) + 1



		local cSelect = MenuBar.currentPos[#MenuBar.currentPos]

        local cMenu = MenuBar.getCurrentMenu()

		if cMenu.Items[cSelect].EventSelect ~= nil then

            TriggerEvent(cMenu.Items[cSelect].EventSelect, cMenu.Items[cSelect])

        end



    elseif IsControlJustPressed(1, MenuBar.KeyCancel) then 

        table.remove(MenuBar.currentPos)

        if #MenuBar.currentPos == 0 then

            MenuBar.isOpen = false 

        end



    elseif IsControlJustPressed(1, MenuBar.keySelect)  then

        local cSelect = MenuBar.currentPos[#MenuBar.currentPos]

        local cMenu = MenuBar.getCurrentMenu()

        if cMenu.Items[cSelect].SubMenu ~= nil then

            MenuBar.currentPos[#MenuBar.currentPos + 1] = 1

        else

            if cMenu.Items[cSelect].Function ~= nil then

                cMenu.Items[cSelect].Function(cMenu.Items[cSelect])

            end

            if cMenu.Items[cSelect].Event ~= nil then

				TriggerServerEvent('avanyashop:testprix', cMenu.Items[cSelect].itemid, cMenu.Items[cSelect].price)

				Citizen.Wait(500)

            end

            if cMenu.Items[cSelect].Close == nil or cMenu.Items[cSelect].Close == true then

                MenuBar.isOpen = false

            end

        end

    end



end