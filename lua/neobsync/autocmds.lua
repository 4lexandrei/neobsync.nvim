local state = require("neobsync.state")
local vault = require("neobsync.vault")
local markdown = require("neobsync.markdown")
local payload = require("neobsync.payload")
local udp = require("neobsync.transport.udp")
local lifecycle = require("neobsync.lifecycle")

---@class neobsync.Autocommands
local M = {}

local function on_cursor_moved()
	if not state.active then
		return
	end

	if not vault.contains_current_buffer() then
		return
	end

	local current_line = vim.api.nvim_win_get_cursor(0)[1]

	if current_line == state.last_cursor_line then
		return
	end

	state.last_cursor_line = current_line

	udp.send_data(payload.get_cursor_data(state.total_lines, state.frontmatter_lines))
end

local function on_buf_enter()
	if not vault.contains_current_buffer() then
		lifecycle.stop()
		return
	end

	lifecycle.start()

	state.frontmatter_lines = markdown.calculate_frontmatter_lines()
	state.total_lines = vim.fn.line("$")

	udp.send_data(payload.get_buffer_data())
end

function M.setup()
	local group = vim.api.nvim_create_augroup("NeobsyncAutocmds", { clear = true })

	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		group = group,
		pattern = "*.md",
		callback = on_cursor_moved,
	})

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
		group = group,
		pattern = "*.md",
		callback = on_buf_enter,
	})
end

return M
