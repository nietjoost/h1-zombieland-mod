-- [[ MAP: mp_bog_summer (bog summer) ]] --


map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}


map.posFlag = { 
    vector:new(6047.105957, 1799.957764, 9.609579),
    vector:new(4455.023926, 1369.031738, 103.615898),
    vector:new(6375.125000, 1236.076904, 49.125000),
    vector:new(1413.2668457031, -460.60473632812, 258.125),
    vector:new(3432.508301, -74.840248, -25.954500),
    vector:new(3728.712158, -987.368530, -12.692110),
}


map.posTP = {
    vector:new(6408.397461, 27.427656, 49.125000),
    vector:new(1127.0115966797, 213.80505371094, 258.125),
    vector:new(6080.000000, 880.000000, 20.271774),
    vector:new(2115.813721, 70.457253, -25.017788),
    vector:new(3613.763916, -487.735199, -30.083664),
    vector:new(4092.301025, 430.048920, -5.968887),
}


map.below_map_y = -36.00
map.below_map_tp = vector:new(6047.105957, 1799.957764, 9.609579)


function BuildMap()
    SpawnFlag(map.posFlag[1])
    SpawnFlag(map.posFlag[2])
    SpawnFlagOutside(map.posFlag[3])
    SpawnFlagOutside(map.posFlag[4])
    SpawnFlag(map.posFlag[5])
    SpawnFlagOutside(map.posFlag[6])

    -- Outside spawn surviviors
    SpawnWall(vector:new(7094.3388671875, 153.40759277344, 55.968902587891), vector:new(8679.173828125, 637.71801757812, 115.8570022583))
    SpawnRamp(vector:new(7168.6953125, 1132.4294433594, 28.978841781616), vector:new(7716.138671875, 1268.8138427734, 396.03131103516))
    SpawnRamp(vector:new(7954.6088867188, 1338.1723632812, 389.98806762695), vector:new(8479.1083984375, 1469.9633789062, 627.86029052734))
    SpawnRamp(vector:new(8618.9951171875, 1706.5588378906, 593.04711914062), vector:new(8559.716796875, 1945.7591552734, 816.02069091797))
    SpawnRamp(vector:new(8736.783203125, 1086.3225097656, 587.52142333984), vector:new(8797.28125, 852.5634765625, 760.70831298828))

    SpawnWall(vector:new(8270.701171875, 2268.2482910156, 857.90466308594), vector:new(8118.7602539062, 2823.6127929688, 931.13146972656))
    SpawnWall(vector:new(8119.0864257812, 2827.6062011719, 915.00646972656), vector:new(8658.30859375, 2968.1762695312, 879.54876708984))
    SpawnWall(vector:new(8918.587890625, 892.03039550781, 739.79547119141), vector:new(9057.6640625, 406.27127075195, 796.96319580078))


    -- Outside middle map
    SpawnWall(vector:new(3413.2922363281, -845.32153320312, -25.440746307373), vector:new(3473.4858398438, -909.98797607422, 55.245471954346))
    SpawnWall(vector:new(4169.796875, -685.10382080078, -39.058525085449), vector:new(4392.5434570312, -1532.2570800781, 99.830459594727))
    SpawnWall(vector:new(4392.5434570312, -1532.2570800781, 99.830459594727), vector:new(3492.7185058594, -932.92358398438, -28.353410720825))


    -- Outside spawn zombies
    SpawnWall(vector:new(850.50183105469, -70.194854736328, 229.18910217285), vector:new(1106.3599853516, 308.11898803711, 351.11944580078))
    SpawnWall(vector:new(1431.8264160156, -122.9588394165, 231.77133178711), vector:new(1486.0388183594, -604.21826171875, 342.69573974609))

    return true
end

return map