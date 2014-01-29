Msg("Initialising Prop Lag Protection")
local entlist = {}

hook.Add( "OnEntityCreated", "Add entity to logger", function( entity )
    if entity:GetClass() == "prop_physics" then
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

timer.Create("Proplist check frozen", 5, 0, function()
    for k, v in pairs(entlist) do
    end
end

