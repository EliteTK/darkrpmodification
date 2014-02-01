--[[
--SHIPMENTS
default: https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua
examples: http://wiki.darkrp.com/index.php/DarkRP:CustomShipmentFields
--]]


-- MISC

AddCustomShipment("Medical kits", {
    model = "models/Items/healthkit.mdl", 
    entity = "item_healthkit",
    price = 750,
    amount = 10,
    separate = false, 
    pricesep = 100, 
    noship = false, 
    allowed = {TEAM_MEDIC},
    shipmodel = "models/items/item_item_crate.mdl",
    weight = 15, 
    buttonColor = Color(255, 80, 80, 255), 
    label = "Medical kits",
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Armour kits", {
    model = "models/Items/battery.mdl", 
    entity = "item_battery",
    price = 1000,
    amount = 10,
    separate = false, 
    pricesep = 150, 
    noship = false, 
    allowed = {TEAM_BLACK_MARKET_DEALER, TEAM_SWAT_LEADER},
    shipmodel = "models/items/item_item_crate.mdl",
    weight = 15, 
    buttonColor = Color(80, 80, 255, 255), 
    label = "Armour kits",
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})


AddCustomShipment("Pistol ammo", {
    model = "models/Items/BoxSRounds.mdl", 
    entity = "item_ammo_pistol",
    price = 400,
    amount = 10,
    separate = false, 
    pricesep = 50, 
    noship = false, 
    allowed = {TEAM_GUN},
    shipmodel = "models/items/item_item_crate.mdl",
    weight = 15, 
    buttonColor = Color(80, 255, 80, 255), 
    label = "Pistol Ammo",
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("SMG ammo", {
    model = "models/Items/BoxMRounds.mdl", 
    entity = "item_ammo_smg1",
    price = 450,
    amount = 10,
    separate = false, 
    pricesep = 60, 
    noship = false, 
    allowed = {TEAM_GUN},
    shipmodel = "models/items/item_item_crate.mdl", 

    weight = 15, 
    buttonColor = Color(80, 80, 255, 255), 
    label = "SMG Ammo", 

    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Assult rifle ammo", {
    model = "models/Items/combine_rifle_cartridge01.mdl", 
    entity = "item_ammo_ar2", 
    price = 500,
    amount = 10,
    separate = false, 
    pricesep = 75, 
    noship = false, 
    allowed = {TEAM_GUN},
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "Assult rifle Ammo", 

    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Shotgun ammo", {
    model = "models/Items/BoxBuckshot.mdl", 
    entity = "item_box_buckshot", 
    price = 500,
    amount = 10,
    separate = false, 
    pricesep = 75, 
    noship = false, 
    allowed = {TEAM_GUN},
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(200, 25, 25, 255), 
    label = "Shotgun Ammo", 

    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Sniper ammo", {
    model = "models/Items/sniper_round_box.mdl", 
    entity = "item_ammo_sniper", 
    price = 750,
    amount = 10,
    separate = false, 
    pricesep = 100, 
    noship = false, 
    allowed = {TEAM_GUN},
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(200, 200, 25, 255), 
    label = "Sniper Ammo", 

    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment(".357 ammo", {
    model = "models/Items/357ammobox.mdl", 
    entity = "item_ammo_357", 
    price = 450,
    amount = 10,
    separate = false, 
    pricesep = 55, 
    noship = false, 
    allowed = {TEAM_GUN},
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(255, 128, 0, 255), 
    label = ".357 Ammo", 

    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("winchester ammo", {
    model = "models/Items/sniper_round_box.mdl", 
    entity = "item_ammo_winchester", 
    price = 550,
    amount = 10,
    separate = false, 
    pricesep = 70, 
    noship = false, 
    allowed = {TEAM_GUN},
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(140, 70, 0, 255), 
    label = "Winchester Ammo", 

    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

--[[
-- *******************
-- STANDARD PISTOLS
-- *******************
--]]

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
    buttonColor = Color(80, 255, 80, 255), 
    label = "USP", 

    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("colt 1911", {
    model = "models/weapons/s_dmgf_co1911.mdl", 
    entity = "m9k_colt1911", 
    price = 1750, 
    amount = 10, 
    separate = true, 
    pricesep = 200, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(80, 255, 80, 255), 
    label = "Colt 1911", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
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
    buttonColor = Color(80, 255, 80, 255), 
    label = "Glock 18", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
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
    buttonColor = Color(255, 128, 0, 255), 
    label = "Model 500", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Raging bull", {
    model = "models/weapons/w_taurus_raging_bull.mdl", 
    entity = "m9k_ragingbull", 
    price = 2100, 
    amount = 10, 
    separate = true, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(255, 128, 0, 255), 
    label = "Raging bull", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("P229", {
    model = "models/weapons/w_sig_229r.mdl", 
    entity = "m9k_sig_p229r", 
    price = 2100, 
    amount = 10, 
    separate = true, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(80, 255, 80, 255), 
    label = "P229", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("HK45C", {
    model = "models/weapons/w_hk45c.mdl", 
    entity = "m9k_hk45", 
    price = 2100, 
    amount = 10, 
    separate = true, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(80, 255, 80, 255), 
    label = "HK45C", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

--[[
-- *******************
-- DONATOR PISTOLS
-- *******************
--]]

AddCustomShipment("Raging bull scoped", {
    model = "models/weapons/w_raging_bull_scoped.mdl", 
    entity = "m9k_scoped_taurus", 
    price = 2100, 
    amount = 10, 
    separate = true, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(255, 128, 0, 255), 
    label = "Raging bull scoped", 
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

--[[
-- *******************
-- STANDARD SMGS
-- *******************
--]]

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
    buttonColor = Color(80, 80, 255, 255), 
    label = "KAC PDW",
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("P90", {
    model = "models/weapons/w_fn_p90.mdl", 
    entity = "m9k_smgp90", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(80, 80, 255, 255), 
    label = "P90", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
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
    buttonColor = Color(80, 80, 255, 255), 
    label = "USC", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
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
    buttonColor = Color(80, 80, 255, 255), 
    label = "MP40", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
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
    buttonColor = Color(80, 80, 255, 255), 
    label = "UZI", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

--[[
-- *******************
-- DONATOR SMGs
-- *******************
--]]

AddCustomShipment("Magpul PDR", {
    model = "models/weapons/w_magpul_pdr.mdl", 
    entity = "m9k_magpulpdr", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(80, 80, 255, 255), 
    label = "Magpul PDR", 
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Honeybadger", {
    model = "models/weapons/w_aac_honeybadger.mdl", 
    entity = "m9k_honeybadger", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "Honeybadger", 
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("KRISS vector", {
    model = "models/weapons/w_kriss_vector.mdl", 
    entity = "m9k_vector", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(80, 80, 255, 255), 
    label = "KRISS vector", 
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Bizon PP19", {
    model = "models/weapons/w_pp19_bizon.mdl", 
    entity = "m9k_bizonp19", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(80, 80, 255, 255), 
    label = "Bizon PP19", 
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

--[[
-- *******************
-- STANDARD ASSULT RIFLES
-- *******************
--]]

AddCustomShipment("M14", {
    model = "models/weapons/w_snip_m14sp.mdl", 
    entity = "m9k_m14sp", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "M14", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("M4A1", {
    model = "models/weapons/w_m4a1_iron.mdl", 
    entity = "m9k_m4a1", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "M4A1", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("HK416", {
    model = "models/weapons/w_hk_416.mdl", 
    entity = "m9k_m416", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "HK416", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Famas", {
    model = "models/weapons/w_tct_famas.mdl", 
    entity = "m9k_famas", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "Famas", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("G36", {
    model = "models/weapons/w_hk_g36c.mdl", 
    entity = "m9k_g36", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "G36", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Winchester", {
    model = "models/weapons/w_winchester_1873.mdl", 
    entity = "m9k_winchester73", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(140, 70, 0, 255), 
    label = "Winchester", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})


--[[
-- *******************
-- DONATOR ASSULT RIFLES
-- *******************
--]]

AddCustomShipment("TAR21", {
    model = "models/weapons/w_imi_tar21.mdl", 
    entity = "m9k_tar21", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "TAR21", 
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("L85", {
    model = "models/weapons/w_l85a2.mdl", 
    entity = "m9k_l85", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "L85", 
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("M16A4", {
    model = "models/weapons/w_dmg_m16ag.mdl", 
    entity = "m9k_m16a4_acog", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "M16A4", 
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("SCAR H", {
    model = "models/weapons/w_fn_scar_h.mdl", 
    entity = "m9k_scar", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "SCAR H",
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

--[[
-- *******************
-- STANDARD SHOTGUNS
-- *******************
--]]

AddCustomShipment("Winchester 87", {
    model = "models/weapons/w_winchester_1887.mdl", 
    entity = "m9k_1887winchester", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(200, 25, 25, 255), 
    label = "Winchester 87", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Remington 870", {
    model = "models/weapons/w_remington_870_tact.mdl", 
    entity = "m9k_remington870", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(200, 25, 25, 255), 
    label = "Remington 870", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

--[[
-- *******************
-- DONATOR SHOTGUNS
-- *******************
--]]

AddCustomShipment("SPAS 12", {
    model = "models/weapons/w_remington_870_tact.mdl", 
    entity = "w_spas_12", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(200, 25, 25, 255), 
    label = "SPAS 12", 
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

--[[
-- *******************
-- STANDARD SNIPER RIFLES
-- *******************
--]]

AddCustomShipment("M24", {
    model = "models/weapons/w_snip_m24_6.mdl", 
    entity = "m9k_m24", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(200, 200, 25, 255), 
    label = "M24", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("M98B", {
    model = "models/weapons/w_barrett_m98b.mdl", 
    entity = "m9k_m98b", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(200, 200, 25, 255), 
    label = "M98B", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

--[[
-- *******************
-- DONATOR SNIPER RIFLES
-- *******************
--]]

AddCustomShipment("SVT 40", {
    model = "models/weapons/w_svt_40.mdl", 
    entity = "m9k_svt40", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(200, 200, 25, 255), 
    label = "SVT 40",
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})


--[[
-- *******************
-- STANDARD MACHINE GUNS
-- *******************
--]]

AddCustomShipment("FG 42", {
    model = "models/weapons/w_fg42.mdl", 
    entity = "m9k_fg42", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "FG 42", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("PKM", {
    model = "models/weapons/w_mach_russ_pkm.mdl", 
    entity = "m9k_pkm", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "PKM", 
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})


--[[
-- *******************
-- DONATOR MACHINE GUNS
-- *******************
--]]

AddCustomShipment("M249", {
    model = "models/weapons/w_m249_machine_gun.mdl", 
    entity = "m9k_m249lmg", 
    price = 2100, 
    amount = 10, 
    separate = false, 
    pricesep = 230, 
    noship = false, 
    allowed = {TEAM_GUN}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15, 
    buttonColor = Color(114, 0, 191, 255), 
    label = "M249", 
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})


--[[
-- *******************
-- BLACK MARKET DEALER
-- *******************
--]]


AddCustomShipment("Fast Lockpick", {
    model = "models/weapons/w_crowbar.mdl",
    entity = "fastpick", 
    price = 800,
    amount = 10,
    separate = true, 
    pricesep = 100, 
    noship = false,
    allowed = {TEAM_BLACK_MARKET_DEALER}, 
    shipmodel = "models/items/item_item_crate.mdl", 
    weight = 15,
    buttonColor = Color(88, 88, 88, 255), 
    label = "Fast lockpick", 
    customCheck = function(ply) return ply:IsUserGroup("donator") end,

    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Keypad Cracker", {
    model = "models/weapons/w_c4_planted.mdl",
    entity = "keypad_cracker",
    price = 1000,
    amount = 10,
    separate = true,
    pricesep = 150,
    noship = false,
    allowed = {TEAM_BLACK_MARKET_DEALER},
    shipmodel = "models/items/item_item_crate.mdl",
    weight = 15,
    buttonColor = Color(88, 88, 88, 255),
    label = "Keypad Cracker",
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

AddCustomShipment("Silenced Keypad Cracker", {
    model = "models/weapons/w_c4_planted.mdl",
    entity = "silenced_keypad_cracker",
    price = 1500,
    amount = 10,
    separate = true,
    pricesep = 225,
    noship = false,
    allowed = {TEAM_BLACK_MARKET_DEALER},
    shipmodel = "models/items/item_item_crate.mdl",
    weight = 15,
    buttonColor = Color(88, 88, 88, 255),
    label = "Silenced Keypad Cracker",
    customCheck = function(ply) return ply:IsUserGroup("donator") end,
    
    shipmentClass = "spawned_shipment",
    onBought = function(ply, shipment, ent) end,
    getPrice = function(ply, price) return ply:GetUserGroup() == "donator" and price * 0.9 or price end,
})

