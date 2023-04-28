-- [[ MAP: mp_farm_spring (Daybreak) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(325, 1060, 385),
    vector:new(2480, 1628, 214),
    vector:new(4567, 1901, 317),
    vector:new(5, 3924, 218),
    vector:new(-1063, -1237, 156)
}

map.posTP = {
    vector:new(983, 921, 528),
    vector:new(3517, 1666, 275),
    vector:new(327, 1538, 376),
    vector:new(327, 1538, 376),
    vector:new(327, 1538, 376)
}

map.below_map_tp = vector:new(29, 1260, 225)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    SpawnZipLineBothWays(vector:new(2927, -1480, 547), vector:new(1412, -1193, 132))
    SpawnZipLineBothWays(vector:new(3098, 2396, 269), vector:new(4183, 2330, 573))
    SpawnZipLineBothWays(vector:new(4660, 2263, 609), vector:new(1485, 1885, 590))
    SpawnZipLineBothWays(vector:new(-110, -733, 292), vector:new(798, 2699, 369))

    -- Spawn boosters
    SpawnBoost(vector:new(2859, -1850, 250), 10)

    -- Spawn shop
    SpawnShop(vector:new(4454, 2093, 325), vector:new(0, 170, 0), "compass_objpoint_airstrike")
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map