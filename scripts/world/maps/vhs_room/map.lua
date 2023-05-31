local vhs_room, super = Class(Map)

function vhs_room:load()
    super:load(self)
--[[
    self.timer:every(0.5, function()
        if self.world:inBattle() then
            local marker1 = self.markers["shooter_left"]
            local marker2 = self.markers["shooter_right"]
            self.world:spawnBullet("testbullet", marker1.center_x, Utils.random(marker1.y, marker1.y+marker1.height), false)
            self.world:spawnBullet("testbullet", marker2.center_x, Utils.random(marker2.y, marker2.y+marker2.height), true)
        end
    end)]]
end

function vhs_room:onEnter()    -- VHS shader activation
    Game.stage:addFX(ShaderFX(Mod.vhs_shader, {
        ["time"] = function() return Kristal.getTime() end
    }), "vhs") -- this sets an id for the shader
end

function vhs_room:onExit()
	--Game.stage:removeFX(ShaderFX(Mod.vhs_shader)) doesn't work, needs to add id for it to work
    Game.stage:removeFX("vhs")
end

return vhs_room