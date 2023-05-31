local spell, super = Class(Spell, "swap_soul")

function spell:init()
    super:init(self)

    -- Display name
    self.name = "Swap Soul"
    -- Name displayed when cast (optional)
    self.cast_name = nil

    -- Battle description
    self.effect = "SOUL will\n turn red"
    -- Menu description
    self.description = "Changes the SOUL's color to red."

    -- TP cost
    self.cost = 60

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "none"

    -- Tags that apply to this spell
    self.tags = {"swap", "soulmode"}
    
end

function spell:onCast()
    Assets.playSound("spell_pacify")
    
    if Game:getFlag("swap") == nil then Game:setFlag("swap", false) end
    
    Game:setFlag("swap", not Game:getFlag("swap"))
end

return spell