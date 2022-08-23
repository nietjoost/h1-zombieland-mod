-- [[ First infected function ]]--
function chose_zombies()
   if #players > 5 then
      zombie1 = nil
      zombie2 = nil
      while(zombie1 == zombie2)
      do
         zombie1 = players[math.random(1, #players)]
         zombie2 = players[math.random(1, #players)]
         zombie1:changeteam("axis")
         zombie2:changeteam("axis")
      end
      return
   end

   zombie1 = players[math.random(1, #players)]
   zombie1:changeteam("axis")
end

-- [[ Message: zombies are in-coming ]]--
function start_zombieland()
   game:ontimeout(function()
      all_player_notify_message("Zombies will be chosen in 20 seconds!", vector:new(1, 0, 0))
      all_player_sound("h1_ui_sub_menu_campain_appear")

      local count_down = 10
      while(count_down ~= 0)
      do
         local number = count_down
         game:ontimeout(function()
            all_player_notify_message_fast(number, vector:new(1, 0, 0))
            all_player_sound("h1_ui_main_menu_appear")
         end, 19000 - (1000*count_down))
         count_down = count_down - 1
      end
      return

      game:ontimeout(function()
         if #players < 2 then
            all_player_notify_message("Not enough players!", vector:new(1, 0, 0))
            start_zombieland()
            return
         end

         all_player_notify_message("Zombies are coming!", vector:new(1, 0, 0))
         all_player_sound("nuke_explosion_boom")

         -- [[ New players joins zombies ]]--
         config.started = true

         -- [[ Set first infected ]]--
         chose_zombies()
      end, 19000)
   end, 30000)
end

start_zombieland()