local Jacksons, super = Class(Shop,  "jacksons")

function Jacksons:init()
    super:init(self)

    self.encounter_text = "[color:pink]* Welcome!"
    self.shop_text = "* (...)"
    self.leaving_text = "* I guess it's time to leave."
    -- Shown when you're in the BUY menu
    self.buy_menu_text = "Let's see\nwhat I\ncan take."
    -- Shown when you're about to buy something.
    self.buy_confirmation_text = "Buy it for\n%s ?"
    -- Shown when you refuse to buy something
    self.buy_refuse_text = "Didn't\nneed it\nanyway."
    -- Shown when you buy something
    self.buy_text = "There\nwe go."
    -- Shown when you buy something and it goes in your storage
    self.buy_storage_text = "There\nwe go."
    -- Shown when you don't have enough money to buy something
    self.buy_too_expensive_text = "I don't\nhave enough\nmoney for\nthis."
    -- Shown when you don't have enough space to buy something.
    self.buy_no_space_text = "I'm\ncarrying\ntoo much."
    -- Shown when something doesn't have a sell price
    self.sell_no_price_text = "Why would\nI sell\nthis?"
    -- Shown when you're in the SELL menu
    self.sell_menu_text = "Guess I\ncan get\nrid of\nstuff."
    -- Shown when you try to sell an empty spot
    self.sell_nothing_text = "Nothing\nto give."
    -- Shown when you're about to sell something.
    self.sell_confirmation_text = "Sell it for\n%s ?"
    -- Shown when you refuse to sell something
    self.sell_refuse_text = "I'd\nrather\nhold on\nto this."
    -- Shown when you sell something
    self.sell_text = "There\nwe go."
    -- Shown when you have nothing in a storage
    self.sell_no_storage_text = "Nothing\nin there."
    -- Shown when you enter the talk menu.
    self.talk_text = "Guess I\nshould\nthink."

    self.sell_options_text["items"]   = "What\nshould\nI sell?"
    self.sell_options_text["weapons"] = "What\nshould\nI sell?"
    self.sell_options_text["armors"]  = "What\nshould\nI sell?"
    self.sell_options_text["storage"] = "What\nshould\nI sell?"

    self:registerItem("cell_phone", {stock = 10, color = {1, 0.8, 1, 1}, price = -14, description = "*\n|_\n(O)    Sell phoe\n|#|\n'-'", name="Pone"})
    self:registerItem("tensionbit")
    self:registerItem("manual")
    --self:registerItem("amber_card", {bonuses = {defense = math.huge}})

    self:registerTalk("Reflect")
    self:registerTalk("Where I Am")
    self:registerTalk("Who Am I Talking To")
    self:registerTalk("What Is Going To Happen")

    self:registerTalkAfter("Myself", 1)
    self:registerTalkAfter("Why Am I Here", 2)

    --[[self.shopkeeper:setActor("shopkeepers/seam")
    self.shopkeeper.sprite:setPosition(-24, 12)
    self.shopkeeper.slide = true

    self.background = "ui/shop/bg_seam"]]

    self.background = "ui/shop/bg_seam"

    --self.background = nil
end

