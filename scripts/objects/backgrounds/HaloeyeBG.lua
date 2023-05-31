local BG, super = Class(Object)

function BG:init(color, back_color, fill)
    super:init(self)
    self.color = color
	self.back_color = back_color or color
    self.fill = fill or {0, 0, 0}
    self.speed = 1
    self.size = 50
	self.layer = BATTLE_LAYERS["bottom"]
	self:addFX(ShaderFX(Mod.wave_shader, {
    ["wave_sine"] = function() return love.timer.getTime() * 100 end,
    ["wave_mag"] = 2,
    ["wave_height"] = 12,
    ["texsize"] = {SCREEN_WIDTH, SCREEN_HEIGHT}
}))
end

function BG:update(dt)
    super:update(self, dt)
    self.fade = Game.battle.transition_timer / 10
end

function BG:draw()
    super:draw(self)
	
	self:drawFill()
    self:drawFront()
end

function BG:drawFill()
    local r,g,b,a = unpack(self.fill)
    love.graphics.setColor(r,g,b, a or self.fade)
    love.graphics.rectangle("fill", -8, -8, SCREEN_WIDTH+16, SCREEN_HEIGHT+16)
end

function BG:drawBack()
    local r,g,b,a = unpack(self.back_color)
    love.graphics.setColor(0, 0, 0, a or self.fade/6)
end

function BG:drawFront()
    r,g,b,a = unpack(self.color)
    love.graphics.setColor(r,g,b, a or self.fade)
	haloeye = love.graphics.newImage("mods/spamvil/assets/sprites/haloeye.png")
	love.graphics.draw(haloeye, 200, 40)
end

return BG