local state = require("neobsync.state")
if vim.g.loaded_neobsync then
	return
end
vim.g.loaded_neobsync = true

local neobsync = require("neobsync")

vim.api.nvim_create_user_command("Neobsync", function(opts)
	local subcommand = opts.args

	if subcommand == "toggle" then
		neobsync.toggle()
	elseif subcommand == "status" then
		neobsync.status()
	else
		vim.notify("Neobsync: unknown subcommand '" .. subcommand .. "'", vim.log.levels.ERROR)
	end
end, {
	nargs = 1,
	complete = function()
		return { "toggle", "status" }
	end,
	desc = "Neobsync user commands",
})

vim.keymap.set("n", "<Plug>(NeobsyncToggle)", function()
	neobsync.toggle()
end, { desc = "Toggle Neobsync synchronization" })

vim.keymap.set("n", "<leader>co", "<Plug>(NeobsyncToggle)", { remap = true, silent = true, desc = "Toggle Neobsync" })

require("which-key").add({
	{
		"<leader>co",
		icon = function()
			return state.active and "" or ""
		end,
	},
})
