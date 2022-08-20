function SpawnBox(origin, angles, type, issolid)
    angles = angles or vector:new(0, 0, 0)

    local box = game:spawn("script_model", origin)
    box:setmodel("com_plasticcase_beige_big")
    box.angles = angles

    box:solid()
    --box:clonebrushmodeltoscriptmodel(airdropCollision);

    return box
end


function SpawnOrigin(startpoint, endpoint)
    local center = vector:new((startpoint.x + endpoint.x) / 2, (startpoint.y + endpoint.y) / 2, startpoint.z);
    local entity = game:spawn("script_origin", center);
    return entity;
end


function SpawnFloor(startpoint, endpoint)

    local entity = SpawnOrigin(startpoint, endpoint)
    local w = math.abs(startpoint.x - endpoint.x)
    local h = math.abs(startpoint.y - endpoint.y)

    local xsign = 1
    local ysign = 1

    if startpoint.x > endpoint.x then xsign = -1 end
    if startpoint.y > endpoint.y then ysign = -1 end

    w = math.floor(w / 55)
    h = math.floor(h / 30)

    for i = 0, w do
        for j = 0, h do
            local box = SpawnBox(vector:new(startpoint.x + 55 * i * xsign, startpoint.y + 30 * j * ysign, startpoint.z))
           
            box:linkto(entity)
        end
    end

    return entity;
end


function SpawnRamp(startpoint, endpoint)
    local entity = SpawnOrigin(startpoint, endpoint)

    local length = game:distance(startpoint, endpoint)
    local numBox = length / 30

    local forward = vector:new(endpoint.x - startpoint.x, endpoint.y - startpoint.y, endpoint.z - startpoint.z)
    local angles = game:vectortoangles(forward)
    angles = vector:new(angles.z, angles.y + 90, angles.x)

    forward = vector:new(forward.x / numBox, forward.y / numBox, forward.z / numBox)

    for i = 0, numBox do
        local origin = vector:new(startpoint.x + forward.x * i, startpoint.y + forward.y * i, startpoint.z + forward.z * i)
        local box = SpawnBox(origin, angles)
        
        box:linkto(entity)
    end

    return entity;
end