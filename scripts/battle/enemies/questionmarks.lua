local QuestionMarks, super = Class(EnemyBattler)

function QuestionMarks:init()
    super:init(self)

    -- Enemy name
    self.name = "???"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("sans")

    -- Enemy health
    self.max_health = 500
    self.health = 500
    -- Enemy attack (determines bullet damage)
    self.attack = 3
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 50
	
    self.hurtGood = false
    
	-- For Goodnight
	self.instakill_multiplier = 1

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "aiming",
        --"starsides",
		--"starcircle",
		--"starfade",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        --"..."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT ? DF ?\n* What the heck is that??"

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The sound of whirring permiates the area.",
        "* The ??? blinks a menacing light.",
        "* Smells like copper.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The ??? is giving off smoke."

    self:registerAct("???")
end

--tutorial stuff
function QuestionMarks:onHurt(damage, battler)
    super:onHurt(self)

    self:toggleOverlay(true)
    if not self:getActiveSprite():setAnimation("hurt") then
        self:toggleOverlay(false)
    end
    self:getActiveSprite():shake(9, 0, 0.5, 2/30)

    if self.health <= (self.max_health * self.tired_percentage) then
        self:setTired(true)
    end

        if damage > 80 then
        Game.battle.encounter.hurtGood = true
        end
end

function QuestionMarks:onAct(battler, name)
    if name == "???" then
        -- Give the enemy 100% mercy
        --self:addMercy(100)
        -- Change this enemy's dialogue for 1 turn
        --self.dialogue_override = "... ^^"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* How'djya do that?[wait:10] Oh,[wait:5] you sneaky dataminer/cheater.",
        }

    elseif name == "Standard" then --X-Action
        --if battler.chara.id == "ralsei" then
            return "* How'djya do that?[wait:10] Oh,[wait:5] you sneaky dataminer/cheater."
        --elseif battler.chara.id == "susie" then
        --    return "* How'djya do that?[wait:10] Oh,[wait:5] you sneaky dataminer/cheater."
        --else
        --    return "* How'djya do that?[wait:10] Oh,[wait:5] you sneaky dataminer/cheater."
        --end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super:onAct(self, battler, name)
end

function QuestionMarks:onDefeat(damage, battler)
	Game:addFlag("thingsKilled", 1)
	self:onDefeatFatal(damage, battler)
end

function QuestionMarks:onSpared()
	Game:addFlag("thingsSpared", 1)
	self:setAnimation("spared")
end

--tutorial stuff
function QuestionMarks:onHurt(damage, battler)
	-- You do not know the immense amount of pain I went through. The hardships I endured.
	-- The suffering of eons of mankind knows not the boundraies I have reached.
	-- Should this pain have been released from my body in an instant,
	-- hell shalt have roared from the earth and trumpets of angels shalt have
	-- rang out in my honor.
	
	-- Why would it FUCKING crash whenever I tried to shake the enemy?!?!?!?!
	super:onHurt(self)
			
	if damage > 80 then
		Game.battle.encounter.hurtGood = true
	end
end


return QuestionMarks