--[[Register]]--



RegisterNetEvent('avanyaveh:FinishMoneyCheckForVeh')

RegisterNetEvent('vehshop:spawnVehicle')

RegisterNetEvent('vehshop:cancelBuyVehicle')







--[[Local/Global]]--



local vehshop = {

    opened = false,

    title = "Concessionnaire",

    currentmenu = "main",

    lastmenu = nil,

    currentpos = nil,

    selectedbutton = 0,

    marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },

    menu = {

        x = 0.9,

        y = 0.1,

        width = 0.2,

        height = 0.04,

        buttons = 10,

        from = 1,

        to = 10,

        scale = 0.4,

        font = 0,

        ["main"] = {

            title = "CATEGORIES",

            name = "main",

            buttons = {

                {name = "Vehicles", description = ""},

                {name = "Motorcycles", description = ""},

            }

        },

        ["vehicles"] = {

            title = "VEHICULES",

            name = "vehicles",

            buttons = {

                {name = "Starters", description = ''},

                {name = "Coupes", description = ''},

                {name = "Sedans", description = ''},

                {name = "Sports", description = ''},

                {name = "Sports Classics", description = ''},

                {name = "Super", description = ''},

                {name = "Muscle", description = ''},

                {name = "Off-Road", description = ''},

                {name = "SUVs", description = ''},

                {name = "Vans", description = ''},

            }

        },

        ["starters"] = {

            title = "starters",

            name = "starters",

            buttons = {

				{name = "Tornado Rat Rod",		costs = 3000, description = {}, model = "tornado6", vMax="75.12", accel="67.5", frein= "26.67"},

                {name = "Tornado Rusty",		costs = 3500, description = {}, model = "tornado3", vMax="75.12", accel="67.5", frein= "26.67"},--fait

                {name = "Panto",				costs = 3995, description = {}, model = "panto", vMax="70.82", accel="67.5", frein= "20"},--fait

                {name = "Retinue",				costs = 4300, description = {}, model = "retinue", vMax="80.48", accel="65", frein= "20"},

                {name = "Tornado",				costs = 4500, description = {}, model = "tornado", vMax="75.12", accel="67.5", frein= "26.67"},--fait

                {name = "Roosevelt",			costs = 4500, description = {}, model = "btype", vMax="80.48", accel="65", frein= "20"},

                {name = "Roosevelt Valor",		costs = 4500, description = {}, model = "btype3", vMax="80.48", accel="65", frein= "20"},

                {name = "Tornado2",				costs = 4800, description = {}, model = "tornado2", vMax="75.12", accel="67.5", frein= "26.67"},--fait

                {name = "Blista",				costs = 4895, description = {}, model = "blista", vMax="72.43", accel="57.5", frein= "20" },--fait

                {name = "Tornado3",				costs = 5000, description = {}, model = "tornado3", vMax="75.12", accel="67.5", frein= "26.67"},--fait

                {name = "Tornado4",				costs = 5200, description = {}, model = "tornado4", vMax="75.12", accel="67.5", frein= "26.67"},--fait

                {name = "Fagaloa",				costs = 5500, description = {}, model = "fagaloa", vMax="80.48", accel="65", frein= "20"},

                {name = "Tornado Custom",		costs = 5500, description = {}, model = "tornado5", vMax="75.12", accel="67.5", frein= "26.67"},

                {name = "Issi",					costs = 5995, description = {}, model = "issi2", vMax="72.43", accel="57.5", frein= "20"},

                {name = "Rhapsody",				costs = 5995, description = {}, model = "rhapsody", vMax="71.36", accel="57.5", frein= "20"},--fait

                {name = "Peyote",				costs = 6500, description = {}, model = "peyote", vMax="80.48", accel="65", frein= "20"},

                {name = "Rat-Loader",			costs = 6500, description = {}, model = "ratloader", vMax="72.43", accel="55", frein= "26.67"},

                {name = "Pigalle",				costs = 6800, description = {}, model = "pigalle", vMax="79.95", accel="66.25", frein= "28.33"},

                {name = "Issi classique",		costs = 7800, description = {}, model = "issi3", vMax="72.43", accel="57.5", frein= "20"},

                {name = "Prairie",				costs = 7995, description = {}, model = "prairie", vMax="72.43", accel="55", frein= "20"},

                {name = "Rat-Truck",			costs = 8000, description = {}, model = "ratloader2", vMax="72.43", accel="55", frein= "26.67"},

                {name = "Franken Stange",		costs = 8500, description = {}, model = "btype2", vMax="81.02", accel="85", frein= "16.67"},

                {name = "Cheburek",				costs = 9500, description = {}, model = "cheburek", vMax="81.02", accel="85", frein= "16.67"},

                {name = "Brioso R/A",			costs = 9855, description = {}, model = "brioso", vMax="72.43", accel="72.5", frein= "20"},

                {name = "Dilettante",			costs = 9895, description = {}, model = "Dilettante", vMax="69.75", accel="25", frein= "20"},

                {name = "Blista Compact",		costs = 10000, description = {}, model = "blista2", vMax="70.82", accel="57.5", frein= "18.33"},

                {name = "Blista Monkey",		costs = 10000, description = {}, model = "blista3", vMax="70.82", accel="57.5", frein= "18.33"},

                {name = "Michelli GT",			costs = 10000, description = {}, model = "michelli", vMax="80.48", accel="65", frein= "20"},

                {name = "Manana",				costs = 21500, description = {}, model = "manana", vMax="80.48", accel="65", frein= "20"},--fait

            }

        },

        ["coupes"] = {

            title = "coupes",

            name = "coupes",

            buttons = {

                {name = "Raptor",				costs = 20000, description = {}, model = "raptor", vMax="78.56", accel="78.32", frein= "30.33"},

                {name = "Ruston",				costs = 35000, description = {}, model = "ruston", vMax="79.40", accel="81.24", frein= "40.33"},

                {name = "Streiter",				costs = 35000, description = {}, model = "streiter", vMax="85.31", accel="83.75", frein= "33.33"},

                {name = "Zion",					costs = 42500, description = {}, model = "zion", vMax="77.8", accel="55", frein= "30"},--fait

                {name = "Sentinel ",			costs = 42550, description = {}, model = "sentinel", vMax="76.19", accel="52.5", frein= "30"},--fait

                {name = "Sentinel XS",			costs = 44980, description = {}, model = "sentinel2", vMax="76.19", accel="52.5", frein= "30"},--fait

                {name = "Zion Cabrio",			costs = 45000, description = {}, model = "zion2", vMax="77.8", accel="55", frein= "30"},--fait

                {name = "Oracle",				costs = 45000, description = {}, model = "oracle", vMax="80.48", accel="67.5", frein= "30"},--fait

                {name = "Oracle XS",			costs = 49890, description = {}, model = "oracle2", vMax="80.48", accel="65", frein= "30"},--fait

                {name = "Cognoscenti Cabrio",	costs = 50000, description = {}, model = "cogcabrio", vMax="77.8", accel="65", frein= "20"},

                {name = "Felon",				costs = 50500, description = {}, model = "felon", vMax="77.8", accel="60", frein= "30"},

                {name = "F620",					costs = 51200, description = {}, model = "f620", vMax="77.8", accel="60", frein= "30"},

                {name = "Jackal",				costs = 52500, description = {}, model = "jackal", vMax="76.46", accel="55", frein= "30"},--fait 

                {name = "Felon GT",				costs = 53200, description = {}, model = "felon2", vMax="77.8", accel="60", frein= "30"},

                {name = "Windsor",				costs = 53200, description = {}, model = "windsor", vMax="77.8", accel="65", frein= "20"},

                {name = "Exemplar",				costs = 54500, description = {}, model = "exemplar", vMax="77.8", accel="65", frein= "30"},

                {name = "Windsor Drop",			costs = 55000, description = {}, model = "windsor2", vMax="80.48", accel="69.75", frein= "23.33"},

            }

        },

        ["sports"] = {

            title = "sports",

            name = "sports",

            buttons = {

                {name = "Futo",					costs = 45000, description = {}, model = "futo", vMax="79.95", accel="80", frein= "30"},--fait

                {name = "Tropos",				costs = 50500, description = {}, model = "tropos", vMax="81.56", accel="56.25", frein= "23.33"},

                {name = "Schwarzer",			costs = 50500, description = {}, model = "schwarzer", vMax="80.48", accel="75", frein= "31.67"},

                {name = "Schafter LWB",			costs = 52500, description = {}, model = "schafter4", vMax="80.48", accel="75", frein= "31.67"},

                {name = "Penumbra",				costs = 55000, description = {}, model = "penumbra", vMax="75.12", accel="55", frein= "26.67"},--fait

                {name = "Schafter V12",			costs = 55000, description = {}, model = "schafter3", vMax="80.48", accel="75", frein= "31.67"},

                {name = "Drift Tampa",			costs = 58500, description = {}, model = "tampa2", vMax="80.48", accel="82.5", frein= "16.67"},

                {name = "Kuruma",				costs = 58500, description = {}, model = "kuruma", vMax="78.87", accel="77.5", frein= "16.67"},

                {name = "Buffalo",				costs = 60000, description = {}, model = "buffalo", vMax="77.8", accel="67.5", frein= "30"},--fait

                {name = "GB200",				costs = 60000, description = {}, model = "gb200", vMax="79.95", accel="80", frein= "30"},

                {name = "Rapid GT",				costs = 60000, description = {}, model = "rapidgt", vMax="81.56", accel="90", frein= "33.33"},--fait

                {name = "Sultan",				costs = 60000, description = {}, model = "sultan", vMax="77.8", accel="65", frein= "13.33"},--fait

                {name = "Elegy RH8",			costs = 61000, description = {}, model = "elegy2", vMax="81.55", accel="82.5", frein= "16.67"},--fait

                {name = "Rapid GT Convertible", costs = 61500, description = {}, model = "rapidgt2", vMax="81.56", accel="90", frein= "33.33"},--fait

                {name = "Elegy Retro",			costs = 62500, description = {}, model = "elegy", vMax="79.55", accel="82.5", frein= "33.33"},--fait              

                {name = "Omnis",				costs = 60500, description = {}, model = "omnis", vMax="81.56", accel="76.25", frein= "33.33"},

                {name = "Alpha",				costs = 65000, description = {}, model = "alpha", vMax="83.17", accel="85", frein= "33.33"},

                {name = "Buffalo Sprunk",		costs = 65000, description = {}, model = "buffalo3", vMax="77.8", accel="72.5", frein= "30"},--fait

                {name = "Buffalo S",			costs = 65000, description = {}, model = "buffalo2", vMax="77.8", accel="72.5", frein= "30"},--fait

                {name = "Feltzer",				costs = 68000, description = {}, model = "feltzer2", vMax="82.09", accel="85", frein= "26.67"},--fait

                {name = "Furore GT",			costs = 68500, description = {}, model = "furoregt", vMax="81.56", accel="83.75", frein= "26.67"},

                {name = "Surano",				costs = 68500, description = {}, model = "surano", vMax="83.17", accel="85", frein= "33.33"},--fait      

                {name = "Fusilade",				costs = 69500, description = {}, model = "fusilade", vMax="79.95", accel="80", frein= "30"},--fait

                {name = "Viseris",				costs = 69500, description = {}, model = "viseris", vMax="80.48", accel="83.75", frein= "33.33"},

                {name = "Khamelion",			costs = 70400, description = {}, model = "khamelion", vMax="81.78", accel="76.5", frein= "30.67"},--fait

                {name = "Jester",				costs = 71500, description = {}, model = "jester", vMax="84.78", accel="75", frein= "31.67"},

                {name = "Bestia GTS",			costs = 72000, description = {}, model = "bestiagts", vMax="83.17", accel="80", frein= "33.33"},

                {name = "Sentinel Classique",	costs = 72000, description = {}, model = "sentinel3", vMax="77.8", accel="65", frein= "13.33"},--fait

                {name = "Jester(Racecar)",		costs = 72500, description = {}, model = "jester2", vMax="84.78", accel="77.5", frein= "31.67"},

                {name = "Jester Classique",		costs = 72500, description = {}, model = "jester3", vMax="88.9", accel="80.5", frein= "34.5"},

                {name = "Flash GT",				costs = 72500, description = {}, model = "flashgt", vMax="82.09", accel="90.25", frein= "30"},

                {name = "Verlierer",			costs = 75000, description = {}, model = "verlierer2", vMax="80.48", accel="83.75", frein= "33.33"},

                {name = "Banshee",				costs = 75000, description = {}, model = "banshee", vMax="79.41", accel="85", frein= "33.33"},--fait

                {name = "Schlagen GT",			costs = 75000, description = {}, model = "schlagen", vMax="80.48", accel="75", frein= "31.67"},

                {name = "Specter",				costs = 76500, description = {}, model = "specter", vMax="85.31", accel="83.75", frein= "33.33"},

                {name = "Coquette",				costs = 77000, description = {}, model = "coquette", vMax="81.56", accel="82.5", frein= "26.67"},--fait

                {name = "Specter Custom",		costs = 77500, description = {}, model = "specter2", vMax="85.31", accel="83.75", frein= "33.33"},

                {name = "Carbonizzare",			costs = 80000, description = {}, model = "carbonizzare", vMax="84.78", accel="87.5", frein= "26.67"},--fait

                {name = "Revolter",				costs = 81000, description = {}, model = "revolter", vMax="83.81", accel="91", frein= "30"},

                {name = "Lynx",					costs = 81500, description = {}, model = "lynx", vMax="84.24", accel="78.75", frein= "33.33"},

                {name = "Massacro",				costs = 82400, description = {}, model = "massacro", vMax="82.09", accel="90.25", frein= "30"},

                {name = "9F",					costs = 82500, description = {}, model = "ninef", vMax="83.17", accel="82.5", frein= "33.33"},--fait

                {name = "Comet",				costs = 82500, description = {}, model = "comet2", vMax="81.56", accel="85", frein= "26.67"},--fait

                {name = "Seven-70",				costs = 82500, description = {}, model = "seven70", vMax="85.31", accel="83.75", frein= "33.33"},

                {name = "Massacro(Racecar)",	costs = 82900, description = {}, model = "massacro2", vMax="83.81", accel="91", frein= "30"},

                {name = "Raiden",				costs = 83500, description = {}, model = "raiden", vMax="85.31", accel="83.75", frein= "33.33"},

                {name = "9F Cabrio",			costs = 85000, description = {}, model = "ninef2", vMax="83.17", accel="82.5", frein= "33.33"},--fait

                {name = "Comet Retro",			costs = 85000, description = {}, model = "comet3", vMax="81.56", accel="85", frein= "26.67"},--fait

                {name = "Comet SR",				costs = 85000, description = {}, model = "comet5", vMax="81.56", accel="85", frein= "26.67"},--fait

                {name = "Pariah",				costs = 85500, description = {}, model = "pariah", vMax="83.81", accel="91", frein= "30"},

                {name = "ItaliGTO",				costs = 88000, description = {}, model = "italigto", vMax="79.40", accel="81.24", frein= "40.33"},

                {name = "Neon",					costs = 90000, description = {}, model = "neon", vMax="81.56", accel="85", frein= "26.67"},--fait

            }

        },

        ["sportsclassics"] = {

            title = "sports classics",

            name = "sportsclassics",

            buttons = {

                {name = "Turismo Classic",	costs = 49500, description = {}, model = "turismo2", vMax="75.12", accel="55", frein= "13.33"},

                {name = "Stinger",			costs = 51000, description = {}, model = "stinger", vMax="77.8", accel="65", frein= "20"},--fait

                {name = "Monroe",			costs = 51000, description = {}, model = "monroe", vMax="80.48", accel="65", frein= "20"},--fait

                {name = "JB 700",			costs = 52000, description = {}, model = "jb700", vMax="80.48", accel="65", frein= "20"},--fait

                {name = "Stinger GT",		costs = 52500, description = {}, model = "stingergt", vMax="77.8", accel="65", frein= "20"},--fait

                {name = "Mamba",			costs = 54500, description = {}, model = "mamba", vMax="80.48", accel="65", frein= "20"},

                {name = "Stirling GT",		costs = 55000, description = {}, model = "feltzer3", vMax="74.04", accel="75", frein= "26.67"},--fait

                {name = "Torero",			costs = 58500, description = {}, model = "torero", vMax="81.02", accel="80", frein= "20"},

                {name = "Z-Type",			costs = 60000, description = {}, model = "ztype", vMax="75.12", accel="55", frein= "13.33"},--fait

                {name = "Swinger",			costs = 60000, description = {}, model = "swinger", vMax="74.04", accel="75", frein= "26.67"},--fait

                {name = "Cheetah Classic",	costs = 70000, description = {}, model = "cheetah2", vMax="81.02", accel="80", frein= "20"},--fait

                {name = "Infernus Classic", costs = 72500, description = {}, model = "infernus2", vMax="81.02", accel="85", frein= "16.67"},--fait

                {name = "Casco",			costs = 75000, description = {}, model = "casco", vMax="81.02", accel="80", frein= "20"},

                {name = "Coquette Classic", costs = 78500, description = {}, model = "coquette2", vMax="81.02", accel="85", frein= "16.67"},

            }

        },

        ["super"] = {

            title = "super",

            name = "super",

            buttons = {

                {name = "Bullet",			costs = 105000, description = {}, model = "bullet", vMax="81.56", accel="82.5", frein= "26.67"},--fait

                {name = "Banshee 900R",		costs = 125000, description = {}, model = "banshee2", vMax="80.48", accel="86.88", frein= "33.33"},--fait

                {name = "Infernus",			costs = 135000, description = {}, model = "infernus", vMax="80.48", accel="85", frein= "16.67"},

                {name = "Voltic",			costs = 145000, description = {}, model = "voltic", vMax="77.8", accel="90", frein= "33.33"},--fait

                {name = "SC1",				costs = 145500, description = {}, model = "sc1", vMax="84.99", accel="91.38", frein= "36.67"},

                {name = "Cheetah",			costs = 145500, description = {}, model = "cheetah", vMax="82.09", accel="80", frein= "26.67"},--fait

                {name = "811",				costs = 150000, description = {}, model = "pfister811", vMax="85.85", accel="80", frein= "33.33"},

                {name = "Sultan RS",		costs = 150000, description = {}, model = "sultanrs", vMax="79.41", accel="82.5", frein= "33.33"},

                {name = "Penetrator",		costs = 151500, description = {}, model = "penetrator", vMax="83.31", accel="86.5", frein= "32.33"},

                {name = "Entity XF",		costs = 155000, description = {}, model = "entityxf", vMax="83.17", accel="82.5", frein= "30"},--fait

                {name = "GP1",				costs = 155000, description = {}, model = "gp1", vMax="86.11", accel="92.5", frein= "40"},

                {name = "Vacca",			costs = 155000, description = {}, model = "vacca", vMax="81.56", accel="75", frein= "33.33"},--fait

                {name = "XA-21",			costs = 155000, description = {}, model = "xa21", vMax="83.31", accel="90.75", frein= "37.67"},

                {name = "ETR1",				costs = 156300, description = {}, model = "sheava", vMax="85.04", accel="82.5", frein= "38.33"},

                {name = "RE-7B",			costs = 160000, description = {}, model = "le7b", vMax="86.38", accel="92.75", frein= "36.67"},

                {name = "Tempesta",			costs = 160000, description = {}, model = "tempesta", vMax="84.23", accel="90.0", frein= "33.33"},

                {name = "Turismo R",		costs = 160000, description = {}, model = "turismor", vMax="83.17", accel="88.25", frein= "40"},

                {name = "italigtb",			costs = 164500, description = {}, model = "italigtb", vMax="86.11", accel="92.5", frein= "40"},

                {name = "Tyrus",			costs = 165000, description = {}, model = "tyrus", vMax="86.38", accel="92.75", frein= "40"},

                {name = "FMJ",				costs = 165000, description = {}, model = "fmj", vMax="84.99", accel="91.38", frein= "36.67"},

                {name = "Osiris",			costs = 165500, description = {}, model = "osiris", vMax="85.31", accel="88.5", frein= "33.33"},

                {name = "T20",				costs = 175000, description = {}, model = "t20", vMax="85.31", accel="88.5", frein= "33.33"},

                {name = "italigtbcustom",	costs = 175000, description = {}, model = "italigtb2", vMax="86.11", accel="92.5", frein= "40"},

                {name = "Taipan",			costs = 178500, description = {}, model = "taipan", vMax="86.11", accel="92.5", frein= "40"},

                {name = "Visione",			costs = 179500, description = {}, model = "visione", vMax="85.31", accel="88.75", frein= "33.33"},

                {name = "Tyrant",			costs = 180000, description = {}, model = "tyrant", vMax="85.31", accel="88.5", frein= "33.33"},

                {name = "Nero",				costs = 181500, description = {}, model = "nero", vMax="86.11", accel="92.5", frein= "40"},

                {name = "Adder",			costs = 185000, description = {}, model = "adder", vMax="85.85", accel="80", frein= "33.33"},--fait

                {name = "Entity XXR",		costs = 185000, description = {}, model = "entity2", vMax="83.17", accel="82.5", frein= "30"},--fait

                {name = "NeroCustom",		costs = 185000, description = {}, model = "nero2", vMax="86.11", accel="92.5", frein= "40"},

                {name = "Vagner",			costs = 185000, description = {}, model = "vagner", vMax="83.56", accel="88.25", frein= "39.33"},

                {name = "Cyclone",			costs = 190000, description = {}, model = "cyclone", vMax="83.17", accel="88.25", frein= "40"},

                {name = "Deveste Eight",	costs = 195000, description = {}, model = "deveste", vMax="82.09", accel="80", frein= "26.67"},--fait

                {name = "Reaper",			costs = 195000, description = {}, model = "reaper", vMax="85.31", accel="91.25", frein= "36.67"},

                {name = "X80 Proto",		costs = 205000, description = {}, model = "prototipo", vMax="85.31", accel="93.75", frein= "36.67"},

                {name = "Zentorno",			costs = 205000, description = {}, model = "zentorno", vMax="85.31", accel="88.75", frein= "33.33"},

                {name = "Tezeract",			costs = 215000, description = {}, model = "tezeract", vMax="86.11", accel="92.5", frein= "40"},

            }

        },

        ["muscle"] = {

            title = "muscle",

            name = "muscle",

            buttons = {

                --{name = "BurgerShot Stalion", costs = 99999999999999999999, description = {}, model = "stalion2", vMax="78.34", accel="70", frein= "26.67"},

                --{name = "Pisswasser Dominator", costs = 9999999999999999999999, description = {}, model = "dominator2", vMax="77.8", accel="72.5", frein= "26.67"},

                --{name = "Redwood Gauntlet", costs = 9999999999999999999999999, description = {}, model = "gauntlet2", vMax="77.8", accel="75", frein= "30"},

                {name = "Slamvan",				costs = 8500, description = {}, model = "slamvan", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Slamvan Custom",		costs = 9500, description = {}, model = "slamvan3", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Ruiner",				costs = 9500, description = {}, model = "ruiner", vMax="77.8", accel="75", frein= "30"},

                {name = "Voodoo",				costs = 10500, description = {}, model = "voodoo2", vMax="75.12", accel="72.5", frein= "26.67"},

                {name = "Blade",				costs = 11000, description = {}, model = "blade", vMax="77.8", accel="81", frein= "26.67"},

                {name = "Yosemite",				costs = 11000, description = {}, model = "yosemite", vMax="75.12", accel="72.5", frein= "26.67"},

                {name = "Buccaneer",			costs = 11500, description = {}, model = "buccaneer", vMax="78.34", accel="70", frein= "26.67"},

                {name = "Chino",				costs = 11500, description = {}, model = "chino", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Picador",				costs = 11500, description = {}, model = "picador", vMax="72.43", accel="55", frein= "26.67"},

                {name = "Virgo",				costs = 11500, description = {}, model = "virgo", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Virgo Classic",		costs = 12000, description = {}, model = "virgo3", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Buccaneer Custom",		costs = 12000, description = {}, model = "buccaneer2", vMax="78.34", accel="70", frein= "26.67"},

                {name = "Chino Custom",			costs = 12000, description = {}, model = "chino2", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Tulip",				costs = 12000, description = {}, model = "tulip", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Virgo Custom",			costs = 12500, description = {}, model = "virgo2", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Voodoo Custom",		costs = 12500, description = {}, model = "voodoo", vMax="75.12", accel="72.5", frein= "26.67"},

                {name = "Faction",				costs = 12500, description = {}, model = "faction", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Stalion",				costs = 12500, description = {}, model = "stalion", vMax="78.34", accel="70", frein= "26.67"},

                {name = "Tampa",				costs = 13000, description = {}, model = "tampa", vMax="75.12", accel="67.5", frein= "26.67"},

                {name = "Faction Custom",		costs = 13000, description = {}, model = "faction2", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Sabre Turbo",			costs = 13500, description = {}, model = "sabregt", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Sabre Turbo Custom",	costs = 14000, description = {}, model = "sabregt2", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Vigero",				costs = 15000, description = {}, model = "vigero", vMax="75.12", accel="72.5", frein= "26.67"},

                {name = "Moonbeam",				costs = 16000, description = {}, model = "moonbeam", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Phoenix",				costs = 16500, description = {}, model = "phoenix", vMax="77.43", accel="55", frein= "26.67"},

                {name = "Vamos",				costs = 18500, description = {}, model = "vamos", vMax="75.12", accel="72.5", frein= "26.67"},

                {name = "Dukes",				costs = 19500, description = {}, model = "dukes", vMax="77.26", accel="80", frein= "26.67"},

                {name = "Hotknife",				costs = 19500, description = {}, model = "hotknife", vMax="75.12", accel="75", frein= "14.33"},

                {name = "Faction Custom Donk",	costs = 19500, description = {}, model = "faction3", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Ellie",				costs = 20500, description = {}, model = "ellie", vMax="77.26", accel="80", frein= "26.67"},

                {name = "Gauntlet",				costs = 24500, description = {}, model = "gauntlet", vMax="77.8", accel="75", frein= "30"},

                {name = "Moonbeam Custom",		costs = 24500, description = {}, model = "moonbeam2", vMax="75.12", accel="70", frein= "26.67"},

                {name = "Nightshade",			costs = 25000, description = {}, model = "nightshade", vMax="77.8", accel="62.5", frein= "20"},

                {name = "Coquette BlackFin",	costs = 28000, description = {}, model = "coquette3", vMax="81.02", accel="85", frein= "16.67"},

                {name = "Deviant",				costs = 31500, description = {}, model = "deviant", vMax="77.8", accel="72.5", frein= "26.67"},

                {name = "Hermes",				costs = 34500, description = {}, model = "hermes", vMax="77.8", accel="50", frein= "30"},

                {name = "Dominator",			costs = 35500, description = {}, model = "dominator", vMax="77.8", accel="72.5", frein= "26.67"},

                {name = "Dominator GTX",		costs = 38500, description = {}, model = "dominator3", vMax="77.8", accel="72.5", frein= "26.67"},

            }

        },

        ["offroad"] = {

            title = "off road",

            name = "off road",

            buttons = {

                --{name = "Insurgent", costs = 999999999999999999999999999, description = {}, model = "insurgent2", vMax="79.75", accel="50", frein= "20"},

                --{name = "Marshall", costs = 99999999999999999999999999999999, description = {}, model = "marshall", vMax="59.02", accel="100", frein= "21.67"},

                --{name = "The Liberator", costs = 999999999999999999999999999999999, description = {}, model = "monster", vMax="59.02", accel="100", frein= "21.67"},

                {name = "Blazer",			costs = 2900, description = {}, model = "blazer", vMax="67.07", accel="62.5", frein= "33.33"},

                {name = "Street Blazer",	costs = 3500, description = {}, model = "blazer4", vMax="67.07", accel="62.5", frein= "33.33"},

                {name = "Hot Rod Blazer",	costs = 4000, description = {}, model = "blazer3", vMax="67.07", accel="62.5", frein= "33.33"},

                {name = "StreetBlazer",		costs = 4800, description = {}, model = "blazer4", vMax="69.07", accel="62.5", frein= "33.33"},

                {name = "Bodhi",			costs = 5500, description = {}, model = "bodhi2", vMax="69.07", accel="62.5", frein= "33.33"},

                {name = "Kalahari",			costs = 7500, description = {}, model = "kalahari", vMax="69.75", accel="50", frein= "20"},

                {name = "Rancher XL",		costs = 7500, description = {}, model = "rancherxl", vMax="69.75", accel="50", frein= "20"},

                {name = "Rebel Rusty",		costs = 7500, description = {}, model = "rebel", vMax="69.75", accel="50", frein= "20"},

                {name = "Dune Loader",		costs = 8000, description = {}, model = "dloader", vMax="72.43", accel="62.5", frein= "21"},

                {name = "Sandking",			costs = 8300, description = {}, model = "sandking", vMax="69.75", accel="50", frein= "20"},

                {name = "Rebel",			costs = 8500, description = {}, model = "rebel2", vMax="69.75", accel="50", frein= "20"},

                {name = "Sandking XL",		costs = 8500, description = {}, model = "sandking2", vMax="69.75", accel="50", frein= "20"},

                {name = "Injection",		costs = 11000, description = {}, model = "bfinjection", vMax="69.75", accel="50", frein= "20"},

                {name = "Freecrawler",		costs = 12000, description = {}, model = "freecrawler", vMax="72.43", accel="62.5", frein= "21"},

                {name = "Bifta",			costs = 14500, description = {}, model = "bifta", vMax="72.97", accel="65", frein= "23.33"},

                {name = "Dune Buggy",		costs = 15000, description = {}, model = "dune", vMax="72.43", accel="62.5", frein= "21"},

                {name = "Riata",			costs = 23500, description = {}, model = "riata", vMax="73.51", accel="70", frein= "20"},

                {name = "Brawler",			costs = 45000, description = {}, model = "brawler", vMax="72.43", accel="62.5", frein= "20.67"},

                {name = "Desert Raid",		costs = 48500, description = {}, model = "trophytruck2", vMax="75.12", accel="84.75", frein= "10"},

                {name = "Bubsta 6x6",		costs = 55000, description = {}, model = "dubsta3", vMax="73.51", accel="70", frein= "20"},

                {name = "Trophy Truck",		costs = 48500, description = {}, model = "trophytruck", vMax="75.12", accel="84.75", frein= "10"},

                {name = "Guardian",			costs = 65000, description = {}, model = "guardian", vMax="75.12", accel="84.75", frein= "10"},

                {name = "Kamacho",			costs = 145000, description = {}, model = "kamacho", vMax="83.51", accel="110", frein= "20"},

            }

        },

        ["suvs"] = {

            title = "suvs",

            name = "suvs",

            buttons = {

                --{name = "Baller", costs = 99999999999999999999999999, description = {}, model = "baller", vMax="72.43", accel="67.5", frein= "20"},

                --{name = "Baller New", costs = 9999999999999999999999999999, description = {}, model = "baller2", vMax="72.43", accel="67.5", frein= "20"},

                --{name = "Baller LE", costs = 999999999999999999999999999999999, description = {}, model = "baller3", vMax="72.43", accel="67.5", frein= "20"},

                --{name = "Cavalcade", costs = 999999999999999999999999999, description = {}, model = "cavalcade", vMax="68.14", accel="50", frein= "20"},

                --{name = "Landstalker", costs = 99999999999999999999999999999, description = {}, model = "landstalker", vMax="72.43", accel="45", frein= "26.67"},

                --{name = "Mesa", costs = 999999999999999999999999999999, description = {}, model = "mesa", vMax="77.43", accel="48", frein= "26.67"},

                --{name = "Radius", costs = 99999999999999999999999999, description = {}, model = "radi", vMax="75.12", accel="50", frein= "26.67"},

                --{name = "Seminole", costs = 999999999999999999999999999999999999999999999, description = {}, model = "seminole", vMax="69.75", accel="45", frein= "26.67"},

                --{name = "Serrano", costs = 9999999999999999999999999999999999999999999, description = {}, model = "serrano", vMax="72.75", accel="45", frein= "26.67"},

                {name = "Habanero",			costs = 19500, description = {}, model = "habanero", vMax="72.43", accel="45", frein= "26.67"},

                {name = "Huntley S",		costs = 22000, description = {}, model = "huntley", vMax="72.97", accel="66.25", frein= "18.33"},

                {name = "Gresley",			costs = 22500, description = {}, model = "gresley", vMax="72.97", accel="66.25", frein= "18.33"},

                {name = "Cavalcade New",	costs = 23500, description = {}, model = "cavalcade2", vMax="68.14", accel="50", frein= "20"},

                {name = "Mesa Army",		costs = 24500, description = {}, model = "mesa3", vMax="77.43", accel="48", frein= "26.67"},

                {name = "BeeJay XL",		costs = 24500, description = {}, model = "bjxl", vMax="68.14", accel="50", frein= "20"},

                {name = "FQ 2",				costs = 25000, description = {}, model = "fq2", vMax="79.12", accel="47.5", frein= "26.67"},

                {name = "Rocoto",			costs = 26500, description = {}, model = "rocoto", vMax="74.58", accel="47.5", frein= "8.33"},

                {name = "Patriot",			costs = 27500, description = {}, model = "patriot", vMax="77.43", accel="48", frein= "26.67"},

                {name = "Dubsta",			costs = 28500, description = {}, model = "dubsta2", vMax="79.12", accel="47.5", frein= "26.67"},

                {name = "Granger",			costs = 28500, description = {}, model = "granger", vMax="75.12", accel="47.5", frein= "26.67"},

                {name = "XLS",				costs = 29500, description = {}, model = "xls", vMax="70.82", accel="65", frein= "19.33"},

                {name = "Baller LWB",		costs = 30000, description = {}, model = "baller4", vMax="72.43", accel="67.5", frein= "20"},

                {name = "Contender",		costs = 34500, description = {}, model = "contender", vMax="79.12", accel="47.5", frein= "26.67"},

                {name = "Toros",			costs = 60000, description = {}, model = "toros", vMax="72.75", accel="45", frein= "26.67"},

            }

        },

        ["vans"] = {

            title = "vans",

            name = "vans",

            buttons = {

                --{name = "Paradise", costs = 999999999999999999999999999999999999999, description = {}, model = "paradise", vMax="69.75", accel="42.5", frein= "13.33"},

                {name = "Surfer",					costs = 4500, description = {}, model = "surfer", vMax="53.66", accel="25", frein= "10"},

                {name = "Youga",					costs = 8300, description = {}, model = "youga", vMax="64.39", accel="35", frein= "10"},

                {name = "Youga classique",			costs = 8300, description = {}, model = "youga2", vMax="64.39", accel="35", frein= "10"},

                {name = "Rumpo",					costs = 8500, description = {}, model = "rumpo", vMax="69.75", accel="45", frein= "10"},

                {name = "Camper",					costs = 8500, description = {}, model = "camper", vMax="53.66", accel="32.5", frein= "8.33"},

                {name = "Boxville",					costs = 8800, description = {}, model = "boxville3", vMax="69.75", accel="42.5", frein= "13.33"},

                {name = "Speedo",					costs = 8700, description = {}, model = "speedo", vMax="69.75", accel="45", frein= "10"},

                {name = "Bobcat XL",				costs = 9500, description = {}, model = "bobcatxl", vMax="69.75", accel="45", frein= "26.67"},

                {name = "Gang Burrito",				costs = 9500, description = {}, model = "gburrito", vMax="69.75", accel="40", frein= "20"},

                {name = "Journey",					costs = 9500, description = {}, model = "journey", vMax="53.66", accel="32.5", frein= "8.33"},

                {name = "Minivan",					costs = 10000, description = {}, model = "minivan", vMax="67.07", accel="37.5", frein= "13.33"},

                {name = "Bison",					costs = 12000, description = {}, model = "bison", vMax="69.75", accel="50", frein= "20"},

                {name = "Rumpo Custom",				costs = 12500, description = {}, model = "rumpo3", vMax="69.75", accel="45", frein= "10"},

            }

        },

        ["sedans"] = {

            title = "sedans",

            name = "sedans",

            buttons = {

                {name = "Emperor2",			costs = 3500, description = {}, model = "emperor2", vMax="77.8", accel="50", frein= "30"},

                {name = "Asea",				costs = 5200, description = {}, model = "asea", vMax="77.8", accel="50", frein= "13.33"},

                {name = "Regina",			costs = 5200, description = {}, model = "regina", vMax="64.39", accel="35", frein= "20"},

                {name = "Emperor",			costs = 5400, description = {}, model = "emperor", vMax="77.8", accel="50", frein= "30"},

                {name = "Glendale",			costs = 5500, description = {}, model = "glendale", vMax="78.87", accel="58.75", frein= "21.67"},

                {name = "Asterope",			costs = 5500, description = {}, model = "asterope", vMax="77.8", accel="50", frein= "30"},

                {name = "Primo",			costs = 5800, description = {}, model = "primo", vMax="75.12", accel="50", frein= "30"},

                {name = "Ingot",			costs = 6100, description = {}, model = "ingot", vMax="67.07", accel="35", frein= "20"},

                {name = "Premier",			costs = 6400, description = {}, model = "premier", vMax="77.8", accel="50", frein= "20"},

                {name = "Warrener",			costs = 6400, description = {}, model = "warrener", vMax="75.12", accel="61.25", frein= "31.67"},

                {name = "Primo Custom",		costs = 6500, description = {}, model = "primo2", vMax="75.12", accel="50", frein= "30"},

                {name = "Intruder",			costs = 6500, description = {}, model = "intruder", vMax="77.8", accel="50", frein= "30"},

                {name = "Stratum",			costs = 7400, description = {}, model = "stratum", vMax="72.43", accel="52.5", frein= "20"},

                {name = "Stafford",			costs = 8400, description = {}, model = "stafford", vMax="72.43", accel="42.5", frein= "26.67"},

                {name = "Stanier",			costs = 8500, description = {}, model = "stanier", vMax="75.12", accel="50", frein= "30"},

                {name = "Washington",		costs = 8600, description = {}, model = "washington", vMax="75.12", accel="50", frein= "30"},

                {name = "Surge",			costs = 13500, description = {}, model = "surge", vMax="75.12", accel="25", frein= "20"},

                {name = "Tailgater",		costs = 22500, description = {}, model = "tailgater", vMax="77.8", accel="50", frein= "30"},

                {name = "Fugitive",			costs = 25000, description = {}, model = "fugitive", vMax="77.8", accel="50", frein= "30"},

                {name = "Schafter",			costs = 25000, description = {}, model = "schafter2", vMax="77.8", accel="50", frein= "30"},

                {name = "Cognoscenti 55",	costs = 32500, description = {}, model = "cog55", vMax="84.8", accel="72", frein= "30"},

                {name = "Cognoscenti",		costs = 35000, description = {}, model = "cognoscenti", vMax="84.8", accel="72", frein= "30"},

                {name = "Super Diamond",	costs = 35000, description = {}, model = "superd", vMax="77.8", accel="65", frein= "20"},

                {name = "Stretch",			costs = 54500, description = {}, model = "stretch", vMax="72.43", accel="42.5", frein= "26.67"},

            }

        },

        ["motorcycles"] = {

            title = "MOTORCYCLES",

            name = "motorcycles",

            buttons = {

                --{name = "Kawasaki kx450f", costs = 99999999999999999999999999999999999, description = {}, model = "kx450f", vMax="90.31", accel="70", frein= "36.67"},

                --{name = "Yamaha YZF R6", costs = 999999999999999999999999999999999999, description = {}, model = "r6", vMax="70.2", accel="70", frein= "36.67"},

                --{name = "BMW S1000 RR", costs = 9999999999999999999999999999999999, description = {}, model = "bmws", vMax="70.2", accel="70", frein= "36.67"},

                --{name = "TMAX", costs = 99999999999999999999999999999999, description = {}, model = "tmax", vMax="95.5", accel="50", frein= "70.5"},

                --{name = "Faggio", costs = 999999999999999999999999999999999999, description = {}, model = "faggio2", vMax="48.29", accel="25", frein= "13.33"},

                --{name = "FCR 1000", costs = 9999999999999999999999999999999999999999, description = {}, model = "fcr", vMax="78.87", accel="78.13", frein= "36.67"},

                --{name = "Shotaro", costs = 999999999999999999999999999, description = {}, model = "Shotaro", vMax="88.87", accel="79.13", frein= "36.67"},

				{name = "BMX",					costs = 100, description = {}, model = "bmx", vMax="5.0", accel="5.0", frein= "5.0"},

				{name = "Velo de crosse",		costs = 200, description = {}, model = "scorcher", vMax="5.0", accel="5.0", frein= "5.0"},

				{name = "Velo de course",		costs = 250, description = {}, model = "tribike", vMax="5.0", accel="5.0", frein= "5.0"},

                {name = "Faggio Custom",		costs = 1500, description = {}, model = "faggio3", vMax="48.29", accel="25", frein= "13.33"},

                {name = "Faggio Sport",			costs = 2000, description = {}, model = "faggio", vMax="48.29", accel="25", frein= "13.33"},

                {name = "Sanchez",				costs = 2500, description = {}, model = "sanchez2", vMax="63.31", accel="70", frein= "36.67"},

                {name = "Sanchez Sport",		costs = 2500, description = {}, model = "sanchez", vMax="63.31", accel="70", frein= "36.67"},

                {name = "Rat Bike",				costs = 2500, description = {}, model = "ratbike", vMax="75.12", accel="85", frein= "36.67"},

                {name = "Manchez",				costs = 4000, description = {}, model = "manchez", vMax="77.8", accel="72.5", frein= "36.67"},

                {name = "Enduro",				costs = 4200, description = {}, model = "enduro", vMax="63.85", accel="72.5", frein= "36.67"},

                {name = "Sovereign",			costs = 4500, description = {}, model = "sovereign", vMax="72.43", accel="67.5", frein= "36.67"},

                {name = "Daemon",				costs = 5800, description = {}, model = "daemon", vMax="72.43", accel="65", frein= "20"},

                {name = "Esskey",				costs = 5800, description = {}, model = "esskey", vMax="63.85", accel="72.5", frein= "36.67"},

                {name = "Wolfsbane",			costs = 5800, description = {}, model = "wolfsbane", vMax="72.43", accel="65", frein= "33.33"},

                {name = "PCJ-600",				costs = 5900, description = {}, model = "pcj", vMax="69.75", accel="65", frein= "43.33"},

                {name = "FCR 1000 Custom",		costs = 5900, description = {}, model = "fcr2", vMax="78.87", accel="78.13", frein= "36.67"},

                {name = "Thrust",				costs = 6000, description = {}, model = "thrust", vMax="81.56", accel="66.25", frein= "50"},

                {name = "Hexer",				costs = 6000, description = {}, model = "hexer", vMax="72.43", accel="65", frein= "33.33"},

                {name = "Vader",				costs = 6100, description = {}, model = "vader", vMax="75.12", accel="67.5", frein= "36.67"},

                {name = "Carbon RS",			costs = 6200, description = {}, model = "carbonrs", vMax="77.8", accel="75", frein= "43.33"},

                {name = "Daemon Custom",		costs = 6200, description = {}, model = "daemon2", vMax="72.43", accel="65", frein= "20"},

                {name = "Cliffhanger",			costs = 6300, description = {}, model = "cliffhanger", vMax="79.14", accel="79.5", frein= "36.67"},

                {name = "Innovation",			costs = 6400, description = {}, model = "innovation", vMax="72.43", accel="80", frein= "33.33"},

                {name = "Bagger",				costs = 6500, description = {}, model = "bagger", vMax="69.75", accel="52.5", frein= "40"},

                {name = "BF400",				costs = 6500, description = {}, model = "bf400", vMax="77.8", accel="72.5", frein= "36.67"},

                {name = "Nemesis",				costs = 6500, description = {}, model = "nemesis", vMax="75.12", accel="75", frein= "40"},

                {name = "Nightblade",			costs = 6500, description = {}, model = "nightblade", vMax="75.12", accel="75", frein= "40"},

                {name = "Double T",				costs = 6700, description = {}, model = "double", vMax="78.87", accel="77.5", frein= "46.67"},

                {name = "Chimera",				costs = 6800, description = {}, model = "chimera", vMax="79.14", accel="79.5", frein= "36.67"},

                {name = "Lectro",				costs = 6800, description = {}, model = "lectro", vMax="75.12", accel="70", frein= "40"},

                {name = "Vortex",				costs = 6800, description = {}, model = "vortex", vMax="86.87", accel="78.13", frein= "36.67"},

                {name = "Defiler",				costs = 6900, description = {}, model = "defiler", vMax="78.87", accel="77.5", frein= "46.67"},

                {name = "Ruffian",				costs = 7200, description = {}, model = "ruffian", vMax="75.12", accel="85", frein= "36.67"},

                {name = "Gargoyle",				costs = 7300, description = {}, model = "gargoyle", vMax="78.87", accel="78.13", frein= "36.67"},

                {name = "Avarus",				costs = 7500, description = {}, model = "Avarus", vMax="72.43", accel="65", frein= "33.33"},

                {name = "Diabolus",				costs = 7500, description = {}, model = "diablous", vMax="78.87", accel="77.5", frein= "46.67"},

                {name = "Diabolus Custom",		costs = 7900, description = {}, model = "diablous2", vMax="78.87", accel="77.5", frein= "46.67"},

                {name = "Zombie Bobber",		costs = 7900, description = {}, model = "zombiea", vMax="74.43", accel="67", frein= "33.33"},

                {name = "Zombie Chopper",		costs = 8200, description = {}, model = "zombieb", vMax="74.43", accel="67", frein= "33.33"},

                {name = "Sanctus",				costs = 8300, description = {}, model = "sanctus", vMax="86.87", accel="78.13", frein= "36.67"},

                {name = "Vindicator",			costs = 8900, description = {}, model = "vindicator", vMax="81.56", accel="66.25", frein= "50"},

                {name = "Akuma",				costs = 9500, description = {}, model = "AKUMA", vMax="77.8", accel="100", frein= "40"},

                {name = "Bati 801",				costs = 9000, description = {}, model = "bati", vMax="80.48", accel="75", frein= "46.67"},

                {name = "Bati 801RR",			costs = 9500, description = {}, model = "bati2", vMax="80.48", accel="75", frein= "46.67"},

                {name = "Hakuchou",				costs = 12500, description = {}, model = "hakuchou", vMax="81.56", accel="78.75", frein= "46.67"},

                {name = "Hakuchou Drag",		costs = 15000, description = {}, model = "hakuchou2", vMax="85.56", accel="78.75", frein= "46.67"},

            }

        },

    }

}



local fakecar = {model = '', car = nil}

local vehshop_locations = {{entering = {205.26,-179.15,53.61}, inside = {218.87,-186.69,54.61, 202.14}, outside = {216.6,-166.58,56.54,247.97}}}

local vehshop_blips ={}

local inrangeofvehshop = false

local currentlocation = nil

local boughtcar = false

local vehicle_price = 0

local backlock = false

local firstspawn = 0







--[[Functions]]--



function LocalPed()

	return GetPlayerPed(-1)

end



function drawTxt(text,font,centre,x,y,scale,r,g,b,a)

	SetTextFont(font)

	SetTextProportional(0)

	SetTextScale(scale, scale)

	SetTextColour(r, g, b, a)

	SetTextDropShadow(0, 0, 0, 0,255)

	SetTextEdge(1, 0, 0, 0, 255)

	SetTextDropShadow()

	SetTextOutline()

	SetTextCentre(centre)

	SetTextEntry("STRING")

	AddTextComponentString(text)

	DrawText(x , y)

end



function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end



function IsPlayerInRangeOfVehshop()

	return inrangeofvehshop

end



function ShowVehshopBlips(bool)

	if bool and #vehshop_blips == 0 then

		for station,pos in pairs(vehshop_locations) do

			local loc = pos

			pos = pos.entering

			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])

			-- 60 58 137

			SetBlipSprite(blip,326)

			BeginTextCommandSetBlipName("STRING")

			AddTextComponentString('Concessionnaire')

			EndTextCommandSetBlipName(blip)

			SetBlipAsShortRange(blip,true)

			SetBlipAsMissionCreatorBlip(blip,true)

			table.insert(vehshop_blips, {blip = blip, pos = loc})

		end

		Citizen.CreateThread(function()

			while #vehshop_blips > 0 do

				Citizen.Wait(1)

				local inrange = false

				for i,b in ipairs(vehshop_blips) do

					local currentPos = GetEntityCoords(GetPlayerPed(-1), false)

					local distanceFromShop = GetDistanceBetweenCoords(b.pos.entering[1], b.pos.entering[2], b.pos.entering[3], currentPos.x, currentPos.y, currentPos.z, true)

					if(distanceFromShop < 30.0) then

						DrawMarker(25, b.pos.entering[1], b.pos.entering[2], b.pos.entering[3] + 0.01, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 255, 255, 255, 50, 0, 0, 2, 0, 0, 0, 0)

					end

					if distanceFromShop < 3.0 and vehshop.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false then

						DisplayHelpText("Achat de vehicule : ~INPUT_CONTEXT~")

						currentlocation = b

						inrange = true

					end

				end

				inrangeofvehshop = inrange

			end

		end)

	elseif bool == false and #vehshop_blips > 0 then

		for i,b in ipairs(vehshop_blips) do

			if DoesBlipExist(b.blip) then

				SetBlipAsMissionCreatorBlip(b.blip,false)

				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))

			end

		end

		vehshop_blips = {}

	end

end



function f(n)

	return n + 0.0001

end



function try(f, catch_f)

	local status, exception = pcall(f)

	if not status then

		catch_f(exception)

	end

end



function firstToUpper(str)

    return (str:gsub("^%l", string.upper))

end



function OpenCreator()

	boughtcar = false

	local ped = LocalPed()

	local pos = currentlocation.pos.inside

	FreezeEntityPosition(ped,true)

	SetEntityVisible(ped,false)

	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)

	SetEntityCoords(ped,pos[1],pos[2],g)

	SetEntityHeading(ped,pos[4])

	vehshop.currentmenu = "main"

	vehshop.opened = true

	vehshop.selectedbutton = 0

