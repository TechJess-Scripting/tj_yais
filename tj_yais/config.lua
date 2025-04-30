

Framework = 'QB'

if GetResourceState('ex_extended') == 'started' then
    Framework = 'ESX'
elseif GetResourceState('qbx_core') == 'started' then
    Framework = 'QBX'
elseif GetResourceState('qb-core') == 'started' then
    Framework = 'QB'
end