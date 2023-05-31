local Encounter, super = Class(Encounter)

function Encounter:init()
    super:init(self)

    self.text = "* Something's here."
    self.music = "batterup"
    self.background = false
	self.hide_world = true
    self:addEnemy("questionmarks")
end

function Encounter:onBattleStart()
	super:onBattleStart(self)
	Game.battle.default_bg = DefaultBG({1, 1, 1})
	Game.battle:addChild(Game.battle.default_bg)
	Game.battle.default_bg.visible = true
end

-- this is dumb lmao
function Encounter:onTurnEnd()

	Game:setFlag("ignoreOverride", false)

end

function Encounter:beforeStateChange(old, new)

	local override = false
	
	if new == "ACTIONSELECT" and not Game:getFlag("ignoreOverride") then
		
		if Game.battle.turn_count == 0 then
		
			Game.battle.started = true

			for _,battler in ipairs(Game.battle.party) do
				battler:resetSprite()
			end

			if Game.battle.encounter.music then
				Game.battle.music:play(Game.battle.encounter.music)
			end
			Game.battle:showUI()
			Game.battle:startCutscene("tutorial/tutorial", "tutorial1")
			override = true
		
		elseif Game.battle.turn_count >= 1 then
		
			Game.battle:startCutscene("tutorial/tutorial", "tutorial2")
			self.beforeStateChange = function(self, old, new) end
			override = true
			
		end
	
	elseif new == "ATTACKING" then
		Game.battle.encounter.hurtEnemy = true
	end
	
	return override
end

return Encounter