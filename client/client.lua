local RSGCore = exports['rsg-core']:GetCoreObject()

---------------------------------
-- blips
---------------------------------
CreateThread(function()
    for _,v in pairs(Config.GunsmithLocations) do
        if v.showblip == true then    
            local PlayerGunsmithBlip = BlipAddForCoords(1664425300, v.coords)
            SetBlipSprite(PlayerGunsmithBlip, joaat(v.blipsprite), true)
            SetBlipScale(PlayerGunsmithBlip, v.blipscale)
            SetBlipName(PlayerGunsmithBlip, v.blipname)
        end
    end
end)

---------------------------------------------
-- get correct menu
---------------------------------------------
RegisterNetEvent('rex-gunsmith:client:opengunsmith', function(gunsmithid, jobaccess, name)
    RSGCore.Functions.TriggerCallback('rex-gunsmith:server:getgunsmithdata', function(result)
        local owner = result[1].owner
        local status = result[1].status
        if owner ~= 'vacant' then
            local PlayerData = RSGCore.Functions.GetPlayerData()
            local playerjob = PlayerData.job.name
            if playerjob == jobaccess then
                TriggerEvent('rex-gunsmith:client:openjobmenu', gunsmithid, status)
            else
                TriggerEvent('rex-gunsmith:client:opencustomermenu', gunsmithid, status)
            end
        else
            TriggerEvent('rex-gunsmith:client:rentgunsmith', gunsmithid, name)
        end
    end, gunsmithid)
end)

---------------------------------------------
-- gunsmith job menu
---------------------------------------------
RegisterNetEvent('rex-gunsmith:client:openjobmenu', function(gunsmithid, status)
    if status == 'open' then
        lib.registerContext({
            id = 'gunsmith_job_menu',
            title = Lang:t('client.lang_1'),
            options = {
                {
                    title = Lang:t('client.lang_2'),
                    icon = 'fa-solid fa-store',
                    event = 'rex-gunsmith:client:ownerviewitems',
                    args = { gunsmithid = gunsmithid },
                    arrow = true
                },
                {
                    title = Lang:t('client.lang_3'),
                    icon = 'fa-solid fa-circle-plus',
                    iconColor = 'green',
                    event = 'rex-gunsmith:client:newstockitem',
                    args = { gunsmithid = gunsmithid },
                    arrow = true
                },
                {
                    title = Lang:t('client.lang_4'),
                    icon = 'fa-solid fa-circle-minus',
                    iconColor = 'red',
                    event = 'rex-gunsmith:client:removestockitem',
                    args = { gunsmithid = gunsmithid },
                    arrow = true
                },
                {
                    title = Lang:t('client.lang_5'),
                    icon = 'fa-solid fa-sack-dollar',
                    event = 'rex-gunsmith:client:withdrawmoney',
                    args = { gunsmithid = gunsmithid },
                    arrow = true
                },
                {
                    title = Lang:t('client.lang_6'),
                    icon = 'fa-solid fa-box',
                    event = 'rex-gunsmith:client:ownerstoragemenu',
                    args = { gunsmithid = gunsmithid },
                    arrow = true
                },
                {
                    title = Lang:t('client.lang_7'),
                    icon = 'fa-solid fa-box',
                    event = 'rex-gunsmith:client:craftingmenu',
                    args = { gunsmithid = gunsmithid },
                    arrow = true
                },
                {
                    title = Lang:t('client.lang_8'),
                    icon = 'fa-solid fa-box',
                    event = 'rex-gunsmith:client:rentmenu',
                    args = { gunsmithid = gunsmithid },
                    arrow = true
                },
                {
                    title = Lang:t('client.lang_9'),
                    icon = 'fa-solid fa-user-tie',
                    event = 'rsg-bossmenu:client:mainmenu',
                    arrow = true
                },
            }
        })
        lib.showContext('gunsmith_job_menu')
    else
        lib.registerContext({
            id = 'gunsmith_job_menu',
            title = Lang:t('client.lang_1'),
            options = {
                {
                    title = Lang:t('client.lang_8'),
                    icon = 'fa-solid fa-box',
                    event = 'rex-gunsmith:client:rentmenu',
                    args = { gunsmithid = gunsmithid },
                    arrow = true
                },
            }
        })
        lib.showContext('gunsmith_job_menu')
    end
end)

