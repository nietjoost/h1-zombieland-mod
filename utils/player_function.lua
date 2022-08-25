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
    self:scriptcall("maps/mp/_utility", "_id_9B42")
    
    self:notify( "end_respawn" )
end


-- [[ PLAYER: remove from given table ]] --
function entity:RemovePlayerFromTable(remove_table)
    for table_index, table_player in ipairs(remove_table) do
        if table_player == player then
            table.remove(remove_table, table_index)
        end
    end
end