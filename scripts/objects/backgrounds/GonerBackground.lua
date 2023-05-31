local GonerBackground, super = Class(Object)

function GonerBackground:init()
    super:init(self, 0, 0, 320, 240)
    self:setScale(2)
    self:setOrigin(0, 0)

    self.sprite = Assets.getTexture("IMAGE_DEPTH")

    self.parallax_x = 0
    self.parallax_y = 0

    self.OBM = 0.5

    self.ob_depth = 0

    self.timer = Timer()
    self.timer:every(40/30, function()
        self.ob_depth = self.ob_depth - 0.001
        local piece = self:addChild(GonerBackgroundPiece(self.sprite))
        piece.stretch_speed = 0.01 * self.OBM
        piece.layer = self.ob_depth
    end)
    self:addChild(self.timer)

end

return GonerBackground