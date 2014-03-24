ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Nuclear Printer"
ENT.Author = "Base: DRP Devs, Reworked: EliteTK"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.max_damage = 100
ENT.max_coolant = 100
ENT.lifetime = 300
ENT.gain = 7500

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "price")
    self:NetworkVar("Entity", 0, "owning_ent")
end
