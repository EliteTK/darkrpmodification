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

local colors = {}
colors.black = Color(0, 0, 0, 255)
colors.blue = Color(0, 0, 255, 255)
colors.brightred = Color(200, 30, 30, 255)
colors.darkred = Color(0, 0, 70, 100)
colors.darkblack = Color(0, 0, 0, 200)
colors.gray1 = Color(0, 0, 0, 155)
colors.gray2 = Color(51, 58, 51,100)
colors.red = Color(255, 0, 0, 255)
colors.white = Color(255, 255, 255, 255)
colors.white1 = Color(255, 255, 255, 200)

local function DrawPlayerInfo(ply)
    local pos = ply:EyePos()

    pos.z = pos.z + 10 -- The position we want is a bit above the position of the eyes
    pos = pos:ToScreen()
    pos.y = pos.y - 50 -- Move the text up a few pixels to compensate for the height of the text

    if GAMEMODE.Config.showname and not ply:getDarkRPVar("wanted") then
        draw.DrawNonParsedText(ply:Nick(), "DarkRPHUD2", pos.x + 1, pos.y + 1, colors.black, 1)
        draw.DrawNonParsedText(ply:Nick(), "DarkRPHUD2", pos.x, pos.y, team.GetColor(ply:Team()), 1)
    end

    if GAMEMODE.Config.showhealth and not ply:getDarkRPVar("wanted") then
        draw.DrawNonParsedText(DarkRP.getPhrase("health", ply:Health()), "DarkRPHUD2", pos.x + 1, pos.y + 21, colors.black, 1)
        draw.DrawNonParsedText(DarkRP.getPhrase("health", ply:Health()), "DarkRPHUD2", pos.x, pos.y + 20, colors.white1, 1)
    end

    if GAMEMODE.Config.showjob then
        local teamname = team.GetName(ply:Team())
        draw.DrawNonParsedText(ply:getDarkRPVar("job") or teamname, "DarkRPHUD2", pos.x + 1, pos.y + 41, colors.black, 1)
        draw.DrawNonParsedText(ply:getDarkRPVar("job") or teamname, "DarkRPHUD2", pos.x, pos.y + 40, colors.white1, 1)
    end

    if ply:getDarkRPVar("HasGunlicense") then
        surface.SetMaterial(Page)
        surface.SetDrawColor(255,255,255,255)
        surface.DrawTexturedRect(pos.x-16, pos.y + 60, 32, 32)
    end
end

local function DrawWantedInfo(ply)
    if not ply:Alive() then return end

    local pos = ply:EyePos()
    if not pos:isInSight({LocalPlayer(), ply}) then return end

    pos.z = pos.z + 14
    pos = pos:ToScreen()

    if GAMEMODE.Config.showname then
        draw.DrawNonParsedText(ply:Nick(), "DarkRPHUD2", pos.x + 1, pos.y + 1, colors.black, 1)
        draw.DrawNonParsedText(ply:Nick(), "DarkRPHUD2", pos.x, pos.y, team.GetColor(ply:Team()), 1)
    end

    local wantedText = DarkRP.getPhrase("wanted", tostring(ply:getDarkRPVar("wantedReason")))

    draw.DrawNonParsedText(wantedText, "DarkRPHUD2", pos.x, pos.y - 40, colors.white1, 1)
    draw.DrawNonParsedText(wantedText, "DarkRPHUD2", pos.x + 1, pos.y - 41, colors.red, 1)
end

local function DrawEntityDisplay()

    local shootPos = LocalPlayer():GetShootPos()
    local aimVec = LocalPlayer():GetAimVector()

    for k, ply in pairs(players or player.GetAll()) do
        if not ply:Alive() or ply == LocalPlayer() or ply:GetMaterial() == "models/effects/vol_light001" then continue end
        local hisPos = ply:GetShootPos()
        if ply:getDarkRPVar("wanted") then DrawWantedInfo(ply) end

        if GAMEMODE.Config.globalshow then
            DrawPlayerInfo(ply)
            -- Draw when you're (almost) looking at him
        elseif not GAMEMODE.Config.globalshow and hisPos:DistToSqr(shootPos) < 160000 then
            local pos = hisPos - shootPos
            local unitPos = pos:GetNormalized()
            -- Yay! Dot product!
            if unitPos:Dot(aimVec) > 0.95 then
                local trace = util.QuickTrace(shootPos, pos, LocalPlayer())
                if trace.Hit and trace.Entity ~= ply then return end
                DrawPlayerInfo(ply)
            end
        end
    end

    local tr = LocalPlayer():GetEyeTrace()

    if IsValid(tr.Entity) and tr.Entity:isKeysOwnable() and tr.Entity:GetPos():Distance(LocalPlayer():GetPos()) < 200 then
        tr.Entity:drawOwnableInfo()
    end
