--[[ 
    This file is part of BDTK (BOII Development Tool Kit) and is licensed under the MIT License.
    See the LICENSE file in the root directory for full terms.

    © 2025 Case @ BOII Development

    Support honest development — retain this credit. Don"t be that guy...
]]

if not bdtk.is_server then return end

local callbacks <const> = bdtk.get("lib.modules.callbacks")
local xp_mod <const> = bdtk.get("lib.modules.xp")

callbacks.register_callback("bdtk:sv:get_all_xp", function(source, data, cb)
    local player_xp = xp.get_all(source)
    if player_xp then
        cb({ success = true, xp = player_xp })
    else
        cb({ success = false })
    end
end)