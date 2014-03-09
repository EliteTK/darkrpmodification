AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props/cs_assault/ACUnit02.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
    phys:SetMass( 100 )
	phys:Wake()

	self.damage = 100
    self.max_capacity = 100
    self.capacity = 100

    self:SetNWInt("capacity", self.capacity)
    self:SetNWInt("health", self.damage)

	self.IsHeatExchanger = true

	self.sound = CreateSound(self, Sound("ambient/engine_idle.wav"))
	self.sound:SetSoundLevel(52)
	self.sound:PlayEx(1, 100)
end

function ENT:Exchange(needed_coolant)
    return needed_coolant
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
