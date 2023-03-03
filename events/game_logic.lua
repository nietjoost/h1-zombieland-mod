-- [[ First infected function ]]--
function chose_zombies()
   if #players > 5 then
      zombie1 = nil
      zombie2 = nil
      while(zombie1 == zombie2)
      do
         zombie1 = players[math.random(1, #players)]
         zombie2 = players[math.random(1, #players)]
         zombie1:ChangeTeam("axis")
         zombie2:ChangeTeam("axis")
      end
      return
   end

   zombie1 = players[math.random(1, #players)]
   zombie1:ChangeTeam("axis")
end

-- [[ Message: zombies are in-coming ]]--
function start_zombieland(start_zombieland_timer)
   game:ontimeout(function()
      AllPlayerNotifyMessage("Zombies will be chosen in 20 seconds!", vector:new(1, 0, 0))
      AllPlayerSound("h1_ui_sub_menu_campain_appear")

      local count_down = 10
      while(count_down ~= 0)
         do
            local number = count_down
            game:ontimeout(function()
               AllPlayerNotifyMessageFast(number, vector:new(1, 0, 0))
               AllPlayerSound("h1_ui_main_menu_appear")
            end, 19000 - (1000*count_down))
            count_down = count_down - 1
         end
      return

      game:ontimeout(function()
         if #players == 1 then
            AllPlayerMessage("Not enough players!", vector:new(1, 0, 0))
            AllPlayerNotifyMessage("Waiting for more players....", vector:new(0, 1, 0))
            config.enough_people = false
            return
         end

         -- [[ New players joins zombies ]]--
         config.enough_people = true
         config.started = true

         -- [[ Set first infected ]]--
         chose_zombies()

         -- [[ Notify players ]]--
         AllPlayerNotifyMessage("Zombies are coming!", vector:new(1, 0, 0))
         AllPlayerSound("mp_enemy_obj_captured")
      end, 19000)
   end, 30000)
end


-- [[ Check for players ]]--
function CheckForPlayers()
   if (config.started == true and config.enough_people == true and #survivors == 0) then
      AllPlayerMessage("The zombies have won!", vector:new(1, 0, 0))

      game:ontimeout(function()
         temp = {}
         temp.firstPlayer = 0
         for _, player in ipairs(players) do
            if temp.firstPlayer == 0 then
               player:scriptcall("maps/mp/gametypes/_gamelogic", "forceend")
               temp.firstPlayer = 1
            end
         end
      end, 3000)
    end
end


-- [[ EVENT ]]--
start_zombieland()