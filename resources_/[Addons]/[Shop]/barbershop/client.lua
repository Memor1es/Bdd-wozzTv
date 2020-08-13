--
-- User: KRIS
-- Date: 21/05/2017
-- Time: 12:57
--

--------- CREATE SKIN OBJECT ---------
skinChooser =  {}
skinChooser.__index = skinChooser
function skinChooser:create()
    -- our new object
    local self = {}
    -- make Account handle lookup
    setmetatable(self,skinChooser)

    self.hair                       = 0
    self.hair_color                 = 0
    self.beard                      = 0
    self.beard_color                = 0
    self.eyebrows                   = 0
    self.eyebrows_color             = 0
    self.makeup                     = 0
    self.lipstick                   = 0
    self.lipstick_color             = 0

    self.hair_price_selected            = 0
    self.hair_color_price_selected      = 0
    self.beard_price_selected           = 0
    self.beard_color_price_selected     = 0
    self.eyebrows_price_selected        = 0
    self.eyebrows_color_price_selected  = 0
    self.makeup_price_selected          = 0
    self.makeup_opacity_price_selected  = 0
    self.lipstick_price_selected        = 0
    self.lipstick_color_price_selected  = 0
    return self
end

local hair_price            = 20
local hair_color_price      = 10
local beard_price           = 20
local beard_color_price     = 10
local eyebrows_price        = 10
local eyebrows_color_price  = 5
local makeup_price          = 50
local makeup_opacity_price  = 25
local lipstick_price        = 100
local lipstick_color_price  = 50

--------------- VARS -----------------
local new_skin      = skinChooser:create()
local spacebetween  = "        "
local barbersStores = {
    { ['x'] = 1210.117, ['y'] = -470.337, ['z'] = 66.208, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5},
    --{ ['x'] = 133.777, ['y'] = 1708.969, ['z'] = 29.292, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5 },
    { ['x'] = 1931.483, ['y'] = 3726.981, ['z'] = 32.844, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5},
    { ['x'] = -278.906, ['y'] = 6231.357, ['z'] = 31.696, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5},
	{ ['x'] = -813.768, ['y'] = -181.116, ['z'] = 37.569, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5},
	{ ['x'] = -1283.547, ['y'] = -1119.711, ['z'] = 7.000, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5},
	{ ['x'] = -1281.276, ['y'] = -1119.773, ['z'] = 7.000, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5},
	{ ['x'] = 137.956, ['y'] = -1710.894, ['z'] = 29.302, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5},
	{ ['x'] = 139.770, ['y'] = -1708.634, ['z'] = 29.302, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5},
	{ ['x'] = -34.879, ['y'] = -150.132, ['z'] = 57.087, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5},
	{ ['x'] = -35.891, ['y'] = -152.940, ['z'] = 57.087, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5},
	-- { ['x'] = -1011.1187133789, ['y'] = -2776.3767089844, ['z'] = 14.596252441406, ['markerWidth'] = 6.0001,  ['activationDist'] = 0.5},
}
local options       = {
    x = 0.12,
    y = 0.2,
    width = 0.22,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "BarberShop",
    menu_subtitle = "Categories",
    color_r = 192,
    color_g = 57,
    color_b = 43,
}

----------------------------------------------------- HELPERS ----------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function freeze(freeze)
    local player = PlayerId()
    local ped = GetPlayerPed(player)
    if not freeze then
	
        if not IsPedInAnyVehicle(ped) then
     --       SetEntityCollision(ped, true)
        end
        FreezeEntityPosition(ped, false)
        SetPlayerInvincible(player, false)
    else
      --  SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        SetPlayerInvincible(player, true)
    end
	------print("---------------------  Freeze status : " .. tostring(freeze))
end

function DrawMarkers(d, markerType, markerColorRed, markerColorGreen, markerColorBlue, markerAlpha)
    -- drawMarker(type, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, colorR, colorG, colorB, alpha, bobUpAndDown, faceCamera, p19, rotate, colorDict, colorName, drawOnEnts);
    DrawMarker(27, d.x, d.y, d.z - 0.9, 0, 0, 0, 0, 0, 0, d.markerWidth, d.markerWidth, d.markerWidth, 1.5001, markerColorRed, markerColorGreen, markerColorBlue,markerAlpha, 0,0, 0,0)
