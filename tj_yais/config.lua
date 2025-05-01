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
        carrying = { dict = "missfinale_c2mcs_1", anim = 'fin_c2_mcs_1_camman' },
        carried = { dict = 'nm', anim = 'firemans_carry' },
        attach = {
            bone = 0,
            placement = {
                vec3(0.27, 0.15, 0.63),
                vec3(0.5, 0.5, 180)
            }
        }
    },
    back = {
        carrying = { dict = "mx@piggypack_a", anim = 'mxclip_a' },
        carried = { dict = 'mx@piggypack_b', anim = 'mxanim_b' },

        attach = {
            bone = 0,
            placement = {
                vec3(0.02, -0.439900, 0.42),
                vec3(0.0, 0.0, 0.0),
            }
        }
    }
}
