local item, super = Class(LightEquipItem, "light/the_locket")

function item:init()
    super.init(self)

    -- Display name
    self.name = "The Locket"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Whether this item is for the light world
    self.light = true

    -- Light world check text
    self.check = 'Armor 1 DF\n* It says "Forever in my Heart".'

    self.equip = false;
    
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "world"
    -- Item this item will get turned into when consumed
    self.result_item = nil

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack = 0,
        defense = 1
    }

    -- Default dark item conversion for this item
    self.dark_item = "golden_locket"
end

--[[
function item:onWorldUse()
    Game.world:showText("* There's a picture of you,[wait:5] your mother, and your brother.")
    return false
end
]]

function item:showEquipText()
    Game.world:showText("* You equipped "..self:getName()..".")
end


function item:onWorldUse(target)
    --initial cutscene
    Game.world:startCutscene(function(cutscene)
        cutscene:text("* You open the locket to see the picture inside of it.")
        cutscene:text("* It's of you,[wait:5] your mother, and your brother.")
        cutscene:text("* ...[wait:10]\n* You could have sworn the photo used to be different.")
        cutscene:text("* Do you want to equip it?")
        local locket
        locket = cutscene:choicer({"Yes", "No"}) == 1

        -- says "YES" to equip
            if locket then
                Game:setFlag("locket_item_yes", true)

                Assets.playSound("item")
                
                local chara = Game.party[1]
                local replacing = nil
                
                if self.type == "armor" then
                    if chara:getArmor(1) then
                    replacing = chara:getArmor(1)
                    replacing:onUnequip(chara, self)
                    Game.inventory:replaceItem(self, replacing)
                    end
                chara:setArmor(1, self)
                else
                error("LightEquipItem "..self.id.." invalid type: "..self.type)
                end

                    self:onEquip(chara, replacing)
                    --self:showEquipText()
                    cutscene:text("* You equipped The Locket.")

            -- says "NO" to equip
            else
                Game:setFlag("locket_item_no", true)
                cutscene:text("* It isn't yours, after all.")
            end
    end)
        

    return false
    
end


function item:convertToDarkEquip(chara)
    return "golden_locket"
end



return item