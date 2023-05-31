local Python, super = Class(Encounter)

function Python:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* A wandering rider bolts in!"

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    --self.background = true
    self.background = false
	self.hide_world = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("python")

    --- Uncomment this line to add another!
    --self:addEnemy("questionmarks")

    --- Third enemy doesn't fit on the screen
    --self:addEnemy("python")
end


function Python:onBattleInit()
	super:onBattleInit(self)
    ----------------#1---------------------
	--Game.battle.default_bg = DefaultBG({1, 1, 1}) -- This is a recreation of the default BG, but now it uses a sprite.
	--Game.battle:addChild(Game.battle.default_bg)
    Game.battle.default_bg = DefaultBG({1, 1, 1})
	Game.battle:addChild(Game.battle.default_bg)
    ----------------#2---------------------
    Game.battle.default_bg2 = DefaultBG2({1, 1, 1})
	Game.battle:addChild(Game.battle.default_bg2)
    ----------------#3---------------------
	Game.battle.candle_bg = CandleBG({1, 1, 1})
	Game.battle:addChild(Game.battle.candle_bg)
    ----------------#4---------------------
    Game.battle.ralsei_bg = RalseiBG({1, 1, 1})
	Game.battle:addChild(Game.battle.ralsei_bg)
    ----------------#5---------------------
	Game.battle.titan_bg = TitanBG({1, 1, 1})
	Game.battle:addChild(Game.battle.titan_bg)
    ----------------#6---------------------
    --[[
	Game.battle.goner_bg = GonerBackground({1, 1, 1})
	Game.battle:addChild(Game.battle.goner_bg)
    ]]
    ----------------#7---------------------
    Game.battle.star_bg = StarBG({1, 1, 1})
	Game.battle:addChild(Game.battle.star_bg)
    ----------------#8---------------------
    Game.battle.snowflake_bg = SnowflakeBG({1, 1, 1})
    Game.battle:addChild(Game.battle.snowflake_bg)
    ----------------#9---------------------
    Game.battle.thing_bg = ThingBG({1, 1, 1})
    Game.battle:addChild(Game.battle.thing_bg)

    -- Now, set up which BG will be visible when the battle starts. And set the others to FALSE.

    Game.battle.default_bg.visible = false
    Game.battle.default_bg2.visible = true
	Game.battle.candle_bg.visible = false
	Game.battle.ralsei_bg.visible = false
    Game.battle.titan_bg.visible = false
    --Game.battle.goner_bg.visible = false
    Game.battle.star_bg.visible = false
    Game.battle.snowflake_bg.visible = false
    Game.battle.thing_bg.visible = false
    

end

--Lua considers both zero and the empty string as true in conditional tests.
--Zero is used to represent false, and One is used to represent true.


-- YellowSoul(x,y,math.rad(180)) ---> for changing soul angle



function Python:createSoul(x, y)
    local soul = (Game:getFlag("swap") and ParrySoul(x, y)) or YellowSoul(x,y)

    return soul
end

--[[
function Python:onBattleStart()
end
]]

--[[
function Python:onTurnEnd() 
end
]]

--[[
function Python:onBattleEnd() 
end
]]

return Python