function Jacksons:postInit()
    --super.postInit(self)

    self:processReplacements()

    -- Make a sprite for the background
    if self.background and self.background ~= "" then
        self.background_sprite = Sprite(self.background, 0, 0)
        self.background_sprite:setScale(2, 2)
        self.background_sprite.layer = SHOP_LAYERS["background"]
        self:addChild(self.background_sprite)
    end

    -- Construct the UI

    -- this is the large box
    self.large_box = UIBox()
    local left, top = self.large_box:getBorder()
    self.large_box:setOrigin(0, 1)
    self.large_box.x = left
    self.large_box.y = SCREEN_HEIGHT - top + 1
    self.large_box.width = SCREEN_WIDTH - (top * 2) + 1
    self.large_box.height = 213 - 37 + 1
    self.large_box:setLayer(SHOP_LAYERS["large_box"])

    self.large_box.visible = false

    self:addChild(self.large_box)
  
    -- this is the left box
    self.left_box = UIBox()
    local left, top = self.left_box:getBorder()
    self.left_box:setOrigin(0, 1)
    self.left_box.x = left
    self.left_box.y = SCREEN_HEIGHT - top + 1
    self.left_box.width = 338 + 14
    self.left_box.height = 213 - 37 + 1
    self.left_box:setLayer(SHOP_LAYERS["left_box"])

    self:addChild(self.left_box)

    -- this is the box1 (left)
    self.box_1 = UIBox()
    local left, top = self.box_1:getBorder()
    self.box_1:setOrigin(0, 1)
    self.box_1.x = left
    self.box_1.y = SCREEN_HEIGHT - top + 1
    self.box_1.width = 160
    self.box_1.height = 213 - 37 + 1
    self.box_1:setLayer(SHOP_LAYERS["above_boxes"])

    self:addChild(self.box_1)

    -- this is the box 2 (center)
    self.box_2 = UIBox()
    self.box_2:setOrigin(0,1)
    self.box_2.x = 240
    self.box_2.y = SCREEN_HEIGHT - top + 1
    self.box_2.width = 160
    self.box_2.height = 213 - 37 + 1
    self.box_2:setLayer(SHOP_LAYERS["above_boxes"])

    self:addChild(self.box_2)

    -- this is the box 3 (right)
    self.box_3 = UIBox()
    local left, top = self.box_3:getBorder()
    self.box_3:setOrigin(0, 1)
    self.box_3.x = 448
    self.box_3.y = SCREEN_HEIGHT - top + 1
    self.box_3.width = 160
    self.box_3.height = 213 - 37 + 1
    self.box_3:setLayer(SHOP_LAYERS["above_boxes"])
    
    self:addChild(self.box_3)

    -- this is the selection box
    self.selection_box = UIBox()
    local left, top = self.selection_box:getBorder()
    self.selection_box:setOrigin(1, 1)
    self.selection_box.x = 613
    self.selection_box.y = SCREEN_HEIGHT - 260
    self.selection_box.width = 580
    self.selection_box.height = 20
    self.selection_box:setLayer(SHOP_LAYERS["right_box"])

    self:addChild(self.selection_box)
    
    -- this is the right box
    self.right_box = UIBox()
    local left, top = self.right_box:getBorder()
    self.right_box:setOrigin(1, 1)
    self.right_box.x = SCREEN_WIDTH - left + 1
    self.right_box.y = SCREEN_HEIGHT - top + 1
    self.right_box.width = 20 + 156 + 1
    self.right_box.height = 213 - 37 + 1
    self.right_box:setLayer(SHOP_LAYERS["right_box"])

    self:addChild(self.right_box)

    -- this is the info box
    self.info_box = UIBox()
    local left, top = self.info_box:getBorder()
    local right_left, right_top = self.right_box:getBorder()
    self.info_box:setOrigin(1, 1)
    self.info_box.x = SCREEN_WIDTH - left + 1
    -- find a more elegant way to do this...
    self.info_box.y = SCREEN_HEIGHT - top - self.right_box.height - (right_top * 2) + 16 + 1
    self.info_box.width = 20 + 156 + 1
    self.info_box.height = 213 - 37
    --self.info_box:setLayer(SHOP_LAYERS["info_box"])
    self.info_box:setLayer(SHOP_LAYERS["below_dialogue"])
    

    self.info_box.visible = false

    self:addChild(self.info_box)

    local emoteCommand = function(text, node)
        self:onEmote(node.arguments[1])
    end

    --DialogueText:init(text, x, y, w, h, options)
    --self.dialogue_text = DialogueText(nil, 30, 270, 372, 194)
    self.dialogue_text = DialogueText(nil, 30, 270, 372, 194)

    self.dialogue_text:registerCommand("emote", emoteCommand)

    self.dialogue_text:setLayer(SHOP_LAYERS["dialogue"])
    self:addChild(self.dialogue_text)
    self:setDialogueText(self.encounter_text)

    self.right_text = DialogueText("", 30 + 420, 260, 176, 206)

    self.right_text:registerCommand("emote", emoteCommand)

    self.right_text:setLayer(SHOP_LAYERS["dialogue"])
    self:addChild(self.right_text)
    self:setRightText("")

    self.talk_dialogue = { self.dialogue_text, self.right_text }
