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