---------------------------------------------
-- gunsmith customer menu
---------------------------------------------
RegisterNetEvent('rex-gunsmith:client:opencustomermenu', function(gunsmithid, status)
    if status == 'closed' then
        lib.notify({ title = Lang:t('client.lang_10'), type = 'error', duration = 7000 })
        return
    end
    lib.registerContext({
        id = 'gunsmith_customer_menu',
        title = Lang:t('client.lang_11'),
        options = {
            {
                title = Lang:t('client.lang_12'),
                icon = 'fa-solid fa-store',
                event = 'rex-gunsmith:client:customerviewitems',
                args = { gunsmithid = gunsmithid },
                arrow = true
            },
            {
                title = Lang:t('client.lang_13'),
                icon = 'fa-solid fa-box',
                event = 'rex-gunsmith:client:storageplayershare',
                args = { gunsmithid = gunsmithid },
                arrow = true
            },
        }
    })
    lib.showContext('gunsmith_customer_menu')
end)

---------------------------------------------
-- gunsmith rent money menu
---------------------------------------------
RegisterNetEvent('rex-gunsmith:client:rentmenu', function(data)

    RSGCore.Functions.TriggerCallback('rex-gunsmith:server:getgunsmithdata', function(result)
    
        local rent = result[1].rent
        if rent > 50  then rentColorScheme = 'green' end
        if rent <= 50 and rent > 10 then rentColorScheme = 'yellow' end
        if rent <= 10 then rentColorScheme = 'red' end
        
        lib.registerContext({
            id = 'gunsmith_rent_menu',
            title = Lang:t('client.lang_14'),
            menu = 'gunsmith_job_menu',
            options = {
                {
                    title = Lang:t('client.lang_15')..rent,
                    progress = rent,
                    colorScheme = rentColorScheme,
                },
                {
                    title = Lang:t('client.lang_16'),
                    icon = 'fa-solid fa-dollar-sign',
                    event = 'rex-gunsmith:client:payrent',
                    args = { gunsmithid = data.gunsmithid },
                    arrow = true
                },
            }
        })
        lib.showContext('gunsmith_rent_menu')

    end, data.gunsmithid)
    
end)

-------------------------------------------------------------------------------------------
-- job : view gunsmith items
-------------------------------------------------------------------------------------------
RegisterNetEvent('rex-gunsmith:client:ownerviewitems', function(data)

    RSGCore.Functions.TriggerCallback('rex-gunsmith:server:checkstock', function(result)

        if result == nil then
            lib.registerContext({
                id = 'gunsmith_no_inventory',
                title = Lang:t('client.lang_17'),
                menu = 'gunsmith_job_menu',
                options = {
                    {
                        title = Lang:t('client.lang_18'),
                        icon = 'fa-solid fa-box',
                        disabled = true,
                        arrow = false
                    }
                }
            })
            lib.showContext('gunsmith_no_inventory')
        else
            local options = {}
            for k,v in ipairs(result) do
                options[#options + 1] = {
                    title = RSGCore.Shared.Items[result[k].item].label..' ($'..result[k].price..')',
                    description = Lang:t('client.lang_19')..result[k].stock,
                    icon = 'fa-solid fa-box',
                    event = 'rex-gunsmith:client:buyitem',
                    icon = "nui://" .. Config.Img .. RSGCore.Shared.Items[tostring(result[k].item)].image,
                    image = "nui://" .. Config.Img .. RSGCore.Shared.Items[tostring(result[k].item)].image,
                    args = {
                        item = result[k].item,
                        stock = result[k].stock,
                        price = result[k].price,
                        label = RSGCore.Shared.Items[result[k].item].label,
                        gunsmithid = result[k].gunsmithid
                    },
                    arrow = true,
                }
            end
            lib.registerContext({
                id = 'gunsmith_inv_menu',
                title = Lang:t('client.lang_17'),
                menu = 'gunsmith_job_menu',
                position = 'top-right',
                options = options
            })
            lib.showContext('gunsmith_inv_menu')
        end
    end, data.gunsmithid)

end)

