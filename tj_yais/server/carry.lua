



RegisterNetEvent('tj_yeis:triggerCarry', function(serverid, carrytype)
    local src = source

    if serverid == -1 or Player(src).state.iscarrying or Player(src).state.iscarried then
        return
    end

    local pedcoord = GetEntityCoords(GetPlayerPed(src))
    local targetcoord = GetEntityCoords(GetPlayerPed(serverid))
    if #(pedcoord - targetcoord) > 3 then return end


    Player(src).state:set('iscarrying', {id = serverid, type = carrytype}, true)
    Player(serverid).state:set('iscarried', {id = source, type = carrytype}, true)

end)


RegisterNetEvent('tj_yais:server:stopCarry', function()
StopCarry(source)
end)

AddEventHandler('playerDropped', function (reason, resourceName, clientDropReason)
    StopCarry(source)
end)


StopCarry = function(source)
    local src = source

    local iscarryingid = Player(src).state.iscarrying?.id
    local iscarriedid = Player(src).state.iscarried?.id

    if iscarryingid then
        Player(src).state:set('iscarrying', nil, true)
        Player(iscarryingid).state:set('iscarried', nil, true)
    elseif iscarriedid then
        Player(iscarriedid).state:set('iscarrying', nil, true)
        Player(src).state:set('iscarried', nil, true)

    end
end