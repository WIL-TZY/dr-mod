local HealBullet, super = Class(Bullet)

function HealBullet:init(x, y, type, texture)
    super:init(self, x, y, texture)
    self.tp = 0
    self.type = type
    self.color = self:getTypeColor()
    self.override = false
    self.damage = 0
    self.heal = 5
    self.destroy_on_hit = true

end

function HealBullet:getHeal()
    return self.heal or 1
end

function HealBullet:onCollide(soul)
    if soul.inv_timer == 0 then
        self:onHeal(soul)
    end

    if self.destroy_on_hit then
        self:remove()
    end
end

function HealBullet:onHeal(soul) --(soul, target)
    --Assets.playSound("power") -- no need, since target:heal() already plays the sound
    --Assets.playSound("badexplosion", 1, 0.4)

    local amountHealed = self:getHeal()

    if amountHealed > 0 then --Game.battle:heal(-amountHealed, {0, 0.75, 0}, self:getTarget())
        
        if Game:getConfig("targetSystem") then
            local target = self:getTarget()
            target:heal(amountHealed)
        else
            local target = Utils.pick(Game.party)
            target:heal(amountHealed)
        end

        --target:heal(amountHealed)

        --soul:onCollide(self, amountHealed)
        --return target
    end
    return amountHealed
end

function HealBullet:getTypeColor()
    if self.type == "green" then
        return {0, 255, 0}
    end
end

return HealBullet