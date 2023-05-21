-- [[ ZOMBIE LOADOUTS ]] --
function entity:GiveZombieClass()
    self:clearperks()
    self:takeallweapons()
    self:giveweapon("h1_meleejun4_mp_a#none_f#base")

    game:ontimeout(function()
        self:switchtoweapon("h1_meleejun4_mp_a#none_f#base")
    end, 100)

    self:giveweapon("h1_claymore_mp")
    self:disableweaponpickup()
end

function entity:GiveZombieClassClaymore()
    self:clearperks()
    self:takeallweapons()
    self:giveweapon("h1_meleejun4_mp_a#none_f#base")

    game:ontimeout(function()
        self:switchtoweapon("h1_meleejun4_mp_a#none_f#base")
    end, 100)

    self:disableweaponpickup()
end


-- [[ PLAYER LOADOUTS ]] --
function entity:GivePlayerClass()
    if map == nil then
        return
    end
    self:clearperks()
    self:takeallweapons();
    self:giveweapon(map.primary)
    self:giveweapon(map.secondary)
    self:giveweapon(map.knife)
    self:switchtoweapon(map.primary)

    local weapons = self:getweaponslistall()
    for i = 1, #weapons do
        self:givemaxammo(weapons[i])
        self:setweaponammoclip(weapons[i], 1000)
    end
end