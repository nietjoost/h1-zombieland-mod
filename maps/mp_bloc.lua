-- [[ MAP: mp_bloc (bloc) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = { 
    vector:new(1171, -5824, -23),
    vector:new(-511, -5230, 832),
    vector:new(-670, -4847, 832),
    vector:new(-170, -3865, 1),
    vector:new(2150, -4580, 5)
}

map.posTP = {
    vector:new(-518, -6016, 1406),
    vector:new(-95, -5961.4174804688, 1296),
    vector:new(-434, -4756, 1296),
    vector:new(-170, -3597, 30),
    vector:new(2245, -4811, 15)
}

map.below_map_tp = vector:new(1022, -5821, -23)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- ZipLines
    AddZipLine(vector:new(-238, -2936, 229), vector:new(-422, -4128, 1296))
    AddZipLine(vector:new(-818, -4867, 1296), vector:new(-827, -5443, 1296))
    AddZipLine(vector:new(2385, -6318, 1296), vector:new(-1336, -6271, 1320))
    AddZipLine(vector:new(3007, -6006, 1296), vector:new(3022, -5046, 2))
    AddZipLine(vector:new(3854, -7108, 832), vector:new(3037, -6247, 1296))

    -- Boosters
    AddBooster(vector:new(850, -5138, 47), 30)

    -- Spawn bounce
    SpawnRamp(vector:new(1986, -6516, 832), vector:new(1986, -6546, 879))

    -- Spawn ramp
    SpawnRamp(vector:new(2440, -5794, 1272), vector:new(2436, -5943, 1377))

    -- Shop
    SpawnShopKillStreak(vector:new(2376.87109375, -5685.9477539062, 1296.1248779297), vector:new(0, -90, 0))

    -- Hint string
    SpawnHintString(vector:new(2380, -6009, 1406), "^6Heyy look!! ^5There is a bounce down there!")
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map