end

function setMapMarkers(stores, blipIcon, blipColor, blipName)
    for k,v in ipairs(stores)do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, blipIcon)
        SetBlipColour(blip, blipColor)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blipName)
        EndTextCommandSetBlipName(blip)
    end
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

------------------------------------------------------ LISTENERS -------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent('barber:getOldSkinFromServer')
AddEventHandler('barber:getOldSkinFromServer', function(skin)
	----print("------------- Test get old skin --------------------------------------------------")
    new_skin.hair           = skin.hair
    new_skin.hair_color    = skin.hair_color
    new_skin.beard          = skin.beard
    new_skin.beard_color    = skin.beard_color
    new_skin.eyebrows       = skin.eyebrows
    new_skin.eyebrows_color = skin.eyebrows_color
    new_skin.makekup        = skin.makekup
    new_skin.makekup_opacity= skin.makekup_opacity
    new_skin.lipstick       = skin.lipstick
    new_skin.lipstick_color = skin.lipstick_color
end)

RegisterNetEvent('barber:closeMenu')
AddEventHandler('barber:closeMenu', function(status)
    freeze(false)
    Menu.hidden = true
    if status.transaction then
        ShowNotification('~g~ Vous avez payé ~y~'..status.price..'€')
    else
        ShowNotification("~r~ Vous n'avez pas assez d'argent !")
    end
    --TriggerServerEvent('skin:loadSkinAndPosition')
end)

local horsZone = true
local wait = 1000

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if horsZone then
		    wait = 1000
		end
    end
end)

Citizen.CreateThread(function()
    setMapMarkers(barbersStores, 71, 21, "Barbier/Coiffeur")
    while true do
        Citizen.Wait(wait)
        local pos = GetEntityCoords(GetPlayerPed(-1), false)
        for _,d in ipairs( barbersStores )do
            if Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < 15.0 then
			horsZone = false
			wait = 0
                DrawMarkers(d, 71, 255, 255, 0, 155)
				else
				horsZone = false
            end
            if(Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < d.activationDist ) then
                SetTextComponentFormat("STRING")
                AddTextComponentString("Appuyez sur la touche ~INPUT_CONTEXT~ pour ouvrir le magasin.")
                DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            end
            if(IsControlJustPressed(1, 51) and Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) <  d.activationDist ) then
                TriggerServerEvent('barber:getOldSkin', source)
				----print("--- Test get old skin ")
                clearAllProperties()

                new_skin = skinChooser:create()
                BarberShopMenu() -- Menu to draw
                --freeze(true)
                Menu.hidden = not Menu.hidden
            end
        end
        Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
    end
end)

------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------- MENU ---------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function BarberShopMenu()
    options.menu_subtitle = "Bienvenue"
    local price =  new_skin.hair_price_selected
            + new_skin.hair_color_price_selected
            + new_skin.eyebrows_price_selected
            + new_skin.eyebrows_color_price_selected
            + new_skin.beard_price_selected
            + new_skin.beard_color_price_selected
            + new_skin.makeup_price_selected
            + new_skin.makeup_opacity_price_selected
            + new_skin.lipstick_price_selected
            + new_skin.lipstick_color_price_selected

    ClearMenu()
    Menu.addButton("Coupe de cheveux       - prix : ~r~".. hair_price+hair_color_price.." €", "hairCutMenu", nil)
    Menu.addButton("Coupe des sourcils     - prix : ~r~".. eyebrows_price+eyebrows_color_price.." €", "eyebrowsMenu", nil)
    Menu.addButton("Coupe de la barbe      - prix : ~r~".. beard_price+beard_color_price.." €", "beardCutMenu", nil)
    Menu.addButton("Maquillage             - prix : ~r~".. makeup_price+makeup_opacity_price.." €", "makeupMenu", nil)
    Menu.addButton("Rouge à lèvres         - prix : ~r~".. lipstick_price+lipstick_color_price.." €", "lipstickMenu", nil)
    Menu.addButton("Payer"..spacebetween.."~y~"..tostring(price).." €", "barberPayMenu", price)
