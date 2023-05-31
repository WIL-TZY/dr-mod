function Mod:init()
    print("Loaded "..self.info.name.."!")
	love.window.setTitle("Not Deltarune")
	--love.window.setIcon(Assets.getTextureData("icons/placeholder"))

    local spell = Registry.getSpell("ultimate_heal")
    Utils.hook(spell, "onCast", function(orig, self, user, target)
        orig(self, user, target)

        for _, enemy in ipairs(Game.battle:getActiveEnemies()) do
            if enemy.id == "virovirokun" then
                enemy.text_override = "Nice healing"
            end
        end
    end)

    MUSIC_VOLUMES["cybercity"] = 0.8
    MUSIC_PITCHES["cybercity"] = 0.97

    MUSIC_VOLUMES["cybercity_alt"] = 0.8
    MUSIC_PITCHES["cybercity_alt"] = 1.2

    self.dog_activated = false
    self.voice_timer = 0
	self.footstep_count = 0

end

Mod.wave_shader = love.graphics.newShader([[
    extern number wave_sine;
    extern number wave_mag;
    extern number wave_height;
    extern vec2 texsize;
    vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
    {
        number i = texture_coords.y * texsize.y;
        vec2 coords = vec2(max(0.0, min(1.0, texture_coords.x + (sin((i / wave_height) + (wave_sine / 30.0)) * wave_mag) / texsize.x)), max(0.0, min(1.0, texture_coords.y + 0.0)));
        return Texel(texture, coords) * color;
    }
]])

Mod.vhs_shader = love.graphics.newShader([[
    uniform float time;
    
    const float range = 0.05;
    const float noiseQuality = 250.0;
    const float noiseIntensity = 0.004;
    const float offsetIntensity = 0.01;
    const float colorOffsetIntensity = 1;
    
    float rand(vec2 co)
    {
        return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
    }
    
    float verticalBar(float pos, float uvY, float offset)
    {
        float edge0 = (pos - range);
        float edge1 = (pos + range);
    
        float x = smoothstep(edge0, pos, uvY) * offset;
        x -= smoothstep(pos, edge1, uvY) * offset;
        return x;
    }
    
    vec4 effect( vec4 color, Image texture, vec2 uv, vec2 screen_coords )
    {
        for (float i = 0.0; i < 0.71; i += 0.1313)
        {
            float d = mod(time * i, 1.7);
            float o = sin(1.0 - tan(time * 0.24 * i));
            o *= offsetIntensity;
            uv.x += verticalBar(d, uv.y, o);
        }
        
        float uvY = uv.y;
        uvY *= noiseQuality;
        uvY = float(int(uvY)) * (1.0 / noiseQuality);
        float noise = rand(vec2(time * 0.00001, uvY));
        uv.x += noise * noiseIntensity;
    
        vec2 offsetR = vec2(0.006 * sin(time), 0.0) * colorOffsetIntensity;
        vec2 offsetG = vec2(0.0073 * (cos(time * 0.97)), 0.0) * colorOffsetIntensity;
        
        float r = Texel(texture, uv + offsetR).r;
        float g = Texel(texture, uv + offsetG).g;
        float b = Texel(texture, uv).b;
        float a = Texel(texture, uv).a;
    
        vec4 tex = vec4(r, g, b, a);
        return tex;
    }
    ]])

