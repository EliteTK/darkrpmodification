AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.SeizeReward = 500

local printMore
local useCoolant
local coolantDamage
function ENT:Initialize()
    self:SetModel("models/props_c17/consolebox01a.mdl")
    self:SetColor(Color(63, 127, 0, 255))

    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()

    self.sparking = false
    self.cmax_damage = self.max_damage
    self.damage = self.max_damage
    self.coolant = 100
    self.moneyStored = 0

    --[[
    PRINTER SPECIFIC CONSTANTS
    --]]

    --[[
    Name: amateur_printer
    Buy price: 1500
    Expected profit: 750
    Expected running time: 10 minutes
    Total money return: 2250
    --]]
    self.times = {}

    self.times.money = 5

    self.times.coolant = 10

    self.rates = { min = {}, max = {} }

    self.last_coolant = max_coolant

    self.rates.min.coolant = math.floor(self.max_coolant / (self.lifetime / self.times.coolant))
    self.rates.max.coolant = self.rates.min.coolant + 1

    self.rates.min.money = math.floor(self.gain / (self.lifetime / self.times.money)) - 1
    self.rates.max.money = self.rates.min.money + 3
    --END

    self:SetNWInt("coolant", self.coolant)
    self:SetNWInt("cmaxhealth", self.cmax_damage)
    self:SetNWInt("health", self.damage)
    self:SetNWInt("money", self.moneyStored)

    self.IsMoneyPrinter = true

    timer.Simple(self.times.money, function() printMore(self) end)
    timer.Simple(self.times.coolant, function() useCoolant(self) end)

    coolantDamage(self)

    self.sound = CreateSound(self, Sound("ambient/levels/labs/equipment_printer_loop1.wav"))
    self.sound:SetSoundLevel(52)
    self.sound:PlayEx(1, 100)
end


function ENT:OnTakeDamage(dmg)
    if self.burningup then return end

    self.damage = (self.damage or self.max_damage) - dmg:GetDamage()
    self.cmax_damage = (self.cmax_damage or self.max_damage) - dmg:GetDamage() * 0.3
    self:SetNWInt("health", self.damage)
    self:SetNWInt("cmaxhealth", self.cmax_damage)

    if self.damage <= 0 then
        local rnd = math.random(0, 4)
        if rnd == 0 then
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

function ENT:PrintMore()
    self.moneyStored = self.moneyStored + math.random(self.rates.min.money, self.rates.max.money)
    self:SetNWInt("money", self.moneyStored)
    timer.Simple(self.times.money, function() printMore(self) end)
end

printMore = function(ent)
    if not IsValid(ent) then return end
    ent:PrintMore()
end

function ENT:UseCoolant()
    local needed_coolant = math.random(self.rates.min.coolant, self.rates.max.coolant)
    local leaked_coolant = needed_coolant * (self.cmax_damage - self.damage) / self.cmax_damage

    for _, v in pairs(ents.FindInSphere(self:GetPos(), 70)) do
        if v.IsHeatExchanger then
            needed_coolant = needed_coolant - v:Exchange(needed_coolant)
        end
    end

    self.coolant = self.coolant - needed_coolant - leaked_coolant
    self:SetNWInt("coolant", self.coolant)
    timer.Simple(self.times.coolant, function() useCoolant(self) end)
end

useCoolant = function(ent)
    if not IsValid(ent) then return end
    ent:UseCoolant()
end

function ENT:CoolantDamage()
    if(self.coolant <= 0) then
        self:TakeDamage(5, self, self)
        if(self.last_coolant ~= self.coolant) then
            DarkRP.notify(self:Getowning_ent(), 0, 4, DarkRP.getPhrase("money_printer_overheating"))
        end
        self:SetNWInt("health", self.damage)
    end
    self.last_coolant = self.coolant
    timer.Simple(1, function() coolantDamage(self) end)
end

coolantDamage = function(ent)
    if not IsValid(ent) then return end
    ent:CoolantDamage()
end

function ENT:CreateMoneybag()
    if not IsValid(self) or self:IsOnFire() then return end

    local MoneyPos = self:GetPos()

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
end

function ENT:Use(activator, caller)
    if (activator:IsPlayer()) and self.moneyStored ~= 0 then
        local printValue = GAMEMODE.Config.currency..self.moneyStored
        DarkRP.notify(activator, 0, 4, "Collected "..printValue.." from printer.")
        activator:addMoney(self.moneyStored)
        self.moneyStored = 0
        self:SetNWInt("money", self.moneyStored)
    end
end

function ENT:OnRemove()
    if self.sound then
        self.sound:Stop()
    end
end
