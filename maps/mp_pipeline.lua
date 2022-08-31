-- [[ MAP: mp_pipeline (pipeline) ]] --

map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}


map.posFlag = { 
    vector:new(-1150.5849609375, -769.71325683594, 264.125),
    vector:new(2424.7666015625, -1078.2702636719, 312.125),
    vector:new(-295.85870361328, -2406.166015625, 291.85726928711),
    vector:new(167.12132263184, -7647.7919921875, 308.01254272461),
    vector:new(1910.4875488281, 744.96331787109, 229.05364990234),
}


map.posTP = {
    vector:new(-134.75375366211, -1128.6174316406, 308.125),
    vector:new(1323.9715576172, 42.444797515869, 208.125),
    vector:new(-18.725130081177, -2414.4047851562, 298.92739868164),
    vector:new(-105.53605651855, 963.40466308594, 208.125),
    vector:new(1717.1632080078, 574.18603515625, 508.125),
}


function BuildMap()
    SpawnFlag(map.posFlag[1])
    SpawnFlagOutside(map.posFlag[2])
    SpawnFlag(map.posFlag[3])
    SpawnFlagOutside(map.posFlag[4])
    SpawnFlag(map.posFlag[5])
    

    -- Inside map
    SpawnRamp(vector:new(-8.3172559738159, 2116.259765625, 388.08679199219), vector:new(-15.719974517822, 2560.4626464844, 328.125))
    SpawnRamp(vector:new(340.15560913086, 2571.1745605469, 328.125), vector:new(844.01635742188, 1780.0241699219, 604.125))
    SpawnRamp(vector:new(1885.3758544922, 2370.7497558594, 376.625), vector:new(1170.5861816406, 2875.990234375, 320.125))

    --SpawnRamp(vector:new(), vector:new())
    --SpawnWall(vector:new(), vector:new())

    return true
end

return map