local blips = {
     {title="Police Department", colour=26, id=60, x = 636.23, y = 2.65, z = 66.48},
     {title="Police Department", colour=26, id=60, x = -564.05, y = -127.47, z = 37.89},
     {title="Medical Department", colour=1, id=61, x = -822.43, y = -1223.39, z = 7.33},

  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)