end



function deleteCar( entity )

    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(entity))

	if IsEntityAVehicle(entity) then

		Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))

	end

	SetEntityAsNoLongerNeeded(entity)

end





function CloseCreator(name, veh, price)

	Citizen.CreateThread(function()

		local ped = LocalPed()

		if not boughtcar then

			local pos = currentlocation.pos.entering

			SetEntityCoords(ped,pos[1],pos[2],pos[3])

			FreezeEntityPosition(ped,false)

			SetEntityVisible(ped,true)

		else			

			local name = name	

			local vehicle = veh

			local price = price		

			local veh = GetVehiclePedIsUsing(ped)

			local model = GetEntityModel(veh)



			local currentVhl = {}

			currentVhl.primary_red, currentVhl.primary_green, currentVhl.primary_blue   = GetVehicleCustomPrimaryColour(veh);

			currentVhl.secondary_red, currentVhl.secondary_green, currentVhl.secondary_blue = GetVehicleCustomSecondaryColour(veh);

			currentVhl.primary_type = GetVehicleModColor_1(veh,0,0)

			currentVhl.secondary_type = GetVehicleModColor_2(veh,0,0)

			currentVhl.extra ,currentVhl.wheelcolor = GetVehicleExtraColours(veh);



			local mods = {}

			for i = 0,24 do

				mods[i] = GetVehicleMod(veh,i)

			end



			deleteCar(veh)

			local pos = currentlocation.pos.outside



			FreezeEntityPosition(ped,false)

			RequestModel(model)

			while not HasModelLoaded(model) do

				Citizen.Wait(0)

			end

			local personalvehicle = CreateVehicle(model,pos[1],pos[2],pos[3],pos[4],true,false)

			DecorRegister("Avanya", 2)

			DecorSetBool(personalvehicle, "Avanya", true)

			SetModelAsNoLongerNeeded(model)

			for i,mod in pairs(mods) do

				SetVehicleModKit(personalvehicle,0)

				SetVehicleMod(personalvehicle,i,mod)

			end

			SetVehicleOnGroundProperly(personalvehicle)

			

			DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "Plaque Unique Par Vehicule", "", "", "", 64)

			while (UpdateOnscreenKeyboard() == 0) do

				DisableAllControlActions(0);

				Wait(0);

			end

			if (GetOnscreenKeyboardResult()) then

				result = tostring(GetOnscreenKeyboardResult())

				--Chat(result)

				--plate 

			end

			

			-- local plate = GetVehicleNumberPlateText(personalvehicle)

			local plate=result

			SetVehicleNumberPlateText(personalvehicle, plate)

			

			SetVehicleHasBeenOwnedByPlayer(personalvehicle,true)

			SetEntityAsMissionEntity(personalvehicle, true, true)

			local id = NetworkGetNetworkIdFromEntity(personalvehicle)

			SetNetworkIdCanMigrate(id, true)

			Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))



			-- Set ModKit to changes apply

			SetVehicleModKit(personalvehicle, 0 )

			-- Set color Primary

			SetVehicleModColor_1(personalvehicle, currentVhl.primary_type, 0,0)

			SetVehicleCustomPrimaryColour(personalvehicle, currentVhl.primary_red,  currentVhl.primary_green,  currentVhl.primary_blue)

			-- Set color Secondary

			SetVehicleModColor_2(personalvehicle,currentVhl.secondary_type, 0,0)

			SetVehicleCustomSecondaryColour(personalvehicle,  currentVhl.secondary_red,  currentVhl.secondary_green,  currentVhl.secondary_blue)



			-- Set perlescent

			SetVehicleExtraColours(personalvehicle, currentVhl.extra, currentVhl.wheelcolor)

			TaskWarpPedIntoVehicle(GetPlayerPed(-1),personalvehicle,-1)

			SetEntityVisible(ped,true)

			Citizen.Wait(250)

			local plate = GetVehicleNumberPlateText(personalvehicle)

			TriggerServerEvent('avanyaveh:BuyForVeh', name, model, price, plate, currentVhl)

		end

		vehshop.opened = false

		vehshop.menu.from = 1

		vehshop.menu.to = 10

	end)

