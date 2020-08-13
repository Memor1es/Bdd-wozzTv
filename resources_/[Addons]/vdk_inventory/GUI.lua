Menu = {}
Menu.GUI = {}
Menu.buttonCount = 0
Menu.selection = 0
Menu.hidden = true
MenuTitle = "Menu"

function Menu.addButton(name, func,args)
	local yoffset = 0.2
	local xoffset = 0.5
	local xmin = 0.0
	local xmax = 0.25
	local ymin = 0.03
	local ymax = 0.03
	Menu.GUI[Menu.buttonCount+1] = {}
	Menu.GUI[Menu.buttonCount+1]["name"] = name
	Menu.GUI[Menu.buttonCount+1]["func"] = func
	Menu.GUI[Menu.buttonCount+1]["args"] = args
	Menu.GUI[Menu.buttonCount+1]["active"] = false
	Menu.GUI[Menu.buttonCount+1]["xmin"] = xmin + xoffset
	Menu.GUI[Menu.buttonCount+1]["ymin"] = ymin * (Menu.buttonCount + 0.01) +yoffset
	Menu.GUI[Menu.buttonCount+1]["xmax"] = xmax 
	Menu.GUI[Menu.buttonCount+1]["ymax"] = ymax 
	Menu.buttonCount = Menu.buttonCount+1
end

function Menu.updateSelection() 
	if IsControlJustPressed(3, 173) then 
		if(Menu.selection < Menu.buttonCount -1 ) then
			Menu.selection = Menu.selection +1
		else
			Menu.selection = 0
		end		
	elseif IsControlJustPressed(3, 172) then
		if(Menu.selection > 0)then
			Menu.selection = Menu.selection -1
		else
			Menu.selection = Menu.buttonCount-1
		end	
	elseif IsControlJustPressed(3, 176)  then
		if Menu.buttonCount > 0 then
			MenuCallFunction(Menu.GUI[Menu.selection +1]["func"], Menu.GUI[Menu.selection +1]["args"])
		end
	end
	local iterator = 0
	for id, settings in ipairs(Menu.GUI) do
		Menu.GUI[id]["active"] = false
		if(iterator == Menu.selection ) then
			Menu.GUI[iterator +1]["active"] = true
		end
		iterator = iterator +1
	end
end

function Menu.renderGUI()
	if not Menu.hidden then
		Menu.renderButtons()
		Menu.updateSelection()
	end
end

function Menu.renderBox(xMin,xMax,yMin,yMax,color1,color2,color3,color4)
	DrawRect(xMin, yMin,xMax, yMax, color1, color2, color3, color4);
end

function Menu.renderButtons()
	local yoffset = 0.2
	local xoffset = 0.5
	--titre
	SetTextFont(7)
	SetTextScale(0.0, 0.7)
	SetTextColour(255, 255, 255, 190)
	SetTextEdge(0, 0, 0, 0, 0)
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString("Inventaire")
	DrawText((xoffset - 0.001), (yoffset - 0.071 ))
	--objets
	SetTextFont(0)
	SetTextScale(0.0, 0.2)
	SetTextColour(255, 255, 255, 190)
	SetTextEdge(0, 0, 0, 0, 0)
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(string.upper(MenuTitle))
	DrawText((xoffset - 0.001), (yoffset - 0.033 ))
	
	Menu.renderBox(xoffset,0.25,(yoffset - 0.05),0.07,50,0,10,190)
	for id, settings in pairs(Menu.GUI) do
		local screen_w = 0
		local screen_h = 0
		screen_w, screen_h =  GetScreenResolution(0, 0)
		if(settings["active"]) then
			boxColor = {255,255,255,190}
			SetTextColour(0, 0, 0, 190)
		else			
			boxColor = {0,0,0,190}
			SetTextColour(255, 255, 255, 190)	
		end
		SetTextFont(4)
		SetTextScale(0.0,0.43)
		SetTextCentre(false)
		SetTextEdge(0, 0, 0, 0, 0)
		SetTextEntry("STRING") 
		AddTextComponentString(settings["name"])
		DrawText(settings["xmin"]- 0.1, (settings["ymin"] - 0.015 )) 
		Menu.renderBox(settings["xmin"] ,settings["xmax"], settings["ymin"], settings["ymax"],boxColor[1],boxColor[2],boxColor[3],boxColor[4])
	end
end

function ClearMenu()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.selection = 0
end

function MenuCallFunction(fnc, arg)
	_G[fnc](arg)
end