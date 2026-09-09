---@class neobsync.Config
---@field vault_path string|nil Obsidian vault path. If nil, automatically detects the vault.
---@field HOST string UDP destination host.
---@field PORT number UDP destination port.
local M = {}

---@type neobsync.Config
local defaults = {
	vault_path = nil,
	HOST = "127.0.0.1",
	PORT = 9000,
}

---@param opts? neobsync.Config
---@return neobsync.Config
function M.setup(opts)
	opts = opts or {}

	if opts.vault_path then
		M.vault_path = vim.fs.normalize(opts.vault_path)
	end

	M.HOST = opts.HOST or defaults.HOST
	M.PORT = opts.PORT or defaults.PORT

	return M
end

return M
