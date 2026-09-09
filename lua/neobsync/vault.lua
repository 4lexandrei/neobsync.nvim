local config = require("neobsync.config")

---@class neobsync.Vault
local M = {}

---@param bufnr? integer
---@return string|nil
function M.find_root(bufnr)
	bufnr = bufnr or 0
	local buf_path = vim.api.nvim_buf_get_name(bufnr)
	if buf_path == "" then
		return nil
	end
	local full_path = vim.fs.normalize(buf_path)

	if config.vault_path and config.vault_path ~= "" then
		local vault_path = config.vault_path:gsub("/+$", "")
		if full_path:sub(1, #vault_path) == vault_path then
			return vault_path
		end
		return nil
	end

	local root = vim.fs.root(bufnr, ".obsidian")
	if root then
		return (vim.fs.normalize(root):gsub("/+$", ""))
	end

	return nil
end

---@param bufnr? integer
---@return boolean
function M.contains_current_buffer(bufnr)
	bufnr = bufnr or 0
	return M.find_root(bufnr) ~= nil
end

return M
