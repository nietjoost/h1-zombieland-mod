-- [[ MAP: mp_convoy (ambush) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = { 
    vector:new(-830, 551, -63),
    vector:new(-1229, -28, -63),
    vector:new(1713, -390, 95),
    vector:new(4325, -100, 80),
    vector:new(2665, 1624, -32),
    vector:new(3561, 1093, -29),
    vector:new(-529, 2084, -30),
    vector:new(1074, 3384, 300),
    vector:new(4086, -2681, 11),
}

map.posTP = {
    vector:new(-500, 15, 120),
    vector:new(-916, 774, 208),
    vector:new(1346, -1292, 148),
    vector:new(2726, -108, -71),
    vector:new(2623, 2043, 139),
    vector:new(3070, 688, -61),
    vector:new(-800, 3669, 330),
    vector:new(73, 1789, 0),
    vector:new(2159, -705, -30),
}

map.below_map_tp = vector:new(-830, 551, -63)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn shop
    SpawnShopKillStreak(vector:new(1285, -1577, 153), vector:new(0, 0, 0))
    SpawnShopWeapon(vector:new(16, 256, 0), vector:new(0, 0, 0))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    SpawnFlag(map.posFlag[1])
    SpawnFlagOutside(map.posFlag[2])
    SpawnFlag(map.posFlag[3])
    SpawnFlagOutside(map.posFlag[4])
    SpawnFlag(map.posFlag[5])
    SpawnFlagOutside(map.posFlag[6])
    SpawnFlag(map.posFlag[7])
    SpawnFlagOutside(map.posFlag[8])
    SpawnFlagOutside(map.posFlag[9])

    -- Build floors, walls, ramps
    SpawnRamp(vector:new(3539, 1002, -67), vector:new(3518, 767, 119))
    SpawnRamp(vector:new(3709, -93, -86), vector:new(4354, 5, 157))
    SpawnRamp(vector:new(3848, -545, 97), vector:new(3963, -1935, 26))
    SpawnRamp(vector:new(2736, 1841, 104), vector:new(2935, 1822, 213))
    SpawnRamp(vector:new(2935, 1822, 213), vector:new(3339, 1595, 200))
    SpawnRamp(vector:new(-1006, 3746, 285), vector:new(-1455, 3747, 175))
    SpawnRamp(vector:new(-569, 3377, 300), vector:new(706, 3211, 268))
    SpawnRamp(vector:new(4371, -295, 128), vector:new(5030, -2249, 89))
    SpawnRamp(vector:new(1414, -1607, 184), vector:new(1568, -2769, 24))
    SpawnRamp(vector:new(1979, -3205, 24), vector:new(4080, -2682, 11))
    SpawnRamp(vector:new(-1710, 491, 91), vector:new(-2097, 539, 73))

    SpawnWall(vector:new(700, 2988, 302), vector:new(1110, 2982, 384))

    return true
end

return map