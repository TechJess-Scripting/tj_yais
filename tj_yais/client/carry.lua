exports.ox_target:addGlobalPlayer(
    {
        label = "Carry over shoulder",
        icon = 'fa-solid fa-hands',
        distance = 4,
        canInteract = function(entity, distance, coords, name, bone)
            return CarryCheck()
        end,
        onSelect = function(data)
            CarryTarget = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))

            if Config.stopemotes and EmoteFunctions?.IsinAnim() then
                EmoteFunctions?.CancelEmote(true)
            end
            TriggerServerEvent("tj_yeis:triggerCarry", CarryTarget)

        end
    }
)



AddStateBagChangeHandler('iscarrying', ('player:%s'):format(cache.serverId), function(_, _, value)
    CreateThread(function()
        local dict, anim =  "missfinale_c2mcs_1", 'fin_c2_mcs_1_camman'
        local playerPed = PlayerPedId()

        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(5)
        end

        TaskPlayAnim(playerPed, dict, anim, 4.0, 4.0, -1, 49, 0.0, false, false, false)
        RemoveAnimDict(dict)


        

        while LocalPlayer.state.iscarrying do
            if not IsEntityPlayingAnim(playerPed, dict, anim, 3) then
                TaskPlayAnim(playerPed, dict, anim, 4.0, 4.0, -1, 49, 0.0, false, false, false)
            end
            Wait(1000)
        end
    end)

end)


AddStateBagChangeHandler('iscarried', ('player:%s'):format(cache.serverId), function(_, _, value)

    if value then

        local targetPed = GetPlayerPed(GetPlayerFromServerId(value))

        local dict, anim = 'nm', 'firemans_carry'

        if targetPed == 0 then return end

        if Config.stopemotes and EmoteFunctions?.IsinAnim() then
            EmoteFunctions?.CancelEmote(true)
        end


        CreateThread(function()
            local playerPed = PlayerPedId()

            RequestAnimDict(dict)
            while not HasAnimDictLoaded("nm") do
                Citizen.Wait(5)
            end

            AttachEntityToEntity(PlayerPedId(), targetPed, 0, 0.27, 0.15, 0.63, 0.5, 0.5, 180, false, false, false, false, 2, false)

            TaskPlayAnim(playerPed, dict, anim, 8.0, -8.0, -1, 33, 0, false, false, false)
            RemoveAnimDict(dict)

            while LocalPlayer.state.iscarried do
                if Config.stopemotes and not IsEntityPlayingAnim(playerPed, dict, anim, 3) then
                    TaskPlayAnim(playerPed, dict, anim, 8.0, -8.0, -1, 33, 0, false, false, false)
                end
                Wait(1000)
            end
        end)

        CreateThread(function()
            while LocalPlayer.state.iscarried do
                DisableControlAction(0, 25, true)
                DisablePlayerFiring(cache.playerId, true)
                Wait(0)
            end
        end)

    else
        local playerPed = PlayerPedId()

        ClearPedSecondaryTask(playerPed)
        DetachEntity(playerPed, true,false)
    
    end
end)

RegisterCommand('cancel_carry_emote', function()

    if LocalPlayer.state.iscarried or LocalPlayer.state.iscarrying then
        TriggerServerEvent('tj_yais:server:stopCarry')
    end

end, false)

if Config.PointingKeybindEnabled then
    RegisterKeyMapping("cancel_carry_emote", 'Cancel CanPedHearPlayer', "keyboard", 'X')
end