end



function drawMenuButton(button,x,y,selected)

	local menu = vehshop.menu

	SetTextFont(menu.font)

	SetTextProportional(0)

	SetTextScale(menu.scale, menu.scale)

	if selected then

		SetTextColour(0, 0, 0, 255)

	else

		SetTextColour(255, 255, 255, 255)

	end

	SetTextCentre(0)

	SetTextEntry("STRING")

	AddTextComponentString(button.name)

	if selected then

		DrawRect(x,y,menu.width,menu.height,255,255,255,255)

	else

		DrawRect(x,y,menu.width,menu.height,0,0,0,150)

	end

	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)

end



function drawMenuInfo(text)

	local menu = vehshop.menu

	SetTextFont(menu.font)

	SetTextProportional(0)

	SetTextScale(0.45, 0.45)

	SetTextColour(255, 255, 255, 255)

	SetTextCentre(0)

	SetTextEntry("STRING")

	AddTextComponentString(text)

	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)

	DrawText(0.365, 0.934)

end



function DrawStatCar(button,x,y,value)

	local menu = vehshop.menu

	SetTextFont(menu.font)

	SetTextProportional(0)

	SetTextScale(menu.scale, menu.scale)

	SetTextColour(255, 255, 255, 255)

	SetTextCentre(0)

	SetTextEntry("STRING")

	AddTextComponentString(button.name)

	DrawRect(x,y,menu.width,menu.height,0,0,0,150)

	local ProgressBarWidth = (menu.width/100)

	for i = 1, value do

		ProgressBarWidth = ProgressBarWidth + 0.001

	end

	DrawRect(x+((menu.width/2)/2)-0.005,y,menu.width/2,menu.height/4,153,153,153,150) -- fond progressBar

	DrawRect(x+(ProgressBarWidth/2)-0.005,y,ProgressBarWidth,menu.height/4,255,255,255,150) -- dernière couche progressBar

	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)

