<h1 align="center"> 🐷 nvim-code2text </h1>
<p align="center">
Convert code into actual text input without leaving NeoVim
</p>

<img src="nvim-code2text.gif"/>

<p align="center">
Demo GIF
</p>

<hr>

Nvim-code2text is a NeoVim plugin written in Lua that lets you use a programming language output as an input for editor. Everything from http requests, files, json documents, complex loops, etc... It works by redirecting stdout to vim buffer

# 🎃 Caveats

-   Currently it only works for Linux and MacOS

# 🌐 Supported languages

- Javascript
- Python
- Bash

# 🔌 Installation

## Prerequisites

-   [NeoVim 0.5+](https://github.com/neovim/neovim/releases/tag/v0.5.0)
-   [Node](https://nodejs.org/es/) (for javascript)
-   [Python3](https://www.python.org/downloads/) (for python)
-   [Bash](https://www.gnu.org/software/bash/) (for bash)

## Adding the plugin

Use your preferred plugin manager

### Vim-plug

```lua
Plug 'morphisjustfun/nvim-code2text'
```

### Packer.nvim

```lua
use "morphisjustfun/nvim-code2text"
```

### Vundle

```lua
Plugin 'morphisjustfun/nvim-code2text'
```

### NeoBundle

```lua
NeoBundleFetch 'morphisjustfun/nvim-code2text'
```

# 🌟 Usage

## Commands

- `:Code2text <language>` opens vertical split to enter code
- `:Code2textGet` prints output of current code
- `:Code2textAccept` closes code window and inserts output into editor

# 🫂 Contribute

Pull requests are welcomed

# 📙 TO-DO

- Add support for more languages
- How to deal with compiled languages

# 🛂 License

MIT
