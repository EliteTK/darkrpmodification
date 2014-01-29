Msg("Initialising Prop Lag Protection\n")
local entlist = {}

hook.Add( "OnEntityCreated", "Add entity to logger", function( entity )
    if entity:GetClass() == "prop_physics" then
        entity:AddCallback("PhysicsUpdate", Msg("Physics updated\n"))
        entlist[entity:GetCreationID()] = entity
        Msg("Added "..entity:GetCreationID().." to PLP list\n")
    end
end )

hook.Add( "EntityRemoved", "Remove entity from logger", function( entity )
    if entity:GetClass() == "prop_physics" then
        entlist[entity:GetCreationID()] = nil
        Msg("Removed "..entity:GetCreationID().." from PLP list\n")
    end
end )

Msg("Starting proplist check frozen timer\n")
timer.Create("Proplist check frozen", 5, 0, function()
    for k, v in pairs(entlist) do
    end
end )