end



function drawMenuRight(txt,x,y,selected)

	local menu = vehshop.menu

	SetTextFont(menu.font)

	SetTextProportional(0)

	SetTextScale(menu.scale, menu.scale)

	SetTextRightJustify(1)

	if selected then

		SetTextColour(0, 0, 0, 255)

	else

		SetTextColour(255, 255, 255, 255)

	end

	SetTextCentre(0)

	SetTextEntry("STRING")

	AddTextComponentString(txt)

	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)

end



local DrawRect = DrawRect

local DrawText = DrawText



function drawMenuTitle(txt,x,y)

	local menu = vehshop.menu

	SetTextFont(2)

	SetTextProportional(0)

	SetTextScale(0.5, 0.5)

	SetTextColour(255, 255, 255, 255)

	SetTextEntry("STRING")

	AddTextComponentString(txt)

	DrawRect(x,y,menu.width,menu.height,0,0,0,150)

	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)

end



function tablelength(T)

  local count = 0

  for _ in pairs(T) do count = count + 1 end

  return count

end



function drawNotification(text)

	SetNotificationTextEntry("STRING")

	AddTextComponentString(text)

	DrawNotification(false, false)

end



function DoesPlayerHaveVehicle(model,button,y,selected)

		local t = false

		--TODO:check if player own car

		if t then

			drawMenuRight("OWNED",vehshop.menu.x,y,selected)

		else

			drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)

		end

