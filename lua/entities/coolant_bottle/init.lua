AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_junk/garbage_milkcarton001a.mdl")

    local Ang = self:GetAngles()

    local Pos = self:GetPos()

    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()

    self.CoolantBottle = true
end

function ENT:Touch(ent)
    if(IsValid(self) and not self.used and IsValid(ent) and ent.IsMoneyPrinter) then
        self.used = true
        self:Remove()
        ent.coolant = math.min(ent.max_coolant, ent.coolant + self.restore_amount)
        ent:SetNWInt("coolant", ent.coolant)
    end
end

function ENT:Think()
end
