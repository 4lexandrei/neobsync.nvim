local config = require("neobsync.config")

local M = {}

function M.is_in_vault()
	local full_path = vim.fn.expand("%:p")
	return full_path:find(config.vault_path, 1, true) ~= nil
end

function M.calculate_frontmatter_lines()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local count = 0
	if #lines > 1 and lines[1]:match("^---") then
		for i = 2, #lines do
			count = count + 1
			if lines[i]:match("^---") then
				break
			end
		end
	end
	return count
end

return M
