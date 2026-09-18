local vault = require("neobsync.vault")

---@class neobsync.Obsidian
local M = {}

---@param value string
local function uri_encode(value)
	return value:gsub("[^%w%-_%,~]", function(char)
		return string.format("%%%02X", string.byte(char))
	end)
end

function M.open()
	local vault_name = vault.get_name()
	local relative_path = vault.get_relative_path()

	if not vault_name or not relative_path then
		vim.notify("Neobsync: current buffer is not inside an Obsidian vault", vim.log.levels.WARN)
		return
	end

	local uri = string.format("obsidian://open?vault=%s&file=%s", uri_encode(vault_name), uri_encode(relative_path))

	vim.ui.open(uri)
end

return M
