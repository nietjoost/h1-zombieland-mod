-- [[ MAP EDIT: functions ]] --
local GetContainerCollision = function ()
    local ent = game:getent("patchclip_player_128_128_128", "targetname")
    return ent
end

function SpawnContainer(origin, angles)
    local container_collision = GetContainerCollision()
    angles = angles or vector:new(0, 0, 0)

    local container = game:spawn("script_model", origin)
    container:setmodel("h1_shipping_container_03_red_closed")
    container.angles = angles
    container:solid()
    container:clonebrushmodeltoscriptmodel(container_collision)

    return container
end


function SpawnContainerOrigin(startpoint, endpoint)
    local center = vector:new((startpoint.x + endpoint.x) / 2, (startpoint.y + endpoint.y) / 2, startpoint.z);
    local entity = game:spawn("script_origin", center);
    return entity;
end


function SpawnFloorContainer(startpoint, endpoint)

    local entity = SpawnContainerOrigin(startpoint, endpoint)
    local w = math.abs(startpoint.x - endpoint.x)
    local h = math.abs(startpoint.y - endpoint.y)

    local xsign = 1
    local ysign = 1

    if startpoint.x > endpoint.x then xsign = -1 end
    if startpoint.y > endpoint.y then ysign = -1 end

    w = math.floor(w / 100)
    h = math.floor(h / 260)

    for i = 0, w do
        for j = 0, h do
            local container = SpawnContainer(vector:new(startpoint.x + 100 * i * xsign, startpoint.y + 260 * j * ysign, startpoint.z))
           
            container:linkto(entity)
        end
    end

    return entity
end


function SpawnRampContainer(startpoint, endpoint)
    local entity = SpawnContainerOrigin(startpoint, endpoint)

    local length = game:distance(startpoint, endpoint)
    local numBox = length / 30

    local forward = vector:new(endpoint.x - startpoint.x, endpoint.y - startpoint.y, endpoint.z - startpoint.z)
    local angles = game:vectortoangles(forward)
    angles = vector:new(angles.z, angles.y + 90, angles.x)

    forward = vector:new(forward.x / numBox, forward.y / numBox, forward.z / numBox)

    for i = 0, numBox do
        local origin = vector:new(startpoint.x + forward.x * i, startpoint.y + forward.y * i, startpoint.z + forward.z * i)
        local container = SpawnContainer(origin, angles)
        
        container:linkto(entity)
    end

    return entity
end