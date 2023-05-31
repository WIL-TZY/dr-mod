local BG, super = Class(Object)

function BG:init(color, back_color, fill)
    super:init(self)
    self.color = color
    self.back_color = back_color or color
    self.fill = fill or {0, 0, 0}
    self.speed = 1
    self.size = 50
	self.layer = BATTLE_LAYERS["bottom"]
end

function BG:update(dt)
    super:update(self, dt)
    self.fade = Game.battle.transition_timer / 10
end

function BG:draw()
    super:draw(self)

    self:drawFill()
	self:drawBack()
end

function BG:drawFill()
    local r,g,b,a = unpack(self.fill)
    love.graphics.setColor(r,g,b, a or self.fade)
    love.graphics.rectangle("fill", -8, -8, SCREEN_WIDTH+16, SCREEN_HEIGHT+16)
end

function BG:drawBack()
    local r,g,b,a = unpack(self.back_color)
    love.graphics.setColor(r,g,b, a or self.fade/6)
	spamstatic = love.graphics.newImage("mods/spamvil/assets/sprites/spamstatic.png")
	love.graphics.draw(spamstatic, 0, 0)
end

return BG