-------------------------------------------------------------------------------------------
-- customer : view gunsmith items
-------------------------------------------------------------------------------------------
RegisterNetEvent('rex-gunsmith:client:customerviewitems', function(data)
    RSGCore.Functions.TriggerCallback('rex-gunsmith:server:checkstock', function(result)
        if result == nil then
            lib.registerContext({
                id = 'gunsmith_no_inventory',
                title = Lang:t('client.lang_17'),
                menu = 'gunsmith_customer_menu',
                options = {
                    {
                        title = Lang:t('client.lang_18'),
                        icon = 'fa-solid fa-box',
                        disabled = true,
                        arrow = false
                    }
                }
            })
            lib.showContext('gunsmith_no_inventory')
        else
            local options = {}
            for k,v in ipairs(result) do
                options[#options + 1] = {
                    title = RSGCore.Shared.Items[result[k].item].label..' ($'..result[k].price..')',
                    description = Lang:t('client.lang_19')..result[k].stock,
                    icon = 'fa-solid fa-box',
                    event = 'rex-gunsmith:client:buyitem',
                    icon = "nui://" .. Config.Img .. RSGCore.Shared.Items[tostring(result[k].item)].image,
                    image = "nui://" .. Config.Img .. RSGCore.Shared.Items[tostring(result[k].item)].image,
                    args = {
                        item = result[k].item,
                        stock = result[k].stock,
                        price = result[k].price,
                        label = RSGCore.Shared.Items[result[k].item].label,
                        gunsmithid = result[k].gunsmithid
                    },
                    arrow = true,
                }
            end
            lib.registerContext({
                id = 'gunsmith_inv_menu',
                title = Lang:t('client.lang_17'),
                menu = 'gunsmith_customer_menu',
                position = 'top-right',
                options = options
            })
            lib.showContext('gunsmith_inv_menu')
        end
    end, data.gunsmithid)

end)

-------------------------------------------------------------------
-- sort table function
-------------------------------------------------------------------
local function compareNames(a, b)
    return a.value < b.value
end

