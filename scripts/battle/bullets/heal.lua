local Heal, super = Class(HealBullet)
--local Heal, super = Class(Bullet)

function Heal:init(x, y, dir, speed)
    -- Last argument = sprite path
    local color = Utils.pick({ "green" })
    super.init(self, x, y, color, "bullets/smallbullet")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

end

function Heal:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return Heal