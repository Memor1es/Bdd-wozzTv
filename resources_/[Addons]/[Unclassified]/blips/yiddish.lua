local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="Yiddish", colour=0, id=442, x = -98.48885, y = 995.1359, z = 235.7323},

  }
      


Citizen.CreateThread(function()

		Citizen.Wait(0)

local bool = true
  
  if bool then
        
		for k,v in pairs(blips) do
           

               zoneblip = AddBlipForRadius(v.x,v.y,v.z, 145.0)
                          SetBlipSprite(zoneblip,1.1)
                          SetBlipColour(zoneblip,67)
                          SetBlipAlpha(zoneblip,100)
                         
        end
         
    
         for _, info in pairs(blips) do
        
             info.blip = AddBlipForCoord(info.x, info.y, info.z)
                         SetBlipSprite(info.blip, info.id)
                         SetBlipDisplay(info.blip, 4)
                         SetBlipScale(info.blip, 1.1)
                         --SetBlipColour(info.blip, info.colour)
                         SetBlipAsShortRange(info.blip, true)
                         BeginTextCommandSetBlipName("STRING")
                         AddTextComponentString(info.title)
                         EndTextCommandSetBlipName(info.blip)
         end
	   
	   bool = false
   
   end
end)