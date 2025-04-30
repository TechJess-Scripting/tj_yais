


RegisterNetEvent('tj_yeis:triggerCarry', function(serverid)
    local src = source

    if serverid == -1 or carrying[source] or carried[source] then
        return
    end

    local pedcoord = GetEntityCoords(GetPlayerPed(src))
    local targetcoord = GetEntityCoords(GetPlayerPed(serverid))
    if #(pedcoord - targetcoord) > 3 then return end


    Player(src).state:Set('iscarrying', serverid)
    Player(serverid).state:Set('iscarried', source)

end)


RegisterNetEvent('tj_yais:server:stopCarry', function()
    local src = source

    local iscarryingid = Player(src).state.iscarrying
    local iscarriedid = Player(src).state.iscarried

    if iscarryingid then
        Player(src).state:Set('iscarrying', nil)
        Player(iscarryingid).state:Set('iscarried', nil)
    elseif iscarriedid then
        Player(iscarriedid).state:Set('iscarrying', nil)
        Player(src).state:Set('iscarried', nil)

    end


end)
