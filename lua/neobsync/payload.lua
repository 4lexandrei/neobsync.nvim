local vault = require("neobsync.vault")

---@class neobsync.Payload
local M = {}

---@param total_lines number
---@param frontmatter_lines number
---@return table
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

---@return table
function M.get_buffer_data()
	local full_path = vim.fs.normalize(vim.api.nvim_buf_get_name(0))
	local root = vault.find_root(0)
	local relative_path = full_path
	if root then
		root = (root:gsub("/+$", ""))
		if full_path:sub(1, #root) == root then
			relative_path = full_path:sub(#root + 1):gsub("^/", "")
		end
	end

	return {
		method = "updateBuffer",
		params = {
			buffer_path = relative_path,
		},
	}
end

return M
