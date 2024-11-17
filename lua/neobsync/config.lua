local M = {}

M.vault_path = nil
M.HOST = "127.0.0.1"
M.PORT = 9000

function M.setup(config)
	M.vault_path = config.vault_path or M.vault_path
	M.HOST = config.HOST or M.HOST
	M.PORT = config.PORT or M.PORT
end

return M