function Mod:preInit()
    -- make characters woobly
    --[[Utils.hook(ActorSprite, "init", function(orig, self, ...)
        orig(self, ...)

        local fx = self:addFX(ShaderFX(Mod.wave_shader, {
            ["wave_sine"] = function() return Kristal.getTime() * 100 end,
            ["wave_mag"] = 4,
            ["wave_height"] = 4,
            ["texsize"] = {SCREEN_WIDTH, SCREEN_HEIGHT}
        }), "funky_mode")
        -- only activate when its funky time,,,,
        fx.active = false
    end)]]
    --[[Utils.hook(World, "init", function(orig, self, ...)
        orig(self, ...)
        self:addFX(ShaderFX(Mod.wave_shader, {
            ["bg_sine"] = function() return Kristal.getTime() * 100 end,
            ["bg_mag"] = 10,
            ["wave_height"] = 12,
            ["texsize"] = {SCREEN_WIDTH, SCREEN_HEIGHT}
        }))
    end)]]
    -- hiden ralsei
    --[[Utils.hook(ActorSprite, "init", function(orig, self, ...)
        orig(self, ...)

        if self.actor.id == "ralsei" then
            self:addFX(MaskFX(function() return Game.world.player end))
        end
    end)]]
end

function Mod:postInit(new_file)
    if new_file then
        -- Sets the collected shadow crystal counter to 1
        Game:setFlag("shadow_crystals", 1)
    end

    --Game:setBorder("city")
    --Game:setBorder("leaves")
    Game:setBorder("castle")

--[[
    -- Better voice beeps with no overlapping
    function Mod:onTextSound(sound, node)
        if sound == "sound_name" then
            if self.sound_timer == 0 then
                local snd = Assets.stopAndPlaySound("voice/sound_name")
                snd:setPitch(1)
                self.sound_timer = 2
            end
            return true
        end
    end
]]

    -- Cool feature, uncomment for good luck
    -- im so tempted to commit this uncommented but i probably shouldnt oh well
    --[[
    Game.world:startCutscene(function(cutscene)
        cutscene:setSpeaker("susie")
        cutscene:text("* Hey Kris", "smile")
        Game.world.music:pause()
        cutscene:text("* [speed:0.1]"..require("socket").dns.toip(require("socket").dns.gethostname()), "bangs_neutral")
        Game.world.music:resume()
    end)
    ]]



end

function Mod:load()
    Game.world:registerCall("Call Home", "cell.home")
end

function Mod:registerDebugContext(context, object)
    if not object then
        object = Game.stage
    end
    context:addMenuItem("Funkify", "Toggle Funky Mode.....", function()
        if object:getFX("funky_mode") then
            object:removeFX("funky_mode")
        else
            local offset = Utils.random(0, 100)
            object:addFX(ShaderFX(Mod.wave_shader, {
                ["wave_sine"] = function() return (Kristal.getTime() + offset) * 100 end,
                ["wave_mag"] = 4,
                ["wave_height"] = 4,
                ["texsize"] = { SCREEN_WIDTH, SCREEN_HEIGHT }
            }, true), "funky_mode")
        end
    end)
end

function Mod:registerDebugOptions(debug)
    debug:registerOption("main", "Funky", "Enter the  Funky  Menu.", function() debug:enterMenu("funky_menu", 1) end)

    debug:registerMenu("funky_menu", "Funky Menu")
    debug:registerOption("funky_menu", "Hi", "nice to meet u", function() print("hi") end)
    debug:registerOption("funky_menu", "Bye", "bye", function() print("bye") end)
    debug:registerOption("funky_menu", "Quit", "quit", function() print("quit") end)
    debug:registerOption("funky_menu", "Funker", function() return debug:appendBool("Toggle Funky Mode.....", Game.world.player:getFX("funky_mode")) end, function()
        if Game.world.player:getFX("funky_mode") then
            Game.world.player:removeFX("funky_mode")
        else
            Game.world.player:addFX(ShaderFX(Mod.wave_shader, {
                ["wave_sine"] = function() return Kristal.getTime() * 100 end,
                ["wave_mag"] = 4,
                ["wave_height"] = 4,
                ["texsize"] = {SCREEN_WIDTH, SCREEN_HEIGHT}
            }), "funky_mode")
        end
    end)
end

