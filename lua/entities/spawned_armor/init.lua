AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')
include('ent_utilities/spawnedenttools.lua')

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
    if (activator:Armor() < 100) then
        self:EmitSound("items/battery_pickup.wav", 100, 100)
        self:Remove()
        activator:SetArmor(activator:Armor() + 15)
        if activator:Armor() > 100 then
            activator:SetArmor( 100 )
        end
    else
        converttospawned_weapon(self, "spawned_armor")
    end
end

function ENT:Think()
end
