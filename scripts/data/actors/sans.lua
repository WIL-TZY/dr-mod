local actor, super = Class(Actor, "sans")

function actor:init()
    super:init(self)

    -- Display name (optional)
    self.name = "sans"

    -- Width and height for this actor, used to determine its center
    self.width = 23
    self.height = 30

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {0, 5, 22, 39}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 0, 0} --{0,255,255}

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "npcs/sans"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "idle"

    -- Sound to play when this actor speaks (optional)
    self.voice = "sans"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = "face/sans"
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
    self.offsets = {
        -- Movement offsets
        ["idle"] = {0, 15},

    }
    
end

return actor