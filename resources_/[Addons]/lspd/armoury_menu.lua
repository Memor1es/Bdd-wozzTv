armoury_menu = false

local custom_skins = true

local armoury = {

    {name="Armurerie", id=175, x=460.724, y=-981.088, z=30.9}, -- Mission row

    {name="Armurerie", id=175, x=-450.52, y=6011.33, z=31.72}, -- Paleto Bay

    {name="Armurerie", id=175, x=2456.671, y=-836.8339, z=-37.26654}, -- Sandy Shores

    {name="Armurerie", id=175, x=-1078.54, y=-857.00, z=5.6}, -- San Andreas Ave

    {name="Armurerie", id=175, x=-566.57, y=-132.83, z=37.96}, -- Rockford Hills

}



local guns = {}

if custom_skins then

    guns = {

        {"Tazer", {m="WEAPON_STUNGUN", v=nil, c=nil, f=nil, a=nil, s=nil}},

        {"Fumigènes", {m="WEAPON_FLARE", v=nil, c=nil, f=nil, a=20, s=nil}},

        {"GAZ", {m="WEAPON_BZGas", v=nil, c=nil, f=nil, a=20, s=nil}},

        {"Lampe Torche", {m="WEAPON_FLASHLIGHT", v=nil, c=nil, f=nil, a=nil, s=nil}},

        {"Pistolet De Combat", {m="WEAPON_COMBATPISTOL", v=nil, c="COMPONENT_COMBATPISTOL_CLIP_02", f="COMPONENT_AT_PI_FLSH", a=350, s=nil}},

        {"Pistolet Lourd", {m="weapon_heavypistol", v=nil, c="COMPONENT_HEAVYPISTOL_CLIP_02", f="COMPONENT_AT_PI_FLSH", a=350, s=nil}},

        {"Revolver", {m="weapon_revolver", v=nil, c="COMPONENT_REVOLVER_CLIP_01", f=nil, a=350, s=nil}},

        {"Fusil à pompe", {m="weapon_pumpshotgun", v=nil, c=nil, f="COMPONENT_AT_AR_FLSH", a=200, s=nil}},

        {"Mitraillette", {m="weapon_smg", v="COMPONENT_AT_SCOPE_MACRO_02", c="COMPONENT_SMG_CLIP_02", f="COMPONENT_AT_AR_FLSH", a=250, s=nil}},

		{"Carabine", {m="WEAPON_CARBINERIFLE", v="COMPONENT_AT_SCOPE_MEDIUM", c="COMPONENT_CARBINERIFLE_CLIP_02", f="COMPONENT_AT_AR_FLSH", a=250, s=nil}},

        {"Pistolet automatique", {m="weapon_appistol", v=nil, c="COMPONENT_APPISTOL_CLIP_01", f="COMPONENT_AT_PI_FLSH", a=250, s=nil}},

        -- {"Sniper", {m="weapon_sniperrifle", v="COMPONENT_AT_SCOPE_MAX", c="COMPONENT_SNIPERRIFLE_CLIP_01", f=nil, a=10, s=nil}},

        --{"Mitraillette MK2", {m="weapon_smg_mk2", v="COMPONENT_AT_SIGHTS_SMG", c="COMPONENT_SMG_MK2_CLIP_02", f="COMPONENT_AT_AR_FLSH", a=200, s=nil}},

		--{"Carabine", {m="WEAPON_CARBINERIFLE", v=nil, c="COMPONENT_CARBINERIFLE_CLIP_02", f="COMPONENT_AT_AR_FLSH", a=200, s=nil}},

		--{"Carabine MK2", {m="WEAPON_CARBINERIFLE_MK2", v="COMPONENT_AT_SCOPE_MACRO_MK2", c="COMPONENT_CARBINERIFLE_MK2_CLIP_02", f="COMPONENT_AT_AR_FLSH", a=200, s=nil}},

		--{"Carabine MK2 silencieux", {m="WEAPON_CARBINERIFLE_MK2", v="COMPONENT_AT_SCOPE_MACRO_MK2", c="COMPONENT_CARBINERIFLE_MK2_CLIP_02", f="COMPONENT_AT_AR_FLSH", a=200, s="COMPONENT_AT_AR_SUPP"}},

		--{"Carabine speciale MK2", {m="weapon_specialcarbine_mk2", v="COMPONENT_AT_SCOPE_MACRO_MK2", c="COMPONENT_SPECIALCARBINE_MK2_CLIP_02", f="COMPONENT_AT_AR_FLSH", a=200, s=nil}},

		--{"Mitrailleuse MK2", {m="weapon_combatmg_mk2", v="COMPONENT_AT_SIGHTS", c="COMPONENT_COMBATMG_MK2_CLIP_02", f=nil, a=200, s=nil}},

        --{"Sniper MK2", {m="weapon_heavysniper_mk2", v="COMPONENT_AT_SCOPE_MAX", c="COMPONENT_HEAVYSNIPER_MK2_CLIP_02", f=nil, a=200, s=nil}},

    }

