local Heal, super = Class(HealBullet)

function Heal:init(x, y, dir, speed)
    -- Last argument = sprite path
    super:init(self, x, y, "green", "bullets/smallbullet")
    -- Bullet color
    self.type = "green"
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

end

function Heal:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super:update(self)
end

return Heal