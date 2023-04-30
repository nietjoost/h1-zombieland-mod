-- [[ MAP: mp_overgrown (overgrown) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(-693, -5336, 37),
    vector:new(-1646, -7106, -319),
    vector:new(271, -2457, -323)
}

map.posTP = {
    vector:new(-713, -5797, -171),
    vector:new(-1417, -5246, -176),
    vector:new(1289, -2319, 124)
}

map.below_map_tp = vector:new(29, 1260, 225)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    SpawnZipLineBothWays(vector:new(-714, -5150, 61), vector:new(-72, -3954, 48))
    SpawnZipLineBothWays(vector:new(1056, -2794, 88), vector:new(245, -3959, 48))
    SpawnZipLineBothWays(vector:new(1645, -1552, 29), vector:new(27, -496, -43))
    SpawnZipLineBothWays(vector:new(1252, 180, -321), vector:new(1677, -1362, 1))
    SpawnZipLineBothWays(vector:new(2630, -3384, -175), vector:new(1062, -2322, 124))
    SpawnZipLineBothWays(vector:new(15, -5194, -285), vector:new(-497, -5177, 11))

    -- Spawn shop
    SpawnShop(vector:new(-1329, -7191, -318), vector:new(0, 0, 0), "compass_objpoint_airstrike")
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map