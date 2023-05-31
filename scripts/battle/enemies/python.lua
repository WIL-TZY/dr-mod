local Python, super = Class(EnemyBattler)

function Python:init()
    super.init(self)

    -- Enemy name
    self.name = "Python"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/python.lua)
    self:setActor("python")

    -- Enemy health
    self.max_health = 450
    self.health = 450
    -- Enemy attack (determines bullet damage)
    self.attack = 6
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    --self.mercy = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 20

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        --"aiming",
        "aiming_heal",
        -- "star_spiral",
        "two_bullets",
        --"basic_shootable",
        --"snake",
        --"movingarena",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "yee-haw!",
        --"Courage is \nbeing scared \nto death… and \nsaddling up \nanyway.",
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 6 DF 0\n* A hat and a horse, yet you feel \nlike something is still missing?"

    -- Text randomly displayed at the bottom of the screen each turn
        self.text = {
            "* Python is hissing at you.",
            "* Smells like danger.",
        }

    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Python looks like it's\nabout to fall over."

    -- Register act called "Smile"
    self:registerAct("Swap", "Select an \nenemy to \nswap stuff", { "susie", "ralsei" })
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Tell Story", "", { "ralsei" })
end

function Python:getEnemyText()
    if self.text_override then
        local text = self.text_override
        self.text_override = nil
        return text
    end
    return Utils.pick(self.text)
end

function Python:getNameColors()
    local result = {}
    if self:canSpare() then
        table.insert(result, {197/255,77/255,170/255})
    end
    if self.tired then
        table.insert(result, {119/255,49/255,152/255})
    end
    return result
end

function Python:onAct(battler, name)
    if name == "Swap" then
        Game:setFlag("python_spared", true)
        -- Give the enemy 100% mercy
        self:addMercy(100)
        -- Change this enemy's text for 1 turn
        self.text_override = "* Python is not hissing anymore :)"
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "whoa!!\nSo stylish!"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* Select enemies to swap assets with each other.",
        }
    elseif name == "Tell Story" then
        -- Loop through all enemies
        for _, enemy in ipairs(Game.battle.enemies) do
            -- Make the enemy tired
            enemy:setTired(true)
        end
        return "* You and Ralsei told Python\na bedtime story.\n* The enemies became [color:blue]TIRED[color:reset]..."
    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        self:addMercy(50)
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei bowed politely.\n* Python spiritually bowed\nin return."
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/python.lua)
            Game.battle:startActCutscene("python", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* " .. battler.chara:getName() .. " straightened Python's hat."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function Python:update()
    -- Text randomly displayed at the bottom of the screen each turn
    if Game:getFlag("python_spared") or self.mercy == 100 then
        self.text = {
            "* Python is not hissing anymore.",
        }
    else
        self.text = {
            "* Python is hissing at you.",
            "* Smells like danger.",
        }
    end
    super:update(self)
end

return Python
