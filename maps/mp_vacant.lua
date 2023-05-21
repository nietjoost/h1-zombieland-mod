-- [[ MAP: mp_vacant (vacant) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(792, 69, -47)
}

map.posTP = {
    vector:new(53, -754, 134)
}

map.below_map_tp = vector:new(-646, 902, 52)

-- [[ BUILD instant ]] --
function PreBuildMap()

    -- Spawn ziplines
    AddZipLine(vector:new(108,640,208), vector:new(213,1662,49))
    AddZipLine(vector:new(527,652,208), vector:new(671,1082,-47))
    AddZipLine(vector:new(488,1542,37), vector:new(-601,-40, 208))
    AddZipLine(vector:new(408, -1042, 88), vector:new(37, -1316, -103))

    -- Spawn booster
    AddBooster(vector:new(296, 128, 134), 10)
    AddBooster(vector:new(-455, 143, 134), 10)
    AddBooster(vector:new(-1814, 1038, -63), 40)

    -- Spawn shop
    SpawnShopKillStreak(vector:new(1359, 973, 170), vector:new(0, 90, 0))
    SpawnShopWeapon(vector:new(-1424, 387, -102), vector:new(0, 0, 0))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map