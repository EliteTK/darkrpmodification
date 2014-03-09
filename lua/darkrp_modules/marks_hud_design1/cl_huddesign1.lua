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

--[[
Mark's HUD DESIGN 1
Made by mark
Rewritten by someone else.
--]]

local function getscl_x(x, exp_screen_w)
    return x / (exp_screen_w or 1680) * ScrW()
end

local function getscll_y(y, exp_screen_h)
    return y / (exp_screen_h or 1050) * ScrH()
end

local function getscl_y(y, exp_screen_h)
    return ScrH() - getscll_y(y, exp_screen_h or 1050)
end




hook.Add("HUDPaint", "DarkRP_Mod_HUDPaint",function()
    -- Background
    draw.RoundedBox(0, getscl_x(10), getscl_y(135), getscl_x(450), getscll_y(125), Color(0, 0, 0, 200))

    -- Health
    draw.RoundedBox(0, getscl_x(15), getscl_y(70), getscl_x(435), getscll_y(25), Color(0,0,0,200))
    local health = LocalPlayer():Health()
    local bar_health = math.min(math.max(health, 0), 100) / GAMEMODE.Config.startinghealth
    draw.RoundedBox(0, getscl_x(17), getscl_y(68), getscl_x(431)*bar_health, getscll_y(21), Color(255,0,0,100))
    draw.DrawText("Health: " .. math.max(health, 0), "HudSelectionText", getscl_x(235), getscl_y(65), Color(255,255,255,255), TEXT_ALIGN_CENTER )

    -- Armor
    draw.RoundedBox(0, getscl_x(15), getscl_y(40), getscl_x(435), getscll_y(25), Color(0,0,0,200))
    local armor = LocalPlayer():Armor()
    local bar_armor = math.min(math.max(armor, 0), 100) / 100
    draw.RoundedBox(0, getscl_x(17), getscl_y(38), getscl_x(431)*bar_armor, getscll_y(21), Color(0,130,255,100))
    draw.DrawText("Armor: " .. math.max(armor, 0), "HudSelectionText", getscl_x(235), getscl_y(35), Color(255,255,255,255), TEXT_ALIGN_CENTER)

    -- Name
    draw.RoundedBox(0, getscl_x(15), getscl_y(130), getscl_x(200), getscll_y(25), Color(0, 0, 0, 200))
    draw.DrawText(LocalPlayer():Nick(), "HudSelectionText", getscl_x(115), getscl_y(125), Color(255,255,255,255),TEXT_ALIGN_CENTER)

    -- Wallet
    local wallet = DarkRP.getPhrase("wallet", GAMEMODE.Config.currency, (LocalPlayer():getDarkRPVar("money") or 0))
    draw.RoundedBox(0, getscl_x(250), getscl_y(130), getscl_x(200), getscll_y(25), Color(0,0,0,200))
    draw.DrawText(wallet, "HudSelectionText", getscl_x(350), getscl_y(125), Color(255,255,255,255), TEXT_ALIGN_CENTER)
    
    -- Job
    local job = DarkRP.getPhrase("job", LocalPlayer():getDarkRPVar("job") or "")
    draw.RoundedBox(0, getscl_x(15), getscl_y(100), getscl_x(200), getscll_y(25), team.GetColor(LocalPlayer():Team()))
    draw.DrawText(job, "HudSelectionText", getscl_x(115), getscl_y(95), Color(255,255,255,255), TEXT_ALIGN_CENTER)
    
    -- Salary
    local salary = (LocalPlayer():getDarkRPVar("salary") or 0)
    if (LocalPlayer():GetUserGroup() == "donator") then
        salary = math.ceil( salary * 1.5 )
    end

    local written_salary = DarkRP.getPhrase("salary", GAMEMODE.Config.currency, salary) or "Error"
    draw.RoundedBox(0, getscl_x(250), getscl_y(100), getscl_x(200), getscll_y(25), Color(0, 0, 0, 200))
    draw.DrawText(written_salary, "HudSelectionText", getscl_x(350), getscl_y(95), Color(255,255,255,255),TEXT_ALIGN_CENTER)
end)
