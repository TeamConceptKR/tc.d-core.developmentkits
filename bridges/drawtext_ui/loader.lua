--[[ 
    This file is part of BDTK (BOII Development Tool Kit) and is licensed under the MIT License.
    See the LICENSE file in the root directory for full terms.

    © 2025 Case @ BOII Development

    Support honest development — retain this credit. Don"t be that guy...
]]

local res = bdtk.drawtext_ui or "standalone"
local path = "bridges.drawtext_ui.impl." .. res
local success, m = pcall(bdtk.get, path)

if not success or type(m) ~= "table" then
    print(("^1[bdtk]^7 Failed to load drawtext_ui bridge: %s"):format(res))
    return {}
end

return m
