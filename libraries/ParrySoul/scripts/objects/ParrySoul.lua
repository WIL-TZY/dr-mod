local ParrySoul, super = Class(Soul)

function ParrySoul:init(x, y)
    super:init(self, x, y)
    
    -- Default color is cyan {0,1,1}, but feel free to make it whatever you want.
    self.color = {0,1,1}
    -- Here's orange, if you want it.
    -- self.color = {1,(148/255),0}

    -- In Deltatraveler, this soul moves at half speed. Remove this line or set speed to 4 if you don't want that.
    self.speed = 2
    -- Disables focus. Why would you want to move even slower?
    self.allow_focus = false


    self.parry_timer = 0
    self.cooldown_timer = 0
    self.parry_inv = 0


    self.parry_sfx = Assets.getSound("bell_bounce_short")
    self.parried_sfx = Assets.getSound("eyeflash")
    self.parried_loop_sfx = nil

    -- Making sure it only parries once per Z press.
    self.did_parry = false

    -- Customizable stuff. Timing is in frames at 30 FPS.
    self.can_parry = true       -- Determines if you can parry at all.
    self.parry_window = 5       -- How large of a window you have to parry a bullet.
    self.parry_length = 30      -- Invincibility length after a successful parry.
    self.parry_cap = 60         -- Maximum duration for parry invincibility, in the event that multiple bullets are parried in quick succession.
    self.cooldown = 30          -- Recovery time between one parry and the next, assuming the first one failed.

end

function ParrySoul:update()
    super:update(self)
    if self.transitioning then
        if self.parried_loop_sfx then
            self.parried_loop_sfx:stop()
            self.parried_loop_sfx = nil
        end
        return
    end

    if self.parry_inv == 0 and self.did_parry then
        self.did_parry = false
    end
    if not self.parried_loop_sfx then
    self.parried_loop_sfx = Assets.getSound("chargeshot_charge")
    self.parried_loop_sfx:setLooping(true)
    self.parried_loop_sfx:setPitch(0.1)
    self.parried_loop_sfx:setVolume(0)
    self.parried_loop_sfx:play()
    end

    self.parried_loop_sfx:setPitch(Utils.clampMap(self.parry_inv, 0, self.parry_length / 2, 0.1,1))
    self.parried_loop_sfx:setVolume(Utils.clampMap(self.parry_inv, 0, self.parry_length / 2, 0, 1))

    if Input.pressed("confirm") and self:canParry() then
        self:flash()
        self.parry_sfx:stop()
        self.parry_sfx:play()
        self.parry_timer = self.parry_window
        self.cooldown_timer = self.cooldown
        self.did_parry = false
        self.once = false
    end

    if self.parry_timer > 0 then
        self.parry_timer = self.parry_timer - DTMULT            -- DTMULT should be consistent regardless of framerate.
    end
    if self.cooldown_timer > 0 then
        self.cooldown_timer = self.cooldown_timer - DTMULT      -- DTMULT should be consistent regardless of framerate.
    end
    if self.parry_inv > 0 then
        self.parry_inv = self.parry_inv - DTMULT                -- DTMULT should be consistent regardless of framerate.
    end



end

-- Why is this not a default function?
function ParrySoul:flash(sprite)
    local sprite_to_use = sprite or self.sprite
    local flash = FlashFade(sprite_to_use.texture, -10, -10)
    flash.layer = 100
    self:addChild(flash)
    return flash
end

function ParrySoul:canParry()
    -- Conditions for parrying:
    -- Not already parrying
    -- Cooldown is over
    -- Parrying is enabled
    -- Not in the middle of damage i-frames
    if self.parry_timer == 0 and self.cooldown_timer == 0 and self.can_parry == true and self.inv_timer == 0 then
        return true
    else
        return false
    end
end

function ParrySoul:draw()
    local r,g,b,a = self:getDrawColor()
    local heart_texture = Assets.getTexture(self.sprite.texture_path)
    local heart_w, heart_h = heart_texture:getDimensions()

    local charge_timer = self.parry_inv
    if charge_timer > 0 then
        local scale = math.abs(math.sin(charge_timer / 10)) + 1
        love.graphics.setColor(r,g,b,a*0.3)
        love.graphics.draw(heart_texture, -heart_w/2 * scale, -heart_h/2 * scale, 0, scale)

        scale = math.abs(math.sin(charge_timer / 14)) + 1.2
        love.graphics.setColor(r,g,b,a*0.3)
        love.graphics.draw(heart_texture, -heart_w/2 * scale, -heart_h/2 * scale, 0, scale)
    end

    -- Soul brightens when invincible
    if charge_timer > 0 then
        self.color = Utils.clampMap(self.parry_inv, 0, self.parry_cap / 2, {r,g,b},{1,1,1})
    end

    -- Soul darkens when on cooldown
    if self.cooldown_timer > 0 then
        self.color = Utils.clampMap(self.cooldown_timer, 0, self.cooldown / 2, {r,g,b},{(r * 0.5),(g * 0.5),(b * 0.5)})
    end

    super:draw(self)
    self.color = {r,g,b}

end

function ParrySoul:isParrying()
    if self.can_parry and (self.parry_timer > 0) then
        return true
    else
        return false
    end
end

function ParrySoul:onCollide(bullet)
    if self:isParrying() and not self.did_parry then
        self.parried_sfx:stop()
        self.parried_sfx:play()
        self.parry_inv = self.parry_inv + self.parry_length
        if self.parry_inv > self.parry_cap then
            self.parry_inv = self.parry_cap
        end
        self.did_parry = true
        self.cooldown_timer = 0             -- You can chain parries as long as you keep timing them.

    end
    if bullet.damage then
        if bullet.damage ~= 0 then bullet.parrydmg_old = bullet.damage end
    end
    if self.parry_inv > 0 then
        bullet.damage = 0
    else
        if bullet.parrydmg_old then
            bullet.damage = bullet.parrydmg_old
        else
            bullet.damage = nil
        end
    end
        super:onCollide(self, bullet)
end


return ParrySoul