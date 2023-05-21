-- [[ MAP: mp_countdown (mp_countdown) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(1928,501,-7),
    vector:new(-544,2833,-23),
    vector:new(1516,1640,-23),
    vector:new(2522, 2456, 116),
    vector:new(717, -1782, 40),
    vector:new(-1038, 3458, 0)
}

map.posTP = {
    vector:new(-214,2470,145),
    vector:new(442, 2841, 241),
    vector:new(2087, 1712, 309),
    vector:new(2087, 1712, 309),
    vector:new(980, 3868, 241),
    vector:new(-77, 2396, 142)
}

map.below_map_tp = vector:new(133, 1309, 136)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    AddZipLine(vector:new(-523, 1812, 111), vector:new(431, 2839, 241));
    AddZipLine(vector:new(-729, 3511, 312), vector:new(260,2976,227));
    AddZipLine(vector:new(747,3024,224), vector:new(738,3822,246));
    AddZipLine(vector:new(2200,2127,309), vector:new(1107,2740,229));
    AddZipLine(vector:new(1717, 3225, 241), vector:new(1106, 5202, 241));

    -- Spawn boosters
    AddBooster(vector:new(2478, 2210, -17), 40)
    AddBooster(vector:new(-542, 3827, 0), 40)

    -- Spawn shop
    SpawnShopKillStreak(vector:new(2294, 4366, 72), vector:new(0, 0, 0))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    AddZipLine(vector:new(1163,3964,254), vector:new(2140,3383,254));
    AddZipLine(vector:new(2611, 2412, 128), vector:new(3513, 3651, 192))
    AddZipLine(vector:new(1598, 5076, 71), vector:new(799, 5705, 241))

    return true
end

return map