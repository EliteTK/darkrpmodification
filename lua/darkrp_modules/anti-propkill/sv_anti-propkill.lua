local blockedDamage = {
    "gmod_button",
    "wire_textscreen",
    "prop_physics",
}

local conditionalDamage = {
    "worldspawn",
}

local blockConditional = true

local function damageIsBlocked( damage, attacker )
    for _, v in pairs(blockedDamage) do
        if attacker:GetClass() == v then
            return true
        end
    end
    return false
end

local function damageIsConditional( damage, attacker )
    for _, v in pairs(conditionalDamage) do
        if attacker:GetClass() == v then
            return true
        end
    end
    return false
end

local function markTime()
    blockConditinal = true
    timer.Create( "Unblock Conditional", 1, 1, function()
        blockConditional = false
    end )
end

hook.Add( "PlayerShouldTakeDamage", "propdamage remover", function( ply, attacker )
        if ( not attacker:IsPlayer() and ply:IsValid() ) then
            local damage = attacker:GetClass()
            local blocked = damageIsBlocked( damage, attacker )
            local conditional = damageIsConditional( damage, attacker )

            if ( blocked ) then -- Stop blocked damage and mark the time.
                markTime()
                Msg("Stopped blocked damage\n")
                return false
            end

            if ( conditional and blockConditional) then
                markTime()
                Msg("Stopped conditional damage\n")
                return false
            end
            Msg("Letting conditional damage from "..damage.." pass\n")
        end
    end
)
