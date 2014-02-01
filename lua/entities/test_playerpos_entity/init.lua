AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize ()
    self:SetModel( "models/props_lab/citizenradio.mdl" )

    self:PhysicsInit( SOLID_VPHYSICS )
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )

    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
    end
end

function ENT:Use( activator, caller )
    self:SetMoveType( MOVETYPE_NONE )
    self:SetSolid( SOLID_NONE )
    local pos = activator:GetPos()
    local angles = activator:GetAngles()
    local model = activator:GetModel()
    Msg(model.."\n")
    local aim_yaw = activator:GetPoseParameter( "aim_yaw" )
    Msg(aim_yaw.."\n")
    local aim_pitch = activator:GetPoseParameter( "aim_pitch" )
    Msg(aim_pitch.."\n")
    self:SetModel( model )
    self:SetAngles( angles )
    self:SetPos( pos )
    self:SetPoseParameter( "aim_yaw", aim_yaw )
    self:SetPoseParameter( "aim_pitch", aim_pitch )
    self:SetColor( Color( 0, 0, 255, 200 ) )
end

function ENT:Think()
end
