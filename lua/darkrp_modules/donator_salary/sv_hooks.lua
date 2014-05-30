include('sets.lua')
Msg("Enabling donator salary increase.\n")

local groups = Set {"donator", "trusted donator", "regular donator", "moderator donator", "admin donator", "superadmin"}

hook.Add( "playerGetSalary", "Donator Salary", function ( ply, amount )
    if groups[ply:GetUserGroup()] then
        new_amount = math.ceil(amount * 1.5)
        return false, "Donator payday! You received £"..new_amount.."!", new_amount
    end
end )
