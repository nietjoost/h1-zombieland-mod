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
   all_player_notify_message("Zombies will be chosen in 20 seconds!", vector:new(1, 0, 0))
   all_player_sound("h1_ui_sub_menu_campain_appear")

   game:ontimeout(function()
      all_player_notify_message_fast("10", vector:new(1, 0, 0))
      --all_player_sound("mp_hud_tk_lockon")
      --all_player_sound("h1_ui_menu_warning_box_appear")
      all_player_sound("h1_ui_main_menu_appear")
   end, 10000)

   game:ontimeout(function()
      all_player_notify_message_fast("9", vector:new(1, 0, 0))
      all_player_sound("h1_ui_main_menu_appear")
   end, 11000)
   
   game:ontimeout(function()
      all_player_notify_message_fast("8", vector:new(1, 0, 0))
      all_player_sound("h1_ui_main_menu_appear")
   end, 12000)

   game:ontimeout(function()
      all_player_notify_message_fast("7", vector:new(1, 0, 0))
      all_player_sound("h1_ui_main_menu_appear")
   end, 13000)

   game:ontimeout(function()
      all_player_notify_message_fast("6", vector:new(1, 0, 0))
      all_player_sound("h1_ui_main_menu_appear")
   end, 14000)

   game:ontimeout(function()
      all_player_notify_message_fast("5", vector:new(1, 0, 0))

      all_player_sound("h1_ui_main_menu_appear")
   end, 15000)

   game:ontimeout(function()
      all_player_notify_message_fast("4", vector:new(1, 0, 0))
      all_player_sound("h1_ui_main_menu_appear")
   end, 16000)

   game:ontimeout(function()
      all_player_notify_message_fast("3", vector:new(1, 0, 0))
      all_player_sound("h1_ui_main_menu_appear")
   end, 17000)

   game:ontimeout(function()
      all_player_notify_message_fast("2", vector:new(1, 0, 0))
      all_player_sound("h1_ui_main_menu_appear")
   end, 18000)

   game:ontimeout(function()
      all_player_notify_message_fast("1", vector:new(1, 0, 0))
      all_player_sound("h1_ui_main_menu_appear")
   end, 19000)

   game:ontimeout(function()
      all_player_notify_message("Zombies are coming!", vector:new(1, 0, 0))
      --all_player_sound("h1_ui_menu_overheat_machine_gun")
      all_player_sound("nuke_explosion_boom")
      chose_zombies()
   end, 20000)
end, 30000)