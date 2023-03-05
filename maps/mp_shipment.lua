-- [[ MAP: mp_shipment (shipment) ]] --

-- [[ Map config settings ]] --
map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

map.posFlag = { 
    vector:new(706.50140380859, -573.70373535156, 376.125),
    vector:new(388.7594909668, 6492.8564453125, 192.125),
    vector:new(-1.8485237360001, 58.412368774414, 192.62408447266),
    vector:new(2433.802734375, 4182.8286132812, 240.125),
}

map.posTP = {
    vector:new(-2023.0865478516, 2317.7395019531, 192.125),
    vector:new(679.90093994141, 26.48740196228, 201.125),
    vector:new(4994.0678710938, 1406.3018798828, 240.125),
    vector:new(-713.97711181641, 752.97723388672, 376.125),
}

map.below_map_y = -36.00
map.below_map_tp = vector:new(706.50140380859, -573.70373535156, 376.125)

-- [[ BUILD instant ]] --
function PreBuildMap()
    SpawnShop(vector:new(-701.76135253906, -616.99945068359, 190), "compass_objpoint_airstrike")
end

-- [[ Build map: called later for lag purpose ]] --
function BuildMap()
    -- Spawn flags
    SpawnFlag(map.posFlag[1])
    SpawnFlagOutside(map.posFlag[2])
    SpawnFlag(map.posFlag[3])
    SpawnFlagOutside(map.posFlag[4])

    -- Inside map
    SpawnRamp(vector:new(-292.64617919922, -415.05114746094, 175.22680664062), vector:new(-136.68685913086, -416.47885131836, 295.18801879883))
    SpawnRamp(vector:new(203.87696838379, -103.68852996826, 255.91763305664), vector:new(-86.058471679688, -103.00691986084, 405.8332824707))
    SpawnRamp(vector:new(-74.903861999512, -5.0158138275146, 391.02825927734), vector:new(81.595252990723, 142.00148010254, 383.28460693359))
    SpawnRamp(vector:new(-764.28234863281, -74.304473876953, 152.27754211426), vector:new(-678.50262451172, -69.514228820801, 230.48477172852)) -- Custom bounce
    SpawnRamp(vector:new(-733.69946289062, -49.483268737793, 360.0), vector:new(-732.99572753906, 752.99475097656, 360.0))
    SpawnRamp(vector:new(712.84741210938, 752.99987792969, 360.0), vector:new(-722.38604736328, 752.34210205078, 360.0))
    SpawnRamp(vector:new(712.84741210938, 752.99951171875, 360.0), vector:new(708.9931640625, -605.00915527344, 360.0))


    -- Outside map
    SpawnWall(vector:new(-1735.5347900391, 2030.6020507812, 161.20111083984), vector:new(-2800.6320800781, 2029.2550048828, 300))
    SpawnWall(vector:new(5342.396484375, 1239.0572509766, 199.49546813965), vector:new(4606.1088867188, 1211.5090332031, 364.89492797852))

    SpawnContainer(vector:new(4981.2583007812, 3167.1599121094, 240.12498474121))
    SpawnContainer(vector:new(5184.1713867188, 1837.0454101562, 240.125))
    SpawnContainer(vector:new(4928.1240234375, 4195.2915039062, 240.125))
    SpawnContainer(vector:new(3485.294921875, 4385.43359375, 240.125))
    SpawnContainer(vector:new(-326.96151733398, 5611.4091796875, 192.125))
    SpawnContainer(vector:new(255.65837097168, 5888.14453125, 192.125))

    --SpawnRamp(vector:new(), vector:new())
    --SpawnWall(vector:new(), vector:new())

    return true
end

return map