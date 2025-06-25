--[[ 
    This file is part of BDTK (BOII Development Tool Kit) and is licensed under the MIT License.
    See the LICENSE file in the root directory for full terms.

    © 2025 Case @ BOII Development

    Support honest development — retain this credit. Don’t be that guy…
]]

local bridge = {}

if not bdtk.is_server then

    --- Show drawtext via ESX TextUI.
    --- @param options table Drawtext options (must contain message).
    function bridge.show(options)
        if not options or not options.message then return false end
        exports.es_extended:TextUI(options.message)
    end

    --- Hide drawtext via ESX HideUI.
    function bridge.hide()
        exports.es_extended:HideUI()
    end

end

return bridge