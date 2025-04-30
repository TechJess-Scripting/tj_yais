local emotescript = 'rpemotes'

EmoteFunctions = {}

if GetResourceState("rpemotes") == 'started' then
    
    
    EmoteFunctions.IsinAnim = function()
        return exports["rpemotes"]:IsPlayerInAnim()
    end

    EmoteFunctions.CancelEmote = function(boolean)
        return exports["rpemotes"]:EmoteCancel(boolean)
    end

    EmoteFunctions.SetCanEmote = function(boolean)
        return LocalPlayer.state:set('canEmote', boolean, true)
    end

elseif GetResourceState("rpemotes-reborn") == 'started' then
    EmoteFunctions.IsinAnim = function()
        return exports["rpemotes-reborn"]:IsPlayerInAnim()
    end

    EmoteFunctions.CancelEmote = function(boolean)
        return exports["rpemotes-reborn"]:EmoteCancel(boolean)
    end

    EmoteFunctions.SetCanEmote = function(boolean)
        return LocalPlayer.state:set('canEmote', boolean, true)
    end

elseif GetResourceState("scully_emotemenu") == 'started' then
    EmoteFunctions.IsinAnim = function()
        return LocalPlayer.state.isInEmote
    end

    EmoteFunctions.CancelEmote = function(boolean)
        return exports.scully_emotemenu:cancelEmote()
    end


    EmoteFunctions.SetCanEmote = function(boolean)
        return LocalPlayer.state:set('isLimited', boolean, true)
    end
end

