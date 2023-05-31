local SansShop, super = Class(Shop, "sans_shop")



function SansShop:init()
    super:init(self)

    --self.font = Assets.getFont("comicsnas") --> this changes the shop menu font, but not character text.
    self.background = "ui/shop/sans_background"
    self.voice = "sans"
    -- Alternatively, put "[voice:sans]" inside the text string. Can put in the middle of a sentence for cool effects.

    Game.money = 40
    --Game.lw_money is set to "2"
    --Game.money = Game.lw_money

    self.currency_text = "$%d"

    self.encounter_text = "[font:comicsnas][emote:idle]* heya, kid.\nwelcome to sans."

    --self.shop_text = "[font:comicsnas]* it's ok, i won't judge." --"* (...)"

    self.leaving_text = "[font:comicsnas]* take it easy."
    -- Shown when you're in the BUY menu

    --self.buy_menu_text = "[font:comicsnas]do you\neven have\nmoney?"
    -- Shown when you're about to buy something.

    self.buy_confirmation_text = "Buy it for\n%s ?"
    -- Shown when you refuse to buy something
    self.buy_refuse_text = "[font:comicsnas]Didn't\nneed it\nanyway."
    -- Shown when you buy something
    self.buy_text = "[font:comicsnas]Bone Apettit."
    -- Shown when you buy something and it goes in your storage
    self.buy_storage_text = "[font:comicsnas]There\nwe go."
    -- Shown when you don't have enough money to buy something
    self.buy_too_expensive_text = "[font:comicsnas]You don't\nhave money\nfor this."
    -- Shown when you don't have enough space to buy something.
    self.buy_no_space_text = "[font:comicsnas]You're\ncarrying\ntoo much."
    -- Shown when something doesn't have a sell price
    self.sell_no_price_text = "[font:comicsnas]Why would\ni sell\nthis?"
    -- Shown when you're in the SELL menu
    self.sell_menu_text = "[font:comicsnas]i'm a seller,[wait:5]\nnot a buyer."
    -- Shown when you try to sell an empty spot
    self.sell_nothing_text = "[font:comicsnas]nothing\nto give."
    -- Shown when you're about to sell something.
    self.sell_confirmation_text = "[font:comicsnas]sell it for\n%s ?"
    -- Shown when you refuse to sell something
    self.sell_refuse_text = "[font:comicsnas]i'd\nrather\nhold on\nto this."
    -- Shown when you sell something
    self.sell_text = "[font:comicsnas]there\nwe go."
    -- Shown when you have nothing in a storage
    self.sell_no_storage_text = "[font:comicsnas]nothing\nin there."
    -- Shown when you enter the talk menu.

    --self.talk_text = "[font:comicsnas]you wanna chat right at my work hours?"
    --self.talk_text = "[font:comicsnas]you want\nto chat?[wait:10]\njust call\nme, kid."

    --self.buy_confirming = true

    self.menu_options = {
        { "Buy",  "BUYMENU" },
        { "Sell", function()
            self:startDialogue({
                "[font:comicsnas][emote:lateral]* Sorry,[wait:5] not happening.[wait:10]\n[emote:talk]* I need to pay bills.",
                "[font:comicsnas][emote:wink]* All proceeds go to my socks collection."

            })
        end },
        { "Talk", "TALKMENU" },
        { "Exit", "LEAVE" }
    }

    --SELLMENU
    --self.sell_options = {}


    --self:startDialogue("[font:comicsnas]* huh?[wait:10] I don't buy, only sell.")

    --function Shop:onStateChange(old,new)

    if new == "SELLMENU" then
        self:setDialogueText("I'm not a buyer, kid. I'm a seller.")
        self.dialogue_text.width = 598
        self:setRightText("")
        self.large_box.visible = true
        self.left_box.visible = false
        self.right_box.visible = false
        self.info_box.visible = false
    end
    --end

    --[[
    self.menu_options[2] = {
        function() self:startDialogue({

            "[font:comicsnas]* I'm not a buyer, kid.",
            "[font:comicsnas]* I'm a seller."

        }) end
    }
    ]]
    --[[
    self.sell_options_text["items"]   = "what\nshould\nyou sell?"
    self.sell_options_text["weapons"] = "what\nshould\nyou sell?"
    self.sell_options_text["armors"]  = "what\nshould\nyou sell?"
    self.sell_options_text["storage"] = "what\nshould\nyou sell?"
]]
    self:registerItem("light/chocolate", { stock = 1, price = 2, description = "ITEM\nChoco-bar.\nDelicious\ntreat", name = "Chocolate" })
    self:registerItem("light/apple", { price = 5, description = "ITEM\nGood ol'\nred apple", name = "Apple" })
    self:registerItem("manual", { price = 8, description = "ITEM\nAn apple that \nisn't an apple", name = "Pineapple" })
    self:registerItem("manual", { price = 10, name = "Crab apple", description = "ITEM\nA grouchy\napple\n(Expensive)" })

    --self:registerItem("cell_phone", {stock = 10, color = {1, 0.8, 1, 1}, price = -14, description = "*\n|_\n(O)    Sell phoe\n|#|\n'-'", name="Pone"})
    --self:registerItem("tensionbit")
    --self:registerItem("manual")
    --self:registerItem("amber_card", {bonuses = {defense = math.huge}})
    
    self:registerTalk("About You") --1
    self:registerTalk("Store") --2
    self:registerTalk("See brother") --3
    self:registerTalk("We know each other") --4

    --function registerTalkAfter() can take up to 5 arguments: (talk, index, flag, value, color)
    self:registerTalkAfter("Chocolate (NEW)", 1, "chocolate_bought")
    --self:registerTalkAfter("Chocolate", 1, "chocolate_new", nil, COLORS.white)
    self:registerTalkAfter("Mom (NEW)", 1)
    self:registerTalkAfter("Mom", 1, "mom_new", nil, COLORS.white) --can be either COLORS.white or {255, 255, 255} which is white in RGB colors.
    self:registerTalkAfter("What's up (NEW)", 3)
    self:registerTalkAfter("What's up", 3, "wassup_new", nil, COLORS.white)
    self:registerTalkAfter("Different timelines (NEW)", 4)
    self:registerTalkAfter("Different timelines", 4, "timelines_new", nil, COLORS.white)

    self.shopkeeper:setActor("shopkeepers/sans")
    self.shopkeeper.sprite:setPosition( -24, 12)
    self.shopkeeper.slide = true

    --self.background = "ui/shop/bg_seam"
    --self.background = nil
    self.shop_music = "shop/mus_muscle"
    --Game.world.music:stop()
