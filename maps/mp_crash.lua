-- [[ MAP: mp_crash (crash) ]] --


map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}


map.posFlag = { 
    vector:new(637.83770751953, 523.25750732422, 137.71771240234),
    vector:new(-2498.6081542969, 1361.9106445312, 692.125),
    vector:new(1629.9156494141, -1185.2731933594, 65.125),
    vector:new(-910.48474121094, 1312.3875732422, 245.90710449219),
    vector:new(338.01824951172, -594.66253662109, 272.04052734375),
}


map.posTP = {
    vector:new(-2612.3664550781, -196.80017089844, 846.125),
    vector:new(941.24273681641, -1015.5969238281, 345.125),
    vector:new(-711.76965332031, 2267.7409667969, 243.125),
    vector:new(1243.1607666016, -1944.6381835938, 64.125),
    vector:new(334.3996887207, -564.03588867188, 408.1051940918),
}


map.below_map_tp = vector:new(-711.76965332031, 2267.7409667969, 243.125)


function BuildMap()
    SpawnFlag(map.posFlag[1])
    SpawnFlagOutside(map.posFlag[2])
    SpawnFlag(map.posFlag[3])
    SpawnFlag(map.posFlag[4])
    SpawnFlag(map.posFlag[5])

    SpawnContainer(vector:new(-2495.9516601562, 423.93350219727, 764.125))

    return true
end

return map