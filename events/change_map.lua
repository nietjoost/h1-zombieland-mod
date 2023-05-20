-- [[ Maps ]] --
maps = {
    "mp_backlot",
    "mp_bloc",
    "mp_bog_summer",
    "mp_bog",
    "mp_broadcast",
    "mp_carentan",
    "mp_cargoship",
    "mp_citystreets",
    "mp_convoy",
    "mp_countdown",
    "mp_crash_snow",
    "mp_crash",
    "mp_creek",
    "mp_crossfire",
    "mp_farm_spring",
    "mp_farm",
    "mp_killhouse",
    "mp_showdown",
    "mp_strike",
    "mp_vacant"
}

-- [[ Change to a random map]] --
function ChangeMap()
    game:ontimeout(function()
        game:executecommand("devmap " .. maps[math.random(1, #maps)])
    end, 10000)
end