-- [[ MESSAGE UI: functions ]] --


function entity:PlayerMessage(msg)
    self:clientiprintln("^1[Zombieland] " .. "^7" .. msg)
end


function AllPlayerMessage(msg, color)
    for _, player in ipairs(players) do
        player:CreateTopMessage(msg, color)
    end
end


function AllPlayerNotifyMessage(msg, color)
    for _, player in ipairs(players) do
        player:CreateBottomMessage(msg, color)
    end
end


function AllPlayerNotifyMessageFast(msg, color)
    for _, player in ipairs(players) do
        player:CreateBottomMessageFast(msg, color)
    end
end