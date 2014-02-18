Msg("Enabling donator salary increase.\n")

hook.Add( "playerGetSalary", "Donator Salary", function ( ply, amount )
    if ( ply:GetUserGroup() == "donator" ) then
        new_amount = math.ceil(amount * 1.5)
        return false, "Donator payday! You received £"..new_amount.."!", new_amount
    end
end )
