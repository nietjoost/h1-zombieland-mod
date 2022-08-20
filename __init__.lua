-- [[ VARIABLES ]] --
players = {}
config = {}
config.started = false

-- [[ Require ]] --
require("hud/hud_money")
require("hud/hud_message")
require("utils/spawn")
require("utils/mapedit")
require("utils/message_ui")
require("utils/weapon")
require("events/check_flag")
require("events/connect")
build = require("maps/mp_main")
build.main()

-- [[ Settings ]]--
game:executecommand("set sv_cheats 1")
game:executecommand("set team_rebalance 1")
game:executecommand("set jump_height 60")
game:executecommand("set pm_bouncing 1")
game:executecommand("set pm_bouncingAllAngles 1")
game:executecommand("set scr_war_scorelimit 150") 
game:executecommand("set scr_war_timelimit 15")

-- [[ Disable Killstreaks ]]--
game:setdvar("scr_killstreak_kills_uav", 1000)
game:setdynamicdvar("scr_killstreak_kills_uav", 1000)
game:setdvar("scr_killstreak_kills_airstrike", 1000)
game:setdynamicdvar("scr_killstreak_kills_airstrike", 1000)
game:setdvar("scr_killstreak_kills_heli", 1000)
game:setdynamicdvar("scr_killstreak_kills_heli", 1000)

-- [[ EVENTS ]] --
level:onnotify("connected", player_connected)
level:onnotify("connected", player_disconnected)
level:onnotify("connected", money_connected)