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

-- [[ BUILD instant ]] --
function PreBuildMap()

    -- Spawn zipline
    AddZipLine(vector:new(-1378, -3186, 374), vector:new(149, -3007, 576))
    AddZipLine(vector:new(358, -4673, 650), vector:new(444, -3314, 576))
    AddZipLine(vector:new(1157, -13, 208), vector:new(181, -1487, 544))
    AddZipLine(vector:new(2029, 3511, 123), vector:new(1164, 3326, 320))
    AddZipLine(vector:new(-814, 2038, 450), vector:new(-827, 3142, 0))
    AddZipLine(vector:new(236, 1205, -119), vector:new(-475, 876, 584))
    AddZipLine(vector:new(964, -5317, 753), vector:new(422, -7643, 308))
    AddZipLine(vector:new(316, 2906, 328), vector:new(847, 3330, 320))

    -- Spawn booster
    AddBooster(vector:new(797, -3076, 308), 10)
    AddBooster(vector:new(844, 494, 291), 15)

    -- Spawn shop
    SpawnShop(vector:new(-1360, 1022, 408), vector:new(0, -90, 0))
end

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