local character, super = Class("noelle", true)

function character:init()
    super:init(self)

    self:addSpell("snowgrave")
    self:addSpell("swap_soul")
end

return character