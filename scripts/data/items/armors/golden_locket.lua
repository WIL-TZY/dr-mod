local item, super = Class(Item, "golden_locket")

function item:init()
    super.init(self)

    -- Display name
    self.name = "GoldenLocket"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/armor"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "Heart-shaped charm.\nBelongs to mom."

    -- Default shop price (sell price is halved)
    self.price = 1000
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "world"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        defense = 3,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil --"ui/menu/icon/up"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        kris = true,
        --player = true,
        --ralsei = true,
    }

    -- Character reactions
    self.reactions = {
        susie = "... Nope. Too personal.",
        ralsei = "Uh, Kris...?",
        noelle = "... Azzy still has this jacket?",
    }
end

function item:canEquip(character, slot_type, slot_index)
    -- Default equippable to false, like weapons
    return self.can_equip[character.id]
end

function item:convertToLight(inventory)
    return "light/the_locket"
end

--[[
function item:convertToLightEquip(chara)
    return "light/the_locket"
end
]]

return item