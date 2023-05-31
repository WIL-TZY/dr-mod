local Dummy, super = Class(Encounter)

function Dummy:init()
    super:init(self)

    self.text = "* The tutorial begins. [wait:5]But something feels different...\n[wait:5]* You should check your ACT menu!"

    self.music = "battle"
    -- The default, code-drawn background needs to be set to FALSE, and the hide overworld needs to be set to TRUE.
	self.background = false
	self.hide_world = true

    self:addEnemy("dummy")
end

-- How to apply different BGs in battle and change them mid-battle:
function Dummy:onBattleStart()
	super:onBattleStart(self)
	-- First, you need to add the BGs you want to use in the battle.
	Game.battle.default_bg = DefaultBG({1, 1, 1}) -- This is a recreation of the default BG, but now it uses a sprite.
	Game.battle:addChild(Game.battle.default_bg)
	Game.battle.ralsei_bg = RalseiBG({1, 1, 1})
	Game.battle:addChild(Game.battle.ralsei_bg)
	Game.battle.candle_bg = CandleBG({1, 1, 1})
	Game.battle:addChild(Game.battle.candle_bg)
	Game.battle.titan_bg = TitanBG({1, 1, 1})
	Game.battle:addChild(Game.battle.titan_bg)
	Game.battle.default_bg.visible = true -- Now, set up which BG will be visible when the battle starts.
	Game.battle.titan_bg.visible = false -- And set the others to FALSE. This will allow us to change the BG mid battle.
	Game.battle.candle_bg.visible = false
	Game.battle.ralsei_bg.visible = false
end

return Dummy