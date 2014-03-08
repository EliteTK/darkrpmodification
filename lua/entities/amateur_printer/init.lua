AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.SeizeReward = 500

local PrintMore
function ENT:Initialize()
	self:SetModel("models/props_c17/consolebox01a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	phys:Wake()

	self.sparking = false
	self.damage = 100
    self.coolant = 100
    self.moneyStored = 0

    --Printer Specific Variables
    --Name: amateur_printer
    --Buy price: 1500
    --Expected profit: 750
    --Expected running time: 10 minutes
    --Total money return: 2250
    self.times = { min = {}, max = {} }

    self.times.min.money = 4
    self.times.max.money = 6

    self.times.min.coolant = 9
    self.times.max.coolant = 11

    self.rates = { min = {}, max = {} }

    self.rates.min.coolant = 1.333333
    self.rates.max.coolant = 2

    self.rates.min.money = 17
    self.rates.max.money = 20
    --END

    self:SetNWInt("coolant", self.coolant)
    self:SetNWInt("health", self.damage)
    self:SetNWInt("money", self.moneyStored)

	self.IsMoneyPrinter = true

    timer.Simple(math.random(self.times.min.money, self.times.max.money), function() printMore(self) end)
    timer.Simple(math.random(self.times.min.coolant, self.times.max.coolant), function() useCoolant(self) end)
    coolantDamage(self)

	self.sound = CreateSound(self, Sound("ambient/levels/labs/equipment_printer_loop1.wav"))
	self.sound:SetSoundLevel(52)
	self.sound:PlayEx(1, 100)
end

function ENT:OnTakeDamage(dmg)
	if self.burningup then return end

	self.damage = (self.damage or 100) - dmg:GetDamage()
    self:SetNWInt("health", self.damage)
	if self.damage <= 0 then
		local rnd = math.random(1, 10)
		if rnd < 3 then
			self:BurstIntoFlames()
		else
			self:Destruct()
			self:Remove()
		end
	end
end

function ENT:Destruct()
    self:CreateMoneybag()
	local vPoint = self:GetPos()
	local effectdata = EffectData()
	effectdata:SetStart(vPoint)
	effectdata:SetOrigin(vPoint)
	effectdata:SetScale(1)
	util.Effect("Explosion", effectdata)
	DarkRP.notify(self:Getowning_ent(), 1, 4, DarkRP.getPhrase("money_printer_exploded"))
end

function ENT:BurstIntoFlames()
	DarkRP.notify(self:Getowning_ent(), 0, 4, DarkRP.getPhrase("money_printer_overheating"))
	self.burningup = true
	local burntime = math.random(8, 18)
	self:Ignite(burntime, 0)
	timer.Simple(burntime, function() self:Fireball() end)
end

function ENT:Fireball()
	if not self:IsOnFire() then self.burningup = false return end
	local dist = math.random(20, 280) -- Explosion radius
	self:Destruct()
	for k, v in pairs(ents.FindInSphere(self:GetPos(), dist)) do
		if not v:IsPlayer() and not v:IsWeapon() and v:GetClass() ~= "predicted_viewmodel" and not v.IsMoneyPrinter then
			v:Ignite(math.random(5, 22), 0)
		elseif v:IsPlayer() then
			local distance = v:GetPos():Distance(self:GetPos())
			v:TakeDamage(distance / dist * 100, self, self)
		end
	end
	self:Remove()
end

function printMore(ent)
	if(not IsValid(ent)) then return end
    ent.moneyStored = ent.moneyStored + math.random(ent.rates.min.money, ent.rates.max.money)
    ent:SetNWInt("money", ent.moneyStored)
    timer.Simple(math.random(ent.times.min.money, ent.times.max.money), function() printMore(ent) end)
end

function useCoolant(ent)
    if(not IsValid(ent)) then return end
    ent.coolant = ent.coolant - math.random(ent.rates.min.coolant, ent.rates.max.coolant)
    ent:SetNWInt("coolant", ent.coolant)
    timer.Simple(math.random(ent.times.min.coolant, ent.times.max.coolant), function() useCoolant(ent) end)
end

function coolantDamage(ent)
    if(not IsValid(ent)) then return end
    if(ent.coolant <= 0) then ent:TakeDamage(5, self, self) end
    timer.Simple(1, function() coolantDamage(ent) end)
end

function ENT:CreateMoneybag()
    if not IsValid(self) or self:IsOnFire() then return end

    local MoneyPos = self:GetPos()
    local angles = self:GetAngles()

    DarkRP.createMoneyBag(MoneyPos, self.moneyStored * 0.2)
    self.moneyStored = 0
    self:SetNWInt("money", self.moneyStored)
end

function ENT:Think()

	if self:WaterLevel() > 0 then
		self:Destruct()
		self:Remove()
		return
	end

	if not self.sparking then return end

	local effectdata = EffectData()
	effectdata:SetOrigin(self:GetPos())
	effectdata:SetMagnitude(1)
	effectdata:SetScale(1)
	effectdata:SetRadius(2)
	util.Effect("Sparks", effectdata)
end

function ENT:Use( activator, caller )
    if (activator:IsPlayer()) then
        activator:addMoney(self.moneyStored)
        self.moneyStored = 0
        self:SetNWInt("money", self.moneyStored)
    end
    Msg("Caller: "..caller:GetClass().."\n")
end

function ENT:OnRemove()
	if self.sound then
		self.sound:Stop()
	end
end
