local item, super = Class(HealItem, "chocolate")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Choco"

    -- Item type (item, key, weapon, armor)
    self.type = "item"

    -- Item icon (for equipment)
    self.icon = nil

    self.heal_amount = 90
 
    -- Battle description
    self.effect = "Heals\nteam\n"..self.heal_amount.."HP"

    -- Shop description
    self.shop = ""

    -- Menu description
    self.description = "Everyone loves some chocolate.\nHeals "..self.heal_amount.." HP."

    -- Default shop price (sell price is halved)
    self.price = 70

    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "party"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"

    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {}
    
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions (key = party member id)
    self.reactions = {
        susie = "I've tasted better.",
        ralsei = "Thanks..! Kris...",
        noelle = "(Kris, where did you get this..?)"
    }

    -- Item this item will get turned into when consumed
    self.result_item = nil
end

function item:convertToLight(inventory)
    return "light/chocolate"
end

return item