AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()

    self:SetModel( "models/Items/battery.mdl" )
    self:PhysicsInit( SOLID_VPHYSICS )
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )

    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
    end
end

function ENT:Use( activator, caller )
    if (activator:Armor() <= 90) then
        self:EmitSound("items/battery_pickup.wav", 100, 100)
        self:Remove()
        activator:SetArmor(activator:Armor() + 15)
    end
end

function ENT:Think()
end