end --of init()

--added hard-coded values to change UI settings.
function SansShop:postInit()
    -- Mutate talks

    self:processReplacements()

    -- Make a sprite for the background
    if self.background and self.background ~= "" then
        self.background_sprite = Sprite(self.background, 0, 0)
        self.background_sprite:setScale(2, 2)
        self.background_sprite.layer = SHOP_LAYERS["background"]
        self:addChild(self.background_sprite)
    end

    -- Construct the UI
    self.large_box = UIBox()
    local left, top = self.large_box:getBorder()
    self.large_box:setOrigin(0, 1)
    self.large_box.x = left - 8
    self.large_box.y = SCREEN_HEIGHT - 24
    self.large_box.width = SCREEN_WIDTH - (top * 2) + 16
    self.large_box.height = 192
    self.large_box:setLayer(SHOP_LAYERS["large_box"])

    self.large_box.visible = false

    self:addChild(self.large_box)

    self.left_box = UIBox()
    local left, top = self.left_box:getBorder()
    self.left_box:setOrigin(0, 1)
    self.left_box.x = left - 8
    self.left_box.y = SCREEN_HEIGHT - 24
    self.left_box.width = 366
    self.left_box.height = 192
    self.left_box:setLayer(SHOP_LAYERS["left_box"])

    self:addChild(self.left_box)

    self.right_box = UIBox()
    local left, top = self.right_box:getBorder()
    self.right_box:setOrigin(1, 1)
    self.right_box.x = 616
    self.right_box.y = 456
    self.right_box.width = 184
    self.right_box.height = 192
    self.right_box:setLayer(SHOP_LAYERS["right_box"])

    self:addChild(self.right_box)

    self.info_box = UIBox()
    local left, top = self.info_box:getBorder()
    local right_left, right_top = self.right_box:getBorder()
    self.info_box:setOrigin(1, 1)
    self.info_box.x = SCREEN_WIDTH - left + 8
    -- find a more elegant way to do this...
    self.info_box.y = SCREEN_HEIGHT - top - self.right_box.height - (right_top * 2) + 30
    self.info_box.width = 184
    self.info_box.height = 176
    self.info_box:setLayer(SHOP_LAYERS["info_box"])

    self.info_box.visible = false

    self:addChild(self.info_box)

    local emoteCommand = function(text, node)
        self:onEmote(node.arguments[1])
    end

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

