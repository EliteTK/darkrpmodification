/*---------------------------------------------------------------------------
/*---------------------------------------------------------------------------
DarkRP custom vehicles
---------------------------------------------------------------------------

This file contains your custom vehicles.
This file should also contain vehicles from DarkRP that you edited.

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:Vehicles


Add vehicles under the following line:
---------------------------------------------------------------------------*/
DarkRP.createVehicle({
        name = "Abrams",
        model = "models/tiggomods/tanks/m1a1/body.mdl",
        price = 3500000,
        allowed = {TEAM_CAR_DEALER},
        label = "M1 Abrams",
})

DarkRP.createVehicle({
        name = "Yamahayfz350",
        model = "models/tiggogm/vehicles/yamahayfz450.mdl",
        price = 2500,
        allowed = {TEAM_CAR_DEALER},
        label = "Yamahay FZ350",
})


DarkRP.createVehicle({
        name = "Taxi",
        model = "models/taxi1.mdl",
        price = 500,
        allowed = {TEAM_TAXI},
        label = "Taxi",
})
