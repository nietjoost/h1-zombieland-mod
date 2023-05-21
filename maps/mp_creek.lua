-- [[ MAP: mp_countdown (mp_countdown) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = {
    vector:new(-1007, 5694, 340),
    vector:new(-2591, 4865, 617),
    vector:new(-2143, 7986, 200)
}

map.posTP = {
    vector:new(-1348, 5544, 449),
    vector:new(-2920, 6880, 590),
    vector:new(-1925, 8100, 204)
}

map.below_map_tp = vector:new(-608, 5725, 328)

-- [[ BUILD instant ]] --
function PreBuildMap()
    -- Spawn ziplines
    AddZipLine(vector:new(-436, 5112, 316), vector:new(375, 5079, 233))
    AddZipLine(vector:new(457, 4287, 307), vector:new(577, 4851, 233))
    AddZipLine(vector:new(-2554, 7537, 235), vector:new(-182, 6045, 288))
    AddZipLine(vector:new(-1630, 5764, 287), vector:new(-826, 7478, 38))
    AddZipLine(vector:new(-1174, 8032, 188), vector:new(575, 3957, 136))

    -- Spawn boosters
    AddBooster(vector:new(-2759, 7235, 167), 30)
    AddBooster(vector:new(-2165, 6070, -120), 30)

    -- Spawn shop
    SpawnShopKillStreak(vector:new(-1611, 7999, 195), vector:new(0, 0, 0))
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    for flagCount = 1, #map.posFlag do
        SpawnFlag(map.posFlag[flagCount])
    end

    -- Spawn ramp
    SpawnRamp(vector:new(-250, 3620, 51), vector:new(-249, 3663, 75))
    SpawnHintString(vector:new(-58, 3989, 307), "^6Heyy look!! ^5There is a bounce down there!")
    
    -- Spawn floor
    SpawnFloor(vector:new(-221, 3269, 218), vector:new(-1047, 3473, 303))

    return true
end

return map