end



local function getscl_x(x, exp_screen_w)
    return x / (exp_screen_w or 1680) * ScrW()
end

local function getscll_y(y, exp_screen_h)
    return y / (exp_screen_h or 1050) * ScrH()
end

local function getscl_y(y, exp_screen_h)
    return ScrH() - getscll_y(y, exp_screen_h or 1050)
end

local alpha = 200;


local function DrawHUD()
    -- Background
    draw.RoundedBox(0, getscl_x(10), getscl_y(135), getscl_x(450), getscll_y(125), Color(0, 0, 0, alpha))

    --[[
    BARS
    --]]

    -- Health
    draw.RoundedBox(0, getscl_x(15), getscl_y(70), getscl_x(440), getscll_y(25), Color(0,0,0, alpha))
    local health = LocalPlayer():Health()
    local bar_health = math.min(math.max(health, 0), 100) / GAMEMODE.Config.startinghealth
    draw.RoundedBox(0, getscl_x(17), getscl_y(68), getscl_x(436)*bar_health, getscll_y(21), Color(255-255*bar_health,255*bar_health,0,alpha))
    draw.DrawText("Health: " .. math.max(health, 0), "HudSelectionText", getscl_x(230), getscl_y(65), Color(255,255,255,alpha), TEXT_ALIGN_CENTER )

    -- Armor
    draw.RoundedBox(0, getscl_x(15), getscl_y(40), getscl_x(440), getscll_y(25), Color(0,0,0,200))
    local armor = LocalPlayer():Armor()
    local bar_armor = math.min(math.max(armor, 0), 100) / 100
    draw.RoundedBox(0, getscl_x(17), getscl_y(38), getscl_x(436)*bar_armor, getscll_y(21), Color(0,130,255,alpha))
    draw.DrawText("Armor: " .. math.max(armor, 0), "HudSelectionText", getscl_x(230), getscl_y(35), Color(255,255,255,alpha), TEXT_ALIGN_CENTER)

    --[[
    BOXES
    --]]

    -- Name
    draw.RoundedBox(0, getscl_x(15), getscl_y(130), getscl_x(215), getscll_y(25), Color(0, 0, 0, alpha))
    draw.DrawText(LocalPlayer():Nick(), "HudSelectionText", getscl_x(123), getscl_y(125), Color(255,255,255,alpha), TEXT_ALIGN_CENTER)

    -- Wallet
    local wallet = DarkRP.getPhrase("wallet", GAMEMODE.Config.currency, (LocalPlayer():getDarkRPVar("money") or 0))
    draw.RoundedBox(0, getscl_x(240), getscl_y(130), getscl_x(215), getscll_y(25), Color(0,0,0,alpha))
    draw.DrawText(wallet, "HudSelectionText", getscl_x(347), getscl_y(125), Color(255,255,255,alpha), TEXT_ALIGN_CENTER)

    -- Job
    local job = DarkRP.getPhrase("job", LocalPlayer():getDarkRPVar("job") or "")
    draw.RoundedBox(0, getscl_x(15), getscl_y(100), getscl_x(215), getscll_y(25), team.GetColor(LocalPlayer():Team()))
    draw.DrawText(job, "HudSelectionText", getscl_x(123), getscl_y(95), Color(255,255,255,alpha), TEXT_ALIGN_CENTER)

    -- Salary
    local salary = (LocalPlayer():getDarkRPVar("salary") or 0)
    if (LocalPlayer():GetUserGroup() == "donator") then
        salary = math.ceil( salary * 1.5 )
    end

    local written_salary = DarkRP.getPhrase("salary", GAMEMODE.Config.currency, salary) or "Error"
    draw.RoundedBox(0, getscl_x(240), getscl_y(100), getscl_x(215), getscll_y(25), Color(0, 0, 0, 200))
    draw.DrawText(written_salary, "HudSelectionText", getscl_x(347), getscl_y(95), Color(255,255,255,255),TEXT_ALIGN_CENTER)
end

function GAMEMODE:HUDPaint()
        DrawHUD()
        --DrawEntityDisplay()
end
