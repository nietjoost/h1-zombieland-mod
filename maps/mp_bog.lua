-- [[ MAP: mp_bog (bog) ]] --


map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}


map.posFlag = { 
    vector:new(6047.105957, 1799.957764, 9.609579),
    vector:new(4455.023926, 1369.031738, 103.615898),
    vector:new(6375.125000, 1236.076904, 49.125000),
    vector:new(1528.849243, -535.244507, 258.125000),
    vector:new(3432.508301, -74.840248, -25.954500),
    vector:new(3728.712158, -987.368530, -12.692110),
}


map.posTP = {
    vector:new(6408.397461, 27.427656, 49.125000),
    vector:new(853.135803, -216.277695, 458.125000),
    vector:new(6080.000000, 880.000000, 20.271774),
    vector:new(2115.813721, 70.457253, -25.017788),
    vector:new(3613.763916, -487.735199, -30.083664),
    vector:new(4092.301025, 430.048920, -5.968887),
}


function BuildMap()
    SpawnFlag(map.posFlag[1])
    SpawnFlag(map.posFlag[2])
    SpawnFlagOutside(map.posFlag[3])
    SpawnFlagOutside(map.posFlag[4])
    SpawnFlag(map.posFlag[5])
    SpawnFlagOutside(map.posFlag[6])

    --SpawnRamp(vector:new(), vector:new())

    return true
end

return map