else

    guns = {

        {"Tazer", {m="WEAPON_STUNGUN", v=nil, c=nil, f=nil, a=nil, s=nil}},

        {"Lampe Torche", {m="WEAPON_FLASHLIGHT", v=nil, c=nil, f=nil, a=nil, s=nil}},

        {"Couteau", {m="WEAPON_KNIFE", v=nil, c=nil, f=nil, a=nil, s=nil}},

        {"Pistolet De Combat", {m="WEAPON_COMBATPISTOL", v=nil, c="COMPONENT_COMBATPISTOL_CLIP_02", f="COMPONENT_AT_PI_FLSH", a=350, s=nil}},

        {"Pistol.50", {m="WEAPON_PISTOL50", v=nil, c="COMPONENT_PISTOL50_CLIP_02", f="COMPONENT_AT_PI_FLSH", a=350, s=nil}},

        {"Mitraillette", {m="weapon_smg", v="COMPONENT_AT_SIGHTS", c="COMPONENT_COMBATMG_MK2_CLIP_02", f="COMPONENT_AT_AR_FLSH", a=200, s=nil}},

        {"Carabine", {m="WEAPON_CARBINERIFLE", v="COMPONENT_AT_SCOPE_MEDIUM", c="COMPONENT_CARBINERIFLE_CLIP_02", f="COMPONENT_AT_AR_FLSH", a=200, s=nil}},

        {"Fusil A Pompe", {m="weapon_pumpshotgun", v=nil, c=nil, f="COMPONENT_AT_AR_FLSH", a=200, s=nil}},

        {"Bullpup Rifle", {m="weapon_bullpuprifle", v="COMPONENT_AT_SCOPE_SMALL", c="COMPONENT_BULLPUPRIFLE_CLIP_02", f="COMPONENT_AT_AR_FLSH", a=200, s="COMPONENT_AT_AR_SUPP"}},

        {"Sniper", {m="weapon_sniperrifle", v="COMPONENT_AT_SCOPE_MAX", c="COMPONENT_SNIPERRIFLE_CLIP_01", f=nil, a=12, s="COMPONENT_AT_AR_SUPP_02"}},

        {"Fumigènes", {m="WEAPON_FLARE", v=nil, c=nil, f=nil, a=20, s=nil}},

        {"GAZ", {m="WEAPON_BZGas", v=nil, c=nil, f=nil, a=20, s=nil}},

    }

end



function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end

currentPed = nil

currentPos = nil



Citizen.CreateThread(function()

	while true do

		currentPed = GetPlayerPed(-1)

		currentPos = GetEntityCoords(currentPed, false)

		Citizen.Wait(500)

	end

end)

local inservice



