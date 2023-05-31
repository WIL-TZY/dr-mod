return {

    dooropen = function(cutscene)
        Assets.playSound("dooropen")
        cutscene:wait(cutscene:playSound("dooropen"))
        Assets.playSound("doorclose")
    end,

    exit = function(cutscene)
        Assets.playSound("escaped")
    end,

}