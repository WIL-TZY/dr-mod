return {
    susie = function(cutscene, event)
        --if not event.sus then
            --event.sus = true
            --local kris = cutscene:getCharacter("kris")
            cutscene:setSpeaker("ralsei")
            cutscene:text("* Hey, Kris. This is still under construction...", "frown_b")
            cutscene:text("* Maybe we should go somewhere else?", "pleased")
                local x = Game.world.player.x
                local y = Game.world.player.y
            cutscene:walkTo(Game.world.player, x, y + 40, 0.5)
            --cutscene:setSpeaker("susie")
            --cutscene:text("* Hell are you going? Trying to have a cake without me?", "shy_b")
    end,

    shops = function(cutscene, event)
            if not event.interacted then
            event.interacted = true
            Game:setFlag("once_shops", true)
            cutscene:text("* (It looks like a shop, but the door is locked, and no one's inside...)")
            elseif Game:getFlag("once_shops") then
            cutscene:text("* (It's locked.)")
            else
            cutscene:text("* (It's locked.)")
            end
    end,

    sans = function(cutscene, event)
        if not event.interacted then
            event.interacted = true
            cutscene:showShop()
            cutscene:setSpeaker("sans")
            cutscene:text("[font:comicsnas]* hey.", "talk")
            cutscene:text("[font:comicsnas]* came to buy something?", "talk")
            cutscene:hideShop()
            else
            cutscene:setSpeaker("sans")
            cutscene:text("[font:comicsnas]* what's up.", "lateral")
            end

    end,

    g = function(cutscene, event)
        if not event.interacted then
            event.interacted = true
            cutscene:setSpeaker("g")
            cutscene:text("[font:wingdings] HAHAHA, I TOTALLY WAS NOT\n SUPPOSED TO BE IN HERE.")
            else
                cutscene:setSpeaker("g")
            cutscene:text("[font:wingdings] ... BUT SINCE I AM,\n HELLO!")
            end

    end,

}
