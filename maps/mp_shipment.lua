-- [[ MAP: mp_shipment (shipment) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = { 
}

map.posTP = {
}

map.below_map_tp = vector:new(706, -573, 376)

-- [[ BUILD instant ]] --
function PreBuildMap()
    SpawnShop(vector:new(-701, -616, 190), vector:new(0, 0, 0), "compass_objpoint_airstrike")
    SpawnZipLineBothWays(vector:new(-507, 551, 192), vector:new(172, 220, 408))
    SpawnBoost(vector:new(-363, -102, 192), 20)
    SpawnBoost(vector:new(348, 233, 192), 20)
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    
    return true
end

return map