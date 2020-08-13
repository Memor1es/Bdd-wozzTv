-- Config

local infos = {

    { message="~h~Pour ~g~obtenir~s~ une arme, veuillez passer votre ~g~PPA~s~ au ~g~commissariat~s~.", color=49, name="Armurerie", id=110, scale=1.0, x = 20.873529434204,	 y = -1107.0363769531,	z = 28.797029495239   },

    --{ message="~h~Pour ~g~obtenir~s~ une arme, veuillez passer votre ~g~PPA~s~ au ~g~commissariat~s~.", color=49, name="Armurerie", id=110, scale=1.0, x = -663.23571777344, y = -935.42932128906,	z = 20.829217910767	  },

    { message="~h~Pour ~g~obtenir~s~ une arme, veuillez passer votre ~g~PPA~s~ au ~g~commissariat~s~.", color=49, name="Armurerie", id=110, scale=1.0, x = 811.27746582031,	 y = -2157.1936035156,	z = 28.618989944458   },

    { message="~h~Pour ~g~obtenir~s~ une arme, veuillez passer votre ~g~PPA~s~ au ~g~commissariat~s~.", color=49, name="Armurerie", id=110, scale=1.0, x = -1305.6514892578, y = -393.06079101563,	z = 35.69575881958    },

    { message="~h~Pour ~g~obtenir~s~ une arme, veuillez passer votre ~g~PPA~s~ au ~g~commissariat~s~.", color=49, name="Armurerie", id=110, scale=1.0, x = 252.16716003418,	 y = -48.767250061035,	z = 68.941009521484   },

}



function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end



Citizen.CreateThread(function()

	for k,v in ipairs(infos)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, v.id)
		SetBlipColour(blip, v.color)
		SetBlipScale(blip, v.scale)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.name)
		EndTextCommandSetBlipName(blip)
	end

end)



Citizen.CreateThread(function()

	while true do

		local ply = GetPlayerPed(-1)

		local plyCoords = GetEntityCoords(ply, 0)



		for _, item in pairs(infos) do

			local distance = GetDistanceBetweenCoords(item.x, item.y, item.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)

			if(distance < 4) then

				DisplayHelpText(item.message)

			end

		end



		Citizen.Wait(1)

	end

end)