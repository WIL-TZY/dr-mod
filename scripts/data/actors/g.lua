local actor, super = Class(Actor, "g")

function actor:init()
    super:init(self)

    -- Display name (optional)
    self.name = "w.d. gaster"

    -- Width and height for this actor, used to determine its center
    self.width = 22
    self.height = 39

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {0, 5, 22, 39}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 0, 0}

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "npcs/gaster/idle"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = ""
    
    -- Sound to play when this actor speaks (optional)
    self.voice = "wngdng1" --"wngdng1"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = ""
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil --{-5, 0}

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {
        [""] = 0.2
    }

    -- Table of sprite animations
    self.animations = {}

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {}
end

--[[
function actor:getVoice()
    return Utils.pick{"wngdng1", "wngdng2", "wngdng3", "wngdng4", "wngdng5", "wngdng6", "wngdng7"}
end
]]

return actor