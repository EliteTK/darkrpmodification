AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("")

    local Ang = self:GetAngles()

    local Pos = self:GetPos()

    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()

    self.CoolantBottle = true
end

function ENT:Touch(hitEnt)
    if(IsValid(hitEnt) and hitEnt.IsMoneyPrinter) then
        hitEnt.coolant = math.min(hitEnt.max_coolant, hitEnt.coolant + 20)
        self:Remove()
    end
end

function ENT:Think()
end
