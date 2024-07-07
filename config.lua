Config = {}

---------------------------------
-- settings
---------------------------------
Config.Keybind         = 'J'
Config.Img             = "rsg-inventory/html/images/"
Config.Money           = 'cash' -- 'cash', 'bank' or 'bloodmoney'
Config.ServerNotify    = true
Config.LicenseRequired = false

---------------------------------
-- rent settings
---------------------------------
Config.MaxGunsmiths       = 1
Config.RentStartup        = 100
Config.RentPerHour        = 1
Config.WeaponsmithCronJob = '0 * * * *' -- cronjob runs every hour (0 * * * *)
Config.MaxRent            = 100

---------------------------------
-- storage settings
---------------------------------
Config.WeaponTrayMaxWeight  = 4000000
Config.WeaponTrayMaxSlots   = 4
Config.CraftingMaxWeight = 4000000
Config.CraftingMaxSlots  = 48
Config.StockMaxWeight    = 4000000
Config.StockMaxSlots     = 48

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn = true

---------------------------------
-- gunsmith locations
---------------------------------
Config.GunsmithLocations = {
    { 
        name = 'Valentine Gunsmith',
        gunsmithid = 'valgunsmith',
        coords = vector3(-280.98, 778.88, 119.50),
        npcmodel = `u_m_m_rhdgunsmith_01`,
        npccoords = vector4(-280.98, 778.88, 119.50, 4.01),
        jobaccess = 'valgunsmith',
        blipname = 'Valentine Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Rhodes Gunsmith',
        gunsmithid = 'rhogunsmith',
        coords = vector3(1322.64, -1323.14, 77.89),
        npcmodel = `u_m_m_rhdgunsmith_01`,
        npccoords = vector4(1322.64, -1323.14, 77.89, 351.73),
        jobaccess = 'rhogunsmith',
        blipname = 'Rhodes Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'StDenis Gunsmith',
        gunsmithid = 'stdgunsmith',
        coords = vector3(2717.28, -1286.84, 49.64),
        npcmodel = `u_m_m_rhdgunsmith_01`,
        npccoords = vector4(2717.28, -1286.84, 49.64, 37.67),
        jobaccess = 'stdgunsmith',
        blipname = 'StDenis Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Tumbleweed Gunsmith',
        gunsmithid = 'tumgunsmith',
        coords = vector3(-5506.44, -2963.92, -0.64),
        npcmodel = `u_m_m_rhdgunsmith_01`,
        npccoords = vector4(-5506.44, -2963.92, -0.64, 105.35),
        jobaccess = 'tumgunsmith',
        blipname = 'Tumbleweed Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Annesburg Gunsmith',
        gunsmithid = 'anngunsmith',
        coords = vector3(2948.46, 1319.50, 44.82),
        npcmodel = `u_m_m_rhdgunsmith_01`,
        npccoords = vector4(2948.46, 1319.50, 44.82, 67.53),
        jobaccess = 'anngunsmith',
        blipname = 'Annesburg Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true
    },
}

---------------------------------
-- gunsmith crafting
---------------------------------
Config.GunsmithCrafting = {

    {   category = 'Parts',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'coal', amount = 1 },
            [2] = { item = 'steelbar', amount = 1 },
            [3] = { item = 'wood', amount = 1 },
        },
        receive = 'revolverparts',
        giveamount = 1
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'revolverparts', amount = 1 },
        },
        receive = 'weapon_revolver_cattleman',
        giveamount = 1
    },

}
