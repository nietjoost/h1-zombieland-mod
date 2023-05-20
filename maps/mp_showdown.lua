-- [[ MAP: mp_showdown (showdown) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
}

map.posTP = {
}

map.below_map_tp = vector:new(29, 1260, 225)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    AddZipLine(vector:new(163, 83, 0), vector:new(617, 27, 406))
    AddZipLine(vector:new(-148, 78, 0), vector:new(-621, 90, 406))
    AddZipLine(vector:new(6, 1872, -1), vector:new(-15, 1121, 374))
    AddZipLine(vector:new(11, -1859, 16), vector:new(4, -1147, 368))
    AddZipLine(vector:new(-2771, 1240, 1326), vector:new(-384, 796, 374))
    AddZipLine(vector:new(-3790, -49, 1389), vector:new(-4027, 1841, 1301))
    AddZipLine(vector:new(535, -2132, 832), vector:new(-3862, -523, 1389))
    AddZipLine(vector:new(1008, -1608, 832), vector:new(2335, -814, 445))
    AddZipLine(vector:new(2410, 324, 449), vector:new(186, 798, 374))
    AddZipLine(vector:new(2410, 2031, 279), vector:new(-789, 861, 11))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    
    -- Spawn booster
    AddBooster(vector:new(2307, -801, 280), 10)
    AddBooster(vector:new(2413, -694, 280), 10)
    AddBooster(vector:new(2410, 216, 280), 10)
    AddBooster(vector:new(2409, 1093, 280), 10)

    -- Spawn shop
    SpawnShop(vector:new(-4380, -222, 1400), vector:new(0, -90, 0))

    return true
end

return map