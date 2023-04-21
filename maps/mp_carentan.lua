-- [[ MAP: mp_carentan (ChinaTown) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(666, 1429, -39),
    vector:new(1770, 1949, 136),
    vector:new(4246, 1654, -37)
}

map.posTP = {
    vector:new(821, 1636, 127),
    vector:new(2634, 1546, -37),
    vector:new(335, -997, 137)
}

map.below_map_tp = vector:new(133, 1309, 136)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    SpawnZipLineBothWays(vector:new(-304, 436, 130), vector:new(-219, 779, 122))
    SpawnZipLineBothWays(vector:new(-101, 783, 122), vector:new(-607, 1680, 149))
    SpawnZipLineBothWays(vector:new(-237, 1931, 154), vector:new(695, 3120, 157))

    -- Spawn boosters
    SpawnBoost(vector:new(-662, 409, 7), 30)
    SpawnBoost(vector:new(726, 3637, -23), 30)
    SpawnBoost(vector:new(-382, 1984, -23), 30)

    -- Spawn shop
    --SpawnShop(vector:new(-2500, 995, 104), vector:new(0, 0, 0), "compass_objpoint_airstrike")
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    -- Spawn ramp
    SpawnRamp(vector:new(844, 1675, 124), vector:new(955, 1981, 104))

    -- Spawn floor
    SpawnFloor(vector:new(955, 1981, 104), vector:new(1803, 1893, 104))
    SpawnFloor(vector:new(2572, 1277, -70), vector:new(4282, 1718, -70))

    -- Spawn wall
    SpawnWall(vector:new(2854, 1684, -70), vector:new(2854, 1553, 10))
    SpawnWall(vector:new(3454, 1684, -70), vector:new(3454, 1553, 10))
    SpawnWall(vector:new(4054, 1684, -70), vector:new(4054, 1553, 10))

    SpawnWall(vector:new(3154, 1553, -70), vector:new(3154, 1277, 10))

    return true
end

return map