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

    surface.SetFont(font)

    local color = {}

    cam.Start3D2D(Pos + Ang:Up() * 9.2, Ang, 0.11)
    cam.End3D2D()
end

function ENT:Think()
end
