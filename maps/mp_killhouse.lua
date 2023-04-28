-- [[ MAP: mp_killhouse (killhouse) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(1371, -1171, 102)
}

map.posTP = {
    vector:new(625, 1442, 260)
}

map.below_map_tp = vector:new(29, 1260, 225)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    SpawnZipLineBothWays(vector:new(678, 558, 156), vector:new(437, -802, 167))
    SpawnZipLineBothWays(vector:new(-3306, 340, 186), vector:new(276, -1149, 179))
    SpawnZipLineBothWays(vector:new(-3656, 335, 186), vector:new(-3933, -853, 117))
    SpawnZipLineBothWays(vector:new(-4207, -852, 115), vector:new(738, 2268, 156))

    -- Spawn boosters
    --SpawnBoost(vector:new(2859, -1850, 240), 10)

    -- Spawn shop
    SpawnShop(vector:new(1709, -1068, 105), vector:new(0, 90, 0), "compass_objpoint_airstrike")
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map