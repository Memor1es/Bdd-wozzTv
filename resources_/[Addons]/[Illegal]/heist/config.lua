Config = {}

Config.MaxLives = 3 -- this is the max lives in hacking thing 5 is max.

Config.Banks = {
	["Pacific"] = {
        ["start"] = { 
            ["pos"] = vector3(253.4314, 228.3452, 101.6833), 
            ["heading"] = 71.58 
        },
        ["door"] = { 
            ["pos"] = vector3(253.88, 224.52, 101.9),
            ["model"] = 961976194
        },
        ["device"] = {
            ["model"] = -160937700
        },
        ["trolleys"] = {
            ["1"] = { 
                ["pos"] = vector3(265.165, 212.18, 100.68), 
                ["heading"] = 35.3
            },
            ["2"] = { 
                ["pos"] = vector3(266.1008, 215.0974, 100.68), 
                ["heading"] = 91.5
            },
			["3"] = { 
                ["pos"] = vector3(263.5, 216.19, 100.68), 
                ["heading"] = 158.05
            },
			["4"] = { 
                ["pos"] = vector3(262.246, 213.0211, 100.68), 
                ["heading"] = 332.7
            }
        }
    }
}

Config.Trolley = {
    ["cash"] = { 30000, 30000 },
    ["model"] = GetHashKey("hei_prop_hei_cash_trolly_01")
}

Config.EmptyTrolley = {
    ["model"] = GetHashKey("hei_prop_hei_cash_trolly_03")
}