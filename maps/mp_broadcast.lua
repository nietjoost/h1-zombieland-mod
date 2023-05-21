-- [[ MAP: mp_broadcast (mp_broadcast) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(-2118, 2364, -68),
    vector:new(-120, -967, 184),
    vector:new(1133, 1437, -72),
    vector:new(346, 797, 136),
    vector:new(-239, 450, 136),
    vector:new(-2226, 1554, -51)
}

map.posTP = {
    vector:new(-2390, 2364, -58),
    vector:new(-2045, -87, 56),
    vector:new(1274, 1568, -84),
    vector:new(396, 652, -31),
    vector:new(-26, 1087, 136),
    vector:new(-1982, 1544, -53)
}

map.below_map_tp = vector:new(133, 1309, 136)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    AddZipLine(vector:new(-1541, 879, 144), vector:new(-1333, 2026, 107))
    AddZipLine(vector:new(-699, 2687, 109), vector:new(-1062, 3266, 146))
    AddZipLine(vector:new(-3486, 2510, -62), vector:new(-2916, 1209, 240))
    AddZipLine(vector:new(-345, 871, 136), vector:new(-1286, -708, 162))
    AddZipLine(vector:new(-1093, 4179, 10), vector:new(660, -1224, -31))

    -- Spawn boosters
    AddBooster(vector:new(-524, 2605, -40), 30)
    AddBooster(vector:new(-1463, 2047, -39), 30)
    AddBooster(vector:new(-2783, 949, -43), 40)

    -- Spawn shop
    SpawnShopKillStreak(vector:new(-2500, 995, 104), vector:new(0, 0, 0))
    SpawnShopWeapon(vector:new(-844, 871, 136), vector:new(0, 0, 0))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map