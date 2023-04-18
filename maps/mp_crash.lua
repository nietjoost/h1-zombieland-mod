-- [[ MAP: mp_crash (crash) ]] --

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

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    SpawnFlag(map.posFlag[1])
    SpawnFlagOutside(map.posFlag[2])
    SpawnFlag(map.posFlag[3])
    SpawnFlag(map.posFlag[4])
    SpawnFlag(map.posFlag[5])

    SpawnContainer(vector:new(-2495, 423, 764))

    return true
end

return map