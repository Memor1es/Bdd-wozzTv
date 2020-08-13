local outfitMenuOpen = false
local outfitMenu
local _outfitMenuPool = nil

RegisterNetEvent("outfit:LoadOutfits")
AddEventHandler("outfit:LoadOutfits", function(outfits)
    _outfitMenuPool = NativeUI.CreatePool()
    outfitMenu = NativeUI.CreateMenu("", "~b~Mes tenues", 1296, 54)
    _outfitMenuPool:Add(outfitMenu)

    outfitList = {}
    for id, outfit in pairs(outfits) do
        outfitList[id] = _outfitMenuPool:AddSubMenu(outfitMenu, outfit.name, "", true, true)
        local confirm = NativeUI.CreateItem("Confirmer", "")
        local delete = NativeUI.CreateItem("Supprimer", "")

        outfitList[id]:AddItem(confirm)
        outfitList[id]:AddItem(delete)

        confirm.Activated = function(menu, item)
            if item == confirm then
                local loadedOutfit = json.decode(outfit.outfit)
                for i=1, 11 do
                    SetPedComponentVariation(PlayerPedId(), i, loadedOutfit.drawable[i], loadedOutfit.texture[i], loadedOutfit.palette[i])
                end
                for i=0, 7 do
                    SetPedPropIndex(PlayerPedId(), i, loadedOutfit.prop[tostring(i)], loadedOutfit.proptexture[tostring(i)], true)
                end
                SetPedHairColor(PlayerPedId(), loadedOutfit.haircolor, 0)
                _outfitMenuPool:CloseAllMenus()
            end
        end
        delete.Activated = function(menu, item)
            if item == delete then
                TriggerServerEvent("outfit:DeleteOutfit", outfit.name)
                _outfitMenuPool:CloseAllMenus()
            end
        end
    end

    local newOutfit = NativeUI.CreateItem("Sauvegarder une nouvelle tenue", "")
    outfitMenu:AddItem(newOutfit)
    newOutfit.Activated = function(menu, item)
        if item == newOutfit then
            AddTextEntry('FMMC_KEY_TIP1', "Nom de la tenue")
            DisplayOnscreenKeyboard(6, "FMMC_KEY_TIP1", "", "", "", "", "", 20)
            while UpdateOnscreenKeyboard() == 0 do
                Wait(0)
            end
            if UpdateOnscreenKeyboard() == 1 then
                local name = tostring(GetOnscreenKeyboardResult())
                if name then
                    local savedOutfit = {
                        drawable = {},
                        texture = {},
                        palette = {},
                        prop = {},
                        proptexture = {},
                    }                    
                    for i=1, 11 do
                        savedOutfit.drawable[i] = GetPedDrawableVariation(PlayerPedId(), i)
                        savedOutfit.texture[i] = GetPedTextureVariation(PlayerPedId(), i)
                        savedOutfit.palette[i] = GetPedPaletteVariation(PlayerPedId(), i)
                    end
                    for i=0, 7 do
                        savedOutfit.prop[i] = GetPedPropIndex(PlayerPedId(), i)
                        savedOutfit.proptexture[i] = GetPedPropTextureIndex(PlayerPedId(), i)
                    end
                    savedOutfit.haircolor = GetPedHairColor(PlayerPedId())
                    TriggerServerEvent("outfit:SaveOutfit", name, json.encode(savedOutfit))
                else
                    ShowNotification("Tenue : ~b~" .. "Veuillez définir un nom de tenue")
                end
            end
            _outfitMenuPool:CloseAllMenus()
        end
    end
    
    _outfitMenuPool:RefreshIndex()
    _outfitMenuPool:MouseControlsEnabled(false)
    _outfitMenuPool:ControlDisablingEnabled(true)
    outfitMenu:Visible(not outfitMenu:Visible())

    outfitMenuOpen = true
end)

Citizen.CreateThread(function()
    while true do
        for _, shop in pairs(clothingShops) do
            while IsEntityAtCoord(PlayerPedId(), shop.x, shop.y, shop.z, 10.0, 10.0, 10.0, 0, 1, 0) do
                DrawMarker(25, shop.x, shop.y, shop.z + 0.05, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 219, 0, 0, 50, 0, 0, 2, 0, 0, 0, 0)
                if IsEntityAtCoord(PlayerPedId(), shop.x, shop.y, shop.z, 2.0, 2.0, 2.0, 0, 1, 0) then
                    if not outfitMenuOpen then
                        DisplayHelpText("Tenues : ~INPUT_CONTEXT~")
                        if IsControlJustPressed(0, 51) then
                            TriggerServerEvent("outfit:LoadOutfits")
                        end
                    end
                end

                if outfitMenuOpen and UpdateOnscreenKeyboard() ~= 0 then 
                    _outfitMenuPool:ProcessMenus()
                    if not _outfitMenuPool:IsAnyMenuOpen() then
                        _outfitMenuPool:CloseAllMenus()
                        outfitMenuOpen = false
                    end
                end
                Wait(0)
            end
        end
        Wait(500)
    end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

RegisterCommand("rdm", function()
    local pedId = PlayerPedId()
	local modelhash = GetHashKey("mp_m_freemode_01")

	RequestModel(modelhash)
	if IsModelValid(modelhash) then
		while not HasModelLoaded(modelhash) do
			Wait(0)
			RequestModel(modelhash)
		end

		SetPlayerModel(PlayerId(), modelhash)

		local pedId = PlayerPedId()
		SetPedHeadBlendData(pedId, math.random(24,45), math.random(1, 23), 0, math.random(24, 45), math.random(1, 23), 0, 0.5, 0.5, 0, false)
		SetPedHairColor(pedId, math.random(1, 20), 0)
		SetPedHeadOverlayColor(pedId, 1, 1, math.random(1,10), 0)
		SetPedHeadOverlayColor(pedId, 2, 1, math.random(1,10), 0)

		if IsPedMale(pedId) then
			SetPedComponentVariation(pedId, 0, math.random(0, 5), 0, 2)
			SetPedComponentVariation(pedId, 2, math.random(1, 17), 3, 2)
			SetPedComponentVariation(pedId, 3, 0, 0, 2)

			SetPedComponentVariation(pedId, 4, 1, math.random(0, 15), 2)
			SetPedComponentVariation(pedId, 6, 3, math.random(0, 15), 2)
			SetPedComponentVariation(pedId, 8, 0, 240, 0)
			SetPedComponentVariation(pedId, 10, 0, 0, 2)
			SetPedComponentVariation(pedId, 11, 0, math.random(0, 5), 0)
		else
			SetPedComponentVariation(pedId, 0, 0, 0, 2)
			SetPedComponentVariation(pedId, 2, math.random(1, 17), 3, 2)
			SetPedComponentVariation(pedId, 3, 0, 0, 2)
			SetPedComponentVariation(pedId, 4, 1, math.random(2), 2)
			SetPedComponentVariation(pedId, 6, math.random(0, 6), 0, 2)

			SetPedComponentVariation(pedId, 8, 2, 2, 2)
			SetPedComponentVariation(pedId, 10, 7, 0, 2)
			SetPedComponentVariation(pedId, 11, 0, 2, 2)
        end
        for i=0, 7 do
            SetPedPropIndex(PlayerPedId(), i, 5, 2, true)
        end
	end
	SetModelAsNoLongerNeeded(modelhash)
end)