ESX                           = nil
local timer = 0
playerjob = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)
jobplate =  {police="PD "}
RegisterNetEvent("setjob")
AddEventHandler("setjob",function(job)
playerjob = job

end)

Citizen.CreateThread(function()
  local dict = "anim@mp_player_intmenu@key_fob@"
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
      Citizen.Wait(0)
  end
  while true do
	Citizen.Wait(0)
	if (IsControlJustReleased(1, 246)) then
			local coords = GetEntityCoords(GetPlayerPed(-1))
			local hasAlreadyLocked = false
			cars = ESX.Game.GetVehiclesInArea(coords, 15)
			local carstrie = {}
			local cars_dist = {}		
			notowned = 0
			if #cars == 0 then
				--ESX.ShowNotification("Mashini Baraye Ghofl Kardan Nazdik Shoma Nist.")
			else
				for j=1, #cars, 1 do
					local coordscar = GetEntityCoords(cars[j])
					local distance = Vdist(coordscar.x, coordscar.y, coordscar.z, coords.x, coords.y, coords.z)
					table.insert(cars_dist, {cars[j], distance})
				end
				for k=1, #cars_dist, 1 do
					local z = -1
					local distance, car = 200
					for l=1, #cars_dist, 1 do
						if cars_dist[l][2] < distance then
							distance = cars_dist[l][2]
							car = cars_dist[l][1]
							z = l
						end
					end
					if z ~= -1 then
						table.remove(cars_dist, z)
						table.insert(carstrie, car)
					end
				end
				for i=1, #carstrie, 1 do
					local plate = ESX.Math.Trim(GetVehicleNumberPlateText(carstrie[i]))
					ESX.TriggerServerCallback('carlock:isVehicleOwnerjob', function(owner)
					local target = nil
                        	if owner == 'police' then
							target = 'PD '
							elseif owner == 'mechanic' then
							target = 'MEC '
							elseif owner == 'ambulance' then
							target = 'EMS '
							elseif owner == 'taxi' then
							target = 'TX '
							elseif owner == 'vigne' then
							target = 'VIG '
                            end							
						if owner and hasAlreadyLocked ~= true and string.match(plate, target) then
						
							local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(carstrie[i]))
							vehicleLabel = GetLabelText(vehicleLabel)
							local lock = GetVehicleDoorLockStatus(carstrie[i])
							if lock == 1 or lock == 0 then
								SetVehicleDoorShut(carstrie[i], 0, false)
								SetVehicleDoorShut(carstrie[i], 1, false)
								SetVehicleDoorShut(carstrie[i], 2, false)
								SetVehicleDoorShut(carstrie[i], 3, false)
								SetVehicleDoorShut(carstrie[i], 4, false)
								SetVehicleDoorShut(carstrie[i], 5, false)
								SetVehicleDoorsLocked(carstrie[i], 2)
								PlayVehicleDoorCloseSound(carstrie[i], 1)
								--ESX.ShowNotification('Shoma ~y~'..vehicleLabel..'~s~ Ra ~r~Ghofl~s~ Kardid~s~.')
								TriggerEvent("pNotify:SendNotification", {text = 'Shoma '..vehicleLabel..' Ra Ghofl Kardid.', type = "error", timeout = 3000, layout = "centerRight"})
								TriggerServerEvent("sedahayeajibpersianpixelxd", 10, "lock", 0.5)
								ESX.TriggerServerCallback('esx_policejob:getIcName', function(PlayerName)

									if PlayerName ~= nil then
							
							
									end
							
								end)
								if not IsPedInAnyVehicle(PlayerPedId(), true) then
									TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
								end
								SetVehicleLights(carstrie[i], 2)
								Citizen.Wait(150)
								SetVehicleLights(carstrie[i], 0)
								Citizen.Wait(150)
								SetVehicleLights(carstrie[i], 2)
								Citizen.Wait(150)
								SetVehicleLights(carstrie[i], 0)
								hasAlreadyLocked = true
							elseif lock == 2 then
								SetVehicleDoorsLocked(carstrie[i], 1)
								PlayVehicleDoorOpenSound(carstrie[i], 0)
                                TriggerEvent("pNotify:SendNotification", {text = 'Shoma '..vehicleLabel..' Ra Baz Kardid.', type = "success", timeout = 3000, layout = "centerLeft"})
								TriggerServerEvent("sedahayeajibpersianpixelxd", 10, "unlock", 0.5)
								--ESX.TriggerServerCallback('esx_policejob:getIcName', function(PlayerName)

								--	if PlayerName ~= nil then
							
							
								--	end
							--
--end)
								if not IsPedInAnyVehicle(PlayerPedId(), true) then
									TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
								end
								SetVehicleLights(carstrie[i], 2)
								Citizen.Wait(150)
								SetVehicleLights(carstrie[i], 0)
								Citizen.Wait(150)
								SetVehicleLights(carstrie[i], 2)
								Citizen.Wait(150)
								SetVehicleLights(carstrie[i], 0)
								hasAlreadyLocked = true
							end
					--	else
						--	notowned = notowned + 1
						end
						--if notowned == #carstrie then
						--	ESX.ShowNotification("Mashini Baraye Ghofl Kardan Nazdik Shoma Nist.")
						--end	
					end)
				end			
			end
	end
  end
end)
