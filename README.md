# neobsync.nvim

neobsync.nvim is a plugin for Neovim that allows synchronization with Obsidian.

> [!NOTE]
> Requires [`neobsync-obsidian`](https://github.com/4lexandrei/neobsync-obsidian) community plugin installed in your Obsidian vault.

## Features

- Scroll sync
- Buffer sync
- Linux and Windows support

## 📦 Installation

Using `lazy.nvim`

```lua
{
  "4lexandrei/neobsync.nvim",
  ft = "markdown",
  opts = {
    vault_path = "path_to_vault", -- Optional: auto detected via `.obsidian`. Example: /home/user/Documents/Notes/
    HOST = "127.0.0.1",
    PORT = 9000,
  }
},
```

> [!NOTE]
> On Windows, paths require double backslashes `\\` instead of forward slashes `/`.
>
> `vault_path = "C:\\Users\\username\\Documents\\Notes\\"`
> `dir = "C:\\Users\\username\\neovim_plugins\\neobsync.nvim"`

## 🚀 Usage

### Commands

|      Command       |         Action         |
| :----------------: | :--------------------: |
| `:Neobsync toggle` |    Toggle neobsync     |
| `:Neobsync status` | Display current status |

### Keymaps

|    Keymap    |     Action      |
| :----------: | :-------------: |
| `<leader>co` | Toggle neobsync |

## 🛠️ Development setup

```bash
  git clone https://github.com/4lexandrei/neobsync.nvim.git
```

```lua
{
  "4lexandrei/neobsync.nvim",
  dir = "path_to_plugin", -- example: /home/user/neovim_plugins/neobsync.nvim
  dev = true,
  ft = "markdown",
  opts = {
    vault_path = "path_to_vault", -- Optional: auto detected via `.obsidian`. Example: /home/user/Documents/Notes/
    HOST = "127.0.0.1",
    PORT = 9000,
  }
},
```
