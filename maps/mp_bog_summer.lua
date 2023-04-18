-- [[ MAP: mp_bog_summer (bog summer) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = { 
    vector:new(6047, 1799, 9),
    vector:new(4455, 1369, 103),
    vector:new(6375, 1236, 49),
    vector:new(1413, -460, 258),
    vector:new(3432, -74, -25),
    vector:new(3728, -987, -12),
}

map.posTP = {
    vector:new(6408, 27, 49),
    vector:new(1127, 213, 258),
    vector:new(6080, 880, 20),
    vector:new(2115, 70, -25),
    vector:new(3613, -487, -30),
    vector:new(4092, 430, -5),
}

map.below_map_tp = vector:new(6047, 1799, 9)

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    SpawnFlag(map.posFlag[1])
    SpawnFlag(map.posFlag[2])
    SpawnFlagOutside(map.posFlag[3])
    SpawnFlagOutside(map.posFlag[4])
    SpawnFlag(map.posFlag[5])
    SpawnFlagOutside(map.posFlag[6])

    -- Outside spawn surviviors
    SpawnWall(vector:new(7094, 153, 55), vector:new(8679, 637, 115))
    SpawnRamp(vector:new(7168, 1132, 28), vector:new(7716, 1268, 396))
    SpawnRamp(vector:new(7954, 1338, 389), vector:new(8479, 1469, 627))
    SpawnRamp(vector:new(8618, 1706, 593), vector:new(8559, 1945, 816))
    SpawnRamp(vector:new(8736, 1086, 587), vector:new(8797, 852, 760))

    SpawnWall(vector:new(8270., 2268, 857), vector:new(8118, 2823, 931))
    SpawnWall(vector:new(8119, 2827, 915), vector:new(8658, 2968, 879))
    SpawnWall(vector:new(8918, 892, 739), vector:new(9057, 406, 796))


    -- Outside middle map
    SpawnWall(vector:new(3413, -845, -25), vector:new(3473, -909, 55))
    SpawnWall(vector:new(4169, -685, -39), vector:new(4392, -1532, 99))
    SpawnWall(vector:new(4392, -1532, 99), vector:new(3492, -932, -28))


    -- Outside spawn zombies
    SpawnWall(vector:new(850, -70, 229), vector:new(1106, 308, 351))
    SpawnWall(vector:new(1431, -122, 231), vector:new(1486, -604, 342))

    return true
end

return map