end



function stringstarts(String,Start)

   return string.sub(String,1,string.len(Start))==Start

end



function round(num, idp)

  if idp and idp>0 then

    local mult = 10^idp

    return math.floor(num * mult + 0.5) / mult

  end

  return math.floor(num + 0.5)

end



function ButtonSelected(button)

	local ped = GetPlayerPed(-1)

	local this = vehshop.currentmenu

	local btn = button.name

	if this == "main" then

		if btn == "Vehicles" then

			OpenMenu('vehicles')

		elseif btn == "Motorcycles" then

			OpenMenu('motorcycles')

		end

	elseif this == "vehicles" then

		if btn == "Sports" then

			OpenMenu('sports')

		elseif btn == "Sedans" then

			OpenMenu('sedans')

		elseif btn == "Starters" then

			OpenMenu('starters')

		elseif btn == "Coupes" then

			OpenMenu('coupes')

		elseif btn == "Sports Classics" then

			OpenMenu("sportsclassics")

		elseif btn == "Super" then

			OpenMenu('super')

		elseif btn == "Muscle" then

			OpenMenu('muscle')

		elseif btn == "Off-Road" then

			OpenMenu('offroad')

		elseif btn == "SUVs" then

			OpenMenu('suvs')

		elseif btn == "Vans" then

			OpenMenu('vans')

		end

	elseif this == "starters" or this == "coupes" or this == "sedans" or this == "sports" or this == "sportsclassics" or this == "super" or this == "muscle" or this == "offroad" or this == "suvs" or this == "vans" or this == "industrial" or this == "cycles" or this == "motorcycles" then

		TriggerServerEvent('avanyaveh:CheckMoneyForVeh',button.name, button.model, button.costs)

	end

