ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Heat Exchanger"
ENT.Author = "EliteTK"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.max_capacity = 6
ENT.max_damage = 100
ENT.lifetime = 400

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "price")
    self:NetworkVar("Entity", 0, "owning_ent")
end
