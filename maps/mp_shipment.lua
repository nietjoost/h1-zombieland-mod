-- [[ MAP: mp_shipment (shipment) ]] --

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

map.below_map_tp = vector:new(706, -573, 376)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    AddZipLine(vector:new(-507, 551, 192), vector:new(172, 220, 408))
    AddZipLine(vector:new(1366, 870, 195), vector:new(598, 615, 253))
    AddZipLine(vector:new(2334, 907, 192), vector:new(1554, 556, 390))
    AddZipLine(vector:new(2425, 4231, 240), vector:new(384, 6553, 192))
    AddZipLine(vector:new(-692, 109, 299), vector:new(-1218, 250, 322))
    AddZipLine(vector:new(-1534, 619, 339), vector:new(-1970, 1845, 192))
    AddZipLine(vector:new(-1525, 2830, 192), vector:new(4829, 2555, 240))
    AddZipLine(vector:new(0, -528, 299), vector:new(-628, -2217, 1515))

    -- Spawn boost
    AddBooster(vector:new(-363, -102, 192), 20)
    AddBooster(vector:new(348, 233, 192), 20)

    -- Spawn shop
    SpawnShopKillStreak(vector:new(2658, -4698, 1515), vector:new(0, 0, 0))
    SpawnShopWeapon(vector:new(-8, 73, 192), vector:new(0, 0, 0))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    
    -- Spawn ziplines
    AddZipLine(vector:new(1592, -2667, 1515), vector:new(1574, -595, 416))
    AddZipLine(vector:new(28, -2925, 1515), vector:new(626, -3114, 1515))
    AddZipLine(vector:new(2876, -4142, 1515), vector:new(2205, -3819, 1515))

    return true
end

return map