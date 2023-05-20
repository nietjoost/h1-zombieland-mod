-- [[ MESSAGE UI: functions ]] --
function entity:PlayerMessage(msg)
    self:iprintln("^1[Zombieland] " .. "^7" .. msg)
end


function AllPlayerMessage(msg, color)
    for _, player in ipairs(players) do
        if game:scriptcall("maps/mp/_utility", "isreallyalive", player) == 0 then
            return
        end
        player:CreateTopMessage(msg, color)
    end
end


function AllPlayerNotifyMessage(msg, color)
    for _, player in ipairs(players) do
        if game:scriptcall("maps/mp/_utility", "isreallyalive", player) == 0 then
            return
        end
        player:CreateBottomMessage(msg, color)
    end
end


function AllPlayerNotifyMessageFast(msg, color)
    for _, player in ipairs(players) do
        if game:scriptcall("maps/mp/_utility", "isreallyalive", player) == 0 then
            return
        end
        player:CreateBottomMessageFast(msg, color)
    end
end

function AllPlayerFreeze(status)
    for _, player in ipairs(players) do     
        player:freezecontrols(status)
    end
end