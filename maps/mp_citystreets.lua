-- [[ MAP: mp_citystreets (District) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(5523, -2312, -7),
    vector:new(6108, -1427, -7),
    vector:new(6341, 1203, -9),
    vector:new(-1613, 3195, 657),
    vector:new(2855, 1020, -9)
}

map.posTP = {
    vector:new(5515, -2559, -7),
    vector:new(6311, -1424, -7),
    vector:new(6107, 1203, -9),
    vector:new(2418, 987, 1),
    vector:new(2875, 1206, -6)
}

map.below_map_tp = vector:new(4029, 368, 0)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    AddZipLine(vector:new(6797, -581, 101), vector:new(5225, -2893, 132))
    AddZipLine(vector:new(5197, -1939, 138), vector:new(5093, 67, 132))
    AddZipLine(vector:new(5674, 2853, 896), vector:new(5620, 1155, -10))
    AddZipLine(vector:new(3905, 2852, 896), vector:new(3615, 2906, 608))
    AddZipLine(vector:new(2680, 1615, -7), vector:new(2663, 2727, 744))
    AddZipLine(vector:new(-961, 3212, 657), vector:new(3881, 3469, 896))
    AddZipLine(vector:new(3393, 2867, 640), vector:new(3208, 2877, 744))

    -- Spawn boosters
    AddBooster(vector:new(5366, -2845, -0), 30)

    -- Spawn shop
    SpawnShop(vector:new(-1441, 3739, 657), vector:new(0, 180, 0))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map