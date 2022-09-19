Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1,  x = 1.5, y = 1.5, z = 1.0, r = 255, g = 0, b = 0, a = 100, rotate = false }

Config.ReviveReward               = 5000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 20 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 15 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = { coords = vector3(300.38, -575.01, 43.26), heading = 112.26 }

Config.Hospitals = {

	CentralLosSantos = {

		Blips = {

			{
				coords = vector3(308.75, -595.33, 43.28),
				sprite = 61,
				scale  = 1.0,
				color  = 1
			},

			--[[{
				coords = vector3(338.84, -1394.66, 32.51),
				sprite = 61,
				scale  = 1.0,
				color  = 1
			},

			{
				coords = vector3(1839.07, 3673.22, 34.28),
				sprite = 61,
				scale  = 1.0,
				color  = 1
			},

			{
				coords = vector3(-247.98, 6331.68, 32.43),
				sprite = 61,
				scale  = 1.0,
				color  = 1
			}]]
			
		},

		AmbulanceActions = {
			vector3(301.68, -599.19, 43.28),
			vector3(-823.84, -1238.74, 7.34),

		},

		Pharmacies = {
			vector3(311.26, -563.95, 43.28),
			vector3(-802.85, -1208.9, 7.34),
		},

		Vehicles = {
			{
				Spawner = vector3(296.8, -570.73, 43.26),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(288.03, -598.35, 43.18), heading = 341.7, radius = 4.0 },
					{ coords = vector3(291.98, -587.21, 43.19), heading = 342.59, radius = 4.0 },
					{ coords = vector3(275.89, -581.07, 43.11), heading = 340.11, radius = 4.0 },
					{ coords = vector3(270.36, -593.19, 43.19), heading = 340.31, radius = 4.0 }
				}
			}
		},

		VehiclesDeleter = {
			{
				Marker = { type = 24, x = 1.0, y = 1.0, z = 1.0, r = 255, g = 0, b = 0, a = 100, rotate = true },
				Deleter = vector3(290.31, -591.85, 43.17)
			},
			{
				Marker = { type = 24, x = 1.0, y = 1.0, z = 1.0, r = 255, g = 0, b = 0, a = 100, rotate = true },
				Deleter = vector3(292.95, -609.21, 43.36)
			},
			{
				Marker = { type = 24, x = 1.0, y = 1.0, z = 1.0, r = 255, g = 0, b = 0, a = 100, rotate = true },
				Deleter = vector3(352.67, -588.04, 74.9)
			},
		},

		Helicopters = {
			{
				Spawner = vector3(355.38, -578.23, 74.17),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(352.67, -588.04, 74.9), heading = 66.47, radius = 5.0 },
				}
			}
		},

	}
}

Config.AuthorizedVehicles = {

	emtb = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 35000},
		{ model = 'dodgeems', label = 'Dodge EMS', price = 50000}

	},

	emti = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 35000},
		{ model = 'dodgeems', label = 'Dodge EMS', price = 50000}
	},

	emta = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 35000},
		{ model = 'dodgeems', label = 'Dodge EMS', price = 50000}
	},

	paramedic = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 35000},
		{ model = 'dodgeems', label = 'Dodge EMS', price = 50000}
	},
	
	commander = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 35000},
		{ model = 'dodgeems', label = 'Dodge EMS', price = 50000}
	},

	paramedics = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 35000},
		{ model = 'dodgeems', label = 'Dodge EMS', price = 50000}
	},

	boss = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 35000},
		{ model = 'dodgeems', label = 'Dodge EMS', price = 50000}
	}

}

Config.AuthorizedHelicopters = {

	paramedic = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 150000 }
	},
	paramedics = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 150000 }
	},

	commander = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 150000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 300000 }
	},

	boss = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 150000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 300000 }
	}

}
