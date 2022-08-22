function chose_zombies()

   if #players > 5 then
      zombie1 = nil
      zombie2 = nil
      while(zombie1 == zombie2)
      do
         zombie1 = players[math.random(1, #players)]
         zombie2 = players[math.random(1, #players)]
      end

      print(zombie1.name)
      print(zombie2.name)

      return
   end

   zombie1 = players[math.random(1, #players)]
end


-- [[ Message: zombies are in-coming ]]--
game:ontimeout(function()
   chose_zombies()

   all_player_notify_message("Zombies will be chosen in 20 seconds!", vector:new(1, 0, 0))

   game:ontimeout(function()
      all_player_notify_message_fast("Zombies will be chosen in 10 seconds!", vector:new(1, 0, 0))
   end, 10000)

   game:ontimeout(function()
      all_player_notify_message_fast("5", vector:new(1, 0, 0))
   end, 15000)

   game:ontimeout(function()
      all_player_notify_message_fast("4", vector:new(1, 0, 0))
   end, 16000)

   game:ontimeout(function()
      all_player_notify_message_fast("3", vector:new(1, 0, 0))
   end, 17000)

   game:ontimeout(function()
      all_player_notify_message_fast("2", vector:new(1, 0, 0))
   end, 18000)

   game:ontimeout(function()
      all_player_notify_message_fast("1", vector:new(1, 0, 0))
   end, 19000)

   game:ontimeout(function()
      all_player_notify_message("Zombies are coming!", vector:new(1, 0, 0))
      chose_zombies()
   end, 20000)
end, 30000)