end



function OpenMenu(menu)

	fakecar = {model = '', car = nil}

	vehshop.lastmenu = vehshop.currentmenu

	if menu == "vehicles" then

		vehshop.lastmenu = "main"

	elseif menu == "bikes"  then

		vehshop.lastmenu = "main"

	elseif menu == 'race_create_objects' then

		vehshop.lastmenu = "main"

	elseif menu == "race_create_objects_spawn" then

		vehshop.lastmenu = "race_create_objects"

	end

	vehshop.menu.from = 1

	vehshop.menu.to = 10

	vehshop.selectedbutton = 0

	vehshop.currentmenu = menu

end



function Back()

	if backlock then

		return

	end

	backlock = true

	if vehshop.currentmenu == "main" then

		CloseCreator()

	elseif vehshop.currentmenu == "starters" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then

		if DoesEntityExist(fakecar.car) then

			deleteCar(fakecar.car)

		end

		fakecar = {model = '', car = nil}

		OpenMenu(vehshop.lastmenu)

	else

		OpenMenu(vehshop.lastmenu)

	end

end



--[[Citizen]]--



Citizen.CreateThread(function()

Citizen.Wait(250)

	while true do

		Citizen.Wait(1)

		if IsControlJustPressed(1, 51) and IsPlayerInRangeOfVehshop() then

			if vehshop.opened then

				CloseCreator()

			else

				OpenCreator()

			end

		end

		if vehshop.opened then

			local ped = LocalPed()

			local menu = vehshop.menu[vehshop.currentmenu]

			drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)

			drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)

			drawTxt(vehshop.selectedbutton.."/"..tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)

			local y = vehshop.menu.y + 0.12

			buttoncount = tablelength(menu.buttons)

			local selected = false



			for i,button in pairs(menu.buttons) do

				if i >= vehshop.menu.from and i <= vehshop.menu.to then



					if i == vehshop.selectedbutton then

						selected = true

					else

						selected = false

					end

					drawMenuButton(button,vehshop.menu.x,y,selected)

					if button.costs ~= nil then

						if vehshop.currentmenu == "starters" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then

							DoesPlayerHaveVehicle(button.model,button,y,selected)

						else

						drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)

						end

					end

					y = y + 0.04

					if vehshop.currentmenu == "starters" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then

						if selected then

							if fakecar.model ~= button.model then

								if DoesEntityExist(fakecar.car) then

									deleteCar(fakecar.car)

								end

								local pos = currentlocation.pos.inside

								local hash = GetHashKey(button.model)

								RequestModel(hash)

								while not HasModelLoaded(hash) do

									Citizen.Wait(0)

									drawTxt("~b~Loading...",0,1,0.5,0.5,1.5,255,255,255,255)



								end

								local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)

								DecorRegister("Arcadia", 2)

								DecorSetBool(veh, "Arcadia", true)

								SetModelAsNoLongerNeeded(hash)

								while not DoesEntityExist(veh) do

									Citizen.Wait(0)

									drawTxt("~b~Loading...",0,1,0.5,0.5,1.5,255,255,255,255)

								end

								FreezeEntityPosition(veh,true)

								SetEntityInvincible(veh,true)

								SetVehicleDoorsLocked(veh,4)

								--SetEntityCollision(veh,false,false)

								TaskWarpPedIntoVehicle(LocalPed(),veh,-1)

								for i = 0,24 do

									SetVehicleModKit(veh,0)

									RemoveVehicleMod(veh,i)

								end

								fakecar = { model = button.model, car = veh}

							else 

								local pos = 0.66

								for i = buttoncount+1, 10 do

									pos = pos - 0.04

								end

								drawMenuButton({name = 'CARACTERISTIQUES' },0.9,pos,false)

								DrawStatCar({name = 'Vitesse max ' },0.9,pos+0.04,tonumber(button.vMax))

								DrawStatCar({name = 'Acceleration ' },0.9,pos+0.08,tonumber(button.accel))

								DrawStatCar({name = 'Freinage ' },0.9,pos+0.12,tonumber(button.frein))

							end

						end

					end

					if selected and IsControlJustPressed(1,18) then

						ButtonSelected(button)

					end

				end

			end

		end

		if vehshop.opened then

			if IsControlJustPressed(1,177) then

				Back()

			end

			if IsControlJustReleased(1,177) then

				backlock = false

			end

			if IsControlJustPressed(1,172) then

				if vehshop.selectedbutton > 1 then

					vehshop.selectedbutton = vehshop.selectedbutton -1

					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then

						vehshop.menu.from = vehshop.menu.from -1

						vehshop.menu.to = vehshop.menu.to - 1

					end

				else

					vehshop.selectedbutton = buttoncount

					vehshop.menu.from = buttoncount - 9

					vehshop.menu.to = buttoncount

				end

			end

			if IsControlJustPressed(1,173)then

				if vehshop.selectedbutton < buttoncount then

					vehshop.selectedbutton = vehshop.selectedbutton +1

					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then

						vehshop.menu.to = vehshop.menu.to + 1

						vehshop.menu.from = vehshop.menu.from + 1

					end

				else

					vehshop.selectedbutton = 1

					vehshop.menu.from = 1

					vehshop.menu.to = 10	

				end

			end

		end



	end

