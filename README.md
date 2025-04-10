# neobsync.nvim

neobsync.nvim is a plugin for Neovim that allows synchronization with Obsidian.

> [!NOTE]
> This plugin works alongside [`neobsync-obsidian`](https://github.com/4lexandrei/neobsync-obsidian)

## Features

- Scroll sync
- Buffer sync
- Linux and Windows support

## Installation

Local installation

```bash
  git clone https://github.com/4lexandrei/neobsync.nvim.git
```

## Configuration

`neobsync.lua`

```lua
{
  "neobsync.nvim",
  dir = "path_to_plugin", -- example: /home/user/neovim_plugins/neobsync.nvim
  config = function()
    require("neobsync.config").setup({
      vault_path = "path_to_vault", -- example: /home/user/Documents/Notes/
      HOST = "127.0.0.1",
      PORT = 9000,
    })
    require("neobsync").setup()
  end,
},
```

> [!NOTE]
> Please note that on Windows, paths use backslashes `\` instead of forward slashes `/`.
>
> `dir = "C:\\Users\\user\\neovim_plugins\\neobsync.nvim"` > `vault_path = "C:\\Users\\user\\Documents\\Notes\\"`

## Usage

|    Keymap    |     Action      |
| :----------: | :-------------: |
| `<leader>co` | Toggle Neobsync |
