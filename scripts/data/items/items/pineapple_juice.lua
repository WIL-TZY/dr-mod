local item, super = Class(HealItem, "pineapple")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Apple Juice"

    -- Item type (item, key, weapon, armor)
    self.type = "item"

    -- Item icon (for equipment)
    self.icon = nil

    -- Amount healed (HealItem variable)
    if Game.chapter == 1 then
        self.heal_amount = 10
    else
        self.heal_amount = 40
    end

    -- Battle description
    self.effect = "Heals\nteam\n"..self.heal_amount.."HP"
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "Apple juice.\nHeals "..self.heal_amount.." HP."

    -- Default shop price (sell price is halved)
    --self.price = 70
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"
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
        susie = "I've tasted better!",
        ralsei = "(Kris, did you make it yourself...?)",
        noelle = "(Reminds me of middle school.)"
    }

    -- Item this item will get turned into when consumed
    self.result_item = nil
end

function item:convertToLight(inventory)
    return "light/applejuice"
end

return item