
Config = {}
Config.Framework = 'QB'

-- if GetResourceState('ex_extended') == 'started' then
--     Config.Framework = 'ESX'
-- elseif GetResourceState('qbx_core') == 'started' then
--     Config.Framework = 'QBX'
-- elseif GetResourceState('qb-core') == 'started' then
--     Config.Framework = 'QB'
-- end

Config.stopemotes = true -- stops players from emoting when they are being carried


Config.emotes = {
    shoulder = {
        carrying = {dict = "missfinale_c2mcs_1",anim = 'fin_c2_mcs_1_camman'},
        carried = {dict = 'nm',anim = 'firemans_carry'}
    },
    back = {
        carrying = {dict = "anim@heists@box_carry@",anim = 'idle'},
        carried = {dict = 'amb@code_human_in_car_idles@generic@ps@base',anim = 'base'}
    }
}
