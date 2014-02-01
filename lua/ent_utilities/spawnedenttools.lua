function converttospawned_weapon (ent, class)
    local pos = ent:GetPos()
    local angles = ent:GetAngles()
    local model = ent:GetModel()
    ent:Remove()
    local weapon = ents.Create( "spawned_weapon" )
    weapon.weaponclass = class
    weapon:SetModel( model )
    weapon.ShareGravgun = true
    weapon:SetPos( pos )
    weapon:SetAngles( angles )
    weapon.noDupe = true
    weapon:Spawn()
end
