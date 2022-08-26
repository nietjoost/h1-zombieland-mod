-- [[ MAP: mp_pipeline (pipeline) ]] --

map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}


map.posFlag = { 
    vector:new(),
}


map.posTP = {
    vector:new(),
}


function BuildMap()
    SpawnFlag(map.posFlag[1])
    SpawnFlagOutside(map.posFlag[2])


    --SpawnRamp(vector:new(), vector:new())
    --SpawnWall(vector:new(), vector:new())

    return true
end

return map