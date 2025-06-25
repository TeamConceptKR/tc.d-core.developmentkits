--[[ 
    This file is part of BDTK (BOII Development Tool Kit) and is licensed under the MIT License.
    See the LICENSE file in the root directory for full terms.

    © 2025 Case @ BOII Development

    Support honest development — retain this credit. Don"t be that guy...
]]

--- @script init.lua
--- Handles bdtk initialization for bdtk.

--- @section Object

bdtk = setmetatable({}, { __index = _G })

--- @section General

bdtk.dev_mode = GetConvar("bdtk:dev_mode", "false") == "true"
bdtk.resource_name = GetCurrentResourceName()
bdtk.version = GetResourceMetadata(bdtk.resource_name, "version", 0) or "unknown"
bdtk.is_server = IsDuplicityVersion()
bdtk.debug_enabled = GetConvar("bdtk:debug_mode", "false") == "true"
bdtk.deferals_updates = GetConvar("bdtk:deferals_updates", "true") == "true"
bdtk.unique_id_prefix = GetConvar("bdtk:unique_id_prefix", "USER_")
bdtk.unique_id_chars = tonumber(GetConvar("bdtk:unique_id_chars", "5"))
bdtk.debug_colours = {
    reset = "^7",
    debug = "^6",
    info = "^5",
    success = "^2",
    warn = "^3",
    error = "^8",
    critical = "^1",
    dev = "^9"
}

--- @section Cache

bdtk.cache = bdtk.cache or {}

--- @section Framework Bridge

bdtk.framework_map = {
    { key = "esx", resource = "es_extended" },
    { key = "boii", resource = "boii_core" },
    { key = "nd", resource = "ND_Core" },
    { key = "ox", resource = "ox_core" },
    { key = "qb", resource = "qb-core" },
    { key = "qbx", resource = "qbx_core" },
}
bdtk.auto_detect_framework = GetConvar("bdtk:auto_detect_framework", "true") == "true"
bdtk.framework = GetConvar("bdtk:framework", "standalone")

--- @section UI Bridges

bdtk.drawtext_ui_map = {
    { key = "boii_ui", resource = "boii_ui" },
    { key = "esx", resource = "es_extended" },
    { key = "okok", resource = "okokTextUi" },
    { key = "ox", resource = "ox_lib" },
    { key = "qb", resource = "qb-core" }
}
bdtk.auto_detect_drawtext_ui = GetConvar("bdtk:auto_detect_drawtext_ui", "true") == "true"
bdtk.drawtext_ui = GetConvar("bdtk:drawtext_ui", "standalone")

bdtk.notify_map = {
    { key = "boii_ui", resource = "boii_ui" },
    { key = "esx", resource = "es_extended" },
    { key = "okok", resource = "okokNotify" },
    { key = "ox", resource = "ox_lib" },
    { key = "qb", resource = "qb-core" }
}
bdtk.auto_detect_notify = GetConvar("bdtk:auto_detect_notify", "true") == "true"
bdtk.notify = GetConvar("bdtk:notify", "standalone")

--- @section Timers

bdtk.clear_expired_cooldowns = tonumber(GetConvar("bdtk:clear_expired_cooldowns", "5"))

--- @section Helpers

--- Print logs
local function log_err(fmt, ...) print(("^1[bdtk]^7 " .. fmt):format(...)) end
local function log_ok(fmt, ...) print(("^2[bdtk]^7 " .. fmt):format(...)) end

--- Builds relative paths
local function build_path(tpl, name)
    return tpl:find("%%s") and tpl:format(name) or ("%s/%s.lua"):format(tpl, name)
end

--- @section Resource Auto Detection

--- Auto detects active resource for framework, drawtext, or notify layer.
--- @param flag_key string: bdtk flag key, e.g., "auto_detect_framework"
--- @param option_key string: bdtk option key, e.g., "framework"
--- @param list table: resource list (e.g., bdtk.frameworks)
--- @param default_value string: default fallback value
--- @param label string: optional log label
local function auto_detect(flag_key, option_key, list, default_value, label)
    if not bdtk[flag_key] or bdtk[option_key] ~= default_value then return end
    for _, res in ipairs(list) do
        if GetResourceState(res.resource) == "started" then
            bdtk[option_key] = res.key
            if label then log_ok("%s detected: %s", label, res.resource) end
            return
        end
    end
end

auto_detect("auto_detect_framework", "framework", bdtk.framework_map, "standalone", "Framework")
auto_detect("auto_detect_drawtext", "drawtext_ui", bdtk.drawtext_ui_map, "default")
auto_detect("auto_detect_notify", "notify", bdtk.notify_map, "default")

--- @section Safe Require Function

--- Loads and caches a module file from bdtk or another resource.
--- @param key string: Dotted path (e.g. "core.player.manager")
--- @param env table|nil: Optional environment table.
--- @return table|nil
function bdtk.get(key, external, env)
    if not key or type(key) ~= "string" then return nil end

    local external = external or false
    local resource = external and GetInvokingResource() or bdtk.resource_name
    local rel_path = key:gsub("%.", "/")
    if not rel_path:match("%.lua$") then rel_path = rel_path .. ".lua" end

    local cache_key = ("%s:%s"):format(resource, rel_path)
    if not external and bdtk.cache[cache_key] then return bdtk.cache[cache_key] end

    local file = LoadResourceFile(resource, rel_path)
    if not file then return nil end

    local env = setmetatable(env or {}, { __index = _G })
    local chunk, err = load(file, "@@" .. resource .. "/" .. rel_path, "t", env)
    if not chunk then print(("[bdtk] compile error in %s: %s"):format(rel_path, err)) return nil end

    local ok, result = pcall(chunk)
    if not ok then print(("[bdtk] runtime error in %s: %s"):format(rel_path, result)) return nil end
    if type(result) ~= "table" then print(("[bdtk] expected table return from: %s"):format(rel_path)) return nil end

    if not external then bdtk.cache[cache_key] = result end
    return result
end

exports("require", bdtk.get)
exports("get", bdtk.get)

--- @section Dot Access Helpers

bdtk.data = setmetatable({}, {
    __index = function(_, k) return bdtk.get("lib.data." .. k) end
})

--- @section Version Checking

--[[
-- will add version checking back in later debating changing system
local opts = {
    resource_name = "bdtk",
    url_path = "boiidevelopment/fivem_resource_versions/main/versions.json",
}
local version <const> = bdtk.get("lib.modules.version")
version.check(opts)
]]

--- @section Export Namespace

--- Returns the full BDTK object for plugin usage.
--- @return table: bdtk core object.
exports("import", function()
    return bdtk
end)