# neobsync.nvim

neobsync.nvim is a plugin for Neovim that allows synchronization with Obsidian.

> [!NOTE]
> This plugin works alongside [`neobsync-obsidian`](https://github.com/4lexandrei/neobsync-obsidian)

## Features

> ✅️ Available
> - Scroll sync
> - Buffer sync

## Installation
`neobsync.lua`
Local installation
```lua
{
  "neobsync.nvim",
  dir = "path_to_plugin", -- example: /home/user/neovim_plugins/neobsync.nvim
  config = function()
    require("neobsync.config").setup({
      vault_path = "path_to_vault",
      HOST = "127.0.0.1",
      PORT = 9000,
    })
    require("neobsync").setup()
  end,
},
```

## Usage

| Keymap       | Action          |
|:------------:|:---------------:|
| `<leader>co` | Toggle Neobsync |

## Configuration
```lua
{
  vault_path = "path_to_vault",
  HOST = "127.0.0.1",
  PORT = 9000,
}
```


