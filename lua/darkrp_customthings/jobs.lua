--[[
defaults: https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua
wiki: http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields
--]]

     TEAM_ADMIN = DarkRP.createJob("Admin On Duty", {
        color = Color(255, 0, 0, 255),
        model = "models/player/combine_super_soldier.mdl",
        description = [[Your an admin on duty, You know what to do, Dont abuse!]],
        weapons = {"arrest_stick", "unarrest_stick", "m9k_deagle", "stunstick", "door_ram", "weaponchecker", "paydaybaton"},
        command = "admin",
        max = 4,
        salary = 0,
        admin = 1,
        vote = false,
        hasLicense = true,
     })
     
    TEAM_MOD = DarkRP.createJob("Moderator On Duty", {
        color = Color(255, 0, 0, 255),
        model = "models/player/combine_super_soldier.mdl",
        description = [[Your a moderator on duty, You know what to do, Dont abuse!]],
        weapons = {"arrest_stick", "unarrest_stick", "m9k_deagle", "stunstick", "door_ram", "weaponchecker"},
        command = "admin",
        max = 4,
        salary = 0,
        admin = 0,
        vote = false,
        hasLicense = true,
        customCheck = function(ply) return ply:IsUserGroup("moderator") end,
     })

TEAM_CITIZEN = DarkRP.createJob("Citizen", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group01/Female_01.mdl",
		"models/player/Group01/Female_02.mdl",
		"models/player/Group01/Female_03.mdl",
		"models/player/Group01/Female_04.mdl",
		"models/player/Group01/Female_06.mdl",
		"models/player/group01/male_01.mdl",
		"models/player/Group01/Male_02.mdl",
		"models/player/Group01/male_03.mdl",
		"models/player/Group01/Male_04.mdl",
		"models/player/Group01/Male_05.mdl",
		"models/player/Group01/Male_06.mdl",
		"models/player/Group01/Male_07.mdl",
		"models/player/Group01/Male_08.mdl",
		"models/player/Group01/Male_09.mdl"
	},
	description = [[The Citizen is the most basic level of society you can hold besides being a hobo. You have no specific role in city life.]],
	weapons = {},
	command = "citizen",
	max = 0,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
})

