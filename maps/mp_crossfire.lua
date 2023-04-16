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
    SpawnZipLineBothWays(vector:new(5179, -1013, 160), vector:new(4667, -1805, 307))
    SpawnZipLineBothWays(vector:new(4484, -4717, 29), vector:new(3734, -3944, -7))

    SpawnBoost(vector:new(3497, -1083, 9), 40)
    SpawnBoost(vector:new(4626, -3662, -142), 90)
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map