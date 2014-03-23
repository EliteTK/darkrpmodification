include("shared.lua")

function ENT:Initialize()
end

function ENT:Draw()
    -- Draw the model.
    self:DrawModel()

    -- Position and orientation.
    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    -- Fonts
    local font = "HUDNumber5"
    surface.SetFont(font)

    -- Owner
    local owner = self:Getowning_ent()

    -- Displayed attributes
    local attrib = {}
    attrib.mhealth = self:GetNWInt("cmaxhealth", 0)
    attrib.health = self:GetNWInt("health", 0)

    -- Displayed text
    local text = {}
    text.owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")
    text.name = self.PrintName

    -- Displayed text width
    local textWidth = {}
    textWidth.owner = surface.GetTextSize(text.owner)
    textWidth.name = surface.GetTextSize(text.name)

    -- Colours
    local color = {}
    color.boxBg = Color(0, 0, 0, 0)
    color.text = Color(255, 255, 255, 255)
    color.mhealth = Color(0, 60, 0, 255)
    color.background = Color(100, 100, 100, 200)

    Ang:RotateAroundAxis(Ang:Up(), -90)
    Ang:RotateAroundAxis(Ang:Forward(), -90)
    Ang:RotateAroundAxis(Ang:Up(), 180)
    cam.Start3D2D(Pos + Ang:Up() * 9.2, Ang, 0.11)
        -- Name and owner
        draw.WordBox(0, -textWidth.name/2, -36.5, text.name, font, color.boxBg, color.text)
        draw.WordBox(0, -textWidth.owner/2, -10, text.owner, font, color.boxBg, color.text)

        -- Background
        draw.RoundedBox(0, -130, 16.5, 260, 30, color.background)

        -- Health maxbar and bar
        draw.RoundedBox(0, -125, 21.5, 250*math.max(attrib.mhealth, 0)/self.max_damage, 20, color.mhealth)
        draw.RoundedBox(0, -125, 21.5, 250*math.max(attrib.health, 0)/self.max_damage, 20, Color(255 - 255*attrib.health/100, 255*attrib.health/100, 0, 255))
    cam.End3D2D()
end

function ENT:Think()
end
