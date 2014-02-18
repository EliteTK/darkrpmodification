/*---------------------------------------------------------------------------
Which default HUD elements should be hidden?
---------------------------------------------------------------------------*/

local hideHUDElements = {
-- if you DarkRP_HUD this to true, ALL of DarkRP's HUD will be disabled. That is the health bar and stuff,
-- but also the agenda, the voice chat icons, lockdown text, player arrested text and the names above players' heads
["DarkRP_HUD"] = false,

-- DarkRP_EntityDisplay is the text that is drawn above a player when you look at them.
-- This also draws the information on doors and vehicles
["DarkRP_EntityDisplay"] = false,

-- DarkRP_ZombieInfo draws information about zombies for admins who use /showzombie.
["DarkRP_ZombieInfo"] = false,

-- This is the one you're most likely to replace first
-- DarkRP_LocalPlayerHUD is the default HUD you see on the bottom left of the screen
-- It shows your health, job, salary and wallet
["DarkRP_LocalPlayerHUD"] = true,

-- Drawing the DarkRP agenda
["DarkRP_Agenda"] = false
}

-- this is the code that actually disables the drawing.
hook.Add("HUDShouldDraw", "HideDefaultDarkRPHud", function(name)
if hideHUDElements[name] then return false end
end)

/*---------------------------------------------------------------------------
Mark's HUD DESIGN 1
Made by mark
---------------------------------------------------------------------------*/

local function paintHud()
	-- background
	draw.RoundedBox(10, 10, ScrH()-135, 450, 125, Color(0, 0, 0, 200))
	       
	-- Health 
	draw.RoundedBox(10, 15, ScrH() - 70, 435, 25, Color(0,0,0,200))
	local Health = LocalPlayer():Health()
    local DrawHealth = math.Min(Health / GAMEMODE.Config.startinghealth, 1)
    if Health != 0 then
        draw.RoundedBox(10, 17, ScrH() - 68, 431 * DrawHealth, 21, Color(255,0,0,100))
    end
	if Health < 0 then
	Health = 0
	end
    draw.DrawText("Health: " .. Health, "HudSelectionText",235, ScrH() - 65, Color(255,255,255,255), TEXT_ALIGN_CENTER)
       
    -- Armor
    draw.RoundedBox(10, 15, ScrH() - 40, 435, 25, Color(0,0,0,200))
       
    local armor = LocalPlayer():Armor()
    if armor != 0 then
	    draw.RoundedBox(10, 17, ScrH() - 38, 431 * armor / 100, 21, Color(0,130,255,100))
        end
    draw.DrawText("Armor: " .. armor, "HudSelectionText",235, ScrH() - 35, Color(255,255,255,255), TEXT_ALIGN_CENTER)
	
	-- Name
	draw.RoundedBox(10, 15, ScrH()-130, 200, 25, Color(0, 0, 0, 200))
	draw.DrawText(LocalPlayer():Nick(), "HudSelectionText", 115, ScrH()-125, Color(255,255,255,255),TEXT_ALIGN_CENTER)
	
	-- Wallet
	
    local Wallet = DarkRP.getPhrase("wallet", GAMEMODE.Config.currency, (LocalPlayer():getDarkRPVar("money") or 0))
    draw.RoundedBox(10, 250, ScrH()-130, 200, 25, Color(0,0,0,200))
    draw.DrawText(Wallet, "HudSelectionText", 350, ScrH()-125, Color(255,255,255,255), TEXT_ALIGN_CENTER)
	
	-- Job
    local Job = DarkRP.getPhrase("job", LocalPlayer():getDarkRPVar("job") or "")
    draw.RoundedBox(10, 15, ScrH() - 100, 200, 25, team.GetColor(LocalPlayer():Team()))
    draw.DrawText(Job, "HudSelectionText", 115, ScrH() - 95, Color(255,255,255,255), TEXT_ALIGN_CENTER)
	
	-- Salary
	local Salary = DarkRP.getPhrase("salary", GAMEMODE.Config.currency, (LocalPlayer():getDarkRPVar("salary") or 0))
	draw.RoundedBox(10, 250, ScrH()-100, 200, 25, Color(0, 0, 0, 200))
	draw.DrawText(Salary, "HudSelectionText", 350, ScrH()-95, Color(255,255,255,255),TEXT_ALIGN_CENTER)
end
hook.Add("HUDPaint", "DarkRP_Mod_HUDPaint", paintHud)
