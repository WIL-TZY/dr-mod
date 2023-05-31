local PurpleLines, super = Class(Object)

-- we're going to give it the position and width of the arena
function PurpleLines:init(x, y, width, height)
    super:init(self, x, y, width, height)

    -- layer should be above the arena
    -- LAYERS is a global table containing references to layer constants
    self.layer = LAYERS["above_arena"]
    
    -- since the arena's position is at its center,
    -- we want to set the origin to be the object's center
    self:setOrigin(0.5, 0.5)

    -- i don't actually know the specific rgb it needs to be
    self.color = {1, 0, 1}
end

function PurpleLines:draw()
    super:draw(self)

    love.graphics.setColor(unpack(self.color))

    -- coordinates are relative to the topleft of the object,
    -- which means they're relative to the topleft of the arena
    love.graphics.line(20, 20, self.width - 40, 20) -- top line, 20px from top of arena
    love.graphics.line(20, self.height/2, self.width - 40, self.height/2) -- middle line, center of arena
    love.graphics.line(20, self.height - 20, self.width - 40, self.height - 20) -- bottom line, 20px from bottom of arena
end

return PurpleLines