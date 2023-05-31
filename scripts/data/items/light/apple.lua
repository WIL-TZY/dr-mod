local item, super = Class(Item, "light/apple")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Apple"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Whether this item is for the light world
    self.light = true

    -- Light world check text
    self.check = "Just good ol' apple. Use it to heal 5 HP."

    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"

    -- Item this item will get turned into when consumed
    self.result_item = nil

    self.flags = {
        ["interact_count"] = 0
    }
end

function item:onWorldUse()
    if self:getFlag("interact_count") == 0 then
    Assets.playSound("item")
    Game.world:showText("* You nibbled the apple.")
    self:addFlag("interact_count")
    return false

    elseif self:getFlag("interact_count") == 1 then
    Assets.playSound("item")
    Game.world:showText("* You nibbled the apple.")
    self:addFlag("interact_count")
    return false
    
    elseif self:getFlag("interact_count") == 2 then
    Assets.playSound("item")
    Game.world:showText("* Congratulations! You ate the entire apple.")
    self:setFlag("interact_count", 0)
    return true
    end
end

function item:convertToDark(inventory)
    return "applejuice"
end

return item