-- [[ PLAYER: functions ]] --
function entity:ChangeTeam(team)
    if self.sessionstate ~= "dead" then
        self.switching_teams = true
        self.joining_team = team
        self.leaving_team = self.pers["team"]
        game:ontimeout(function ()
            self:suicide()
        end, 0)
    end

    self.pers["team"] = team
    self.team = team
    self.pers["teamTime"] = nil
    self.sessionteam = self.pers["team"]
    
    self:notify( "end_respawn" )
end

-- [[ ZOMBIE FIRST LOGIC ]] --
function ZombieSpawnLogic(player)
    player.type = "zombie"
    player.money = 50
    player:GiveZombieClass()
end

-- [[ SURVIVOR FIRST LOGIC ]] --
function SurvivorSpawnLogic(player)
    player.type = "survivor"
    player.money = 500
    player:freezecontrols(false)
    player:GivePlayerClass()
    player:GivePlayerClass()
end

function entity:is_bot()
    if (starts_with(self:getguid(), "bot")) then
        return true
    else
        return false
    end
end


-- [[ PLAYER: remove from given table ]] --
function entity:RemovePlayerFromTable(remove_table)
    for table_index, table_player in ipairs(remove_table) do
        if table_player == player then
            table.remove(remove_table, table_index)
        end
    end
end