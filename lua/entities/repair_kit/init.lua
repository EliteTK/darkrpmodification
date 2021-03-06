AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_lab/reciever01d.mdl")

    local Ang = self:GetAngles()

    local Pos = self:GetPos()

    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()

    self.used = false

    self.RepairKit = true
end

function ENT:Touch(ent)
    if(IsValid(self) and not self.used and IsValid(ent) and (ent.IsMoneyPrinter or ent.IsHeatExchanger)) then
        self.used = true
        self:Remove()
        ent.damage = math.min(ent.cmax_damage, ent.damage + self.restore_amount)
        ent:SetNWInt("health", ent.damage)
    end
end

function ENT:Think()
end
