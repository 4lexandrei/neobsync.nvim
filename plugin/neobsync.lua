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
	elseif subcommand == "open" then
		neobsync.open_obsidian()
	else
		vim.notify("Neobsync: unknown subcommand '" .. subcommand .. "'", vim.log.levels.ERROR)
	end
end, {
	nargs = 1,
	complete = function()
		return { "toggle", "status", "open" }
	end,
	desc = "Neobsync user commands",
})

vim.keymap.set("n", "<Plug>(NeobsyncToggle)", function()
	neobsync.toggle()
end, { desc = "Toggle Neobsync synchronization" })

vim.keymap.set("n", "<leader>cnt", "<Plug>(NeobsyncToggle)", { remap = true, silent = true, desc = "Toggle Neobsync" })

vim.keymap.set("n", "<Plug>(NeobsyncOpenObsidian)", function()
	neobsync.open_obsidian()
end, { desc = "Open Obsidian" })

vim.keymap.set(
	"n",
	"<leader>cno",
	"<Plug>(NeobsyncOpenObsidian)",
	{ remap = true, silent = true, desc = "Open in Obsidian" }
)

require("which-key").add({
	{
		"<leader>cnt",
		icon = function()
			return state.active and "" or ""
		end,
	},
})
