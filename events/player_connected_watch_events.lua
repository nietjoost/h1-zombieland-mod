-- [[ PLAYER WATCH EVENTS ]] --
function PlayerConnectedWatchEvents(player)

    -- CHECK FOR CLAYMORE placing
    player:notifyonplayercommand("cancel_claymore", "+actionslot 3")
    player:onnotify("cancel_claymore", function()
        if player.type == "zombie" then
            local weapons = player:getweaponslistall()
            for i = 1, #weapons do
                if weapons[i] == "h1_claymore_mp" then
                    player:SpawnClaymore()            
                end
            end
        end
    end)
end

-- [[ Spawn Tactical Insertion for Player ]] --
function entity:SpawnClaymore()
    -- Check for only one
    if self.savedPosistion ~= nil then
        return
    end

    -- Save posistion
    self.savedPosistion = self.origin
    self.savedAngle = self.angles

    -- Play effects
    self:playlocalsound("claymore_plant_concrete")
    game:ontimeout(function()
        self:playlocalsound("claymore_plant_concrete")
        game:ontimeout(function()
            self:playlocalsound("claymore_plant_concrete")
        end, 50)
    end, 50)

    -- Add delete Tactical Insersion function
    local tactical = game:spawn("script_model",  self.origin)
    tactical:setmodel("h1_dogtag_friend_animated")
    tactical:show()
    tactical:makeusable()
    tactical:sethintstring("Press ^3[{+activate}]^7 to ^1destroy ^7the tactical insertion")
    self.tactical = tactical

    --local tacticalEffect = game:loadfx("vfx/unique/vfx_marker_dom")
    --local playtacticalEffect = game:playfx(tacticalEffect, self.origin)

    -- Wait for players trigger
    tactical:onnotify("trigger", function(self)
        if self.type == "zombie" then
            self:iprintlnbold("^1You cannot delete a tactical insertion!");
            return
        end

        tactical:delete()
        self:playlocalsound("bullet_large_ice")
    end)

    -- Other
    self:iprintlnbold("^2Tactical insertion is set")

    game:ontimeout(function()
        self:GiveZombieClassClaymore()
    end, 300)
end