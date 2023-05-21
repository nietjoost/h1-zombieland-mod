-- [[ MAP: mp_vacant (vacant) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(3113, 160, 336),
    vector:new(2918, 211, 176),
    vector:new(3233 ,186 ,176),
    vector:new(-3413, 245, 224),
    vector:new(-2512, 602, 752)
}

map.posTP = {
    vector:new(2811, 28, 176),
    vector:new(3228, 6, 345),
    vector:new(2749, 299, 346),
    vector:new(-2492, 372, 384),
    vector:new(-2517, -603, 752)
}

map.below_map_tp = vector:new(-1358, -664, 640)

-- [[ BUILD instant ]] --
function PreBuildMap()

    -- Spawn ziplines
    AddZipLine(vector:new(2722, -321, 336), vector:new(-1992, 193, 64))
    AddZipLine(vector:new(4003, -12, 212), vector:new(3253, 21, 496))
    AddZipLine(vector:new(-2289, -9, 860), vector:new(2821, 178, 496))
    AddZipLine(vector:new(-3132, 219, 416), vector:new(-2633, 112, 860))
    AddZipLine(vector:new(159, 3, 16), vector:new(2533, -1, 180))

    -- Spawn shop
    SpawnShopKillStreak(vector:new(-2601, -232, 858), vector:new(0, 0, 0))
    SpawnShopWeapon(vector:new(-577, -14, 176), vector:new(0, 0, 0))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map