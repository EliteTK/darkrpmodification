AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local refill
function ENT:Initialize()
    self:SetModel("models/props/cs_assault/ACUnit02.mdl")

    local Ang = self:GetAngles()
    Ang:RotateAroundAxis(Ang:Right(), 90)
    self:SetAngles(Ang)

    local Pos = self:GetPos()
    self:SetPos(Pos + Ang:Up() * 9.4)

    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:SetMass( 100 )
    phys:Wake()

    self.damage = 100
    self.capacity = self.max_capacity
    self.recharge = 0.45

    self:SetNWInt("capacity", self.capacity)
    self:SetNWInt("health", self.damage)

    self.IsHeatExchanger = true

    timer.Simple(1, function() refill(self) end)

    self.sound = CreateSound(self, Sound("ambient/engine_idle.wav"))
    self.sound:SetSoundLevel(65)
    self.sound:PlayEx(1, 100)
end

function ENT:Refill()
    self.capacity = math.min((self.capacity + self.recharge), self.max_capacity)
    self:SetNWInt("capacity", self.capacity)
    timer.Simple(1, function() refill(self) end)
end

refill = function(ent)
    if not IsValid(ent) then return end
    ent:Refill()
end

function ENT:Exchange(needed_coolant)
    local returned_coolant = math.min(needed_coolant, self.capacity)
    self.capacity = self.capacity - returned_coolant
    self:SetNWInt("capacity", self.capacity)
    return returned_coolant
end

function ENT:OnTakeDamage(dmg)
    self.damage = (self.damage or 100) - dmg:GetDamage()
    self:SetNWInt("health", self.damage)
    if self.damage <= 0 then
        self:Destruct()
        self:Remove()
    end
end

function ENT:Destruct()
    local position = self:GetPos()
    local effectdata = EffectData()
    effectdata:SetStart(position)
    effectdata:SetOrigin(position)
    effectdata:SetScale(1)
    util.Effect("Explosion", effectdata)
end

function ENT:Think()
end

function ENT:OnRemove()
    if self.sound then
        self.sound:Stop()
    end
end
