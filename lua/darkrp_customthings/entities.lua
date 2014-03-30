--[[
DarkRP custom entities
--]]

--[[
Kits
--]]

-- Health

DarkRP.createEntity("Health vial", {
    ent = "spawned_health_vial",
    model = "models/healthvial.mdl",
    price = 50,
    max = 30,
    cmd = "buyvial",
    buttonColor = Color(255, 80, 80, 255), 
    allowed = {TEAM_MEDIC}
})

DarkRP.createEntity("Health kit", {
    ent = "spawned_health_kit",
    model = "models/items/healthkit.mdl",
    price = 100,
    max = 30,
    cmd = "buykit",
    buttonColor = Color(255, 80, 80, 255),
    allowed = {TEAM_MEDIC}
})

-- Armor

DarkRP.createEntity("Armor", {
    ent = "spawned_armor",
    model = "models/Items/battery.mdl",
    price = 150,
    max = 30, 
    cmd = "buyarmor",
    buttonColor = Color(80, 80, 255, 255), 
    allowed = {TEAM_BLACK_MARKET_DEALER, TEAM_SWAT_LEADER}
})

--[[
Printers
--]]

DarkRP.createEntity("Amateur Printer", {
    ent = "amateur_printer",
    model = "models/props_c17/consolebox01a.mdl",
    price = 1500,
    max = 10,
    cmd = "buyamateurprinter",
    buttonColor = Color(90, 50, 0, 255),
})

DarkRP.createEntity("Consumer Printer", {
    ent = "consumer_printer",
    model = "models/props_c17/consolebox01a.mdl",
    price = 2500,
    max = 10,
    cmd = "buyconsumerprinter",
    buttonColor = Color(0, 140, 200, 255),
})

DarkRP.createEntity("High Performance Printer", {
    ent = "hp_printer",
    model = "models/props_c17/consolebox01a.mdl",
    price = 5000,
    max = 10,
    cmd = "buyhpprinter",
    buttonColor = Color(15, 120, 0, 255),
})

DarkRP.createEntity("Nuclear Printer", {
    ent = "nuclear_printer",
    model = "models/props_c17/consolebox01a.mdl",
    price = 10000,
    max = 10,
    cmd = "buynuclearprinter",
    buttonColor = Color(50, 0, 120, 255),
})

--[[
Heat Exchangers
--]]

DarkRP.createEntity("Basic Heat Exchanger", {
    ent = "basic_heat_exchanger",
    model = "models/props/cs_assault/ACUnit02.mdl",
    price = 2500,
    max = 10,
    cmd = "buybasicheat",
    buttonColor = Color(90, 50, 30, 255),
})

DarkRP.createEntity("Advanced Heat Exchanger", {
    ent = "advanced_heat_exchanger",
    model = "models/props/cs_assault/ACUnit02.mdl",
    price = 7000,
    max = 10,
    cmd = "buyadvancedheat",
    buttonColor = Color(182, 182, 182, 255),
})

--[[
Printer kits
--]]

-- Repair

DarkRP.createEntity("Printer Repair Kit", {
    ent = "repair_kit",
    model = "models/props_lab/reciever01d.mdl",
    price = 800,
    max = 20,
    cmd = "buyrepair",
    buttonColor = Color(90, 90, 90, 255),
    allowed = {TEAM_TECH}
})

-- Coolant

DarkRP.createEntity("Printer Coolant Bottle", {
    ent = "coolant_bottle",
    model = "models/props_junk/garbage_milkcarton001a.mdl",
    price = 500,
    max = 20,
    cmd = "buycoolant",
    buttonColor = Color(0, 80, 170, 255),
    allowed = {TEAM_TECH}
})

--[[
Gun Labs
--]]

DarkRP.createEntity("Pistol Gun lab", {
    ent = "pistol_gunlab",
    model = "models/props_c17/TrapPropeller_Engine.mdl",
    price = 5000,
    max = 1,
    cmd = "buypistollab",
    buttonColor = Color(255, 128, 0, 255),
    allowed = {TEAM_GUN}
})

DarkRP.createEntity("SMG Gun lab", {
    ent = "smg_gunlab",
    model = "models/props_c17/TrapPropeller_Engine.mdl",
    price = 8000,
    max = 1,
    cmd = "buysmglab",
    buttonColor = Color(255, 128, 0, 255),
    allowed = {TEAM_GUN}
})
