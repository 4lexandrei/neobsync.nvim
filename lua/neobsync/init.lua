local config = require("neobsync.config")
local lifecycle = require("neobsync.lifecycle")
local autocmds = require("neobsync.autocmds")
local obsidian = require("neobsync.obsidian")

local M = {}

---@param opts? neobsync.Config User configuration
function M.setup(opts)
	config.setup(opts)
	autocmds.setup()
end

function M.start()
	lifecycle.start()
end

function M.stop()
	lifecycle.stop()
end

function M.toggle()
	lifecycle.toggle()
end

function M.status()
	lifecycle.status()
end

function M.open_obsidian()
	obsidian.open()
end

return M
