--[[ 
    This file is part of BDTK (BOII Development Tool Kit) and is licensed under the MIT License.
    See the LICENSE file in the root directory for full terms.

    © 2025 Case @ BOII Development

    Support honest development — retain this credit. Don’t be that guy…
]]

--- @module DrawText Bridge (qb)
local bridge = {}

if not bdtk.is_server then

    --- Show drawtext via qb-core export.
    --- @param options table Drawtext options (must contain message).
    function bridge.show(options)
        if not options or not options.message then return false end
        exports["qb-core"]:DrawText(options.message)
    end

    --- Hide drawtext via qb-core export.
    function bridge.hide()
        exports["qb-core"]:HideText()
    end

end

return bridge
