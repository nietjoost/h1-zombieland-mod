-- [[ MAP: mp_shipment (shipment) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(3524, -4789, -131),
    vector:new(6802, -7317, 494),
    vector:new(7844, -8307, 644),
    vector:new(10295, -5819, 89)
}

map.posTP = {
    vector:new(7767, -7335, 722),
    vector:new(7813, -7473, 722),
    vector:new(4249, -2947, 72),
    vector:new(6482, -4356, 44)
}

map.below_map_tp = vector:new(8754, -2810, 715)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn Zipline
    AddZipLine(vector:new(4484, -4717, 29), vector:new(3734, -3944, -7))
    AddZipLine(vector:new(5774, -707, 245), vector:new(5754, -1805, 168))
    AddZipLine(vector:new(6490, -4523, 42), vector:new(7243, -3783, 556))
    AddZipLine(vector:new(7833, -3357, 556), vector:new(8535, -3087, 644))
    AddZipLine(vector:new(8527, -2501, 644), vector:new(8090, -1814, 704))
    AddZipLine(vector:new(8967, -2726, 644), vector:new(9493, -2736, 644))
    AddZipLine(vector:new(7402, -1553, 704), vector:new(8059, 2871, 176))
    AddZipLine(vector:new(8963, -3078, 644), vector:new(10511, -6184, 644))
    AddZipLine(vector:new(7821, -7014, 722), vector:new(10408, -6910, 644))
    AddZipLine(vector:new(6399, -6761, 494), vector:new(4573, -2992, -110))
    AddZipLine(vector:new(6640, -6774, 494), vector:new(6660, -6060, 446))

    -- Spawn booster
    AddBooster(vector:new(6254, 494, 56), 20)

    -- Spawn shop
    SpawnShopKillStreak(vector:new(10078, -2705, 640), vector:new(0, 90, 0))

    -- Hint string
    SpawnHintString(vector:new(5854, -614, 245), "^1Dont fall of the wall!")
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    SpawnRamp(vector:new(5905, -195, 50), vector:new(5903, -244, 86))
    SpawnRamp(vector:new(6247, 1074, 41), vector:new(6221, 1065, 61))
    SpawnRamp(vector:new(5932, 757, 42), vector:new(5959, 764, 66))
    SpawnRamp(vector:new(7004, -6166, 283), vector:new(7035, -6215, 329))
    
    return true
end

return map