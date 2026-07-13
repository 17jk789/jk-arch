# IDEA Config

> ⚠️ **Important:**
> This repo was not created for public distribution.
> It is intended only for my own use, so I can use my settings on another computer without logging into my GitHub account.


## Disclaimer

These settings are provided **as-is**, without any warranty.

I am **not responsible** for any issues, errors, or damage that may occur from using them, including but not limited to:

* configuration problems
* loss of data
* software issues
* compatibility problems

Use them **at your own risk**.

## License

This repository is primarily licensed under the **Apache License 2.0**.

Some files are distributed under different licenses:
- `general.lua` is licensed under **GNU General Public License v3.0-only (GPL-3.0-only)** because it contains modifications based on:
  https://github.com/end-4/dots-hyprland

Windows: 
```bash 
C:\Users\DeinName\.ideavimrc
```

macOS/Linux: 
```bash 
~/.ideavimrc
```

```text
" --- ALLGEMEINE SETTINGS ---
set clipboard+=unnamedplus  " Entspricht vim.useSystemClipboard: true
set incsearch               " Entspricht vim.incsearch
set hlsearch                " Entspricht vim.hlsearch
set smartcase               " Entspricht search.smartCase
set number relativenumber   " Falls du relative Zeilen willst
set scrolloff=8             " Komfort beim Scrollen

" Tabs & Einrückung
set tabstop=4
set shiftwidth=4
set expandtab

" --- PLUGINS (IdeaVim Extensions) ---
set surround                " Entspricht vim.surround
set commentary              " Entspricht vim.commentary
set argtextobj              " Erlaubt 'cia' (change in argument)

" --- KEYBINDINGS ---
let mapleader=" "           " Entspricht vim.leader: <space>

" Blackhole Register für 'd' (Löschen ohne zu kopieren)
" Entspricht deinen vim.normalModeKeyBindingsNonRecursive
nnoremap d "_d
vnoremap d "_d
nnoremap dd "_dd

" 'u' und 'Ctrl-j' / 'Ctrl-b' freigeben (falls du IntelliJ Shortcuts willst)
" In IdeaVim musst du Keys aktiv ignorieren, wenn sie NICHT von Vim gefangen werden sollen
set handler+=<C-b>:ide
set handler+=<C-j>:ide

" --- OPTIONAL: IDE ACTIONS ---
" Schnelles Speichern (statt :w)
nnoremap <leader>w :action      FileStructurePopup<CR> 
```
