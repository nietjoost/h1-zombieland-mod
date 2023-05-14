-- [[ MAP: mp_strike (strike) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(-1616, -2211, 208),
    vector:new(-267, -2333, 221)
}

map.posTP = {
    vector:new(-2284, -2180, 208),
    vector:new(-428, -2331, 218)
}

map.below_map_tp = vector:new(-646, 902, 52)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    AddZipLine(vector:new(-2600, -2180, 208), vector:new(-2711, -3347, 521))
    AddZipLine(vector:new(-2716, -3669, 521), vector:new(-1685, -3680, 524))
    AddZipLine(vector:new(-679, -3327, 544), vector:new(-494, -2585, 220))
    AddZipLine(vector:new(-848, -3546, 544), vector:new(-656, 686, 52))
    AddZipLine(vector:new(333, 612, 268), vector:new(-354, 1264, 223))
    AddZipLine(vector:new(-907, 1265, 223), vector:new(-38, 792, 432))
    AddZipLine(vector:new(780, -166, 408), vector:new(261, 374, 432))
    AddZipLine(vector:new(774, -647, 408), vector:new(742, -1181, 384))
    AddZipLine(vector:new(1366, -1576, 384), vector:new(1978, -1855, 108))

    -- Spawn booster
    SpawnBoost(vector:new(429, 561, 16), 30)
    SpawnBoost(vector:new(-980, 1878, 24), 30)

    -- Spawn shop
    SpawnShop(vector:new(895, -392, 404), vector:new(0, 90, 0), "compass_objpoint_airstrike")
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    return true
end

return map