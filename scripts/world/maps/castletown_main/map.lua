local castletown_main, super = Class(Map)

function castletown_main:load()

    super:load(self)


end

function castletown_main:onEnter() 

    --Game:setFlag("room_entered", true)

end


return castletown_main