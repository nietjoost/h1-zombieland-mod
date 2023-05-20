-- [[ MAP: mp_farm (Downpour) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(325, 1060, 385),
    vector:new(2480, 1628, 214),
    vector:new(4560, 2373, 325),
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
    AddZipLine(vector:new(2927, -1480, 547), vector:new(1412, -1193, 132))
    AddZipLine(vector:new(3098, 2396, 269), vector:new(4234, 2402, 761))
    AddZipLine(vector:new(4829, 2354, 761), vector:new(1485, 1885, 590))
    AddZipLine(vector:new(-110, -733, 292), vector:new(798, 2699, 369))

    -- Spawn boosters
    AddBooster(vector:new(2859, -1850, 240), 10)

    -- Spawn shop
    SpawnShop(vector:new(4247, 2200, 431), vector:new(0, 0, 0))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map