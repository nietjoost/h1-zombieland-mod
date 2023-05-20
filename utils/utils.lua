-- [[ Convert seconds to ms ]] --
function ms(secs)
    return math.floor(secs * 1000)
end

-- [[ HANDLE MENU ]] --
function HandleMenu(player)
    if config.started == true then
        player:scriptcall("maps/mp/gametypes/_menus", "setteam", "axis")
    else
        player:scriptcall("maps/mp/gametypes/_menus", "setteam", "allies")
    end
end

-- [[ Get total players in team ]] --
function GetTotalPlayerInTeam(team)
    count = 0

    for _, player in ipairs(players) do
        if player.pers["team"] == team then
            count = count + 1
        end
    end
    return count
end