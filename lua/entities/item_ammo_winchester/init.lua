AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()

    self:SetModel( "models/items/sniper_round_box.mdl" )
    self:PhysicsInit( SOLID_VPHYSICS )
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )

    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
    end
end

function ENT:Use( activator, caller )
    self:EmitSound( "items/ammo_pickup.wav", 100, 100 )
    self:Remove()
    activator:GiveAmmo(16, "AirboatGun", true)
end

function ENT:Think()
end
