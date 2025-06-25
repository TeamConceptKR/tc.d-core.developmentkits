--[[ 
    This file is part of BDTK (BOII Development Tool Kit) and is licensed under the MIT License.
    See the LICENSE file in the root directory for full terms.

    © 2025 Case @ BOII Development

    Support honest development — retain this credit. Don"t be that guy...
]]

if not bdtk.is_server then return end

local callbacks <const> = bdtk.get("lib.modules.callbacks")
local licences <const> = bdtk.get("lib.modules.licences")

callbacks.register_callback('boii_utils:sv:get_licences', function(source, data, cb)
    local utils_licences = licences.get_licences(source)
    if utils_licences then
        cb({ success = true, licences = utils_licences })
    else
        cb({ success = false, })
    end
end)