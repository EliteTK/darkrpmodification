ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Novice Money Printer"
ENT.Author = "DarkRP Developers and Mark.Annable"
ENT.Spawnable = false
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
self:NetworkVar("Int", 0, "price")
self:NetworkVar("Entity", 0, "owning_ent")
end
