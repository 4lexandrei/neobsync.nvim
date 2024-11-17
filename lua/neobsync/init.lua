local autocmds = require("neobsync.autocmds")

local M = {}

function M.setup()
	autocmds.setup_autocmds()
end

return M
