---@class neobsync.Markdown
local M = {}

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
	return count + 3
end

return M
