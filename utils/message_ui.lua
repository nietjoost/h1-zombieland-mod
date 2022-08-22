function entity:clientMsg(message)
    self:clientiprintln("^1[Zombieland] " .. "^7" .. message)
end

function all_player_message(msg, color)
    for msg_, all_player_msg_var in ipairs(players) do
        all_player_msg_var:welcome_message(msg, color)
    end
end

function all_player_notify_message(msg, color)
    for msg__, all_player_notify_message_var in ipairs(players) do
        all_player_notify_message_var:notify_message(msg, color)
    end
end

function all_player_notify_message_fast(msg, color)
    for msg___, all_player_notify_message_fast_var in ipairs(players) do
        all_player_notify_message_fast_var:notify_message_fast(msg, color)
    end
end