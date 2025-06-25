--[[ 
    This file is part of BDTK (BOII Development Tool Kit) and is licensed under the MIT License.
    See the LICENSE file in the root directory for full terms.

    © 2025 Case @ BOII Development

    Support honest development — retain this credit. Don't be that guy...
]]

if bdtk.is_server then return end

--- Sends a base gta notification as fallback.
--- @param options table: The notification options.
RegisterNetEvent("bdtk:cl:notify", function(options)
    if not options or not options.message then return end

    local text = options.header and (options.header .. "\n" .. options.message) or options.message

    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(false, options.duration or 5000)
end)

--- Test command remove if you want
RegisterCommand("test_notif_bd", function()
    local header = "Test Header"
    local message = "Test message.."
    local duration = 3500
    TriggerEvent("bdtk:cl:notify", {
        header = header,
        message = message,
        duration = duration
    })
end)