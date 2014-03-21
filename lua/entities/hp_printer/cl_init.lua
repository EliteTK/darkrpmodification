include("shared.lua")

function ENT:Initialize()
end

function ENT:Draw()
    -- Draw the model.
    self:DrawModel()

    -- Orientation defining variables
    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    -- Fonts
    local font = "HUDNumber5"
    surface.SetFont(font)

    -- Owner
    local owner = self:Getowning_ent()

    -- Displayed attributes
    local attrib = {}
    attrib.money = self:GetNWInt("money", 0)
    attrib.mhealth = self:GetNWInt("cmaxhealth", 0)
    attrib.health = self:GetNWInt("health", 0)
    attrib.mcoolant = self.max_coolant
    attrib.coolant = self:GetNWInt("coolant", 0)

    -- Displayed text
    local text = {}
    text.owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")
    text.moneyStored = GAMEMODE.Config.currency..attrib.money
    text.name = self.PrintName

    -- Displayed text width
    local textWidth = {}
    textWidth.text = surface.GetTextSize(text.name)
    textWidth.owner  = surface.GetTextSize(text.owner)
    textWidth.moneyStored = surface.GetTextSize(text.moneyStored)

    -- Colours
    local color = {}
    color.boxBg = Color(0, 0, 0, 0)
    color.text = Color(255, 255, 255, 255)
    color.coolant = Color(0, 80, 170, 255)
    color.mcoolant = Color(0, 40, 85, 255)
    color.mhealth = Color(0, 60, 0, 255)

    -- Draw top of printer
    Ang:RotateAroundAxis(Ang:Up(), 90)
    cam.Start3D2D(Pos + Ang:Up() * 11.5, Ang, 0.11)
        draw.WordBox(0, -textWidth.text*0.5, -40, text.name, font, color.boxBg, color.text)
        draw.WordBox(0, -textWidth.owner*0.5, 8, text.owner, font, color.boxBg, color.text)
    cam.End3D2D()

    -- Draw front of printer
    Ang:RotateAroundAxis(Ang:Forward(), 90)
    cam.Start3D2D(Pos + Ang:Up() * 17, Ang, 0.11)
        -- Money stored
        draw.WordBox(0, -125, -86.5, text.moneyStored, font, color.boxBg, color.text)
        -- Coolant and health background
        draw.RoundedBox(0, -130, -60, 260, 55, Color(100, 100, 100, 200))
        -- Coolant maxbar and bar
        draw.RoundedBox(0, -125, -55, 250*math.max(attrib.mcoolant, 0)/self.max_coolant, 20, color.mcoolant)
        draw.RoundedBox(0, -125, -55, 250*math.max(attrib.coolant, 0)/self.max_coolant, 20, color.coolant)
        -- Health maxbar and bar
        draw.RoundedBox(0, -125, -30, 250*math.max(attrib.mhealth, 0)/self.max_damage, 20, color.mhealth)
        draw.RoundedBox(0, -125, -30, 250*math.max(attrib.health, 0)/self.max_damage, 20, Color(255 - 255*attrib.health/100, 255*attrib.health/100, 0, 200))
    cam.End3D2D()
end

function ENT:Think()
end
