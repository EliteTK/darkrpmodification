ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "High Performance Printer"
ENT.Author = "Base: DRP Devs, Reworked: EliteTK"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.max_damage = 100
ENT.max_coolant = 100
ENT.lifetime = 800
ENT.gain = 5000

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "price")
    self:NetworkVar("Entity", 0, "owning_ent")
end
