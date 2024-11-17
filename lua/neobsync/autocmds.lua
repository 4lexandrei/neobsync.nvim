local utils = require("neobsync.utils")
local data = require("neobsync.data")
local udp = require("neobsync.udp")

local M = {}
local active = false
local last_cursor_line = -1
local total_lines
local frontmatter_lines

if utils.is_in_vault() then
	active = true
end

local function on_cursor_moved()
	if active and utils.is_in_vault() then
		local current_line = vim.api.nvim_win_get_cursor(0)[1]
		if current_line ~= last_cursor_line then
			last_cursor_line = current_line
			udp.send_data(data.get_cursor_data(total_lines, frontmatter_lines))
		end
	end
end

local function on_buf_enter()
	if active and utils.is_in_vault() then
		frontmatter_lines = utils.calculate_frontmatter_lines()
		total_lines = vim.fn.line("$")
		udp.send_data(data.get_buffer_data())
	end
end

function M.setup_autocmds()
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		pattern = "*.md",
		callback = on_cursor_moved,
	})

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
		pattern = "*.md",
		callback = on_buf_enter,
	})
end

function M.toggle_neobsync()
	active = not active
	if active then
		udp.send_data(data.get_buffer_data())
		print("Neobsync enabled")
	else
		udp.close()
		print("Neobsync disabled")
	end
end

-- user commands
vim.api.nvim_create_user_command("ToggleNeobsync", M.toggle_neobsync, {})

-- keymaps
vim.keymap.set("n", "<leader>co", M.toggle_neobsync, { desc = "ToggleNeobsync", noremap = true, silent = true })

return M