--added this here for the "Utils.pick({})" thing. ----> maybe I should change it for Utils.hook (to avoid copyinh the whole function). Or use super:onStateChange(self)
function SansShop:onStateChange(old, new)
    Game.key_repeat = false
    self.buy_confirming = false
    self.sell_confirming = false
    if new == "MAINMENU" then
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
        self.info_box.visible = false
        self.dialogue_text.width = 372
        self:setDialogueText(self.shop_text)
        self:setRightText("")
        --sprite:setAnimation("idle")
    elseif new == "BUYMENU" then
        self:setDialogueText("")
        self:setRightText(self.buy_menu_text)
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
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
        self.info_box.visible = false
        self.item_current_selecting = 1
        self.item_offset = 0
    elseif new == "TALKMENU" then
        self:setDialogueText("")
        self:setRightText(self.talk_text)
        self.large_box.visible = false
        self.left_box.visible = true
        self.right_box.visible = true
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
        self.info_box.visible = false
        self:onLeave()
    elseif new == "LEAVING" then
        self:setRightText("")
        self:setDialogueText("")
        self.large_box.visible = true
        self.left_box.visible = false
        self.right_box.visible = false
        self.info_box.visible = false
        self:leave()
    elseif new == "DIALOGUE" then
        self.dialogue_text.width = 598
        self:setRightText("")
        self.large_box.visible = true
        self.left_box.visible = false
        self.right_box.visible = false
        self.info_box.visible = false
    end

    -----------------------------ADDED STUFF----------------------------
    local buymenutext = Utils.pick({ 1, 2 })
    if (buymenutext == 1) then
        self.buy_menu_text = "[font:comicsnas]do you\neven have\nmoney?"
    elseif (buymenutext == 2) then
        self.buy_menu_text = "[font:comicsnas]what would\nyou like\nto buy?"
    end

    local shopmenutext = Utils.pick({ 1, 2 })
    if (shopmenutext == 1) then
        self.shop_text = "[font:comicsnas][emote:idle]* it's ok, i won't judge."
    elseif (shopmenutext == 2) then
        self.shop_text = "[font:comicsnas][emote:idle]* what would you like to buy?"
    end

    local talkmenutext = Utils.pick({ 1, 2 })
    if (talkmenutext == 1) then
        self.talk_text = "[font:comicsnas][emote:idle]it's not like I'm doing anything."
    elseif (talkmenutext == 2) then
        self.talk_text = "[font:comicsnas][emote:idle]since when\nwere you\na chatty?"
    end
end --of onStateChange()

--added hard-coded values to change offset for text in the UI talkmenu.
--Must be super.super.draw(self) in line 355 instead of super.draw(self). Alternatively, can be just Object.draw(self).
function SansShop:draw()
    self:drawBackground()

    super.super.draw(self)

    love.graphics.setFont(self.font)
    if self.state == "MAINMENU" then
        love.graphics.setColor(COLORS.white)
        for i = 1, #self.menu_options do
            love.graphics.print(self.menu_options[i][1], 480, 220 + (i * 40))
        end
        love.graphics.setColor(Game:getSoulColor())
        love.graphics.draw(self.heart_sprite, 450, 230 + (self.main_current_selecting * 40))
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

    if self.state == "MAINMENU" or
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

