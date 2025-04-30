local carrying, carried = {}, {}


RegisterNetEvent('tj_yeis:triggerCarry', function(serverid)
    local src = source

    if serverid == -1 or carrying[source] or carried[source] then
        return
    end

    local pedcoord = GetEntityCoords(GetPlayerPed(src))
    local targetcoord = GetEntityCoords(GetPlayerPed(serverid))

    local distance = #(pedcoord - targetcoord)


    if distance > 3 then return end

    if carried[source] then return end

    Player(src).state:Set('iscarrying', serverid, false)
    Player(serverid).state:Set('iscarried', source, false)

    TriggerClientEvent("tj_yeis:syncCarry", serverid, source)
end)
