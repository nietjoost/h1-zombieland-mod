-- [[ Spawn Zipline logic ]] --
ziplinesFirstPos = {}
ziplinesSecondPos = {}

function AddZipLine(startPos, endPos)
    table.insert(ziplinesFirstPos, startPos)
    table.insert(ziplinesSecondPos, endPos)
end

function BuildZiplines()
    delay = 300
    for zipline_index, zipline in ipairs(ziplinesFirstPos) do
        game:ontimeout(function()
            SpawnZipLine(ziplinesFirstPos[zipline_index], ziplinesSecondPos[zipline_index])
            SpawnZipLine(ziplinesSecondPos[zipline_index], ziplinesFirstPos[zipline_index])
        end, 300)
        delay = delay + 300
    end
end

function SpawnZipLine(startPos, endPos)
    -- Spawn hint string [needs model]
    local zipline = game:spawn("script_model", startPos)
    zipline:setmodel("h1_flag_mp_domination_spetsnaz_blue")
    zipline:hide()
    zipline:makeusable()
    zipline:sethintstring("Press ^3[{+activate}]^7 to use the zipline")

    -- Spawn ZipeLine models
    local model1 = game:spawn("script_model", startPos + vector:new(0, 0, 110))
    model1.angles = game:vectortoangles(endPos - startPos)
    model1:setmodel("vehicle_cobra_helicopter_d_piece07")
    model1:show()

    game:ontimeout(function()
        -- Spawn effect
        local zipLineEffect = game:loadfx("fx/misc/ui_pickup_unavailable_bright")
        game:playfx(zipLineEffect, zipline.origin)

        -- Wait for players trigger
        zipline:onnotify("trigger", function(player)
            if player.use_of_zipline == 0 then
                player.use_of_zipline = 1
                player:playlocalsound("weap_suitcase_drop_plr")
                player:StartZipLine(zipline.origin, endPos)
            end
        end)
    end, 100)
end

-- [[ Link a player to a ZipLine ]] --
function entity:StartZipLine(startPos, endPos)
    -- Set route
    local delay = 1.75
    local zoomheight = 3500
    local origin = startPos
    local ent = game:spawn("script_model", vector:new(69, 69, 69))
    ent:setmodel("tag_origin")
    ent.origin = self.origin
    self:playerlinkto(ent)
    ent:moveto(endPos + vector:new(0, 0, 10), delay, 0, delay)

    -- Reset player after finish zipline
    game:ontimeout(function()
        self:unlink()
        self:enableweapons()
        self:enableoffhandweapons()
        self:freezecontrols(false)
        ent:delete()
        self.use_of_zipline = 0
    end, ms(delay))
end