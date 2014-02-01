--[[
-----------------------------------------------------------------------------
/*---------------------------------------------------------------------------
DarkRP custom entities
---------------------------------------------------------------------------

This file contains your custom entities.
This file should also contain entities from DarkRP that you edited.

Note: If you want to edit a default DarkRP entity, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the entity to this file and edit it.

The default entities can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua#L111

Add entities under the following line:
---------------------------------------------------------------------------*/
--]]
--

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

DarkRP.createEntity("Armor", {
    ent = "spawned_armor",
    model = "models/Items/battery.mdl",
    price = 150,
    max = 30, 
    cmd = "buyarmor",
    buttonColor = Color(80, 80, 255, 255), 
    allowed = {TEAM_BLACK_MARKET_DEALER, TEAM_SWAT_LEADER}
})

DarkRP.createEntity("Test", {
    ent = "test_entity",
    model = "models/props_interiors/BathTub01a.mdl",
    price = 0,
    max = 1,
    cmd = "buybath",
    buttonColor = Color(12, 80, 255, 255), 
    allowed = {TEAM_ADMIN}
})

DarkRP.createEntity("Another test", {
    ent = "test_playerpos_entity",
    model = "models/props_lab/citizenradio.mdl",
    price = 0,
    max = 100,
    cmd = "buybath",
    buttonColor = Color(123, 32, 45, 255),
    allowed = {TEAM_ADMIN}
})
