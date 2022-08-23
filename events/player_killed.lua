-- [[ EVENTS: on player killed ]] --
game:onplayerkilled(function(_self, inflictor, attacker, damage, mod, weapon, dir, hitloc, timeoffset, deathanimduration)
    if _self == attacker and config.started == false then
        _self:changeteam("allies")
        return
    end
    
    if attacker.money == nil then
        attacker.money = 0
    end

    if _self.money == nil then
        _self.money = 0
    end

    if _self.name ~= attacker.name then
        attacker:update_money_HUD()
    end

    _self.hudMoney:destroy()
    _self.hudMoney = nil

    if _self.type == "zombie" then
        return
    end

    _self.money = 50
    _self.type = "zombie"
    _self.died = true
    _self:changeteam("axis")

    table.insert(zombies, _self)
    for sur_index, loop_sur in ipairs(survivors) do
        if loop_sur == _self then
            table.remove(survivors, sur_index)
        end
    end

    if #survivors == 0 then
        all_player_message("The zombies have won!", vector:new(1, 0, 0))
        print("Zombies has won!")
    end
end)