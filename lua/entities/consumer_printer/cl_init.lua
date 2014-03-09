include("shared.lua")

function ENT:Initialize()
end

function ENT:Draw()
    self:DrawModel()

    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    local font = "HUDNumber5"

    local owner = self:Getowning_ent()
    local text = {}
    text.owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")

    local attrib = {}
    attrib.money = self:GetNWInt("money", 0)
    attrib.health = self:GetNWInt("health", 0)
    attrib.coolant = self:GetNWInt("coolant", 0)

    text.moneyStored = "£"..attrib.money

    surface.SetFont(font)
    text.name = DarkRP.getPhrase("money_printer")
    local textWidth = {}
    textWidth.text = surface.GetTextSize(text.name)
    textWidth.owner  = surface.GetTextSize(text.owner)
    textWidth.moneyStored = surface.GetTextSize(text.moneyStored)

    Ang:RotateAroundAxis(Ang:Up(), 90)

    local color = {}
    color.boxBg = Color(0, 0, 0, 0)
    color.text = Color(255, 255, 255, 255)

    cam.Start3D2D(Pos + Ang:Up() * 11.5, Ang, 0.11)
        draw.WordBox(0, -textWidth.text*0.5, -40, text.name, font, color.boxBg, color.text)
        draw.WordBox(0, -textWidth.owner*0.5, 8, text.owner, font, color.boxBg, color.text)
    cam.End3D2D()

    Ang:RotateAroundAxis(Ang:Forward(), 90)

    cam.Start3D2D(Pos - Ang:Up() * -17, Ang, 0.11)
        draw.WordBox(0, -125, -86.5, text.moneyStored, font, color.boxBg, color.text)
        draw.RoundedBox(0, -130, -60, 260, 55, Color(100, 100, 100, 200))
        draw.RoundedBox(0, -125, -55, 250*math.max(attrib.coolant, 0)/100, 20, Color(0, 80, 170, 200))
        draw.RoundedBox(0, -125, -30, 250*math.max(attrib.health, 0)/100, 20, Color(255 - 255*attrib.health/100, 255*attrib.health/100, 0, 200))
    cam.End3D2D()
end

function ENT:Think()
end
