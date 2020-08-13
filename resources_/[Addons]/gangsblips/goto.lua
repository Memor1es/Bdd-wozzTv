local blips = {
    {title="Casino", colour=0, id=439, x = 924.2281, y = 46.43788, z = 28.55}
}

Citizen.CreateThread(function()

		Citizen.Wait(0)
		
local bool = true

	if bool then
	
		for k,v in pairs(blips) do
		
	  zoneblip = AddBlipForRadius(v.x,v.y,v.z, 800.0)
				 SetBlipSprite(zoneblip,1)
				 SetBlipColour(zoneblip,40)
				 SetBlipAlpha(zoneblip,75)
				 
		end

    for _, info in pairs(blips) do
	
	
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
				  SetBlipSprite(info.blip, info.id)
				  SetBlipDisplay(info.blip, 4)
				  SetBlipScale(info.blip, 1.5)
				  SetBlipColour(info.blip, info.colour)
				  SetBlipAsShortRange(info.blip, true)
				  BeginTextCommandSetBlipName("STRING")
				  AddTextComponentString(info.title)
				  EndTextCommandSetBlipName(info.blip)
    end
	
	bool = false
end
end)