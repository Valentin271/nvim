# My neovim config

This is my daily driver neovim config.

## Install the config

Make sure to remove or move your current `nvim` directory

```sh
git clone https://github.com/Valentin271/nvim.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

**NOTE** First time you will get an error just ignore them and press enter, it will say nvim-ts-context-commentstring is not installed but that is fine just close and reopen nvim and everything should be fine  

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

**NOTE** Checkout this file for some predefined keymaps: [keymaps](https://github.com/Valentin271/nvim/blob/master/lua/user/keymaps.lua)

## Requirements

- Neovim 0.10
- ripgrep
- fd
- `npm i -g neovim`

## Additional programs

- Lazygit
- Lazydocker
- inlyne

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste.

So let's fix that

First we'll fix copy/paste

- On Ubuntu

  ```sh
  sudo apt install xsel # for X11
  sudo apt install wl-clipboard # for wayland
  ```

## Font

I use this Nerd Font: [JetBrainsMonoNL Nerd Font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/JetBrainsMonoNLNerdFont-Regular.ttf)

## Configuration

### LSP

To add a new LSP, use

```
:Mason
```

Next, add the server to this list: [servers](https://github.com/Valentin271/nvim/blob/master/lua/user/lsp/mason.lua#L1)

See [server_configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) for configuration options.

### Formatters and linters

Make sure the formatter or linter is installed and add it to this setup function: [null-ls](https://github.com/Valentin271/nvim/blob/master/lua/user/lsp/null-ls.lua#L12)

### Plugins

You can install new plugins here: [plugins](https://github.com/Valentin271/nvim/blob/master/lua/user/plugins.lua#L45)
