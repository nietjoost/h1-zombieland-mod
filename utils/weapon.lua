function entity:giveZombieClass()
    self:clearperks()
    self:takeallweapons();
    self:giveweapon("h1_meleejun4_mp_a#none_f#base")
    self:switchtoweapon("h1_meleejun4_mp_a#none_f#base")
end

function entity:givePlayerClass()
    if map == nill then
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
