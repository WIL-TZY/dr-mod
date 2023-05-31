local item, super = Class(Item, "light/halfchocolate")

function item:init()
    super:init(self)

    -- Display name
    self.name = "Half-chocolate"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Whether this item is for the light world
    self.light = true

    -- Light world check text
    self.check = 'Half of a chocolate bar.'

    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"

    -- Battle description
    --self.effect = "Really\nstupid"
    -- Shop description
    --self.shop = "Radiates\nstupidity\nheals 1000HP"
    -- Menu description
    --self.description = "Completely worthless"

    -- Shop buy price
    self.buy_price = 0
    -- Shop sell price (usually half of buy price)
    self.sell_price = 0

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"
    -- Where this item can be used (world, battle, all, or none) ---> if chooses battle its name turns greyish in the inventory.
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {}
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    --self.dark_item = "spookysword"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions (key = party member id)
    self.reactions = {}
end

--[[
function item:onBattleSelect(user, target)
    -- Do not consume
    return false
end
]]

--[[
--overriding original convertToLight() function in item.lua to return true so the item isn't added to the ball of junk.
function item:convertToLight(inventory)
    if self.light_item then
        if self.light_location then
            inventory:addItemTo(self.light_location.storage, self.light_location.index, self.light_item)
            return true
        else
            return self.light_item
        end
     end
    return true
end
]]

function item:onWorldUse()
    --Game.world:showText("* You looked at the junk ball in\nadmiration.[wait:5]\n* Nothing happened.")
    --return false

    Game.world:startCutscene(function(cutscene)
            cutscene:wait(0.2)    
            Game.inventory:removeItem(self)
            Assets.playSound("bageldefeat")
            cutscene:wait(1.5)
            cutscene:text("* You threw it away because its taste was awful.")
    end)
    return false
end

function item:convertToDark(inventory)
    inventory:addItem("chocolate")
    return true
end

--[[
function item:onCheck()
    Game.world:showText({
        '* "Chocolate" - A chocolate bar bought from a local store.\n* It\'s cheap.'
    })
end
]]

return item