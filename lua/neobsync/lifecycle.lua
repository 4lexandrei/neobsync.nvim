local state = require("neobsync.state")
local vault = require("neobsync.vault")
local udp = require("neobsync.transport.udp")

---@class neobsync.Lifecycle
local M = {}

function M.start()
	if state.active then
		return
	end

	if not vault.contains_current_buffer() then
		return
	end

	state.active = true
end

function M.stop()
	if not state.active then
		return
	end

	udp.close()
	state.active = false
end

function M.toggle()
	if state.active then
		M.stop()
	else
		M.start()
	end
end

function M.status()
	if state.active then
		vim.notify("Neobsync: active", vim.log.levels.INFO)
	else
		vim.notify("Neobsync: inactive", vim.log.levels.INFO)
	end
end

return M
