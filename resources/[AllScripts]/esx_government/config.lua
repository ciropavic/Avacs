Config                            = {}



Config.DrawDistance               = 3.0

Config.MarkerType                 = 21

Config.MarkerTypeboss             = 22

Config.MarkerTypeveh              = 36

Config.MarkerTypevehdel           = 24

Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }

Config.MarkerColor                = { r = 50, g = 50, b = 204 }



Config.EnablePlayerManagement     = true

Config.EnableArmoryManagement     = true



Config.Government = {

	CityHall = {



		Blip = {

			Pos     = { x = -364.55, y = -994.58, z = 31.25 },

			Sprite  = 419,

			Display = 4,

			Scale   = 1.6

		},



		Cloakrooms = {

			{ x = 2514.35, y = -345.78, z = 101.89},

			{ x = -132.27, y = -633.03, z = 168.60}

		},



		Armory = {

			{ x = 2528.41, y = -338.86, z = 101.89 },

			{ x = -127.75, y = -633.57, z = 168.82 },

		},	



		BossActions = {

			{ x = -349.37, y = -991.25, z = 36.75 },

			{ x = -125.09, y = -641.500, z = 168.82 }

		},



		Vehicles = {

			{

				Spawner    = { x = -364.55, y = -994.58, z = 31.25 },

				SpawnPoint = { x = -343.16, y = -1012.54, z = 30.38 },

				Heading    = 113.45

			},

			{

				Spawner    = { x = 275.66, y = -344.95, z = 45.17 },

				SpawnPoint = { x = 266.28, y = -332.13, z = 44.92 },

				Heading    = 245.92

			}

		},



		Helicopters = {

			{

				Spawner    = { x = -373.89, y = -991.57, z = 36.87 },

				SpawnPoint = { x = -367.0, y = -1001.98, z = 37.55 },

				Heading    = 230.88

			}

		},



		VehicleDeleters = {

			{ x = -364.07, y = -1001.57 , z = 76.53 },

			{ x = 267.26, y = -328.83 , z = 44.92 }

		},



	}

}



Config.AuthorizedVehicles = {

	Shared = {			

		{ model = 'schafter5', label = 'Schafter Armored' },

		{ model = 'polschafter3', label = 'Pol Schafter' },

		{ model = 'rebla', label = 'Rebela' },

		{ model = 'saspacar4', label = 'Vapid Scout' },

		{ model = "umkcara", label = "Unmarked Caracara"},

		{ model = "policeinsurgent", label = "Insurgent"}

	},



	agent = {



	},



	sagent = {



	},



	supervisor = {



	},



	speaker = {



	},



	ddirector = {



	},



	director = {



	},

	

	boss = {



	},

	

}



Config.AuthorizedWeapons = {

	{ name = 'WEAPON_STUNGUN'},

	{ name = 'WEAPON_FLASHLIGHT'},

	{ name = 'WEAPON_PISTOL'},

	{ name = 'WEAPON_COMBATPISTOL'},

	{ name = 'WEAPON_HEAVYPISTOL'},

	{ name = 'WEAPON_MICROSMG'},

	{ name = 'WEAPON_SMG'},

	{ name = 'WEAPON_CARBINERIFLE'},

	{ name = 'WEAPON_ADVANCEDRIFLE'},

	

	director = {

	{ name = 'WEAPON_HEAVYSNIPER'},

	},

	

	boss = {

	{ name = 'WEAPON_HEAVYSNIPER'},

	},

}



