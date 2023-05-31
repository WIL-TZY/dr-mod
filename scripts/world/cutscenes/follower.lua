return {
    susie = function(cutscene, event)
        if not event.sus then
            event.sus = true
            Game:setFlag("susie_talked", true)
            cutscene:setSpeaker("susie")
            cutscene:text("* Hey, Kris![wait:5] I was about to leave for school.", "surprise_smile")
            cutscene:text("* Maybe we could...[wait:5] walk around town to skip class?", "smile")
        else
            cutscene:setSpeaker("susie")
            cutscene:text("* Just messing with you.", "sincere_smile")
        end
    end,
    join_susie = function(cutscene)
        --event.interacted = false
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        local talked = Game:getFlag("susie_talked")
        if #Game.party == 1 and talked == true and not Game:getFlag("susie_joined") then
            cutscene:detachFollowers()
            cutscene:detachCamera()
            cutscene:wait(0.5)
            --susie = Game.world:spawnNPC("susie_lw", kris.x, kris.y) ---> don't need it
            cutscene:setSpeaker("susie")
            cutscene:text("* Let's go!", "smile")
            --susie:convertToFollower(1, true)
            susie:convertToFollower(1)
            cutscene:attachFollowers()
            Game:setFlag("susie_joined", true)
            --Game.lock_movement = true --should softlock player here. cutscene:wait kinda does it?
            cutscene:wait(1)
            Game:addPartyMember("susie", 2) ---> just make sure the temporary follower's "save" parameter isn't set to true
            cutscene:attachCamera()
            cutscene:endCutscene()
        end
    end,

    join_ralsei = function(cutscene)
        --event.interacted = false
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        local ralsei = cutscene:getCharacter("ralsei")
        local entered = Game:getFlag("room_entered")
        if #Game.party == 2 and entered == true and not Game:getFlag("ralsei_joined") then
            cutscene:detachFollowers()
            cutscene:detachCamera()
            cutscene:wait(2)
            cutscene:setSpeaker("ralsei")
            cutscene:text("* Hello! Kris, Susie!", "blush_pleased_open")
            ralsei:convertToFollower(2)
            cutscene:attachFollowers()
            Game:setFlag("ralsei_joined", true)
            --Game.lock_movement = true --should softlock player here. cutscene:wait kinda does it?
            cutscene:wait(1)
            Game:addPartyMember("ralsei", 3)
            cutscene:attachCamera()
            cutscene:endCutscene()
        end
    end,



    --make a cutscene for followers leaving the party.
    --leave_susie = function(cutscene)
    --leave_ralsei = function(cutscene)


}

--[[
function susie:onKeyPressed(key)
    if Input.isConfirm(key) then
    event.interacted = true
    end
end
]]
