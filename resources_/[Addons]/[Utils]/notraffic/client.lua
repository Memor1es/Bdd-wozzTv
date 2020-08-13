Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(0)

    SetParkedVehicleDensityMultiplierThisFrame(20.20)
    SetRandomVehicleDensityMultiplierThisFrame(20.20)
    SetVehicleDensityMultiplierThisFrame(20.0)
    SetSomeVehicleDensityMultiplierThisFrame(20.0)
	SetScenarioPedDensityMultiplierThisFrame(20.0, 20.0)
  end
end)

AddEventHandler('onResourceStart', function (resourceName)
  if resourceName == GetCurrentResourceName() then
    SetFarDrawVehicles(false)
  end
end)

AddEventHandler('onResourceStop', function (resourceName)
  if resourceName == GetCurrentResourceName() then
    SetFarDrawVehicles(true)
  end
end)
