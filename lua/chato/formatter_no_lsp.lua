local opts = { remap = false }

local function get_extension(filename)
	return filename:match("^.+%.(.+)$")
end

local function auto_reload_buffer()
    vim.api.nvim_exec([[
        augroup AutoReloadBuffer
            autocmd!
            autocmd BufWritePost * if &buftype == '' | silent! e! | endif
        augroup END
    ]], false)
end

local function get_formatters()
	local formatters = {
		lua = "lua-format -i",
		py = "autopep8 --in-place --aggressive ",
	}

	return formatters
end

vim.keymap.set("n", "<leader>f", function()
	local filename_path = vim.api.nvim_buf_get_name(0)
	local extension = get_extension(filename_path)
	local formatters = get_formatters()

	if formatters[extension] ~= nil then
		vim.api.nvim_command("! " .. formatters[extension] .. filename_path)
		auto_reload_buffer()
	end
end, opts)
