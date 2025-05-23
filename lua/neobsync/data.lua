local config = require("neobsync.config")

local M = {}

-- For Windows Users
local function normalize_path(path)
	return path:gsub("\\", "/")
end

function M.get_cursor_data(total_lines, frontmatter_lines)
	local line = vim.api.nvim_win_get_cursor(0)[1]
	return {
		method = "updateCursor",
		params = {
			line = line,
			total_lines = total_lines,
			frontmatter_lines = frontmatter_lines,
		},
	}
end

function M.get_buffer_data()
	local full_path = vim.fn.expand("%:p")
	full_path = normalize_path(full_path)
	local relative_path = full_path:gsub(normalize_path(config.vault_path), "")
	return {
		method = "updateBuffer",
		params = {
			buffer_path = relative_path,
		},
	}
end

return M
