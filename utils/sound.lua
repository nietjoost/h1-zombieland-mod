function all_player_sound(sound)
    game:precachesound(sound)
    for msg_, all_player_sound in ipairs(players) do
        all_player_sound:playlocalsound(sound)
    end
end