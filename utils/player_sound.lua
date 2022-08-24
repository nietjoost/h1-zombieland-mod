-- [[ ALL player play sound ]] --
function AllPlayerSound(sound)
    game:precachesound(sound)
    for aps_index, player_sound in ipairs(players) do
        player_sound:playlocalsound(sound)
    end
end