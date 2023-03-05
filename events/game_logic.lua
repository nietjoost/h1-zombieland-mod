-- [[ Select the first infected ]]--
function chose_zombies()
   -- Chose multiple infected when there is enough people
   if #players > 8 then
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

   -- Chose only one infected
   zombie1 = players[math.random(1, #players)]
   zombie1:ChangeTeam("axis")
end

-- [[ Start the gamemode [show start message, countdown, chose infected] ]]--
function start_zombieland(start_zombieland_timer)
   game:ontimeout(function()
      
      -- Start countdown message
      AllPlayerNotifyMessage("Zombies will be chosen in 20 seconds!", vector:new(1, 0, 0))
      AllPlayerSound("h1_ui_sub_menu_campain_appear")

      -- The countdown messages
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

      -- Check for enough people
      game:ontimeout(function()
         -- Check for enough people with messages
         if #players == 1 then
            AllPlayerMessage("Not enough players!", vector:new(1, 0, 0))
            AllPlayerNotifyMessage("Waiting for more players....", vector:new(0, 1, 0))
            config.enough_people = false
            return
         end

         -- SET: New players joins zombies
         config.enough_people = true
         config.started = true

         -- Set first infected
         chose_zombies()

         -- Notify players
         AllPlayerNotifyMessage("Zombies are coming!", vector:new(1, 0, 0))
         AllPlayerSound("mp_enemy_obj_captured")
      end, 19000)
   end, 30000)
end


-- [[ Game wining check ]]--
function CheckForPlayers()
   if (config.started == true and config.enough_people == true and #survivors == 0) then
      AllPlayerMessage("The zombies have won!", vector:new(1, 0, 0))

      game:ontimeout(function()
         level:scriptcall("maps/mp/gametypes/_gamelogic", "forceend")
      end, 3000)
    end
end


-- [[ START THE GAMEMODE - event ]]--
start_zombieland()