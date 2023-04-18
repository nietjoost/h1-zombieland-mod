-- [[ MAP: mp_pipeline (pipeline) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = { 
    vector:new(-1150, -769, 264),
    vector:new(2424, -1078, 312),
    vector:new(-295, -2406, 291),
    vector:new(167, -7647, 308),
    vector:new(1910, 744, 229),
}

map.posTP = {
    vector:new(-134, -1128, 308),
    vector:new(1323, 42, 208),
    vector:new(-18, -2414, 298),
    vector:new(-105, 963, 208),
    vector:new(1717, 574, 508),
}

map.below_map_tp = vector:new(-1150, -769, 264)

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    SpawnFlag(map.posFlag[1])
    SpawnFlagOutside(map.posFlag[2])
    SpawnFlag(map.posFlag[3])
    SpawnFlagOutside(map.posFlag[4])
    SpawnFlag(map.posFlag[5])
    

    -- Inside map
    SpawnRamp(vector:new(-8, 2116, 388), vector:new(-15, 2560, 328))
    SpawnRamp(vector:new(340, 2571, 328), vector:new(844, 1780, 604))
    SpawnRamp(vector:new(1885, 2370, 376), vector:new(1170, 2875, 320))

    return true
end

return map