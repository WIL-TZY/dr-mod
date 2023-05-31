local actor, super = Class(Actor, "shopkeepers/sans")

function actor:init()
    super:init(self)

    self.name = "Sans"

    self.width = 135
    self.height = 109
    
    self.voice = "sans"

    self.path = "shopkeepers/sans"
    self.default = "idle"

    self.animations = {
        ["idle"] = {"idle", function(sprite, wait)
            while true do
                sprite:setFrame(1)
                wait(2)
                for i = 2, 4 do
                    sprite:setFrame(i)
                    wait(5/30)
                end
            end
        end}
    }

    self.talk_sprites = {
        ["talk"] = 0.25,
        ["closed"] = 0.25,
        ["creepy"] = 0.25,
        ["eyelids"] = 0.25,
        ["eyelidslateral"] = 0.25,
        ["wink"] = 0.25,
        ["lateral"] = 0.25
    }
end

function actor:onTalkStart(text, sprite)
    if sprite.sprite == "idle" then
        sprite:setSprite("talk")
    end
end

function actor:onTalkEnd(text, sprite)
    if sprite.sprite == "talk" then --or "closed" or "creepy" or "eyelids" or "eyelidslateral" or "wink" or "lateral"
        sprite:setAnimation("idle")
    end
end

return actor