local ResourceName = 'qb-core'

if Config.Framework ~= 'QB' then return end
if GetResourceState(ResourceName) ~= 'started' then return end

local QBCore = exports[ResourceName]:GetCoreObject()
Functions = {}

Functions.PlayerData = function()
    return QBCore.Functions.GetPlayerData()
end

CarryCheck = function()
    local Player = Functions.PlayerData().metadata
    if Player.isdead == true 
    or Player.ishandcuffed == true 
    or LocalPlayer.state.iscarrying
    or LocalPlayer.state.iscarried
    or IsPedInAnyVehicle(PlayerPedId(), false) then return false end
    return true

end