end --of postInit()


------------------- FOR MAKING BOXES VISIBLE DEPENDING ON STAT ---------------------
function Jacksons:onStateChange(old,new)
    Game.key_repeat = false
    self.buy_confirming = false
    self.sell_confirming = false
    if new == "MAINMENU" then
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        ---------------------------------
        self.selection_box.visible = true
        self.box_1.visible = true
        self.box_2.visible = true
        self.box_3.visible = true
        ---------------------------------
        self.info_box.visible = false
        self.dialogue_text.width = 372
        self:setDialogueText(self.shop_text)
        self:setRightText("")
    elseif new == "BUYMENU" then
        self:setDialogueText("")
        self:setRightText(self.buy_menu_text)
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        ---------------------------------
        self.selection_box.visible = true
        self.box_1.visible = false
        self.box_2.visible = false
        self.box_3.visible = false
        ---------------------------------
        self.info_box.visible = true
        self.info_box.height = -8
        self.box_ease_timer = 0
        self.box_ease_beginning = -8
        if #self.items > 0 then
            self.box_ease_top = 220 - 48
        else
            self.box_ease_top = -8
        end
        self.box_ease_method = "outExpo"
        self.box_ease_multiplier = 1
        self.current_selecting = 1
    elseif new == "SELLMENU" then
        self:setDialogueText("")
        if not self.state_reason then
            self:setRightText(self.sell_menu_text)
        end
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        ---------------------------------
        self.selection_box.visible = true
        self.box_1.visible = false
        self.box_2.visible = false
        self.box_3.visible = false
        ---------------------------------
        self.info_box.visible = false
    elseif new == "SELLING" then
        Game.key_repeat = true
        self:setDialogueText("")
        if self.state_reason and type(self.state_reason) == "table" then
            if self.sell_options_text[self.state_reason[2]] then
                self:setRightText(self.sell_options_text[self.state_reason[2]])
            else
                self:setRightText("Invalid\nmenu\ntext")
            end
        else
            self:setRightText("Invalid\nstate\nreason")
        end
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        ---------------------------------
        self.selection_box.visible = false
        self.box_1.visible = false
        self.box_2.visible = false
        self.box_3.visible = false
        ---------------------------------
        self.info_box.visible = false
        self.item_current_selecting = 1
        self.item_offset = 0
    elseif new == "TALKMENU" then
        self:setDialogueText("")
        self:setRightText(self.talk_text)
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        ---------------------------------
        self.selection_box.visible = true
        self.box_1.visible = false
        self.box_2.visible = false
        self.box_3.visible = false
        ---------------------------------
        self.info_box.visible = false
        if self.state_reason ~= "DIALOGUE" then
            self.current_selecting = 1
        end
        self:processReplacements()
        self:onTalk()
    elseif new == "LEAVE" then
        self:setRightText("")
        self.large_box.visible = true
        self.left_box.visible = false
        self.right_box.visible = false
        ---------------------------------
        self.selection_box.visible = true
        self.box_1.visible = true
        self.box_2.visible = true
        self.box_3.visible = true
        ---------------------------------
        self.info_box.visible = false
        self:onLeave()
    elseif new == "LEAVING" then
        self:setRightText("")
        self:setDialogueText("")
        self.large_box.visible = true
        self.left_box.visible = false
        self.right_box.visible = false
        ---------------------------------
        self.selection_box.visible = false
        self.box_1.visible = true
        self.box_2.visible = true
        self.box_3.visible = true
        ---------------------------------
        self.info_box.visible = false
        self:leave()
    elseif new == "DIALOGUE" then
        self.dialogue_text.width = 598
        self:setRightText("")
        self.large_box.visible = true
        self.left_box.visible = false
        self.right_box.visible = false
        ---------------------------------
        self.selection_box.visible = false
        self.box_1.visible = true
        self.box_2.visible = true
        self.box_3.visible = true
        ---------------------------------
        self.info_box.visible = false
    end


    -----------------------------ADDED STUFF----------------------------
    local buymenutext = Utils.pick({ 1, 2 })
    if (buymenutext == 1) then
        self.buy_menu_text = "Do you\neven have\nmoney?"
    elseif (buymenutext == 2) then
        self.buy_menu_text = "What would\nyou like\nto buy?"
    end

    local shopmenutext = Utils.pick({ 1, 2 })
    if (shopmenutext == 1) then
        self.shop_text = "* It's ok."
    elseif (shopmenutext == 2) then
        self.shop_text = "* What would you like to buy?"
    end

    local talkmenutext = Utils.pick({ 1, 2 })
    if (talkmenutext == 1) then
        self.talk_text = "We...\nAre The Crystal Gems."
    elseif (talkmenutext == 2) then
        self.talk_text = "What would\nyou want \nto talk\nabout?"
    end