-------------------------------------------------------------------
-- add / update stock item
-------------------------------------------------------------------
RegisterNetEvent('rex-gunsmith:client:newstockitem', function(data)

    local items = {}

    for k,v in pairs(RSGCore.Functions.GetPlayerData().items) do
        local content = { value = v.name, label = v.label..' ('..v.amount..')' }
        items[#items + 1] = content
    end

    table.sort(items, compareNames)

    local item = lib.inputDialog(Lang:t('client.lang_20'), {
        { 
            type = 'select',
            options = items,
            label = Lang:t('client.lang_21'),
            required = true
        },
        { 
            type = 'input',
            label = Lang:t('client.lang_22'),
            placeholder = '0',
            icon = 'fa-solid fa-hashtag',
            required = true
        },
        { 
            type = 'input',
            label = Lang:t('client.lang_23'),
            placeholder = '0.00',
            icon = 'fa-solid fa-dollar-sign',
            required = true
        },
    })
    
    if not item then 
        return 
    end
    
    local hasItem = RSGCore.Functions.HasItem(item[1], item[2])
    
    if hasItem then
        TriggerServerEvent('rex-gunsmith:server:newstockitem', data.gunsmithid, item[1], tonumber(item[2]), tonumber(item[3]))
    else
        lib.notify({ title = Lang:t('client.lang_24'), type = 'error', duration = 7000 })
    end

end)

-------------------------------------------------------------------------------------------
-- remove stock item
-------------------------------------------------------------------------------------------
RegisterNetEvent('rex-gunsmith:client:removestockitem', function(data)
    RSGCore.Functions.TriggerCallback('rex-gunsmith:server:checkstock', function(result)
        if result == nil then
            lib.registerContext({
                id = 'gunsmith_no_stock',
                title = Lang:t('client.lang_25'),
                menu = 'gunsmith_owner_menu',
                options = {
                    {
                        title = Lang:t('client.lang_26'),
                        icon = 'fa-solid fa-box',
                        disabled = true,
                        arrow = false
                    }
                }
            })
            lib.showContext('gunsmith_no_stock')
        else
            local options = {}
            for k,v in ipairs(result) do
                options[#options + 1] = {
                    title = RSGCore.Shared.Items[result[k].item].label,
                    description = Lang:t('client.lang_19')..result[k].stock,
                    icon = 'fa-solid fa-box',
                    serverEvent = 'rex-gunsmith:server:removestockitem',
                    icon = "nui://" .. Config.Img .. RSGCore.Shared.Items[tostring(result[k].item)].image,
                    image = "nui://" .. Config.Img .. RSGCore.Shared.Items[tostring(result[k].item)].image,
                    args = {
                        item = result[k].item,
                        gunsmithid = result[k].gunsmithid
                    },
                    arrow = true,
                }
            end
            lib.registerContext({
                id = 'gunsmith_stock_menu',
                title = Lang:t('client.lang_25'),
                menu = 'gunsmith_job_menu',
                position = 'top-right',
                options = options
            })
            lib.showContext('gunsmith_stock_menu')
        end
    end, data.gunsmithid)
end)

-------------------------------------------------------------------------------------------
-- withdraw money 
-------------------------------------------------------------------------------------------
RegisterNetEvent('rex-gunsmith:client:withdrawmoney', function(data)
    RSGCore.Functions.TriggerCallback('rex-gunsmith:server:getmoney', function(result)
        local input = lib.inputDialog(Lang:t('client.lang_27'), {
            { 
                type = 'input',
                label = Lang:t('client.lang_28')..result.money,
                icon = 'fa-solid fa-dollar-sign',
                required = true
            },
        })
        if not input then
            return 
        end
        local withdraw = tonumber(input[1])
        if withdraw <= result.money then
            TriggerServerEvent('rex-gunsmith:server:withdrawfunds', withdraw, data.gunsmithid)
        else
            lib.notify({ title = Lang:t('client.lang_29'), type = 'error', duration = 7000 })
        end
    end, data.gunsmithid)
end)

---------------------------------------------
-- buy item amount
---------------------------------------------
RegisterNetEvent('rex-gunsmith:client:buyitem', function(data)
    local input = lib.inputDialog(Lang:t('client.lang_30')..data.label, {
        { 
            label = Lang:t('client.lang_31'),
            type = 'input',
            required = true,
            icon = 'fa-solid fa-hashtag'
        },
    })
    if not input then
        return
    end
    
    local amount = tonumber(input[1])
    
    if data.stock >= amount then
        local newstock = (data.stock - amount)
        TriggerServerEvent('rex-gunsmith:server:buyitem', amount, data.item, newstock, data.price, data.label, data.gunsmithid)
    else
        lib.notify({ title = Lang:t('client.lang_32'), type = 'error', duration = 7000 })
    end
end)

---------------------------------------------
-- rent gunsmith
---------------------------------------------
RegisterNetEvent('rex-gunsmith:client:rentgunsmith', function(gunsmithid, name)
    
    local input = lib.inputDialog(Lang:t('client.lang_33')..name, {
        {
            label = Lang:t('client.lang_34')..Config.RentStartup,
            type = 'select',
            options = {
                { value = 'yes', label = Lang:t('client.lang_35') },
                { value = 'no',  label = Lang:t('client.lang_36') }
            },
            required = true
        },
    })

    -- check there is an input
    if not input then
        return 
    end

    -- if no then return
    if input[1] == 'no' then
        return
    end

    RSGCore.Functions.TriggerCallback('rex-gunsmith:server:countowned', function(result)
    
        if result >= Config.MaxBalacksmiths then
            lib.notify({ title = Lang:t('client.lang_48'), description = Lang:t('client.lang_49'), type = 'error', duration = 7000 })
            return
        end

        -- check player has a licence
        if Config.LicenseRequired then
            local hasItem = RSGCore.Functions.HasItem('gunsmithlicence', 1)

            if hasItem then
                TriggerServerEvent('rex-gunsmith:server:rentgunsmith', gunsmithid)
            else
                lib.notify({ title = Lang:t('client.lang_37'), type = 'error', duration = 7000 })
            end
        else
            TriggerServerEvent('rex-gunsmith:server:rentgunsmith', gunsmithid)
        end
        
    end)

end)

-------------------------------------------------------------------------------------------
-- pay rent
-------------------------------------------------------------------------------------------
RegisterNetEvent('rex-gunsmith:client:payrent', function(data)

        local input = lib.inputDialog(Lang:t('client.lang_38'), {
            { 
                label = Lang:t('client.lang_39'),
                type = 'input',
                icon = 'fa-solid fa-dollar-sign',
                required = true
            },
        })
        if not input then
            return 
        end
        
        TriggerServerEvent('rex-gunsmith:server:addrentmoney', input[1], data.gunsmithid)

end)

---------------------------------------------
-- owner gunsmith storage menu
---------------------------------------------
RegisterNetEvent('rex-gunsmith:client:ownerstoragemenu', function(data)
    lib.registerContext({
        id = 'owner_storage_menu',
        title = Lang:t('client.lang_43'),
        menu = 'gunsmith_job_menu',
        options = {
            {
                title = Lang:t('client.lang_40'),
                icon = 'fa-solid fa-box',
                event = 'rex-gunsmith:client:storageplayershare',
                args = { gunsmithid = data.gunsmithid },
                arrow = true
            },
            {
                title = Lang:t('client.lang_41'),
                icon = 'fa-solid fa-box',
                event = 'rex-gunsmith:client:storagecrafting',
                args = { gunsmithid = data.gunsmithid },
                arrow = true
            },
            {
                title = Lang:t('client.lang_42'),
                icon = 'fa-solid fa-box',
                event = 'rex-gunsmith:client:storagestock',
                args = { gunsmithid = data.gunsmithid },
                arrow = true
            },
        }
    })
    lib.showContext('owner_storage_menu')
end)

---------------------------------------------
-- player share storage
---------------------------------------------
RegisterNetEvent('rex-gunsmith:client:storageplayershare', function(data)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'share_'..data.gunsmithid, {
        maxweight = Config.WeaponTrayMaxWeight,
        slots = Config.WeaponTrayMaxSlots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", 'share_'..data.gunsmithid)
end)

---------------------------------------------
-- crafting storage
---------------------------------------------
RegisterNetEvent('rex-gunsmith:client:storagecrafting', function(data)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local playerjob = PlayerData.job.name
    if playerjob == data.gunsmithid then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", 'crafting_'..data.gunsmithid, {
            maxweight = Config.CraftingMaxWeight,
            slots = Config.CraftingMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", 'crafting_'..data.gunsmithid)
    end
end)

---------------------------------------------
-- stock storage
---------------------------------------------
RegisterNetEvent('rex-gunsmith:client:storagestock', function(data)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local playerjob = PlayerData.job.name
    if playerjob == data.gunsmithid then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", 'stock_'..data.gunsmithid, {
            maxweight = Config.StockMaxWeight,
            slots = Config.StockMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", 'stock_'..data.gunsmithid)
    end
end)