end

------------------------------------------------------ HAIR ------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

------------ HAIRCUT ---------
function hairCutMenu()
    options.menu_subtitle = "Coupe"
    ClearMenu()
    Menu.addButton("Retour", "BarberShopMenu", nil)
    for i = 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 2) -1 do
        if i ~= new_skin.hair then
            Menu.addButton("Coupe n°"..i.."     - prix : ~r~".. hair_price.." €", "hairCutMenuAction", {id = i, price = hair_price}, "hairCutMenuSelected")
        else
            Menu.addButton("Coupe n°"..i..spacebetween.." ~y~ACTUEL", "hairCutMenuAction", {id = i, price = 0}, "hairCutMenuSelected")
        end
    end
    Menu.addButton("Retour", "BarberShopMenu", nil)
end
function hairCutMenuSelected(item)
    SetPedComponentVariation(GetPlayerPed(-1), 2, item.id, 0, 0)
end
function hairCutMenuAction(item)
    new_skin.hair = item.id
    new_skin.hair_price_selected = item.price
    hairColorMenu()
end

----------- HAIR COLOR ----------
function hairColorMenu()

    options.menu_subtitle = "Couleur"
    ClearMenu()
    Menu.addButton("Retour", "BarberShopMenu", nil)
    for i = 0,  GetNumHairColors() do
        if i ~= new_skin.hair_color then
            Menu.addButton("Couleur n°"..i.."     - prix : ~r~".. hair_color_price.." €", "hairColorMenuAction", {id = i, price = hair_color_price}, "hairColorMenuSelected")
        else
            Menu.addButton("Couleur n°"..i..spacebetween.." ~y~ACTUEL", "hairColorMenuAction", {id = i, price = 0}, "hairColorMenuSelected")
        end
    end
    Menu.addButton("Retour", "BarberShopMenu", nil)
end
function hairColorMenuSelected(item)
    SetPedHairColor(GetPlayerPed(-1), item.id,4)
end
function hairColorMenuAction(item)
    SetPedHairColor(GetPlayerPed(-1), item.id,4)
    new_skin.hair_color = item.id
    new_skin.hair_color_price_selected = item.price
    BarberShopMenu()
end

------------------------------------------------------ EYEBROWS --------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

------------ HAIRCUT ---------
function eyebrowsMenu()
    options.menu_subtitle = "Sourcils"
    ClearMenu()
    Menu.addButton("Retour", "BarberShopMenu", nil)
    for i = 0, GetNumHeadOverlayValues(2) do
        if i ~= new_skin.eyebrows then
            Menu.addButton("Forme n°"..i.."     - prix : ~r~".. eyebrows_price.." €", "eyeBrowsMenuAction", {id = i, price = eyebrows_price}, "eyeBrowsMenuSelected")
        else
            Menu.addButton("Forme n°"..i..spacebetween.." ~y~ACTUEL", "eyeBrowsMenuAction", {id = i, price = 0}, "eyeBrowsMenuSelected")
        end
    end
    Menu.addButton("Retour", "BarberShopMenu", nil)
end
function eyeBrowsMenuSelected(item)
    SetPedHeadOverlay(GetPlayerPed(-1),  2,  item.id, 1.0)
end
function eyeBrowsMenuAction(item)
    new_skin.eyebrows = item.id
    new_skin.eyebrows_price_selected = item.price
    eyebrowsColorMenu()
end

----------- HAIR COLOR ----------
function eyebrowsColorMenu()

    options.menu_subtitle = "Couleur des sourcils"
    ClearMenu()
    Menu.addButton("Retour", "BarberShopMenu", nil)
    for i = 0,  GetNumHairColors() do
        if i ~= new_skin.eyebrows_color then
            Menu.addButton("Couleur n°"..i.."     - prix : ~r~".. eyebrows_color_price.." €", "eyeBrowsColorMenuAction", {id = i, price = eyebrows_color_price}, "eyeBrowsColorMenuSelected")
        else
            Menu.addButton("Couleur n°"..i..spacebetween.." ~y~ACTUEL", "eyeBrowsColorMenuAction", {id = i, price = 0}, "eyeBrowsColorMenuSelected")
        end
    end
    Menu.addButton("Retour", "BarberShopMenu", nil)
