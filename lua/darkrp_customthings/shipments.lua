--[[
--SHIPMENTS
default: https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua
examples: http://wiki.darkrp.com/index.php/DarkRP:CustomShipmentFields

-- PLEASE NOTE - IF YOU WANT TO ADD AMMO SHIPMENTS AND HAVE THEM ONLY SHOW UP UNDER AMMO AS SINGLE BOXES
-- AND UNDER SHIPMENTS AS SHIPMENTS DISABLE SEPARATE AND RECREATE AMMO UNDER "ammo.lua".

--]]


-- Additional note - we need to make sure we're spawning the right entity.
-- We also don't need to be using all these fields.
-- MISC

    AddCustomShipment("Medical kits", {
        model = "models/Items/healthkit.mdl", 
        entity = "item_healthkit", -- Check this in server files.
        price = 750,
        amount = 10,
        separate = false, 
        pricesep = 100, 
        noship = false, 
        allowed = {TEAM_MEDIC},
        shipmodel = "models/items/item_item_crate.mdl",
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "Medical kits",
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

    AddCustomShipment("Armour kits", {
        model = "models/Items/battery.mdl", 
        entity = "item_battery", -- Check this in server files.
        price = 1000,
        amount = 10,
        separate = false, 
        pricesep = 150, 
        noship = false, 
        allowed = {TEAM_BLACK_MARKET_DEALER, TEAM_SWAT_LEADER},
        shipmodel = "models/items/item_item_crate.mdl",
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "Armour kits",
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })


    AddCustomShipment("Pistol ammo", {
        model = "models/Items/BoxSRounds.mdl", 
        entity = "m9k_ammo_pistol", -- Check this in server files.
        price = 400,
        amount = 10,
        separate = false, 
        pricesep = 50, 
        noship = false, 
        allowed = {TEAM_GUN},
        shipmodel = "models/items/item_item_crate.mdl",
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "Pistol Ammo",
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

    AddCustomShipment("SMG ammo", {
        model = "models/Items/BoxsRounds.mdl", 
        entity = "m9k_ammo_smg", -- Check this in server files.
        price = 450,
        amount = 10,
        separate = false, 
        pricesep = 60, 
        noship = false, 
        allowed = {TEAM_GUN},
        shipmodel = "models/items/item_item_crate.mdl", 

        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "SMG Ammo", 

        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

    AddCustomShipment("Assult rifle ammo", {
        model = "models/Items/BoxMRounds.mdl", 
        entity = "m9k_ammo_ar2", 
        price = 500,
        amount = 10,
        separate = false, 
        pricesep = 75, 
        noship = false, 
        allowed = {TEAM_GUN},
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "Assult rifle Ammo", 

        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })
    
    AddCustomShipment("Shotgun ammo", {
        model = "models/Items/BoxBuckshot.mdl", 
        entity = "m9k_ammo_buckshot", 
        price = 500,
        amount = 10,
        separate = false, 
        pricesep = 75, 
        noship = false, 
        allowed = {TEAM_GUN},
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "Shotgun Ammo", 

        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })
    
    AddCustomShipment("Sniper ammo", {
        model = "models/Items/sniper_round_box.mdl", 
        entity = "m9k_ammo_sniper_rounds", 
        price = 750,
        amount = 10,
        separate = false, 
        pricesep = 100, 
        noship = false, 
        allowed = {TEAM_GUN},
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "Sniper Ammo", 

        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })
    
    AddCustomShipment(".357 ammo", {
        model = "models/Items/357ammobox.mdl", 
        entity = "m9k_ammo_357", 
        price = 450,
        amount = 10,
        separate = false, 
        pricesep = 55, 
        noship = false, 
        allowed = {TEAM_GUN},
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = ".357 Ammo", 

        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })
    
    AddCustomShipment("winchester ammo", {
        model = "models/Items/sniper_round_box.mdl", 
        entity = "m9k_ammo_winchester", 
        price = 550,
        amount = 10,
        separate = false, 
        pricesep = 70, 
        noship = false, 
        allowed = {TEAM_GUN},
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "Winchester Ammo", 

        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

-- PISTOLS
    AddCustomShipment("USP", {
        model = "models/weapons/w_pist_fokkususp.mdl", 
        entity = "m9k_usp", 
        price = 1750,
        amount = 10,
        separate = true, 
        pricesep = 200, 
        noship = false, 
        allowed = {TEAM_GUN},
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "USP", 

        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

    AddCustomShipment("M92 Beretta", {
        model = "models/weapons/w_beretta_m92.mdl", 
        entity = "m9k_m92beretta", 
        price = 1500, 
        amount = 10, 
        separate = true, 
        pricesep = 175, 
        noship = false, 
        allowed = {TEAM_GUN}, 
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "M92 Beretta", 
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

    AddCustomShipment("HK45C", {
        model = "models/weapons/w_hk45c.mdl", 
        entity = "m9k_hk45", 
        price = 1750, 
        amount = 10, 
        separate = true, 
        pricesep = 200, 
        noship = false, 
        allowed = {TEAM_GUN}, 
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "HK45C", 
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

    AddCustomShipment("Glock 18", {
        model = "models/weapons/w_dmg_glock.mdl", 
        entity = "m9k_glock", 
        price = 2250, 
        amount = 10, 
        separate = true, 
        pricesep = 250, 
        noship = false, 
        allowed = {TEAM_GUN}, 
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "Glock 18", 
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })
    
    AddCustomShipment("Smith and wesson model 500", {
        model = "models/weapons/w_sw_model_500.mdl", 
        entity = "m9k_model500", 
        price = 2100, 
        amount = 10, 
        separate = true, 
        pricesep = 230, 
        noship = false, 
        allowed = {TEAM_GUN}, 
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "Model 500", 
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

-- SMGs

    AddCustomShipment("KAC PDW", {
        model = "models/weapons/w_kac_pdw.mdl", 
        entity = "m9k_kac_pdw", 
        price = 2100, 
        amount = 10, 
        separate = false, 
        pricesep = 230, 
        noship = false, 
        allowed = {TEAM_GUN}, 
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "KAC PDW", 
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

    AddCustomShipment("P90", {
        model = "models/weapons/w_fn_p90.mdl", 
        entity = "m9k_p90", 
        price = 2100, 
        amount = 10, 
        separate = false, 
        pricesep = 230, 
        noship = false, 
        allowed = {TEAM_GUN}, 
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "P90", 
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

    AddCustomShipment("USC", {
        model = "models/weapons/w_hk_usc.mdl", 
        entity = "m9k_usc", 
        price = 2100, 
        amount = 10, 
        separate = false, 
        pricesep = 230, 
        noship = false, 
        allowed = {TEAM_GUN}, 
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "USC", 
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

    AddCustomShipment("MP40", {
        model = "models/weapons/w_mp40smg.mdl", 
        entity = "m9k_mp40", 
        price = 2100, 
        amount = 10, 
        separate = false, 
        pricesep = 230, 
        noship = false, 
        allowed = {TEAM_GUN}, 
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "MP40", 
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })

    AddCustomShipment("UZI", {
        model = "models/weapons/w_uzi_imi.mdl", 
        entity = "m9k_uzi", 
        price = 2100, 
        amount = 10, 
        separate = false, 
        pricesep = 230, 
        noship = false, 
        allowed = {TEAM_GUN}, 
        shipmodel = "models/items/item_item_crate.mdl", 
        weight = 15, 
        buttonColor = Color(255, 255, 255, 255), 
        label = "UZI", 
        
        shipmentClass = "spawned_shipment",
        onBought = function(ply, shipment, ent) end,
        getPrice = function(ply, price) return ply:GetNWString("usergroup") == "donator" and price * 0.9 or price end,
    })


--DONATOR: VEKTOR, bison, magpul, honeybadger

-- Assult rifles



-- Sniper rifles



-- Shotguns



-- Machine guns
