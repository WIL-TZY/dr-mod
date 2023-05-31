return {
    post_shop = function(cutscene)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        --local flag = Game:getFlag("exit_shop") --set in test.lua (shop)
        --local once = Game:getFlag("susie_dialogue_watched") --set below
        -- this condition makes sure the cutscene only plays if player has Susie on the party +
        -- + has left the shop at least once and has the chocolate item (which means, player has bought it on the shop)
        if Game:getFlag("susie_joined") and Game.inventory:hasItem("light/chocolate") and not Game:getFlag("susie_dialogue_watched") then --and Game:getFlag("exit_shop")
            cutscene:detachFollowers()
            cutscene:setSpeaker("susie_lw")
            cutscene:wait(0.2)
            cutscene:look(kris, "right")
            cutscene:look(susie, "left")
            cutscene:walkTo(susie, kris.x + 40, susie.y, 1.5) -- this is doubling susie for some reason if I trigger cutscene after exiting shop lol
            cutscene:wait(0.2)
            cutscene:text("* Hey, Kris...", "smile")
            cutscene:wait(0.2)
            cutscene:text("* Did you buy that chocolate bar just for yourself??", "smirk")
            cutscene:text("* Come on![wait:5] Won't you share it with a friend?", "sincere")
            local accepted
            accepted = cutscene:choicer({ "Yes", "No" }) == 1
            if accepted then
                Game.inventory:removeItem("light/chocolate")
                Game.inventory:addItem("light/halfchocolate")
                cutscene:wait(0.2)
                Assets.playSound("item")
                cutscene:wait(2)
                cutscene:text("* ...", "shock")
                cutscene:text("* .........", "nervous_side")
                cutscene:text("* ... It tastes like trash.", "nervous")
            else
                Game:setFlag("susie_dialogue_watched", true)
                cutscene:text("* So mean...", "nervous_side")
            end
            --cutscene:alignFollowers()
            cutscene:interpolateFollowers()
            cutscene:attachFollowers()
            cutscene:endCutscene()
        end
    end,
    monsterkid = function(cutscene, event)
        local mk = cutscene:getCharacter("monsterkid")

        if not event.mk then
            event.mk = true

            cutscene:setSpeaker(mk)
            cutscene:text("* Yo, Kris![wait:10]\n* What's up?")
            cutscene:text("* usuhahusahusuhahusa[wait:10]\n* Cool!")
            cutscene:text("* We need to get together and go for a walk!")
        else
            cutscene:text("* See you!")
        end
    end,
    snowdrake = function(cutscene, event)
        local sd = cutscene:getCharacter("snowdrake")

        if not event.sd then
            event.sd = true

            cutscene:setSpeaker(sd)
            cutscene:text("* Look who's here with us.[wait:10]\n* Kris!")
            cutscene:text("* You look terrible.")
        else
            cutscene:setSpeaker(sd)
            cutscene:text("* By the way,[wait:5] how's Asriel doing?")
        end
    end,
    skelehouse = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text("[voice:nil]* (Knock knock knock.)")
        cutscene:text("* (Nobody answered.[wait:10]\n* All you hear is the trousle of bones.)")
    end,
    house1 = function(cutscene, event)
        Assets.playSound("knock")
        if not event.h1 then
            event.h1 = true
            cutscene:text("[voice:nil]* (Knock knock knock.)")
            cutscene:text("* Oooo,[wait:5] is that a humannnn?!")
            cutscene:text("* I'm still wondering...[wait:10]\n* If humans are made of bones...")
            cutscene:text("* Then where do skeletons come from...?")
        else
            cutscene:text("[voice:nil]* (Knock knock knock.)")
            cutscene:text("* What do you want?")
        end
    end,
    house2 = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text("[voice:nil]* (Knock knock knock.)")
        cutscene:text("(* No one picked up.)")
    end
}