Citizen.CreateThread(function()

Citizen.Wait(250)

  while true do

    Citizen.Wait(10000)

	if exports.metiers:getIsInService() then

	    inservice = true

		else

		inservice = false

	end

  end

end)



Citizen.CreateThread(function()

Citizen.Wait(5000)

    while true do

        Citizen.Wait(1)

		if inservice then

        	local pos = currentPos

        	for k,v in ipairs(armoury) do

            	if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 6.5)then

                	DrawMarker(27, v.x, v.y, v.z-1, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 0, 128, 255, 155, 0, 0, 2, 0, 0, 0, 0)

                	if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 1.0)then

                    	if not armoury_menu then

                        	--DisplayHelpText("Appuyez sur ~INPUT_CONTEXT~ pour ~b~ouvrir l'armurerie~w~!")

                        else

                        	--DisplayHelpText("Appuyez sur ~INPUT_CONTEXT~ pour ~b~fermer l'armurerie~w~!")

                        end

                    	if IsControlJustReleased(1, 51) then -- INPUT_CELLPHONE_DOWN

                            GUI.maxVisOptions = 10; GUI.titleText = {255, 255, 255, 255, 1}; GUI.titleRect = {0, 82, 165, 255}; GUI.optionText = {255, 255, 255, 255, 6}; GUI.optionRect = {40, 40, 40, 190}; GUI.scroller = {0, 128, 255, 255}; titleTextSize = {0.85, 0.80}; titleRectSize = {0.16, 0.085}; optionTextSize = {0.5, 0.5}; optionRectSize = {0.16, 0.035}; menuX = 0.75; menuXOption = 0.075; menuXOtherOption = 0.050; menuYModify = 0.3000; menuYOptionDiv = 8.56; menuYOptionAdd = 0.36;

                            Armoury()

                            armoury_menu = not armoury_menu

                    	end

                    elseif(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) > 1.0)then

                        armoury_menu = false

                    end

            	end

        	end

            if armoury_menu then

                menuX = 0.75

                car_menu = false

                cop_menu = false

                heli_menu = false

                clothing_menu = false

                Menu.DisplayCurMenu()

            end

			else

			Citizen.Wait(10000)

			end

	end

end)



local armourPosition = 1

function Armoury()

    Menu.SetupMenu("armoury_menu","Armurerie")

    Menu.Switch(nil,"armoury_menu")

    for ind, value in pairs(guns) do

        Menu.addOption("armoury_menu", function()

            if(Menu.Option(value[1]))then

                equipGun(value[2])

            end

        end)

    end

    Menu.addOption("armoury_menu", function()

        if(Menu.StringArray("Armour:", {"< Mettre >", "< Enlever >"}, armourPosition,function(cb) armourPosition = cb end)) then

            if armourPosition == 1 then

                SetPedArmour(currentPed, 100)

            elseif armourPosition == 2 then

                SetPedArmour(currentPed, 0)

            end

        end         

    end)  

end







function equipGun(gun)

    if gun.a == nil then

        GiveWeaponToPed(currentPed, GetHashKey(gun.m), 250, true, true)

    else

		GiveWeaponToPed(currentPed, GetHashKey(gun.m), gun.a, true, true)

	end



	if gun.v ~= nil then

		GiveWeaponComponentToPed(currentPed, GetHashKey(gun.m), GetHashKey(gun.v))  

	end



	if gun.c ~= nil then

		GiveWeaponComponentToPed(currentPed, GetHashKey(gun.m), GetHashKey(gun.c))  

	end



	if gun.s ~= nil then

		GiveWeaponComponentToPed(currentPed, GetHashKey(gun.m), GetHashKey(gun.s))  

	end



	if gun.f ~= nil then

		GiveWeaponComponentToPed(currentPed, GetHashKey(gun.m), GetHashKey(gun.f))  

	end



	if gun.g ~= nil then

		GiveWeaponComponentToPed(currentPed, GetHashKey(gun.m), GetHashKey(gun.g))  

	end

end





