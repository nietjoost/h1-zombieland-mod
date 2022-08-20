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
}

map.posTP = {
    vector:new(-500.314789, 15.684186, 120.624992),
    vector:new(-916.123535, 774.493408, 208.125000),
    vector:new(1346.589233, -1292.576050, 148.488281),
    vector:new(2726.339600, -108.899338, -71.8750001),
    vector:new(2623.897705, 2043.433472, 139.381348),
    vector:new(3070.167969, 688.228760, -61.058201),
}

function building_map()
    SpawnFlag(map.posFlag[1])
    SpawnFlagOutside(map.posFlag[2])
    SpawnFlag(map.posFlag[3])
    SpawnFlagOutside(map.posFlag[4])
    SpawnFlag(map.posFlag[5])
    SpawnFlagOutside(map.posFlag[6])

    -- Build floors, walls, ramps
    SpawnFloor(vector:new(3681.417480, 166.995605, -13.023321), vector:new(4013.967773, 77.922676, -13.023321))
    SpawnRamp(vector:new(4039.050537, 166.442917, 21.638805), vector:new(4377.038086, 25.364325, 172.498444))

    SpawnFloor(vector:new(4713.721191, -430.383453, 48.543587), vector:new(5069.961914, -2221.173340, 23.923626))


    return true
end

return map