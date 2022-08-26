-- [[ MAP: mp_convoy (ambush) ]] --


map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}


map.posFlag = { 
    vector:new(-830.119629, 551.153137, -63.875000),
    vector:new(-1229.588989, -28.928801, -63.982937),
    vector:new(1713.984619, -390.780853, 95.513596),
    vector:new(4325.545410, -100.696678, 80.354881),
    vector:new(2665.022217, 1624.129028, -32.315208),
    vector:new(3561.949951, 1093.143799, -29.651239),
    vector:new(-529.46710205078, 2084.4191894531, -30.592947006226),
    vector:new(1074.4831542969, 3384.8962402344, 300.125),
    vector:new(4086.1618652344, -2681.8918457031, 11.481952667236),
}


map.posTP = {
    vector:new(-500.314789, 15.684186, 120.624992),
    vector:new(-916.123535, 774.493408, 208.125000),
    vector:new(1346.589233, -1292.576050, 148.488281),
    vector:new(2726.339600, -108.899338, -71.8750001),
    vector:new(2623.897705, 2043.433472, 139.381348),
    vector:new(3070.167969, 688.228760, -61.058201),
    vector:new(-800.86120605469, 3669.6052246094, 330.125),
    vector:new(73.641242980957, 1789.8579101562, 0.12499721348286),
    vector:new(2159.3522949219, -705.77673339844, -30.02409362793),
}


function BuildMap()
    SpawnFlag(map.posFlag[1])
    SpawnFlagOutside(map.posFlag[2])
    SpawnFlag(map.posFlag[3])
    SpawnFlagOutside(map.posFlag[4])
    SpawnFlag(map.posFlag[5])
    SpawnFlagOutside(map.posFlag[6])
    SpawnFlag(map.posFlag[7])
    SpawnFlagOutside(map.posFlag[8])
    SpawnFlagOutside(map.posFlag[9])

    -- Build floors, walls, ramps
    SpawnRamp(vector:new(3539.2229003906, 1002.2791748047, -67.781471252441), vector:new(3518.296875, 767.496948, 119.720406))
    SpawnRamp(vector:new(3709.9174804688, -93.110313415527, -86.733894348145), vector:new(4354.3090820312, 5.1272673606873, 157.36614990234))
    SpawnRamp(vector:new(3848.1984863281, -545.5595703125, 97.869041442871), vector:new(3963.9970703125, -1935.6704101562, 26.425003051758))
    SpawnRamp(vector:new(2736.9704589844, 1841.6318359375, 104.13723754883), vector:new(2935.5773925781, 1822.5744628906, 213.47261047363))
    SpawnRamp(vector:new(2935.5773925781, 1822.5744628906, 213.47261047363), vector:new(3339.2470703125, 1595.0382080078, 200.75140380859))
    SpawnRamp(vector:new(-1006.7158203125, 3746.3376464844, 285.35192871094), vector:new(-1455.0720214844, 3747.2778320312, 175.18600463867))
    SpawnRamp(vector:new(-569.20709228516, 3377.7810058594, 300.89599609375), vector:new(706.11474609375, 3211.3701171875, 268.89715576172))
    SpawnRamp(vector:new(4371.5595703125, -295.46563720703, 128.125), vector:new(5030.9799804688, -2249.2687988281, 89.344131469727))
    SpawnRamp(vector:new(1414.0847167969, -1607.8477783203, 184.125), vector:new(1568.6131591797, -2769.7565917969, 24.124998092651))
    SpawnRamp(vector:new(1979.1345214844, -3205.0375976562, 24.125001907349), vector:new(4080.8178710938, -2682.39453125, 11.39066696167))
    SpawnRamp(vector:new(-1710.9956054688, 491.92831420898, 91.125), vector:new(-2097.8913574219, 539.2138671875, 73.486640930176))

    SpawnWall(vector:new(700.83636474609, 2988.380859375, 302.125), vector:new(1110.5294189453, 2982.2824707031, 384.20626831055))

    return true
end

return map