Config.Uniforms = {

	agent_wear = {

		male = {

			['tshirt_1'] = 13,  ['tshirt_2'] = 0,

			['torso_1'] = 4,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 38,

			['pants_1'] = 28,   ['pants_2'] = 0,

			['shoes_1'] = 15,   ['shoes_2'] = 0,

			['helmet_1'] = -1,   ['helmet_2'] = 0,

			['chain_1'] = 38,    ['chain_2'] = 0,

			['ears_1'] = 0,     ['ears_2'] = 0,

			['glasses_1'] = 5,  ['glasses_2'] = 0,

			['mask_1'] = 121,   ['mask_2'] = 0

		}

	},

	sagent_wear = {

		male = {

			['tshirt_1'] = 13,  ['tshirt_2'] = 0,

			['torso_1'] = 4,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 38,

			['pants_1'] = 28,   ['pants_2'] = 0,

			['shoes_1'] = 15,   ['shoes_2'] = 0,

			['helmet_1'] = -1,   ['helmet_2'] = 0,

			['chain_1'] = 38,    ['chain_2'] = 0,

			['ears_1'] = 0,     ['ears_2'] = 0,

			['glasses_1'] = 5,  ['glasses_2'] = 0,

			['mask_1'] = 121,   ['mask_2'] = 0

		}

	},

	supervisor_wear = {

		male = {

			['tshirt_1'] = 13,  ['tshirt_2'] = 0,

			['torso_1'] = 4,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 38,

			['pants_1'] = 28,   ['pants_2'] = 0,

			['shoes_1'] = 15,   ['shoes_2'] = 0,

			['helmet_1'] = -1,   ['helmet_2'] = 0,

			['chain_1'] = 38,    ['chain_2'] = 0,

			['ears_1'] = 0,     ['ears_2'] = 0,

			['glasses_1'] = 5,  ['glasses_2'] = 0,

			['mask_1'] = 121,   ['mask_2'] = 0

		}

	},

	speaker_wear = {

		male = {

			['tshirt_1'] = 13,  ['tshirt_2'] = 0,

			['torso_1'] = 4,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 38,

			['pants_1'] = 28,   ['pants_2'] = 0,

			['shoes_1'] = 15,   ['shoes_2'] = 0,

			['helmet_1'] = -1,   ['helmet_2'] = 0,

			['chain_1'] = 38,    ['chain_2'] = 0,

			['ears_1'] = 0,     ['ears_2'] = 0,

			['glasses_1'] = 5,  ['glasses_2'] = 0,

			['mask_1'] = 121,   ['mask_2'] = 0

		}

	},

	ddirector_wear = {

		male = {

			['tshirt_1'] = 53,  ['tshirt_2'] = 1,

			['torso_1'] = 13,   ['torso_2'] = 2,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 37,

			['pants_1'] = 28,   ['pants_2'] = 0,

			['shoes_1'] = 15,   ['shoes_2'] = 0,

			['helmet_1'] = 10,   ['helmet_2'] = 5,

			['chain_1'] = 1,    ['chain_2'] = 0,

			['ears_1'] = -1,     ['ears_2'] = 0,

			['mask_1'] = 121,   ['mask_2'] = 0,

			['bproof_1'] = 16 , ['bproof_2'] = 2,

		}

	},

	director_wear = {

		male = {

			['tshirt_1'] = 53,  ['tshirt_2'] = 1,

			['torso_1'] = 13,   ['torso_2'] = 2,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 37,

			['pants_1'] = 28,   ['pants_2'] = 0,

			['shoes_1'] = 15,   ['shoes_2'] = 0,

			['helmet_1'] = 10,   ['helmet_2'] = 5,

			['chain_1'] = 1,    ['chain_2'] = 0,

			['ears_1'] = -1,     ['ears_2'] = 0,

			['mask_1'] = 121,   ['mask_2'] = 0,

			['bproof_1'] = 16 , ['bproof_2'] = 2,

		}

	},

	boss_wear = {

		male = {

			['tshirt_1'] = 53,  ['tshirt_2'] = 1,

			['torso_1'] = 13,   ['torso_2'] = 2,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 37,

			['pants_1'] = 28,   ['pants_2'] = 0,

			['shoes_1'] = 15,   ['shoes_2'] = 0,

			['helmet_1'] = 10,   ['helmet_2'] = 5,

			['chain_1'] = 1,    ['chain_2'] = 0,

			['ears_1'] = -1,     ['ears_2'] = 0,

			['mask_1'] = 121,   ['mask_2'] = 0,

			['bproof_1'] = 16 , ['bproof_2'] = 2,

		}

	},

	noose_wear = {

		male = {

			['tshirt_1'] = 130,  ['tshirt_2'] = 0,

			['torso_1'] = 19,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 17,

			['pants_1'] = 31,   ['pants_2'] = 0,

			['shoes_1'] = 24,   ['shoes_2'] = 0,

			['helmet_1'] = 123,   ['helmet_2'] = 0,

			['chain_1'] = 1,    ['chain_2'] = 0,

			['ears_1'] = -1,     ['ears_2'] = 0,

			['mask_1'] = 57,   ['mask_2'] = 0,

			['bproof_1'] = 0, ['bproof_2'] = 0,

		}

	},

}