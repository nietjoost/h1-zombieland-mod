-- [[ Multiplayer CHECK ]] --
if game:getdvar("gamemode") ~= "mp" then
    print("[ZombieLand] This mod is only for multiplayer!")
    return
end

if game:getdvar("g_gametype") ~= "war" then
    print("[ZombieLand] This mod is only for team deathmatch!")
    return
end

-- [[ GLOBAL VARIABLES ]] --
players = {}
survivors = {}
zombies = {}
config = {}
config.started = false
config.enough_people = true

-- [[ Require ]] --
require("shop/shop_menu")
require("hud/hud_money")
require("hud/hud_message")
require("utils/map_spawn")
require("utils/map_edit")
require("utils/player_message_ui")
require("utils/player_loadout")
require("utils/player_sound")
require("utils/player_function")
require("events/check_flag_tp")
require("events/player_connect")
require("events/game_logic")
require("events/broadcaster")
require("events/player_killed")
build = require("maps/mp_main")
build.main()

-- [[ Settings ]]--
game:executecommand("set sv_cheats 1")
game:executecommand("set team_rebalance 1")
game:executecommand("set jump_height 60")
game:executecommand("set jump_slowdownEnable 0")
game:executecommand("set pm_bouncing 1")
game:executecommand("set pm_bouncingAllAngles 1")
game:executecommand("set scr_war_scorelimit 150") 
game:executecommand("set scr_war_timelimit 15")
game:executecommand("set pt_gameStartTimerLength 1")
game:executecommand("set pt_pregameStartTimerLength 1")
game:executecommand("set g_teamname_allies ^2Survivors")
game:executecommand("set g_teamname_axis ^1Zombies")
game:executecommand("set sv_sayName ^1[ZombieLand]^7")

-- [[ Disable Killstreaks ]]--
game:setdvar("scr_killstreak_kills_uav", 1000)
game:setdynamicdvar("scr_killstreak_kills_uav", 1000)
game:setdvar("scr_killstreak_kills_airstrike", 1000)
game:setdynamicdvar("scr_killstreak_kills_airstrike", 1000)
game:setdvar("scr_killstreak_kills_heli", 1000)
game:setdynamicdvar("scr_killstreak_kills_heli", 1000)

-- [[ EVENTS ]] --
level:onnotify("connected", PlayerConnectedOnce)
level:onnotify("connected", PlayerConnected)
level:onnotify("connected", PlyerDisconnected)
level:onnotify("connected", MoneyConnected)
level:onnotify("connected", ShopConnected)


-- [[ DEBUG ]] --
game:oninterval(function()
    for _, debug_player in ipairs(players) do
        print(debug_player.origin.x .. ", " .. debug_player.origin.y .. ", " .. debug_player.origin.z)
    end

    --print(game:getdvar("mapname"))
end, 100)