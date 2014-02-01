AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()

    self:SetModel( "models/props_interiors/BathTub01a.mdl" )
    self:PhysicsInit( SOLID_VPHYSICS )
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )

    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
    end
end

function ENT:Use( activator, caller )
    local pos = self:GetPos()
    self:Remove()
    if ( activator:IsAdmin() ) then
        if ( activator:Health() < 100 ) then
            activator:SetHealth( activator:Health() + 20 )
            if activator:Health() > 100 then
                activator:SetHealth( 100 )
            end
        else
            weaponboat = ents.Create("spawned_weapon")
            weaponboat:SetModel("models/props_interiors/BathTub01a.mdl")
            weaponboat:SetPos(pos)
            weaponboat:weaponclass = "test_entity"
            weaponboat:Spawn()
        end
    end
end

function ENT:Think()

end


