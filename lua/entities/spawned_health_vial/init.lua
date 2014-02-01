AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')
include('ent_utilities/spawnedenttools.lua')

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
    if (activator:Health() < 100) then
        self:EmitSound("items/smallmedkit1.wav", 100, 100)
        self:Remove()
        activator:SetHealth(activator:Health() + 10)
        if activator:Health() > 100 then
            activator:SetHealth(100)
        end
    else
        converttospawned_weapon(self, "spawned_health_vial")
    end
end

function ENT:Think()
end
