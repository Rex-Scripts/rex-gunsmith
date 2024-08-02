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
Config.GunsmithCronJob    = '0 * * * *' -- cronjob runs every hour (0 * * * *)
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
        npccoords = vector4(-283.27, 780.56, 119.50, 309.68),
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
        npccoords = vector4(1322.34, -1321.18, 77.89, 298.69),
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
        npccoords = vector4(2713.47, -1281.54, 49.63, 243.99),
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
        npccoords = vector4(-5508.79, -2968.76, -0.63, 343.78),
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
        npccoords = vector4(2949.73, 1321.15, 44.82, 113.28),
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
    -- Revolvers
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'revolverparts', amount = 1 },
        },
        receive = 'weapon_revolver_cattleman',
        giveamount = 1
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'revolverparts', amount = 1 },
        },
        receive = 'weapon_revolver_cattleman_mexican',
        giveamount = 1
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'revolverparts', amount = 1 },
        },
        receive = 'weapon_revolver_doubleaction',
        giveamount = 1
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'revolverparts', amount = 1 },
        },
        receive = 'weapon_revolver_doubleaction_gambler',
        giveamount = 1
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'revolverparts', amount = 1 },
        },
        receive = 'weapon_revolver_schofield',
        giveamount = 1
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'revolverparts', amount = 1 },
        },
        receive = 'weapon_revolver_lemat',
        giveamount = 1
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'revolverparts', amount = 1 },
        },
        receive = 'weapon_revolver_navy',
        giveamount = 1
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'revolverparts', amount = 1 },
        },
        receive = 'weapon_revolver_navy_crossover',
        giveamount = 1
    },
    -- Revolver Ammo
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_revolver',
        giveamount = 100
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_revolver_express',
        giveamount = 100
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_revolver_express_explosive',
        giveamount = 100
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_revolver_high_velocity',
        giveamount = 100
    },
    {   category = 'Revolvers',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_revolver_split_point',
        giveamount = 100
    },
    -- Pistols
    {   category = 'Pistols',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'pistolparts', amount = 1 },
        },
        receive = 'weapon_pistol_volcanic',
        giveamount = 1
    },
    {   category = 'Pistols',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'pistolparts', amount = 1 },
        },
        receive = 'weapon_pistol_m1899',
        giveamount = 1
    },
    {   category = 'Pistols',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'pistolparts', amount = 1 },
        },
        receive = 'weapon_pistol_mauser',
        giveamount = 1
    },
    {   category = 'Pistols',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'pistolparts', amount = 1 },
        },
        receive = 'weapon_pistol_semiauto',
        giveamount = 1
    },
    -- Pistol Ammo
    {   category = 'Pistols',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_pistol',
        giveamount = 100
    },
    {   category = 'Pistols',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_pistol_express',
        giveamount = 100
    },
    {   category = 'Pistols',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_pistol_express_explosive',
        giveamount = 100
    },
    {   category = 'Pistols',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_pistol_high_velocity',
        giveamount = 100
    },
    {   category = 'Pistols',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_pistol_split_point',
        giveamount = 100
    },
    -- Repeater
    {   category = 'Repeater',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'repeaterparts', amount = 1 },
        },
        receive = 'weapon_repeater_carbine',
        giveamount = 1
    },
    {   category = 'Repeater',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'repeaterparts', amount = 1 },
        },
        receive = 'weapon_repeater_winchester',
        giveamount = 1
    },
    {   category = 'Repeater',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'repeaterparts', amount = 1 },
        },
        receive = 'weapon_repeater_henry',
        giveamount = 1
    },
    {   category = 'Repeater',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'repeaterparts', amount = 1 },
        },
        receive = 'weapon_repeater_evans',
        giveamount = 1
    },
    -- Repeater Ammo
    {   category = 'Repeater',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_repeater',
        giveamount = 100
    },
    {   category = 'Repeater',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_repeater_express',
        giveamount = 100
    },
    {   category = 'Repeater',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_repeater_express_explosive',
        giveamount = 100
    },
    {   category = 'Repeater',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_repeater_high_velocity',
        giveamount = 100
    },
    {   category = 'Repeater',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_repeater_split_point',
        giveamount = 100
    },
    -- Rifle
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'rifleparts', amount = 1 },
        },
        receive = 'weapon_rifle_varmint',
        giveamount = 1
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'rifleparts', amount = 1 },
        },
        receive = 'weapon_rifle_springfield',
        giveamount = 1
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'rifleparts', amount = 1 },
        },
        receive = 'weapon_rifle_boltaction',
        giveamount = 1
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'rifleparts', amount = 1 },
        },
        receive = 'weapon_rifle_elephant',
        giveamount = 1
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'rifleparts', amount = 1 },
        },
        receive = 'weapon_sniperrifle_rollingblock',
        giveamount = 1
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'rifleparts', amount = 1 },
        },
        receive = 'weapon_sniperrifle_rollingblock_exotic',
        giveamount = 1
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'rifleparts', amount = 1 },
        },
        receive = 'weapon_sniperrifle_carcano',
        giveamount = 1
    },
    -- Rifle Ammo
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_rifle',
        giveamount = 100
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_rifle_express',
        giveamount = 100
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_rifle_express_explosive',
        giveamount = 100
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_rifle_high_velocity',
        giveamount = 100
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_rifle_split_point',
        giveamount = 100
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_rifle_elephant',
        giveamount = 100
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_varmint',
        giveamount = 100
    },
    {   category = 'Rifle',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_varmint_tranquilizer',
        giveamount = 100
    },
    -- Shotgun
    {   category = 'Shotgun',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'shotgunparts', amount = 1 },
        },
        receive = 'weapon_shotgun_doublebarrel',
        giveamount = 1
    },
    {   category = 'Shotgun',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'shotgunparts', amount = 1 },
        },
        receive = 'weapon_shotgun_doublebarrel_exotic',
        giveamount = 1
    },
    {   category = 'Shotgun',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'shotgunparts', amount = 1 },
        },
        receive = 'weapon_shotgun_sawedoff',
        giveamount = 1
    },
    {   category = 'Shotgun',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'shotgunparts', amount = 1 },
        },
        receive = 'weapon_shotgun_semiauto',
        giveamount = 1
    },
    {   category = 'Shotgun',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'shotgunparts', amount = 1 },
        },
        receive = 'weapon_shotgun_pump',
        giveamount = 1
    },
    {   category = 'Shotgun',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'shotgunparts', amount = 1 },
        },
        receive = 'weapon_shotgun_repeating',
        giveamount = 1
    },
    -- Shotgun Ammo
    {   category = 'Shotgun',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_shotgun',
        giveamount = 100
    },
    {   category = 'Shotgun',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_shotgun_buckshot_incendiary',
        giveamount = 100
    },
    {   category = 'Shotgun',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_shotgun_slug',
        giveamount = 100
    },
    {   category = 'Shotgun',
        crafttime = 30000,
        ingredients = {
            [1] = { item = 'ammoparts', amount = 100 },
        },
        receive = 'ammo_shotgun_slug_explosive',
        giveamount = 100
    },

}
