local TestShop, super = Class(Shop,  "test")

function TestShop:init()
    super.init(self)

    self.encounter_text = "* (...)"
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
    self:registerItem("amber_card", {bonuses = {defense = math.huge}})

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

    self.background = nil
end

function TestShop:startTalk(talk)
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

return TestShop