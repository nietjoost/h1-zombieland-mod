-- [[ Broadcaster settings ]] --
broadcast_messages = {
    "Created by RooieRonnie!",
    --"Press 7 (default) to open the menu shop!",
    "Be alive when the timer ends as a survivor to win the game!",
    "Kill all survivors as a zombie before the timer to win the game!",
    "This ZombieLand version is still in BETA!"
}

broadcast_index = 1

-- [[ AUTO CHAT broadcaster - event ]] --
function start_broadcast()
    game:oninterval(function()
        game:executecommand("say " .. broadcast_messages[broadcast_index])
        broadcast_index = broadcast_index + 1

        if broadcast_index > #broadcast_messages then
            broadcast_index = 1
        end
    end, 30000)
end

start_broadcast()