local MoveBullet, super = Class(Bullet)
--code made originally by Vitellary -  Kristal Team
function MoveBullet:init(x, y, type, texture)
    super:init(self, x, y, texture)
    self.tp = 0
    self.type = type or "cyan"
    self.color = self:getTypeColor()
    self.override = false
end

function MoveBullet:onCollide(soul)
    if self.type == "cyan" and (soul.moving_x ~= 0 or soul.moving_y ~= 0)
        or self.type == "orange" and (soul.moving_x == 0 and soul.moving_y == 0)
        or self.override then
        super:onCollide(self, soul)
        if self.type == "cyan" then
            Game.battle:swapSoul(ParrySoul())
        elseif self.type == "orange" then
            Game.battle:swapSoul(YellowSoul())
        end
    end
end

function MoveBullet:getTypeColor()
    if self.type == "orange" then
        return { 1, 0.6, 0 }
        -- red { 255, 0, 0 }
        -- purple { 128, 0, 128 }
        
    else
        return { 0, 0.9, 1 }
    end
end

return MoveBullet