end)



AddEventHandler('avanyaveh:FinishMoneyCheckForVeh', function(name, vehicle, price)	

	local name = name

	local vehicle = vehicle

	local price = price

	boughtcar = true

	CloseCreator(name, vehicle, price)

end)



AddEventHandler('playerSpawned', function(spawn)

if firstspawn == 0 then

	--326 car blip 227 225

	ShowVehshopBlips(true)

	firstspawn = 1

end

end)



AddEventHandler('vehshop:spawnVehicle', function(v)

	local car = GetHashKey(v)

	local playerPed = GetPlayerPed(-1)

	if playerPed and playerPed ~= -1 then

		RequestModel(car)

		while not HasModelLoaded(car) do

				Citizen.Wait(0)

		end

		local playerCoords = GetEntityCoords(playerPed)

		veh = CreateVehicle(car, playerCoords, 0.0, true, false)

		DecorRegister("Avanya", 2)

		DecorSetBool(veh, "Avanya", true)

		SetModelAsNoLongerNeeded(car)

		TaskWarpPedIntoVehicle(playerPed, veh, -1)

		SetEntityInvincible(veh, true)

	end

end)



AddEventHandler('vehshop:cancelBuyVehicle', function()

	local ped = LocalPed()

	local veh = GetVehiclePedIsUsing(ped)



	deleteCar(veh)

end)



local firstspawn = 0

AddEventHandler('playerSpawned', function(spawn)

	if firstspawn == 0 then

		RemoveIpl('v_carshowroom')

		RemoveIpl('shutter_open')

		RemoveIpl('shutter_closed')

		RemoveIpl('shr_int')

		RemoveIpl('csr_inMission')

		RequestIpl('v_carshowroom')

		RequestIpl('shr_int')

		RequestIpl('shutter_closed')

		firstspawn = 1

	end

end)

