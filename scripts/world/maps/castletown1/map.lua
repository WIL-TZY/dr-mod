local castletown1, super = Class(Map)

function castletown1:load()
    --Game:setFlag("room_entered", true)
    super:load(self)


end

function castletown1:onEnter() 

    --Game:setFlag("room_entered", true)

end

function castletown1:onExit()
    
    Game:setFlag("room_entered", true)

end

return castletown1