end --of onStateChange()

--added hard-coded values to change offset for text in the UI talkmenu.
--Must be super.super.draw(self) in line 355 instead of super.draw(self). Alternatively, can be just Object.draw(self).
function Jacksons:draw()
    self:drawBackground()

    super.super.draw(self)

    love.graphics.setFont(self.font)
    if self.state == "MAINMENU" then
        love.graphics.setColor(COLORS.white)
        for i = 1, #self.menu_options do
            love.graphics.print(self.menu_options[i][1], 13 + (i * 80), 194)
        end
        love.graphics.setColor(Game:getSoulColor())
        love.graphics.draw(self.heart_sprite, 18 + (self.main_current_selecting * 50), 203 )
    elseif self.state == "BUYMENU" then
        -- Item type (item, key, weapon, armor)
        for i = 1, math.max(4, #self.items) do
            local item = self.items[i]
            if not item then
                -- If the item is null, add some empty space
                love.graphics.setColor(COLORS.dkgray)
                love.graphics.print("--------", 60, 220 + (i * 40))
            elseif item.options["stock"] and (item.options["stock"] <= 0) then
                -- If we've depleted the stock, show a "sold out" message
                love.graphics.setColor(COLORS.gray)
                love.graphics.print("--SOLD OUT--", 60, 220 + (i * 40))
            else
                love.graphics.setColor(item.options["color"])
                love.graphics.print(item.options["name"], 60, 220 + (i * 40))
                if not self.hide_price then
                    love.graphics.setColor(COLORS.white)
                    love.graphics.print(string.format(self.currency_text, item.options["price"] or 0), 60 + 240,
                        220 + (i * 40))
                end
            end
        end
        love.graphics.setColor(COLORS.white)
        love.graphics.print("Exit", 60, 220 + ((math.max(4, #self.items) + 1) * 40))
        love.graphics.setColor(Game:getSoulColor())
        if not self.buy_confirming then
            love.graphics.draw(self.heart_sprite, 30, 230 + (self.current_selecting * 40))
        else
            love.graphics.draw(self.heart_sprite, 30 + 420, 230 + 80 + 10 + (self.current_selecting_choice * 30))
            love.graphics.setColor(COLORS.white)
            local lines = Utils.split(
                    string.format(self.buy_confirmation_text,
                        string.format(self.currency_text, self.items[self.current_selecting].options["price"] or 0)),
                    "\n")
            for i = 1, #lines do
                love.graphics.print(lines[i], 60 + 400, 420 - 160 + ((i - 1) * 30))
            end
            love.graphics.print("Yes", 60 + 420, 420 - 80)
            love.graphics.print("No", 60 + 420, 420 - 80 + 30)
        end
        love.graphics.setColor(COLORS.white)

        if (self.current_selecting <= #self.items) then
            local current_item = self.items[self.current_selecting]
            local box_left, box_top = self.info_box:getBorder()

            local left = self.info_box.x - self.info_box.width - (box_left / 2) * 1.5
            local top = self.info_box.y - self.info_box.height - (box_top / 2) * 1.5
            local width = self.info_box.width + box_left * 1.5
            local height = self.info_box.height + box_top * 1.5

            Draw.pushScissor()
            Draw.scissor(left, top, width, height)

            love.graphics.setColor(COLORS.white)
            love.graphics.print(current_item.options["description"], left + 32, top + 20)

            if current_item.item.type == "armor" or current_item.item.type == "weapon" then
                for i = 1, #Game.party do
                    local offset_x = 0
                    local offset_y = 0
                    -- TODO: more than 3 party member support
                    if i == 1 then
                        offset_x = 0
                        offset_y = 0
                    elseif i == 2 then
                        offset_x = 100
                        offset_y = 0
                    elseif i == 3 then
                        offset_x = 0
                        offset_y = 45
                    end
                    local party_member = Game.party[i]
                    local can_equip = party_member:canEquip(current_item.item)
                    local head_path = ""

                    love.graphics.setFont(self.plain_font)
                    love.graphics.setColor(COLORS.white)

                    if can_equip then
                        head_path = Assets.getTexture(party_member:getHeadIcons() .. "/head")
                        if current_item.item.type == "armor" then
                            love.graphics.draw(self.stat_icons["defense_1"], offset_x + 470, offset_y + 127 + top)
                            love.graphics.draw(self.stat_icons["defense_2"], offset_x + 470, offset_y + 147 + top)

                            for j = 1, 2 do
                                self:drawBonuses(party_member, party_member:getArmor(j), current_item.options["bonuses"],
                                    "defense", offset_x + 470 + 21, offset_y + 127 + ((j - 1) * 20) + top)
                            end
                        elseif current_item.item.type == "weapon" then
                            love.graphics.draw(self.stat_icons["attack"], offset_x + 470, offset_y + 127 + top)
                            love.graphics.draw(self.stat_icons["magic"], offset_x + 470, offset_y + 147 + top)
                            self:drawBonuses(party_member, party_member:getWeapon(), current_item.options["bonuses"],
                                "attack", offset_x + 470 + 21, offset_y + 127 + top)
                            self:drawBonuses(party_member, party_member:getWeapon(), current_item.options["bonuses"],
                                "magic", offset_x + 470 + 21, offset_y + 147 + top)
                        end
                    else
                        head_path = Assets.getTexture(party_member:getHeadIcons() .. "/head_error")
                    end

                    love.graphics.draw(head_path, offset_x + 426, offset_y + 132 + top)
                end
            end

            Draw.popScissor()

            love.graphics.setColor(COLORS.white)

            if not self.hide_storage_text then
                love.graphics.setFont(self.plain_font)

                local current_storage = Game.inventory:getDefaultStorage(current_item.item)
                local space = Game.inventory:getFreeSpace(current_storage)

                if space <= 0 then
                    love.graphics.print("NO SPACE", 521, 430)
                else
                    love.graphics.print("Space:" .. space, 521, 430)
                end
            end
        end
    elseif self.state == "SELLMENU" then
        love.graphics.setColor(Game:getSoulColor())
        love.graphics.draw(self.heart_sprite, 50, 230 + (self.sell_current_selecting * 40))
        love.graphics.setColor(COLORS.white)
        love.graphics.setFont(self.font)
        for i, v in ipairs(self.sell_options) do
            love.graphics.print(v[1], 80, 220 + (i * 40))
        end
        love.graphics.print("Return", 80, 220 + ((#self.sell_options + 1) * 40))
    elseif self.state == "SELLING" then
        if self.item_current_selecting - self.item_offset > 5 then
            self.item_offset = self.item_offset + 1
        end

        if self.item_current_selecting - self.item_offset < 1 then
            self.item_offset = self.item_offset - 1
        end

        local inventory = Game.inventory:getStorage(self.state_reason[2])

        if inventory and inventory.sorted then
            if self.item_offset + 5 > #inventory then
                if #inventory > 5 then
                    self.item_offset = self.item_offset - 1
                end
            end
            if #inventory == 5 then
                self.item_offset = 0
            end
        end

        love.graphics.setColor(Game:getSoulColor())

        love.graphics.draw(self.heart_sprite, 30, 230 + ((self.item_current_selecting - self.item_offset) * 40))
        if self.sell_confirming then
            love.graphics.draw(self.heart_sprite, 30 + 420, 230 + 80 + 10 + (self.current_selecting_choice * 30))
            love.graphics.setColor(COLORS.white)
            local lines = Utils.split(
                    string.format(self.sell_confirmation_text,
                        string.format(self.currency_text, inventory[self.item_current_selecting]:getSellPrice())), "\n")
            for i = 1, #lines do
                love.graphics.print(lines[i], 60 + 400, 420 - 160 + ((i - 1) * 30))
            end
            love.graphics.print("Yes", 60 + 420, 420 - 80)
            love.graphics.print("No", 60 + 420, 420 - 80 + 30)
        end

        love.graphics.setColor(COLORS.white)

        if inventory then
            for i = 1 + self.item_offset, self.item_offset + math.min(5, inventory.max) do
                local item = inventory[i]
                love.graphics.setFont(self.font)

                if item then
                    love.graphics.setColor(COLORS.white)
                    love.graphics.print(item:getName(), 60, 220 + ((i - self.item_offset) * 40))
                    if item:isSellable() then
                        love.graphics.print(string.format(self.currency_text, item:getSellPrice()), 60 + 240,
                            220 + ((i - self.item_offset) * 40))
                    end
                else
                    love.graphics.setColor(COLORS.dkgray)
                    love.graphics.print("--------", 60, 220 + ((i - self.item_offset) * 40))
                end
            end

            local max = inventory.max
            if inventory.sorted then
                max = #inventory
            end

            love.graphics.setColor(COLORS.white)

            if max > 5 then
                for i = 1, max do
                    local percentage = (i - 1) / (max - 1)
                    local height = 129

                    local draw_location = percentage * height

                    local tocheck = self.item_current_selecting
                    if self.sell_confirming then
                        tocheck = self.current_selecting_choice
                    end

                    if i == tocheck then
                        love.graphics.rectangle("fill", 372, 292 + draw_location, 9, 9)
                    elseif inventory.sorted then
                        love.graphics.rectangle("fill", 372 + 3, 292 + 3 + draw_location, 3, 3)
                    end
                end

                -- Draw arrows
                if not self.sell_confirming then
                    local sine_off = math.sin((Kristal.getTime() * 30) / 6) * 3
                    if self.item_offset + 4 < (max - 1) then
                        love.graphics.draw(self.arrow_sprite, 370, 149 + sine_off + 291)
                    end
                    if self.item_offset > 0 then
                        love.graphics.draw(self.arrow_sprite, 370, 14 - sine_off + 291 - 25, 0, 1, -1)
                    end
                end
            end
        else
            love.graphics.print("Invalid storage", 60, 220 + (1 * 40))
        end
    elseif self.state == "TALKMENU" then
        love.graphics.setColor(Game:getSoulColor())
        love.graphics.draw(self.heart_sprite, 30, 230 + (self.current_selecting * 40))
        love.graphics.setColor(COLORS.white)
        love.graphics.setFont(self.font)
        for i = 1, math.max(4, #self.talks) do
            local v = self.talks[i]
            if v then
                love.graphics.setColor(v[2].color)
                love.graphics.print(v[1], 60, 220 + (i * 40))
            else
                love.graphics.setColor(COLORS.dkgray)
                love.graphics.print("--------", 60, 220 + (i * 40))
            end
        end
        love.graphics.setColor(COLORS.white)
        love.graphics.print("Exit", 60, 220 + ((math.max(4, #self.talks) + 1) * 40))
    end

    if self.state == "MAINMENU" then
        love.graphics.setColor(COLORS.white) -- if this is commented, color becomes red
        love.graphics.print(string.format(self.currency_text, Game.money), 500, 193) --before, x = 440 / y = 420
    elseif
        self.state == "BUYMENU" or
        self.state == "SELLMENU" or
        self.state == "SELLING" or
        self.state == "TALKMENU" then
        love.graphics.setColor(COLORS.white)
        love.graphics.setFont(self.font)
        love.graphics.print(string.format(self.currency_text, Game.money), 440, 420)
    end

    love.graphics.setColor(0, 0, 0, self.fade_alpha)
    love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
end --of draw()


function Jacksons:startTalk(talk)
    if talk == "Reflect" then
        self:startDialogue({
            "* Here we are.[wait:5]\n* Not saying I know where I am,[wait:5] but.\n* You take what you can get.",
            "* I can't see anything.[wait:5]\n* I can only feel around.",
            "* [emote:impatient]Which is a little odd.[wait:5] Because I can't find the way out either.",
            "* [emote:laugh]But whatever.[wait:5]\n* It's calm.[wait:5]\n* Quiet.[wait:5]\n* A great place to do some thinking.",
            "* [emote:laugh]If I want to hear myself think.",
            "* [emote:talk]But that's neither here or there.[wait:5]\n* What's important is,[wait:5] we're here.",
            "* [emote:oh]Where is here,[wait:5] exactly?",
            "* [emote:laugh]I don't know.",
            "* [emote:talk]If I knew,[wait:5] I wouldn't have said that I don't know just now.",
            "* But I know exactly where we are.[wait:5]\n* Where I am.[wait:5]\n* Not like I was lying earlier.",
            "* I don't know where I am.[wait:5]\n* But I do.",
            "* All that to say,[wait:5] I know that I'm supposed to be here.",
            "* I'm here.",
            "* And I'm supposed to be here.",
            "* That's all that matters."
        })
    elseif talk == "Myself" then
        if not self:getFlag("talk_myself", false) then
            self:setFlag("talk_myself", true)
            self:startDialogue({
                "* What does this even mean?[wait:5]\n* I'm fine.",
                "* Obviously I'm fine.",
                "* Would someone who isn't fine be able to make it all the way here?",
                "* I don't think so.",
                "* There's nothing wrong.[wait:5]\n* I'm okay.",
                "* I'm fine."
            })
        else
            self:startDialogue({
                "* I'm fine."
            })
        end
    elseif talk == "Where I Am" then
        self:startDialogue({
            "* Where this is isn't important.",
            "* I mean,[wait:5] hey,[wait:5] it might be to some people.",
            "* Not you.",
            "* No,[wait:5] this place is utterly worthless for you.[wait:5]\n* Not that I know how you're here,[wait:5] too.",
            "* Actually,[wait:5] I don't think you're here at all.[wait:5]\n* I'm just talking to myself.",
            "* It's just me.",
            "* Me and my thoughts alone."
        })
    elseif talk == "Why Am I Here" then
        self:startDialogue({
            "* I'm here for one reason.",
            "* I may not know what it is,[wait:5] but I know that it's important.",
            "* Now that I think about it,[wait:5] I really know just about nothing about what I'm doing.",
            "* So again I ask,[wait:5] why am I here?",
            "* I guess we'll just have to find out."
        })
    elseif talk == "Who Am I Talking To" then
        self:startDialogue({
            "* Good question.",
            "* I'm just talking to myself.",
            "* That's all."
        })
    elseif talk == "What Is Going To Happen" then
        self:startDialogue({
            "* If I knew,[wait:5] I'd be a lot more confident.",
            "* I don't know why I'm not,[wait:5] though.[wait:5]\n* It must be a weird mental thing.",
            "* Because I know I'm supposed to be here.",
            "* And everything will go how it should.",
            "* I really have no input on this.",
            "* ...",
            "* So yes,[wait:5] I don't know what's going to happen.[wait:5]\n* But It'll work."
        })
    end
end

return Jacksons