function SansShop:startTalk(talk)
    if talk == "About You" then
        self:startDialogue({
            "[font:comicsnas]* This is a test dialogue1.",
            "[font:comicsnas]* This is a test dialogue2."
        })
    elseif talk == "Chocolate (NEW)" then
        self:setFlag("chocolate_new", true)
        self:startDialogue({
            "[font:comicsnas]* huh?[wait:10] you want more chocolate?",
            "[font:comicsnas]* too bad,[wait:5] kid.[wait:10]\n[emote:eyelidslateral]* this angry officer came here right before you and bought a huge amount of chocolate.",
            "[font:comicsnas][emote:eyelids]* you will have to wait for more stock to arrive.",
            "[font:comicsnas]*[emote:wink] or maybe ask your mom,[wait:10] heh."
        })
        --[[
    elseif talk == "Chocolate" then -- make the "Chocolate" only appear after player buys the item. Before it, the first talk will be "About You".
            self:startDialogue({
                "[font:comicsnas]* huh?[wait:10] you want more chocolate?",
                "[font:comicsnas]* too bad,[wait:5] kid.[wait:10]\n[emote:eyelidslateral]* this angry officer came here right before you and bought a huge amount of chocolate.",
                "[font:comicsnas][emote:eyelids]* you will have to wait for more stock to arrive.",
                "[font:comicsnas]*[emote:wink] or maybe ask your mom,[wait:10] heh."
        })
        ]]
    elseif talk == "Mom (NEW)" then
        --this flag overwrite the "Mom (NEW)" with just "Mom" which can be found below. Needs to be set at registerTalkAfter.
        self:setFlag("mom_new", true)
        self:startDialogue({
            "[font:comicsnas]* what?[wait:10]\n* what would a skeleton like me know about your mom?",
            "[font:comicsnas][emote:closed]* hell if i know.",
            "[font:comicsnas][emote:talk]* kid,[wait:5] if there's anyone who knows about her,[wait:5] it's you.",
            "[font:comicsnas]* well,[wait:5] she's a very nice lady.[wait:10]\n* comes here often.",
            "[font:comicsnas][emote:wink]* there's nothing wrong with a lady coming to buy groceries,[wait:5] aight." --< putting a "," here preserves the last emote used. It's weird.
        })
    elseif talk == "Mom" then
        self:startDialogue({
            "[font:comicsnas]* want to buy some apples?"
        })
    elseif talk == "Store" then
        self:startDialogue({
            "[font:comicsnas][emote:closed]* it's nice in here,[wait:10] isn't it?",
            "[font:comicsnas][emote:talk]* i mean,[wait:5] hey,[wait:5] you don't see many grocery stores in this town.",
            "[font:comicsnas]* [emote:lateral]which is...[wait:10] a very weird thing,[wait:5] don't ya think?",
            "[font:comicsnas][emote:talk]* haha kidding,[wait:5] this place is small,\n[wait:5]i know.[wait:5]\n* welp,[wait:5] it means less competition.",
            "[font:comicsnas][emote:wink]* so good for me."
        })
    elseif talk == "See brother" then
        self:startDialogue({
            "[font:comicsnas]* the meeting with my brother?",
            "[font:comicsnas][emote:lateral]* oh I see,[wait:5] you still remember this thing.",
            "[font:comicsnas][emote:eyelidslateral]* sorry,[wait:5] it will have to wait.[wait:10]\n* he's not feeling up to it today.",
            "[font:comicsnas][emote:closed]* maybe one more day, maybe one more year.\n[wait:5]* who knows.",
            "[font:comicsnas][emote:talk]* do you need something else?"
        })
    elseif talk == "What's up (NEW)" then
        self:setFlag("wassup_new", true)
        self:startDialogue({
            "[font:comicsnas][emote:wink]* The [color:yellow][wait:5]c[wait:5]e[wait:5]i[wait:5]l[wait:5]i[wait:5]n[wait:5]g[wait:5][color:white].[sound:joke][wait:5]",
            "[font:comicsnas][emote:talk]* ...",
            "[font:comicsnas][emote:eyelids]* c'mon, not even a smirk?",
            "[font:comicsnas][emote:talk]* party pooper."
        })
    elseif talk == "What's up" then
        self:startDialogue({
            "[font:comicsnas][emote:wink]* The [color:yellow][wait:5]c[wait:5]e[wait:5]i[wait:5]l[wait:5]i[wait:5]n[wait:5]g[wait:5][color:white].[sound:joke][wait:5]",
            "[font:comicsnas][emote:talk]* ...",
            "[font:comicsnas][emote:eyelids]* c'mon, not even a smirk?",
            "[font:comicsnas][emote:talk]* party pooper."
        })
    elseif talk == "We know each other" then
        self:startDialogue({
            "[font:comicsnas][emote:wink]* I mean,[wait:5] yeah.[wait:10]\n* Considering we've talked yesterday,[wait:5] I guess we do know each other.",
            "[font:comicsnas][emote:talk]* ...",
            "[font:comicsnas][emote:talk]* Huh. You know me from before?",
            "[font:comicsnas][emote:lateral]* Funny,[wait:5] kid.[wait:5]\n* Especially considering I'm new to this town.[wait:5] I came here like last week.",
            "[font:comicsnas][emote:eyelids]* Could it be, huh.",
            "[font:comicsnas][emote:wink]* Have I become a famous celebrity without knowing?",
            "[font:comicsnas][emote:talk]* hell nah.\n* That seems like too much work."
        })
    elseif talk == "Different timelines (NEW)" then
        self:setFlag("timelines_new", true)
        self:startDialogue({
            "[font:comicsnas][emote:closed]* oh,[wait:5] yeah,[wait:5] yeah.[wait:10]\n* I know about this.",
            "[font:comicsnas][emote:talk]* I used to be into quantum physics and sci-fi when I was younger.",
            "[font:comicsnas][emote:lateral]* I even remember a dream I had once where I lived amongst many clones of myself...",
            "[font:comicsnas][emote:talk]* ...",
            "[font:comicsnas][emote:eyelidslateral]* Not gonna lie,[wait:5] that was a very weird experience.",
            "[font:comicsnas][emote:talk]* Uhn,[wait:5] speaking of which...",
            "[font:comicsnas][emote:talk]* do you like scary sci-fi stuff,[wait:5] kid?\n[wait:10][emote:wink]* I feel like you do.",
            "[font:comicsnas][emote:talk]* Very well.[wait:10]\n* Did ya know that if you go back \nin time and meet your younger self,[wait:5] a temporal paradox happens?",
            "[font:comicsnas][emote:eyelidslateral]* And you simply disappear.[wait:10]\n* from all of the timelines.",
            "[font:comicsnas][emote:talk]* you ''[wait:5]o[wait:5]o[wait:5]p[wait:5]![wait:5]''.[wait:10]\n[emote:closed]* just like that...",
            "[font:comicsnas][emote:creepy]* ... and every trace of your existence is completely erased.",
            "[font:comicsnas][emote:closed]* ...",
            "[font:comicsnas][emote:talk]* I have to say...[wait:5] I'd hate if something like this happened to me.[wait:10]\n* What would be of my brother if he  didn't have me around?",
            "[font:comicsnas][emote:closed]* I'm such a good older brother to him.",
            "[font:comicsnas][emote:talk]* oh,[wait:5] anyways.[wait:10]\n* what were we talking about?"
        })
    elseif talk == "Different timelines" then
        self:startDialogue({
            "[font:comicsnas][emote:closed]* oh,[wait:5] yeah,[wait:5] yeah.[wait:10]\n* I know about this.",
            "[font:comicsnas][emote:talk]* I used to be into quantum physics and sci-fi when I was younger.",
            "[font:comicsnas][emote:lateral]* I even remember a dream I had once where I lived amongst many clones of myself...",
            "[font:comicsnas][emote:talk]* ...",
            "[font:comicsnas][emote:eyelidslateral]* Not gonna lie,[wait:5] it was a very weird experience.",
            "[font:comicsnas][emote:talk]* Uhn,[wait:5] speaking of which...",
            "[font:comicsnas][emote:talk]* do you like scary sci-fi stuff,[wait:5] kid?\n[wait:10][emote:wink]* I feel like you do.",
            "[font:comicsnas][emote:talk]* Very well.[wait:10]\n* Did ya know that if you go back \nin time and meet your younger self,[wait:5] a temporal paradox happens?",
            "[font:comicsnas][emote:eyelidslateral]* And you simply disappear.[wait:10]\n* from all of the timelines.",
            "[font:comicsnas][emote:talk]* you ''[wait:5]o[wait:5]o[wait:5]p[wait:5]![wait:5]''.[wait:10]\n[emote:closed]* just like that...",
            "[font:comicsnas][emote:creepy]* ... and every trace of your existence is completely erased.",
            "[font:comicsnas][emote:closed]* ...",
            "[font:comicsnas][emote:talk]* I have to say...[wait:5] I'd hate if something like this happened to me.[wait:10]\n* What would be of my brother if he  didn't have me around?",
            "[font:comicsnas][emote:closed]* I'm such a good older brother to him.",
            "[font:comicsnas][emote:talk]* oh,[wait:5] anyways.[wait:10]\n* what were we talking about?"
        })
    end
