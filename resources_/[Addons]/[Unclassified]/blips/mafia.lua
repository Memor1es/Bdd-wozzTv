local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="Garduña", colour=0, id=89, x = -1893.197, y = 2036.329, z = 50.0},

  }
      


Citizen.CreateThread(function()

		Citizen.Wait(0)

local bool = true
  
  if bool then
        
		for k,v in pairs(blips) do
           

               zoneblip = AddBlipForRadius(v.x,v.y,v.z, 145.0)
                          SetBlipSprite(zoneblip,1.1)
                          SetBlipColour(zoneblip,85)
                          SetBlipAlpha(zoneblip,100)
                         
        end
         
    
         for _, info in pairs(blips) do
        
             info.blip = AddBlipForCoord(info.x, info.y, info.z)
                         SetBlipSprite(info.blip, info.id)
                         SetBlipDisplay(info.blip, 4)
                         SetBlipScale(info.blip, 1.1)
                         SetBlipColour(info.blip, info.colour)
                         SetBlipAsShortRange(info.blip, true)
                         BeginTextCommandSetBlipName("STRING")
                         AddTextComponentString(info.title)
                         EndTextCommandSetBlipName(info.blip)
         end
	   
	   bool = false
   
   end
end)