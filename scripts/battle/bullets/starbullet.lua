local StarBullet, super = Class(Bullet)

function StarBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/star")

    self:setScale(0.8)
    self.color = Utils.hexToRgb("#FFC0CB")
    
    self.physics = {
        -- Speed the bullet moves (pixels per frame at 30FPS)
        speed = speed,
        -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
        direction = dir, --math.rad(135)
    }
    self.remove_offscreen = false

    self.damage = 70

 end

function StarBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return StarBullet