end --of startTalk()

function SansShop:buyItem(current_item)
    --super:buyItem(self, current_item)

    if (current_item.options["price"] or 0) > Game.money then
        self:setRightText(self.buy_too_expensive_text)
    else
        -- PURCHASE THE ITEM
        -- Remove the gold
        Game.money = Game.money - (current_item.options["price"] or 0)

        --Registry.getItem(item.id)
        
        if(Registry.getItem("chocolate")) then
            self:setFlag("chocolate_bought", true)
        end

        -- Decrement the stock
        if current_item.options["stock"] then
            current_item.options["stock"] = current_item.options["stock"] - 1
            self:setFlag(current_item.options["flag"], current_item.options["stock"])
        end

        -- Add the item to the inventory
        local new_item = Registry.createItem(current_item.item.id)
        new_item:load(current_item.item:save())
        if Game.inventory:addItem(new_item) then
            -- Visual/auditorial feedback (did I spell that right?)
            Assets.playSound("locker")
            self:setRightText(self.buy_text)
        else
            -- Not enough space, oops
            self:setRightText(self.buy_no_space_text)
        end
    end
end

function SansShop:onLeave()
    --super:onLeave(self)
    self:startDialogue(self.leaving_text, "LEAVING")
    Game.lw_money = Game.money
    Game:setFlag("exit_shop", true)
end --of onLeave()

return SansShop
