return {
	-- it's called "tutorial 1" because I thought I was gonna have to
	-- make more than one but it seems to have worked out as just
	-- one single cutscene.
    tutorial1 = function(cutscene, battler, enemy)
        
		-- Note: most of these comments are because they were placeholders
		-- for when I was making the text before I actually did any cutscene stuff.
		-- But they work as handy actual regular comments too!
		
		--cutscene:wait(function() return Battle.state == "BATTLETEXT" end)
		
		cutscene:text("* What the...[wait:5] HELL is this thing?", "wtf", "dess")
		cutscene:text("* WAAAIIIIT![wait:10]\n* WAIIIIIIT!", "surprised", "brook")
		
		-- Brook squeezes into battle here
		local brookCutscene = PartyBattler(Game:getPartyMember("brook"), -32, 240)
		local dessCutscene = cutscene:getCharacter("dess")
		
		local tempDessX = dessCutscene.x
		local tempDessY = dessCutscene.y
		
		local enemyCutscene = cutscene:getEnemies("questionmarks")[1]
		
		-- You ain't gettin' out of this one bub
		enemyCutscene.spare_points = 0
		
		Assets.playSound("wing")
		cutscene:slideTo(dessCutscene, 32, 190, 0.1)
		cutscene:setAnimation(dessCutscene, "battle/hurt")
		cutscene:slideTo(brookCutscene, 32, 240, 0.3)
		cutscene:wait(0.3)
		cutscene:setAnimation(dessCutscene, "battle/idle")
		
		cutscene:text("* Who the-?", "angry", "dess")
		cutscene:text("* Look,[wait:5] there's no time to explain but I'm here to save you!", "anxiety", "brook")
		cutscene:text("* Alright,[wait:5] here we go.", "anxiety_b", "brook")
		cutscene:text("* I'm comin' you silver...[wait:10] villain(???)!", "angry", "brook")
		-- Brook approaches the enemy and fucking DIES (metaphorically of course)
		cutscene:slideTo(dessCutscene, tempDessX, tempDessY, 0.5)
		cutscene:slideTo(brookCutscene, enemyCutscene.x - 32, enemyCutscene.y, 0.5)
		cutscene:wait(0.5)
		cutscene:slideTo(enemyCutscene, enemyCutscene.x - 32, enemyCutscene.y, 0.1)
		cutscene:wait(0.1)
		
		Assets.playSound("impact")
		cutscene:setAnimation(brookCutscene, "hurt")
		cutscene:slideTo(brookCutscene, enemyCutscene.x - 32, enemyCutscene.y, 0.5)
		cutscene:wait(0.5)
		cutscene:text("* ?!?!?![wait:50][instant]", "beatup", "brook", {skip = false, auto = true, advance = false})
		cutscene:wait(3)
		brookCutscene:remove()
		
		cutscene:text("* Hey,[wait:10] are you alright??", "neutral_b", "dess")
		cutscene:text("* Ow...", "anxiety_b", "brook")
		cutscene:text("* Uh!!!!", "surprised", "brook")
		cutscene:text("* Wait,[wait:5] that thing is dangerous![wait:10]\n* Don't get near it!", "surprised", "brook")
		cutscene:text("* ...", "eyebrow", "dess")
		cutscene:text("* Look,[wait:5] obviously I can't help fight it,[wait:5] but!!!", "sideeye", "brook")
		cutscene:text("* You have that bat!", "anxiety", "brook")
		cutscene:text("* Let me teach you how to dent it like it dented my helmet!", "angry", "brook")
		cutscene:text("* Look buddy.", "condescending", "dess")
		cutscene:text("* I KNOW how to put a dent in something with a bat,[wait:5] alright?", "angry", "dess")
		cutscene:text("* Maybe so,[wait:10] but let me teach you the Brook family style!", "sideeye_b", "brook")
		cutscene:text("* And that is??", "condescending", "dess")
		cutscene:text("* Don't look back,[wait:5] and hit it as hard as you would some kind of BUTTON!", "angry", "brook")
		cutscene:text("* Such as,[wait:5] maybe,[wait:5] some kind of attack ([image:ui/battle/btn/fight]) button???", "anxiety", "brook")
		cutscene:text("* ...(That's the stupidest advice I've ever heard.)", "neutral_c", "dess")
		
		
		Game:setFlag("ignoreOverride", true)
        cutscene:after(function() Game.battle:setState("ACTIONSELECT") end, true)
    end,
	
	tutorial2 = function(cutscene, battler, enemy)
		if Game.battle.encounter.hurtEnemy then
			if Game.battle.encounter.hurtGood then
				-- If high damage attack
				cutscene:text("* Alright,[wait:5] now just do that like six more times!", "anxiety", "brook")
				cutscene:text("* So much for 'The Brook family style'!", "angry", "dess")
			else
				-- If low damage attack/miss
				cutscene:text("* Uhhh...[wait:10]\n* Are you sure you don't need help?", "anxiety_b", "brook")
				cutscene:text("* Shut up![wait:10]\n* I hit balls,[wait:5] not aliens,[wait:5] okay?", "annoyed", "dess")
				cutscene:text("* I'm just a little out of practice is all!", "angry", "dess")
			end
		else
			-- If not the attack button
			-- that's goin' on your track record buddy
			Game:setFlag("reluctantOnTutorial", true)
			cutscene:text("* You don't wanna hit it...?", "anxiety_b", "brook")
			cutscene:text("* But,[wait:5] it attacked us!", "angry", "brook")
			cutscene:text("* I hate to say it but...", "neutral", "dess")
			cutscene:text("* Ain't no reason to resort to violence that fast.", "neutral_b", "dess")
			cutscene:text("* What if this thing's came here to...", "eyebrow", "dess")
			cutscene:text("* Like,[wait:5] tell us the cure to cancer or something??", "eyebrow", "dess")
			cutscene:text("* ...No,[wait:5] but...!", "surprised", "brook")
			cutscene:text("* Look,[wait:10] I'll tell you later,[wait:10] but there absolutely a reason to attack this thing!", "anxiety", "brook")
			cutscene:text("* And,[wait:10] I don't think we'll get anywhere just by standing still here.", "anxiety_b", "brook")
			cutscene:text("* Whatever.", "neutral_c", "dess")
		end
		
		cutscene:after(function() Game.battle:setState("ACTIONSELECT") end, true)
	end,
}