end
function eyeBrowsColorMenuSelected(item)
    SetPedHeadOverlay(GetPlayerPed(-1),  2,  new_skin.eyebrows, 1.0)
    SetPedHeadOverlayColor(GetPlayerPed(-1),  2, 1,item.id, 1.0 )
end
function eyeBrowsColorMenuAction(item)
    new_skin.eyebrows_color = item.id
    new_skin.eyebrows_color_price_selected = item.price
    BarberShopMenu()
end

-------------------------------------------------------- BEARD ---------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

---------- CUT -----------
function beardCutMenu()

    options.menu_subtitle = "Barbe"
    ClearMenu()
    Menu.addButton("Retour", "BarberShopMenu", nil)
    for i = 0, GetNumHeadOverlayValues(1) do
        if i ~= new_skin.beard then
            Menu.addButton("Coupe n°"..i.."     - prix : ~r~".. beard_price.." €", "beardCutMenuAction", {id = i, price = beard_price}, "beardCutMenuSelected" )
        else
            Menu.addButton("Coupe n°"..i..spacebetween.." ~y~ACTUEL", "beardCutMenuAction", {id = i, price = 0}, "beardCutMenuSelected")
        end
    end
    Menu.addButton("Retour", "BarberShopMenu", nil)
end
function beardCutMenuSelected(item)
    SetPedHeadOverlay(GetPlayerPed(-1),  1,  item.id,  (item.id / 10) + 0.0)
    SetPedHeadOverlayColor(GetPlayerPed(-1),  1,  1,  1, 1)
end
function beardCutMenuAction(item)
    new_skin.beard = item.id
    new_skin.beard_price_selected = item.price
    beardColorMenu()
end

------- BEARD COLOR -------
function beardColorMenu()
    options.menu_subtitle = "Couleur de la barbe"
    ClearMenu()
    Menu.addButton("Retour", "BarberShopMenu", nil)
    for i = 0, GetNumHairColors() do
        if i ~= new_skin.beard_color then
            Menu.addButton("Couleur n°"..i.."     - prix : ~r~".. beard_color_price.." €", "beardColorMenuAction", {id = i, price = beard_color_price}, "beardColorMenuSelected")
        else
            Menu.addButton("Couleur n°"..i..spacebetween.." ~y~ACTUEL", "beardColorMenuAction", {id = i, price = 0}, "beardColorMenuSelected")
        end
    end
    Menu.addButton("Retour", "BarberShopMenu", nil)
end
function beardColorMenuSelected(item)
    SetPedHeadOverlay(GetPlayerPed(-1),  1,  new_skin.beard ,  (new_skin.beard  / 10) + 0.0)
    SetPedHeadOverlayColor(GetPlayerPed(-1),  1,  1,  item.id, 1.0)
end
function beardColorMenuAction(item)
    new_skin.beard_color = item.id
    new_skin.beard_color_price_selected = item.price
    BarberShopMenu()
end

------------------------------------------------------ MAKEUP ----------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

------- MAKEUP  -------
function makeupMenu()
    options.menu_subtitle = "Maquillage"
    ClearMenu()
    Menu.addButton("Retour", "BarberShopMenu", nil)
    for i = 0, GetNumHairColors() do
        if i ~= new_skin.makeup then
            Menu.addButton("Couleur n°"..i.."     - prix : ~r~".. makeup_price.." €", "makeupMenuAction", {id = i, price = makeup_price}, "makeupMenuSelected")
        else
            Menu.addButton("Couleur n°"..i..spacebetween.." ~y~ACTUEL", "makeupMenuAction", {id = i, price = 0}, "makeupMenuSelected")
        end
    end
    Menu.addButton("Retour", "BarberShopMenu", nil)
