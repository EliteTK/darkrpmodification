ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Heat Exchanger"
ENT.Author = "EliteTK"
ENT.Spawnable = false
ENT.AdminSpawnable = false

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "price")
	self:NetworkVar("Entity", 0, "owning_ent")
end
