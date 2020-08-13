local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

function Chat(t)
	TriggerEvent("chatMessage", 'Debut de la chirurgie', { 0, 255, 255}, "" .. tostring(t))
end

RegisterNetEvent("chirurgie:createBlip")
AddEventHandler("chirurgie:createBlip", function(type, x, y, z)
	local blip = AddBlipForCoord(x, y, z)
	SetBlipSprite(blip, type)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	if(type == 362)then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("chirurgie")
		EndTextCommandSetBlipName(blip)
	end
end)


local entitySkin
local entityQuantity = 1
local missionX = 295.11566162109
local missionY = -1448.0784912109
local missionZ = 30.966617584229

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

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



local airportPos = { ['x'] = -1041.833, ['y'] = -2744.754, ['z'] = 21.35941 }
local hospitalPos = { ['x'] = 295.1034, ['y'] = -1448.15, ['z'] = 29.96662 }

Citizen.CreateThread(function()
	TriggerEvent('chirurgie:createBlip', 362, airportPos.x, airportPos.y, airportPos.Z)
	TriggerEvent('chirurgie:createBlip', 362, hospitalPos.x, hospitalPos.y, hospitalPos.Z)

	while true do
		Citizen.Wait(wait)
		
		local myPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(myPed, false)
		
		if(Vdist(airportPos.x, airportPos.y, airportPos.z, pos.x, pos.y, pos.z) < 15.0) then
		    horsZone = false
		    wait = 5
			DrawMarker(1, airportPos.x, airportPos.y, airportPos.z - 1, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 0, 0, 50, 0,0, 0,0)
			if(Vdist(airportPos.x, airportPos.y, airportPos.z, pos.x, pos.y, pos.z) < 1.5) then
				DisplayHelpText("~INPUT_CONTEXT~ Pour ~r~changer~w~ de physique a n'utiliser ~r~qu'en cas de bug~w~")
				if(IsControlJustReleased(1, 51))then
					TriggerEvent("skin:openSkinCreator")
				end
			end
			else
			horsZone = true
		end
		
		if(Vdist(hospitalPos.x, hospitalPos.y, hospitalPos.z, pos.x, pos.y, pos.z) < 20.0) then
		horsZone = false
		 wait = 5
			DrawMarker(1, hospitalPos.x, hospitalPos.y, hospitalPos.z - 1, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 0, 0, 50, 0,0, 0,0)
			if(Vdist(hospitalPos.x, hospitalPos.y, hospitalPos.z, pos.x, pos.y, pos.z) < 1.5) then
				DisplayHelpText("~INPUT_CONTEXT~ Pour ~r~changer~w~ de physique a n'utiliser ~r~qu'en cas de bug~w~")
				if(IsControlJustReleased(1, 51))then
					TriggerEvent("skin:openSkinCreator")
				end
			end
			else
			horsZone = true
		end
	end
end)