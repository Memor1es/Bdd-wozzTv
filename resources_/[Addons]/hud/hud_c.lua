



local hudactivationnotbool = false

local hudactivationnotboolJeu = false

local hudpanoramique = false

local hudpanoramique2 = false

local hudpanoramique3 = false



local InCall = false



RegisterNetEvent('hud:active')

AddEventHandler('hud:active',function() 



	if not hudactivationnotbool then

		hudactivationnotbool = true

	else

		hudactivationnotbool = false

	end

end)



RegisterNetEvent('hud:activeJeu')

AddEventHandler('hud:activeJeu',function()

	hudactivationnotboolJeu = not hudactivationnotboolJeu

end)



RegisterNetEvent('hud:activePanoramique')

AddEventHandler('hud:activePanoramique',function()

	hudpanoramique = not hudpanoramique

	hudpanoramique2 = false

	hudpanoramique3 = false

end)

RegisterNetEvent('hud:activePanoramique2')

AddEventHandler('hud:activePanoramique2',function()

	hudpanoramique2 = not hudpanoramique2

	hudpanoramique = false

	hudpanoramique3 = false

end)

RegisterNetEvent('hud:activePanoramique3')

AddEventHandler('hud:activePanoramique3',function()

	hudpanoramique3 = not hudpanoramique3

	hudpanoramique2 = false

	hudpanoramique = false

end)









local InCall = false



--[[Citizen.CreateThread(function() 

Citizen.Wait(2500)

	while true do 

		Citizen.Wait(1000)

		Citizen.CreateThread(function()

			InCall = exports.gcphone.CallStatus()

		end)

	end

end)]]



function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline, fontId, shadowp1, shadowp2, shadowp3, shadowp4, floatp1, floatp2)

	SetTextFont(fontId)

	SetTextProportional(1)

	SetTextScale(scale, scale)

	SetTextColour(r, g, b, a)

	SetTextDropshadow(shadowp1, shadowp2, shadowp3, shadowp4,255)

	SetTextEdge(1, 0, 0, 0, 255)

	SetTextDropShadow()

	if(outline)then

		SetTextOutline()

	end

	

	SetTextWrap(floatp1, floatp2)

	SetTextEntry("STRING")

	

	AddTextComponentString(text)

	DrawText(x - width/2, y - height/2 + 0.005)

end



local DrawRect = DrawRect

local DrawText = DrawText

local DrawSprite = DrawSprite

local talk



Citizen.CreateThread(function()

Citizen.Wait(2500)

	while true do

		Citizen.Wait(5)



		if hudactivationnotboolJeu then 

			HideHudAndRadarThisFrame()

		end

		if hudpanoramique then 

			DrawRect(0.5, 0.0, 2.0, 0.05, 0, 0, 0, 255 )

			DrawRect(0.5, 1.0, 2.0, 0.05, 0, 0, 0, 255 )

		end

		if hudpanoramique2 then 

			DrawRect(0.5, 0.0, 2.0, 0.1, 0, 0, 0, 255 )

			DrawRect(0.5, 1.0, 2.0, 0.1, 0, 0, 0, 255 )

		end

		if hudpanoramique3 then 

			DrawRect(0.5, 0.0, 2.0, 0.2, 0, 0, 0, 255 )

			DrawRect(0.5, 1.0, 2.0, 0.2, 0, 0, 0, 255 )

		end

		

		---- HUD pour dire quand on parle ou non

		local nada = ""

        --

		---- 0.5 = 524 288

		---- 0.01 = 10 486 ----- 10485.76

        



		if not hudactivationnotbool then

			if NetworkIsPlayerTalking(PlayerId()) then 

			

			talk = true

				DrawSprite( "mplobby", "mp_charcard_stats_icons9", 0.172, 0.820, 0.015, 0.025, 0, 0, 255, 0, 255 )

				drawTxt(0.685, 1.302, 1.0,1.0,0.3, tostring(nada), 0, 255, 0, 255, true, 8, 1, 1, 1, 1, 0.0, 1.0)

				-- TriggerServerEvent('Mic:Chatter')

			elseif not NetworkIsPlayerTalking(PlayerId()) and IsControlPressed(1, 249) then 

				DrawSprite( "mplobby", "mp_charcard_stats_icons9", 0.172, 0.820, 0.015, 0.025, 0, 255, 120, 0, 255 )

				talk = false

				

				

				TimingTalk = GetGameTimer()

				if not TimingTalkBool then

					TimingTalk2 = GetGameTimer() + 500

					TimingTalkBool = true

				end

				

				if TimingTalk >= TimingTalk2 then

					drawTxt(0.685, 1.295, 1.0,1.0,0.5, "~y~Apparement, vous ne parlez pas, vérifiez vos options de chat vocal ...", 255, 120, 0, 255, true, 8, 1, 1, 1, 1, 0.0, 1.0)

				else

					drawTxt(0.685, 1.302, 1.0,1.0,0.3, tostring(nada), 255, 120, 0, 180, true, 8, 1, 1, 1, 1, 0.0, 1.0)

				end

			else

				

				if InCall then 

					DrawSprite( "mplobby", "mp_charcard_stats_icons9", 0.172, 0.820, 0.015, 0.025, 0, 255, 120, 0, 255 )

					drawTxt(0.685, 1.295, 1.0,1.0,0.5, "~r~Quand vous êtes au telephone, vous devez parler en jeu ...", 255, 120, 0, 255, true, 8, 1, 1, 1, 1, 0.0, 1.0)

				else

					DrawSprite( "mplobby", "mp_charcard_stats_icons9", 0.172, 0.820, 0.015, 0.025, 0, 255, 255, 255, 120 )

					drawTxt(0.685, 1.302, 1.0,1.0,0.3, tostring(nada), 255, 255, 255, 180, true, 8, 1, 1, 1, 1, 0.0, 1.0)

				end

				

			end

		end

	end

end)