-- [[ MAP: mp_crash_snow (crash winter) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = { 
    vector:new(637, 523, 137),
    vector:new(-2498, 1361, 692),
    vector:new(1629, -1185, 65),
    vector:new(-910, 1312, 245),
    vector:new(338, -594, 272),
}

map.posTP = {
    vector:new(-2612, -196, 846),
    vector:new(941, -1015, 345),
    vector:new(-711, 2267, 243),
    vector:new(1243, -1944, 64),
    vector:new(334, -564, 408),
}

map.below_map_tp = vector:new(-711, 2267, 243)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    AddZipLine(vector:new(-560, 1485, 412), vector:new(-2777, 2499, 860))
    AddZipLine(vector:new(-2665, 4644, 808), vector:new(-2185, 4632, 806))
    AddZipLine(vector:new(-1656, 4300, 806), vector:new(-859, 3850, 818))
    AddZipLine(vector:new(-2584, 6089, 714), vector:new(-2178, 4803, 806))
    AddZipLine(vector:new(-2848, 3575, 810), vector:new(-2844, 3191, 860))
    AddZipLine(vector:new(-179, 3514, 736), vector:new(1502, 715, 580))

    -- Spawn shop
    SpawnShop(vector:new(-2595, 6734, 714), vector:new(0, 180, 0))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    SpawnFlag(map.posFlag[1])
    SpawnFlagOutside(map.posFlag[2])
    SpawnFlag(map.posFlag[3])
    SpawnFlag(map.posFlag[4])
    SpawnFlag(map.posFlag[5])

    return true
end

return map