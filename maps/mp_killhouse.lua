-- [[ MAP: mp_killhouse (killhouse) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(1371, -1171, 102)
}

map.posTP = {
    vector:new(625, 1442, 260)
}

map.below_map_tp = vector:new(29, 1260, 225)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    AddZipLine(vector:new(678, 558, 156), vector:new(437, -802, 167))
    AddZipLine(vector:new(-3306, 340, 186), vector:new(276, -1149, 179))
    AddZipLine(vector:new(-3656, 335, 186), vector:new(-3933, -853, 117))
    AddZipLine(vector:new(-4207, -852, 115), vector:new(738, 2268, 156))

    -- Spawn shop
    SpawnShopKillStreak(vector:new(1709, -1068, 105), vector:new(0, 90, 0))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map