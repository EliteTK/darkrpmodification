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
    attrib.max_capacity = 100
    attrib.capacity = 100

    surface.SetFont(font)

    local color = {}
    color.capacity = Color(50,50,50,200)

end

function ENT:Think()
end