end
function makeupMenuSelected(item)
    SetPedHeadOverlay(GetPlayerPed(-1), 4, item.id, 1.0)
end
function makeupMenuAction(item)
    new_skin.makeup = item.id
    new_skin.makeup_price_selected = item.price
    makeupOpacityMenu()
end

---------- MAKEUP OPACITY -----------
function makeupOpacityMenu()
    options.menu_subtitle = "Opacite du Maquillage"
    ClearMenu()
    Menu.addButton("Retour", "BarberShopMenu", nil)
    for i = 0, 10 do
        if i ~= new_skin.makeup_opacity then
            Menu.addButton("Couleur n°"..i.."     - prix : ~r~".. makeup_opacity_price.." €", "makeupOpacityMenuAction", {id = i, price = makeup_opacity_price}, "makeupOpacityMenuSelected")
        else
            Menu.addButton("Couleur n°"..i..spacebetween.." ~y~ACTUEL", "makeupOpacityMenuAction", {id = i, price = 0}, "makeupOpacityMenuSelected")
        end
    end
    Menu.addButton("Retour", "BarberShopMenu", nil)
end
function makeupOpacityMenuSelected(item)

    SetPedHeadOverlay(GetPlayerPed(-1), 4, new_skin.makeup, item.id / 10)
end
function makeupOpacityMenuAction(item)
    new_skin.makeup_opacity = item.id
    new_skin.makeup_opacity_price_selected = item.price
    BarberShopMenu()
end

------------------------------------------------------ LIPSTICK --------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

------- LIPSTICK  -------
function lipstickMenu()
    options.menu_subtitle = "Rouge à lèvres"
    ClearMenu()
    Menu.addButton("Retour", "BarberShopMenu", nil)
    for i = 0, GetNumHairColors() do
        if i ~= new_skin.lipstick then
            Menu.addButton("Couleur n°"..i.."     - prix : ~r~".. lipstick_price.." €", "lipstickMenuAction", {id = i, price = lipstick_price}, "lipstickMenuSelected")
        else
            Menu.addButton("Couleur n°"..i..spacebetween.." ~y~ACTUEL", "lipstickMenuAction", {id = i, price = 0}, "lipstickMenuSelected")
        end
    end
    Menu.addButton("Retour", "BarberShopMenu", nil)
end
function lipstickMenuSelected(item)
    SetPedHeadOverlay(GetPlayerPed(-1), 8, item.id, 1.0)
end
function lipstickMenuAction(item)
    new_skin.lipstick = item.id
    new_skin.lipstick_price_selected = item.price
    lipstickColorMenu()
end

---------- LIPSTICK COLOR -----------
function lipstickColorMenu()
    options.menu_subtitle = "Couleur rouge à lèvres"
    ClearMenu()
    Menu.addButton("Retour", "BarberShopMenu", nil)
    for i = 0,  GetNumHairColors() do
        if i ~= new_skin.makeup_opacity then
            Menu.addButton("Couleur n°"..i.."     - prix : ~r~".. lipstick_color_price.." €", "lipstickColorMenuAction", {id = i, price = lipstick_color_price}, "lipstickColorMenuSelected")
        else
            Menu.addButton("Couleur n°"..i..spacebetween.." ~y~ACTUEL", "lipstickColorMenuAction", {id = i, price = 0}, "lipstickColorMenuSelected")
        end
    end
    Menu.addButton("Retour", "BarberShopMenu", nil)
end
function lipstickColorMenuSelected(item)
    SetPedHeadOverlayColor(GetPlayerPed(-1), 8, 1, item.id, 1.0)
end
function lipstickColorMenuAction(item)
    new_skin.lipstick_color = item.id
    new_skin.lipstick_color_price_selected = item.price
    BarberShopMenu()
end

------------------------------------------------------ PAY EVENT -------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function barberPayMenu(price)
    TriggerServerEvent('barber:pay', price, new_skin)
end

function clearAllProperties()
    ClearPedProp(GetPlayerPed(-1),0)
    ClearPedProp(GetPlayerPed(-1),1)
    ClearPedProp(GetPlayerPed(-1),2)
    SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0)
end
