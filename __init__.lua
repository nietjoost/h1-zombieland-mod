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
gameTime = 15
players = {}
survivors = {}
zombies = {}
megazombies = {}
config = {}
config.started = false
config.enough_people = false
config.last_alive = false

-- [[ Pre cache ]] --
game:precachemodel("vehicle_cobra_helicopter_d_piece07")
game:precachemodel("com_plasticcase_beige_big")
game:precachemodel("laptop_toughbook_01_open")
game:precachemodel("h1_flag_mp_domination_spetsnaz_blue")
game:precachemodel("h1_flag_mp_domination_spetsnaz_red")
game:precachemodel("h1_shipping_container_03_red_closed")
game:precachemodel("afr_junktire")
game:loadfx("fx/misc/ui_pickup_available_bright")
game:loadfx("fx/misc/ui_pickup_unavailable_bright")

-- [[ Require ]] --
require("utils/utils")
require("events/change_map")
require("shop/shop_menu")
require("hud/hud_money")
require("hud/hud_message")
require("utils/spawn/map_spawn_flag")
require("utils/spawn/map_spawn_edit")
require("utils/spawn/map_spawn_edit_cont")
require("utils/spawn/map_spawn_shop_killstreak")
require("utils/spawn/map_spawn_shop_weapon")
require("utils/spawn/map_spawn_zipline")
require("utils/spawn/map_spawn_boost")
require("utils/spawn/map_spawn_hintstring")
require("utils/player/player_message_ui")
require("utils/player/player_loadout")
require("utils/player/player_sound")
require("utils/player/player_function")
require("events/check_flag_tp")
require("events/check_below_map_tp")
require("events/check_zipline")
require("events/player_connect")
require("events/game_logic")
require("events/broadcaster")
require("events/player_killed")
require("events/player_connected_watch_events")
require("events/mega_zombie")
require("events/timed_receivables")
require("events/player_disconnect")

build = require("maps/mp_main")
build.main()

-- [[ Settings ]]--
game:executecommand("set sv_cheats 1")
game:executecommand("set team_rebalance 0")
game:executecommand("set jump_height 60")
game:executecommand("set jump_slowdownEnable 0")
game:executecommand("set pm_bouncing 1")
game:executecommand("set pm_bouncingAllAngles 1")
game:executecommand("set scr_war_scorelimit 150") 
game:executecommand("set scr_war_timelimit " .. gameTime)
game:executecommand("set pt_gameStartTimerLength 1")
game:executecommand("set pt_pregameStartTimerLength 1")
game:executecommand("set g_teamname_allies ^2Survivors")
game:executecommand("set g_teamname_axis ^1Zombies")
game:executecommand("set sv_sayName ^1[ZombieLand]^7")
game:executecommand("spawnbot 10")
game:executecommand("set sv_cheats 0")

-- [[ World settings ]] --
game:setexpfog(100, 150, 1, 0, 0, 1)

-- Remove triggers that can kill players
triggerHurt = game:getentarray("trigger_hurt", "classname")
for i = 1, #triggerHurt do
    triggerHurt[i]:delete()
end

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
level:onnotify("connected", PlayerConnectedWatchEvents)
level:onnotify("connected", PlayerConnectedMegaZombie)
level:onnotify("connected", PlyerDisconnected)
level:onnotify("connected", MoneyConnected)
level:onnotify("connected", ShopConnected)

-- [[ DEBUG ]] --
--game:oninterval(function()
    --for _, debug_player in ipairs(players) do
        --print("vector:new(" .. debug_player.origin.x .. ", " .. debug_player.origin.y .. ", " .. debug_player.origin.z .. ")")
    --end
    --print(game:getdvar("mapname"))
--end, 400)