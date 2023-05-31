local item, super = Class(Item, "light/chocolate")

function item:init()
    super:init(self)

    -- Display name
    self.name = "Chocolate"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Whether this item is for the light world
    self.light = true

    -- Light world check text
    self.check = 'A chocolate bar bought from a local store.\n* It\'s cheap.'

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

    --self.dark_item = "chocolate"

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

    Game.world:startCutscene(function(cutscene)

        cutscene:text("* You took the chocolate from \nyour pocket.[wait:5]")
        cutscene:text("* You remember these as one of those cheap chocolates with a soapy aftertaste.")
        cutscene:text("* ...[wait:10]\n* Your dad used to buy them frequently.")      
        cutscene:text("* Eat it anyway?")

        local dropped
            dropped = cutscene:choicer({"Yes", "No"}) == 1 --setting as "2" inverts "Yes" and "No" like it is in Chapter 1.

        if dropped then
            Game.inventory:removeItem(self)
            Assets.playSound("item")
            cutscene:text("* You felt nostalgic and ate the entire bar in one go.")

        else
            cutscene:text("* You looked at the chocolate bar with disgust.")
        end
    end)
    return false
end

function item:convertToDark(inventory)
    local chocolate = inventory:addItem("chocolate")
    chocolate.flags = self.flags
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