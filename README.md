# neobsync.nvim

neobsync.nvim is a plugin for Neovim that allows synchronization with Obsidian.

> [!NOTE]
> Requires [`neobsync-obsidian`](https://github.com/4lexandrei/neobsync-obsidian) community plugin installed in your Obsidian vault.

## ✨ Features

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
    vault_path = nil, -- Optional string path to the Obsidian vault, or nil to auto-detect via `.obsidian`. (e.g., "~/Documents/Notes/")
    HOST = "127.0.0.1", -- UDP listener host
    PORT = 9000, -- UDP listener port (must match neobsync-obsidian port)
  }
},
```

> [!NOTE]
>
> - Manual paths - harcoded path strings:
>
> ```lua
> vault_path = "/home/username/Documents/Notes/" -- Linux
> vault_path = "C:\\Users\\username\\Documents\\Notes\\" -- Windows
> ```
>
> - Dynamic paths `os.getenv` - recommended for cross-platform configurations:
>
> ```lua
> vault_path = os.getenv("HOME") .. "/Documents/Notes/" -- Linux
> vault_path = os.getenv("USERPROFILE") .. "\\Documents\\Notes\\" -- Windows
>
> ```
>
> `vault_path = "C:\\Users\\username\\Documents\\Notes\\"`

## 🚀 Usage

### Commands

|      Command       |             Action              |
| :----------------: | :-----------------------------: |
| `:Neobsync toggle` |         Toggle Neobsync         |
| `:Neobsync status` |     Display current status      |
|  `:Neobsync open`  | Open current buffer in Obsidian |

### Keymaps

|    Keymap     |             Action              |
| :-----------: | :-----------------------------: |
| `<leader>cnt` |         Toggle Neobsync         |
| `<leader>cno` | Open current buffer in Obsidian |

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
    vault_path = nil,
    HOST = "127.0.0.1",
    PORT = 9000,
  }
},
```

## 💖 Acknowledgements

Special thanks to [lumen-oss/nvim-best-practices](https://github.com/lumen-oss/nvim-best-practices) for providing valuable neovim plugin development guidelines.
