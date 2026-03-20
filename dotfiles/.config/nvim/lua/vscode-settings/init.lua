local json = require('lunajson')

local function read_vscode_settings()
    local settings_path = "./.vscode/settings.json"

    local file = io.open(settings_path, "r")
    if not file then
        return json.decode("{}")
    end

    local content = file:read("*a")
    file:close()

    local settings, _, err = json.decode(content)
    if err then
        print("Error parsing VSCODE json")
        return json.decode("{}")
    end

    return settings
end

-- Apply the settings to Neovim
local function apply_vscode_settings()
    VS_CODE_SETTINGS = read_vscode_settings()

    if not VS_CODE_SETTINGS then
        return
    end

    -- Example: Apply some settings
    -- Map settings to Neovim equivalent
    if VS_CODE_SETTINGS["editor.tabSize"] then
        vim.o.tabstop = VS_CODE_SETTINGS["editor.tabSize"]
        vim.o.shiftwidth = VS_CODE_SETTINGS["editor.tabSize"]
    end

    if VS_CODE_SETTINGS["editor.insertSpaces"] ~= nil then
        vim.o.expandtab = VS_CODE_SETTINGS["editor.insertSpaces"]
    end

    if VS_CODE_SETTINGS["editor.formatOnSave"] then
        FORMAT_ON_SAVE = VS_CODE_SETTINGS["editor.formatOnSave"]
    end
end

-- Call the function on Neovim startup
apply_vscode_settings()
