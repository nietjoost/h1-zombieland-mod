-- [[ Spawn a hint string only in the map ]] --
function SpawnHintString(position, string)
    local hintstring = game:spawn("script_model", position)
    hintstring:setmodel("laptop_toughbook_01_open")
    hintstring:hide()
    hintstring:makeusable()
    hintstring:sethintstring(string)
end