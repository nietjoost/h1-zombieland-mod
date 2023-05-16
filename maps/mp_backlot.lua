-- [[ MAP: mp_backlot (backlot) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = { 
    vector:new(2002.8039550781, 4557.2568359375, 67.75611114502)
}

map.posTP = {
    vector:new(-1241.615234375, -6.5057735443115, 258.125)
}


map.below_map_tp = vector:new(706, -573, 376)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- ZipLines
    AddZipLine(vector:new(431, -1074, 200), vector:new(408, -397, 452))
    AddZipLine(vector:new(593, -295, 396.125), vector:new(1515, 1025, 196))
    AddZipLine(vector:new(-64, 1012, 181), vector:new(-124, 3024, 57))
    AddZipLine(vector:new(1683, -71, 248), vector:new(1651, -1034, 207))

    -- Boosters
    AddBooster(vector:new(39, -837, 164), 20)
    AddBooster(vector:new(-258, -1156, 136), 20)
    AddBooster(vector:new(1094, 204, 154), 20)
    AddBooster(vector:new(752, 622, 160), 20)
    AddBooster(vector:new(1073, -1709, 72), 10)

    -- Shop
    SpawnShop(vector:new(1289, -1383, 174), vector:new(0, -90, 0), "compass_objpoint_airstrike")
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    -- Spawn flags
    for flagCount = 1, #map.posFlag do
        SpawnFlagOutside(map.posFlag[flagCount])
    end

    return true
end

return map