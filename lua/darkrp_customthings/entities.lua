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
DarkRP.createEntity("Rifle Ammo", {
	ent = "m9k_ammo_ar2",
	model = "models/Items/BoxMRounds.mdl",
	price = 0,
	max = 5,
	cmd = "/buyrifleammo",
})

DarkRP.createEntity("Health vial", {
    ent = "item_healthvial",
    model = "models/Items/BoxMRounds.mdl",
    price = 50,
    max = 10,
    cmd = "/buyhealth",
    allowed = {TEAM_GUN}
})

DarkRP.createEntity("Test", {
    emt = "test_entity",
    model = "models/props_interiors/BathTub01a.mdl",
    price = 0,
    max = 1,
    cmd = "/buybath",
    allowed = {TEAM_ADMIN}
})
