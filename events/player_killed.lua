-- [[ EVENTS: on player killed ]] --
game:onplayerkilled(function(_self, inflictor, attacker, damage, mod, weapon, dir, hitloc, timeoffset, deathanimduration)
    if config.started == false then
        _self:ChangeTeam("allies")
        return
    end

    if _self == attacker and config.started == false then
        _self:ChangeTeam("allies")
        return
    end
    
    if attacker.money == nil then
        attacker.money = 0
    end

    if _self.money == nil then
        _self.money = 0
    end

    if _self.name ~= attacker.name then
        if attacker.name ~= nil then
            attacker:UpdateMoneyHUDKill()
        end
    end
    
    if _self.hud_money ~= nil then
        _self.hud_money:destroy()
        _self.hud_money = nil
    end

    if _self.type == "zombie" then
        return
    end
    
    _self.money = 50
    _self.type = "zombie"
    _self.died = true
    _self:ChangeTeam("axis")

    table.insert(zombies, _self)
    for sur_index, loop_sur in ipairs(survivors) do
        if loop_sur == _self then
            table.remove(survivors, sur_index)
        end
    end

    CheckForPlayers()
end)