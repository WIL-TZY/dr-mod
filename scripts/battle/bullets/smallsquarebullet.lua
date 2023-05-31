local SmallSquareBullet, super = Class(MoveBullet)
--local SmallSquareBullet, super = Class(Bullet)

function SmallSquareBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    local color = Utils.pick({ "orange", "cyan" })
    super.init(self, x, y, color, "bullets/smallsquarebullet")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    --self.type = "cyan"
end

function SmallSquareBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return SmallSquareBullet
