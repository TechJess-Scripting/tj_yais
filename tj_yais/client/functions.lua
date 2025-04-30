local emotescript = 'rpemotes'

EmoteFunctions = {}

if GetResourceState("rpemotes") == 'started' then
    
    
    EmoteFunctions.IsinAnim = function()
        return exports["rpemotes"]:IsPlayerInAnim()
    end

    EmoteFunctions.CancelEmote = function(boolean)
        return exports["rpemotes"]:EmoteCancel(boolean)
    end
elseif GetResourceState("rpemotes-reborn") == 'started' then
    EmoteFunctions.IsinAnim = function()
        return exports["rpemotes-reborn"]:IsPlayerInAnim()
    end

    EmoteFunctions.CancelEmote = function(boolean)
        return exports["rpemotes-reborn"]:EmoteCancel(boolean)
    end
end