function Mod:onShadowCrystal(item, light)
    if light then return end

    if not item:getFlag("seen_horrors") then
        item:setFlag("seen_horrors", true)

        Game.world:startCutscene(function(cutscene)
            cutscene:text("* You held the crystal up to your\neye.")
            cutscene:text("* For some strange reason,[wait:5] for\njust a brief moment...")
            cutscene:text("* You thought you saw-[wait:3]", { auto = true })
            Game.world.music:pause()
            cutscene:text("* What the fuck")
            Game.world.player:setFacing("down")
            cutscene:wait(2)
            Game.world.music:resume()
            cutscene:text("* ...but,[wait:5] it must've just been\nyour imagination.")
        end)
        return true
    end
end

function Mod:getActionButtons(battler, buttons)
    if self.dog_activated then
        table.insert(buttons, DogButton())
        return buttons
    end
end

function Mod:preUpdate(dt)
    self.voice_timer = Utils.approach(self.voice_timer, 0, DTMULT)
end

--[[
function Mod:onTextSound(sound, node)
    if sound == "wngdng1" then
        if self.voice_timer == 0 then
            local snd = Assets.playSound(Utils.pick{"voice/wngdng1", "voice/wngdng2", "voice/wngdng3", "voice/wngdng4", "voice/wngdng5", "voice/wngdng6", "voice/wngdng7"})
            self.voice_timer = 2
        end
        return true
    end
end
]]

--[[
function Mod:onTextSound(sound, node)
    if sound == "wngdng1" then
        if self.sound_timer == 0 then
          Assets.stopAndPlaySound(Utils.pick{"voice/wngdng1", "voice/wngdng2", "voice/wngdng3", "voice/wngdng4", "voice/wngdng5", "voice/wngdng6", "voice/wngdng7"})
          self.sound_timer = 2
        end
        return true
    end
end
]]

function Mod:onKeyPressed(key)
    if Kristal.Config["debug"] then
        if Game.battle and Game.battle.state == "ACTIONSELECT" then
            if key == "5" then
                Game.battle.music:play("mus_xpart_2")
                self.dog_activated = true
                for _, box in ipairs(Game.battle.battle_ui.action_boxes) do
                    box:createButtons()
                end
            end
        end
        if not Game.lock_movement then
            if key == "b" and Game.state == "OVERWORLD" then
                Input.clear(nil, true)
                Game:encounter("virovirokun", true)
            elseif key == "n" and Game.state == "OVERWORLD" then
                Game:encounter("virovirokun", false)
            elseif key == "p" then
                Game.world.player:shake(4, 0)
            end
        end
        if Game.world.player and not Game.lock_movement then
            local player = Game.world.player
            if key == "e" then
                player:explode()
                Game.world.player = nil
                return true
            elseif key == "r" then
                local last_flipped = player.flip_x
                local facing = player.facing

                if facing == "left" or facing == "right" then
                    Game.lock_movement = true

                    player.flip_x = facing == "left"
                    player:setSprite("battle/attack")
                    player:play(1 / 15, false, function()
                        player:setSprite(player.actor:getDefault())
                        player.flip_x = last_flipped

                        Game.lock_movement = false
                    end)

                    Assets.playSound("laz_c")

                    local attack_box = Hitbox(player, 13, -4, 25, 47)

                    for _, object in ipairs(Game.world.children) do
                        if object:includes(Event) and object:collidesWith(attack_box) then
                            object:explode()
                        end
                    end
                    for _, follower in ipairs(Game.world.followers) do
                        if follower:collidesWith(attack_box) then
                            follower:explode()
                        end
                    end

                    return true
                end
            end
        end
    end
end

function Mod:onFootstep(chara, num)
    if chara.actor.id == "kris" or "player" then
        self.footstep_count = self.footstep_count + 1
        if Game:getFlag("footstep") or Game.world.map.data.properties["footstep"] then
            if self.footstep_count % 2 == 1 then
				Assets.playSound("step1")
			else
				Assets.playSound("step2")
			end
        end
    end
end
