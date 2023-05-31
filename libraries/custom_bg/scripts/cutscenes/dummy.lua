return {
    susie_punch = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* Susie threw a punch at\nthe dummy.")

        -- Hurt the target enemy for 1 damage
        Assets.playSound("damage")
        enemy:hurt(1, battler)
        -- Wait 1 second
        cutscene:wait(1)

        -- Susie text
        cutscene:text("* You,[wait:5] uh,[wait:5] look like a weenie.[wait:5]\n* I don't like beating up\npeople like that.", "nervous_side", "susie")

        if cutscene:getCharacter("ralsei") then
            -- Ralsei text, if he's in the party
            cutscene:text("* Aww,[wait:5] Susie!", "blush_pleased", "ralsei")
        end
    end,
	
	backgrounds = function(cutscene, battler, enemy)
        cutscene:text("* You ask Ralsei to explain what BACKGROUNDS are.")
		cutscene:text("* Oh yeah! [wait:5]Susie! [wait:5]Kris!", "surprise_smile", "ralsei")
		cutscene:text("* I've been meaning to tell you about this new feature in battles!", "surprise_smile", "ralsei")
		cutscene:text("* We can now change the BACKGROUND to anything we want!", "blush_smile", "ralsei")
        cutscene:text("* Uh... [wait:5]Change what, [wait:5]now?", "nervous_side", "susie")
		cutscene:text("* Like this!", "surprise_smile", "ralsei")
		Assets.playSound("boost")
		-- This is where the BG change happens.
		Game.battle.default_bg.visible = false -- The BG that's currently visible needs to be set to FALSE...
		Game.battle.ralsei_bg.visible = true -- And the one that you want to show needs to be set to TRUE.
		cutscene:wait(1)
		cutscene:text("* See?", "blush_pleased", "ralsei")
		cutscene:text("* ...", "surprise", "susie")
		cutscene:text("* Heh. [wait:5]Cool feature, [wait:5]Ralsei.", "surprise", "susie")
    end,
}