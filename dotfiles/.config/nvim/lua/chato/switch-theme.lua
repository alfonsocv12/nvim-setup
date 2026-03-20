local function ToggleColorScheme()
    local current_colorscheme = vim.api.nvim_exec2(
        "colorscheme",
        { output = true }
    ).output

    local new_color = current_colorscheme == "onedark" and "onelight" or "onedark"
    vim.cmd("colorscheme " .. new_color)
end

vim.api.nvim_create_user_command("ToggleColorScheme", ToggleColorScheme, {})
