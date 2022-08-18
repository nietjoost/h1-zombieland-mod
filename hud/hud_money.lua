-- HUD Money static 
function entity:money_spawned()
    -- HUD Money
    self.hudMoney = game:newclienthudelem(self)
    self.hudMoney.horzalign = "left"
    self.hudMoney.alignx = "left"
    self.hudMoney.y = 150
    self.hudMoney.x = 5
    self.hudMoney.font = "bigfixed"
    self.hudMoney.fontscale = 1.2
    self.hudMoney.hidewhendead = true
    self.hudMoney.hidewheninmenu = true
    self.hudMoney.glowalpha = 0.3
    self.hudMoney.glowcolor = vector:new(0, 0, 1)
    self.hudMoney:settext("$" .. self.money)
end

-- EVENT
game:onplayerkilled(function(_self, inflictor, attacker, damage, mod, weapon, dir, hitloc, timeoffset, deathanimduration) 
    if attacker.type == "zombie" then
        attacker.money = attacker.money + 50
    else
        attacker.money = attacker.money + 500
    end
    attacker.hudMoney:destroy()
    attacker.hudMoney = nil
    attacker:money_spawned()

    _self.money = 50
    _self.hudMoney:destroy()
    _self.hudMoney = nil
    _self.type = "zombie"
end)


function money_connected(player)
    player:onnotify("spawned_player", function()
        player:money_spawned()
    end)
end
