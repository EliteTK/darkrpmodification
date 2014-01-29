AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()

    self:SetModel( "models/healthvial.mdl" )
    self:PhysicsInit( SOLID_VPHYSICS )
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )

    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
    end
end

function ENT:Use( activator, caller )
    if ((activator:Health() + 10) <= 100) then
        self:EmitSound("items/smallmedkit1.wav", 100, 100)
        self:Remove()
        activator:SetHealth(activator:Health() + 10)
    end
end

function ENT:Think()
end