TEAM_GANG = DarkRP.createJob("Gangster", {
	color = Color(75, 75, 75, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl",
		"models/player/Group03/Female_03.mdl",
		"models/player/Group03/Female_04.mdl",
		"models/player/Group03/Female_06.mdl",
		"models/player/group03/male_01.mdl",
		"models/player/Group03/Male_02.mdl",
		"models/player/Group03/male_03.mdl",
		"models/player/Group03/Male_04.mdl",
		"models/player/Group03/Male_05.mdl",
		"models/player/Group03/Male_06.mdl",
		"models/player/Group03/Male_07.mdl",
		"models/player/Group03/Male_08.mdl",
		"models/player/Group03/Male_09.mdl"},
	description = [[The lowest person of crime.
		A gangster generally works for the Mobboss who runs the crime family.
		The Mob boss sets your agenda and you follow it or you might be punished.]],
	weapons = {},
	command = "gangster",
	max = 3,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_MOB = DarkRP.createJob("Mob boss", {
	color = Color(25, 25, 25, 255),
	model = "models/player/gman_high.mdl",
	description = [[The Mob boss is the boss of the criminals in the city.
		With his power he coordinates the gangsters and forms an efficient crime organization.
		He has the ability to break into houses by using a lockpick.
		The Mob boss posesses the ability to unarrest you.]],
	weapons = {"lockpick", "unarrest_stick"},
	command = "mobboss",
	max = 1,
	salary = 60,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_GUN = DarkRP.createJob("Gun Dealer", {
	color = Color(255, 140, 0, 255),
	model = "models/player/monk.mdl",
	description = [[A Gun Dealer is the only person who can sell guns to other people.
		Make sure you aren't caught selling illegal firearms to the public! You might get arrested!]],
	weapons = {},
	command = "gundealer",
	max = 2,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_MEDIC = DarkRP.createJob("Medic", {
	color = Color(47, 79, 79, 255),
	model = {
	         "models/player/Group03m/Female_01.mdl",
	         "models/player/Group03m/Female_02.mdl",
	         "models/player/Group03m/Female_03.mdl",
	         "models/player/Group03m/Female_04.mdl",
	         "models/player/Group03m/Female_06.mdl",
	         "models/player/Group03m/Male_01.mdl",
	         "models/player/Group03m/Male_02.mdl",
	         "models/player/Group03m/Male_03.mdl",
	         "models/player/Group03m/Male_04.mdl",
	         "models/player/Group03m/Male_05.mdl",
	         "models/player/Group03m/Male_06.mdl",
	         "models/player/Group03m/Male_07.mdl",
	         "models/player/Group03m/Male_08.mdl",
	         "models/player/Group03m/Male_09.mdl"},
	description = [[With your medical knowledge you work to restore players to full health.
		Without a medic, people cannot be healed.
		Left click with the Medical Kit to heal other players.
		Right click with the Medical Kit to heal yourself.]],
	weapons = {"med_kit"},
	command = "medic",
	max = 3,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false,
	medic = true
})


TEAM_MAYOR = DarkRP.createJob("Mayor", {
	color = Color(150, 20, 20, 255),
	model = "models/player/breen.mdl",
	description = [[The Mayor of the city creates laws to govern the city.
	If you are the mayor you may create and accept warrants.
	Type /wanted <name>  to warrant a player.
	Type /jailpos to set the Jail Position.
	Type /lockdown initiate a lockdown of the city.
	Everyone must be inside during a lockdown.
	The cops patrol the area.
	/unlockdown to end a lockdown.
	NOTE: Updon death you will become a citizen
	Allowed gun: No
	Allowed to raid: No]],
	weapons = {},
	command = "mayor",
	max = 1,
	salary = 150,
	admin = 0,
	vote = true,
	hasLicense = false,
	mayor = true,
	
	PlayerDeath = function(ply, _, _)
            if( ply:Team() == TEAM_MAYOR ) then
                    ply:changeTeam( GAMEMODE.DefaultTeam, true )
                    for _ ,v in pairs( player.GetAll() ) do
                            v:PrintMessage( HUD_PRINTCENTER, "The mayor has been killed!" )
                    end
            end
        end
})

TEAM_HOBO = DarkRP.createJob("Hobo", {
	color = Color(80, 45, 0, 255),
	model = "models/player/corpse1.mdl",
	description = [[The lowest member of society. Everybody laughs at you.
		You have no home.
		Beg for your food and money
		Sing for everyone who passes to get money
		Make your own wooden home somewhere in a corner or outside someone else's door]],
	weapons = {"weapon_bugbait"},
	command = "hobo",
	max = 5,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = true
})

TEAM_DRUG_DEALER = DarkRP.createJob("Drug Dealer", {
	color = Color(80, 45, 0, 255),
	model = "models/player/corpse1.mdl",
	description = [[The lowest member of society. Everybody laughs at you.
		You have no home.
		Beg for your food and money
		Sing for everyone who passes to get money
		Make your own wooden home somewhere in a corner or outside someone else's door]],
	weapons = {},
	command = "drugdealer",
	max = 2,
	salary = 35,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
})

     
     TEAM_THIEF = DarkRP.createJob("Thief", {
        color = Color(80, 80, 80, 255),
        model = "models/player/arctic.mdl",
        description = [[You are a thief, You should use your skills to steal peoples valubles, or sell your skills for other purposes]],
        weapons = {"slowpick","door_ram"},
        command = "thief",
        max = 3,
        salary = 50,
        admin = 0,
        vote = false,
        hasLicense = false,
     })

     TEAM_SWAT = DarkRP.createJob("SWAT", {
        color = Color(0,0, 139, 255),
        model = "models/player/swat.mdl",
        description = [[Your duty is for heavy strikes when needed. You should stay in the PD until backup is needed. Do everything you can to keep the city safe.]],
        weapons = {"arrest_stick", "unarrest_stick", "m9k_usp", "m9k_m4a1", "stunstick", "door_ram", "weaponchecker"},
        command = "swat",
        max = 3,
        salary = 100,
        admin = 0,
        vote = true,
        hasLicense = true,
     })
     
     TEAM_SWAT_LEADER = DarkRP.createJob("SWAT leader", {
        color = Color(25, 25, 112, 255),
        model = "models/player/gasmask.mdl",
        description = [[Your duty is for heavy strikes when needed. You should stay in the PD until backup is needed. Do everything you can to keep the city safe.]],
        weapons = {"arrest_stick", "unarrest_stick", "m9k_usp", "m9k_m4a1", "m9k_m98b", "stunstick", "door_ram", "weaponchecker"},
        command = "swatleader",
        max = 1,
        salary = 125,
        admin = 0,
        vote = true,
        hasLicense = true,
        NeedToChangeFrom = TEAM_SWAT,
     })
     
     TEAM_BLACK_MARKET_DEALER = DarkRP.createJob("Black Market Dealer", {
        color = Color(41, 41, 41, 255),
        model = "models/player/phoenix.mdl",
        description = [[You are to sell illegal goods to the mob and thieves to aid them in their ventures.]],
        weapons = {},
        command = "blackmarketdealer",
        max = 2,
        salary = 45,
        admin = 0,
        vote = false,
        hasLicense = false,
     })
     
     TEAM_HITMAN = DarkRP.createJob("Hitman", {
        color = Color(66, 0, 110, 255),
        model = "models/player/leet.mdl",
        description = [[You are a hitman. You kill people for money. Do not kill randomly.]],
        weapons = {"m9k_knife"},
        command = "hitman",
        max = 2,
        salary = 30,
        admin = 0,
        vote = true,
        hasLicense = false,
     })
     
     TEAM_CP = DarkRP.createJob("Civil Protection", {
        color = Color(25, 25, 170, 255),
        model = {"models/player/police.mdl", "models/player/police_fem.mdl"},
        description = [[The protector of every citizen that lives in the city.
                You have the power to arrest criminals and protect innocents.
                Hit a player with your arrest baton to put them in jail.
                Bash a player with a stunstick and they may learn to obey the law.
                The Battering Ram can break down the door of a criminal, with a warrant for their arrest.
                The Battering Ram can also unfreeze frozen props (if enabled).
                Type /wanted <name> to alert the public to the presence of a criminal.]],
        weapons = {"arrest_stick", "unarrest_stick", "m9k_m92beretta", "stunstick", "door_ram", "weaponchecker"},
        command = "cp",
        max = 9,
        salary = 75,
        admin = 0,
        vote = true,
        hasLicense = true,
     })
     
     TEAM_CP_CHIEF = DarkRP.createJob("Civil Protection Chief", {
        color = Color(20, 20, 255, 255),
        model = "models/player/combine_soldier_prisonguard.mdl",
        description = [[The Chief is the leader of the Civil Protection unit.
                Coordinate the police force to enforce law in the city.
                Hit a player with arrest baton to put them in jail.
                Bash a player with a stunstick and they may learn to obey the law.
                The Battering Ram can break down the door of a criminal, with a warrant for his/her arrest.
                Type /wanted <name> to alert the public to the presence of a criminal.
                Type /jailpos to set the Jail Position]],
        weapons = {"arrest_stick", "unarrest_stick", "m9k_deagle", "stunstick", "door_ram", "weaponchecker"},
        command = "chief",
        max = 1,
        salary = 90,
        admin = 0,
        vote = false,
        hasLicense = true,
        chief = true,
        NeedToChangeFrom = TEAM_CP,
     })
     
     TEAM_REBEL_LEADER = DarkRP.createJob("Rebel leader", {
        color = Color(0, 100, 0, 255),
        model = "models/dpfilms/metropolice/playermodels/pm_resistance_police.mdl",
        description = [[Rebellion]],
        weapons = {"unarrest_stick"},
        command = "rebelleader",
        max = 1,
        salary = 55,
        admin = 1,
        vote = false,
        hasLicense = false,
        NeedToChangeFrom = TEAM_REBEL,
     })
     
     TEAM_REBEL = DarkRP.createJob("Rebel", {
        color = Color(0, 150, 0, 255),
        model = {"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl",
		"models/player/Group03/Female_03.mdl",
		"models/player/Group03/Female_04.mdl",
		"models/player/Group03/Female_06.mdl",
		"models/player/group03/male_01.mdl",
		"models/player/Group03/Male_02.mdl",
		"models/player/Group03/male_03.mdl",
		"models/player/Group03/Male_04.mdl",
		"models/player/Group03/Male_05.mdl",
		"models/player/Group03/Male_06.mdl",
		"models/player/Group03/Male_07.mdl",
		"models/player/Group03/Male_08.mdl",
		"models/player/Group03/Male_09.mdl"},
        description = [[Rebellion]],
        weapons = {"unarrest_stick"},
        command = "rebel",
        max = 5,
        salary = 35,
        admin = 1,
        vote = false,
        hasLicense = false,
     })

     TEAM_CAR_DEALER = DarkRP.createJob("Car dealer", {
        color = Color(0, 200, 50, 255),
        model = "models/player/odessa.mdl",
        description = [[You are to sell cars to the residents for a profit.]],
        weapons = {},
        command = "cardealer",
        max = 2,
        salary = 45,
        admin = 0,
        vote = false,
        hasLicense = false,
     })
     
     TEAM_TECH = DarkRP.createJob("Technician", {
        color = Color(0, 160, 200, 255),
        model = "models/player/hostage/hostage_04.mdl",
        description = [[You are to build wire contraptions and sell them to players for security and other purposes. No entity finders or abusing.]],
        weapons = {},
        command = "technician",
        max = 2,
        salary = 45,
        admin = 0,
        vote = false,
        hasLicense = false,
     })
     
     TEAM_ZOMBIE = DarkRP.createJob("Zombie", {
        color = Color(100, 0, 0, 255),
        model = {"models/player/zombie_classic.mdl",
        	 "models/dpfilms/metropolice/playermodels/pm_zombie_police.mdl"},
        description = [[Bleh. You are a zombie.]],
        weapons = {"m9k_knife"},
        command = "bleh",
        max = 0,
        salary = 45,
        admin = 1,
        vote = false,
        hasLicense = false,
        NeedToChangeFrom = TEAM_CITIZEN,
     })
     
     TEAM_FREERUNNER = DarkRP.createJob("Free runner", {
        color = Color(62, 132, 166, 255),
        model = "models/player/Group03/Male_01.mdl",
        description = [[Jump from building to building]],
        weapons = {"climb_swep2"},
        command = "freerunner",
        max = 3,
        salary = 35,
        admin = 0,
        vote = false,
        hasLicense = false,
     })
     
     TEAM_BANKER = DarkRP.createJob("Banker", {
        color = Color(0, 255, 0, 255),
        model = "models/player/magnusson.mdl",
        description = [[Your a banker, you can have printers legally however you should get a guard or you may be raided]],
        weapons = {},
        command = "banker",
        max = 1,
        salary = 50,
        admin = 0,
        vote = false,
        hasLicense = false,
     })
     
     TEAM_GUARD = DarkRP.createJob("Guard", {
        color = Color(150, 150, 150, 255),
        model = "models/player/barney.mdl",
        description = [[You are a guard. You are hired by people and must protect them with your life]],
        weapons = {"stunstick"},
        command = "guard",
        max = 5,
        salary = 40,
        admin = 0,
        vote = false,
        hasLicense = false,
     })
     
     TEAM_MECHANIC = DarkRP.createJob("Mechanic", {
        color = Color(51, 102, 153, 255),
        model = "models/player/Group01/Male_05.mdl",
        description = [[As a mechanic you should repair peoples' cars for a price.]],
        weapons = {"weapon_scarrepair", "weapon_scarrefuel"},
        command = "mechanic",
        max = 2,
        salary = 50,
        admin = 0,
        vote = false,
        hasLicense = false,
     })
     
     TEAM_TAXI = DarkRP.createJob("Taxi driver", {
        color = Color(230, 230, 0, 255),
        model = "models/player/eli.mdl",
        description = [[Drive people around at a cost.]],
        weapons = {},
        command = "taxi",
        max = 2,
        salary = 50,
        admin = 0,
        vote = false,
        hasLicense = false,
     })
     


/*---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------*/
GAMEMODE.DefaultTeam = TEAM_CITIZEN


/*---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------*/
GAMEMODE.CivilProtection = {
	[TEAM_CP] = true,
	[TEAM_CP_CHIEF] = true,
	[TEAM_MAYOR] = true,
	[TEAM_SWAT] = true,
	[TEAM_SWAT_LEADER] = true,
}

/*---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------*/
DarkRP.addHitmanTeam(TEAM_HITMAN)
