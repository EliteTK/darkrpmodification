include("shared.lua")

function ENT:Initialize()
end

function ENT:Draw()
    self:DrawModel()

    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    local font = "HUDNumber5"

    local text = {}

    local attrib = {}
    attrib.capacity = self:GetNWInt("capacity")

    surface.SetFont(font)

    local color = {}
    color.capacity = Color(50,50,0,200)

    Ang:RotateAroundAxis(Ang:Up(), -90)
    Ang:RotateAroundAxis(Ang:Forward(), -90)
    Ang:RotateAroundAxis(Ang:Up(), 180)
    cam.Start3D2D(Pos + Ang:Up() * 9.2, Ang, 0.11)
        draw.WordBox(0, -165, -160, "Basic Heat Exchanger", font, Color(0,0,0,0), Color(255, 255, 255, 255))
        draw.RoundedBox(0, -165, -120, 250*math.max(attrib.capacity, 0)/self.max_capacity, 20, color.capacity)
    cam.End3D2D()
end

function ENT:Think()
end
