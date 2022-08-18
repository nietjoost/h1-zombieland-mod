-- VARIABLES
require("hud/hud_money")
require("hud/hud_message")

local map = require("maps/" .. game:getdvar("mapname"))
local utility = game:getfunctions("maps/mp/_utility")

map.main()

players = {}
local config = {}
config.started = false

-- [[ Settings ]]--
game:executecommand("set sv_cheats 1")
game:executecommand("set jump_height 150")
game:executecommand("set team_rebalance 1")
game:executecommand("set pm_bouncing 1")

-- [[ Disable Killstreaks ]]--
game:setdvar("scr_killstreak_kills_uav", 1000)
game:setdynamicdvar("scr_killstreak_kills_uav", 1000)
game:setdvar("scr_killstreak_kills_airstrike", 1000)
game:setdynamicdvar("scr_killstreak_kills_airstrike", 1000)
game:setdvar("scr_killstreak_kills_heli", 1000)
game:setdynamicdvar("scr_killstreak_kills_heli", 1000)

-- FUNCTION
function entity:player_spawned()
    -- Welcome message
    self:clientiprintln("^4Welcome to ^1RooieRonnie's ^6Zombieland!")
    self:clientiprintln("^5Creaded by ^2Joost de Niet!")

    -- Give full ammo
    local weapons = self:getweaponslistall()
    for i = 1, #weapons do
        print(weapons[i])
        self:givemaxammo(weapons[i])
        self:setweaponammoclip(weapons[i], 1000)
    end
end

function player_connected(player)
    table.insert(players, player)
    player:scriptcall("maps/mp/gametypes/_menus", "_id_8027", "allies")

    player.money = 500

    player:onnotify("spawned_player", function()
        if player.type == "zombie" then
            player:welcome_message("You are now a zombie!", vector:new(1, 0, 0))

            local weapons = player:getweaponslistall()
            for i = 1, #weapons do
                --print(weapons[i])
                player:takeweapon(weapons[i])
            end
            player:giveweapon("h1_meleejun4_mp_a#none_f#base")
            player:switchtoweapon("h1_meleejun4_mp_a#none_f#base")

        elseif player.type == nil then
            player:welcome_message("Welcome to RooieRonnie's ZombieLand", vector:new(0, 1, 0))
        end

        player:player_spawned()
    end)
end

-- EVENT
level:onnotify("connected", player_connected)
level:onnotify("connected", money_connected)
