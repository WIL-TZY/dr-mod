local PurpleSoul, super = Class(Wave)

function PurpleSoul:init()
    super:init(self)
end

function PurpleSoul:onStart()
    local arena = Game.battle.arena
    -- add the purple lines at the start of the wave
    -- Wave:spawnObject() add the object to Game.battle,
    -- and automatically removes it when the wave ends
    self:spawnObject(PurpleLines(arena.x, arena.y, arena.width, arena.height))
end

return PurpleSoul