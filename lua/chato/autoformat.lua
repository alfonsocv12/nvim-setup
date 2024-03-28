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

Formatters = {}
Formatters.__index = Formatters

function Formatters:new()
	local this = {
		formatters = {
			lua = {
				file__name = true,
				command = "lua-format -i",
			},
			py = {
				file__name = true,
				command = "autopep8 --in-place --aggressive ",
			},
			rs = {
				file__name = false,
				command = "cargo fmt ",
			}
		}
	}

	setmetatable(this, self)
	return this
end

function Formatters:run(file_extension, filename)
	local formatter = self.formatters[file_extension]

	if formatter == nil then
		return
	end

	local command = formatter.command

	if formatter.file__name then
		command = command .. filename
	end

	vim.api.nvim_command("! " .. command)
	auto_reload_buffer()
end

local function get_formatters()
	local formatters = {
		lua = "lua-format -i",
		py = "autopep8 --in-place --aggressive ",
		rs = "cargo fmt ",
	}

	return formatters
end

vim.keymap.set("n", "<leader>f", function()
	local filename_path = vim.api.nvim_buf_get_name(0)
	local extension = get_extension(filename_path)

	if extension == nil then
		return
	end

	local formatters = Formatters:new()

	formatters:run(extension, filename_path)
end, opts)

