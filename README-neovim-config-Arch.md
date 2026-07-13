# My NeoVim "Settings"

```text
██████╗       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗         Z
██╔══██╗      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     Z    
██████╔╝█████╗██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  z       
██╔═══╝ ╚════╝██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║z         
██║           ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║          
╚═╝           ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝          

N E O V I M - J U L I A N
```

This repository contains my personal **NeoVim settings**.

> ⚠️ **Important:**
> This repo was not created for public distribution.
> It is intended only for my own use, so I can use my settings on another computer without logging into my GitHub account.

- 100% **Rust** Support (Perfect IDE + VS Code Level + Rust Plugins + extras)
- 90% **C und C++** Support (VS Code Level + C/C++ Plugins)
- 90% **Java** Support (VS Code Level + Java Plugins)
- 90% **Python** Support (VS Code Level + Python Plugins)
- 80% **HTML** Support (VS Code Level + basic HTML Plugins)
- 80% **CSS** Support (VS Code Level + basic CSS Plugins)
- 80% **JavaScript** Support (VS Code Level + basic JavaScript Plugins)
- 80% **TypeScript** Support (VS Code Level + basic TypeScript Plugins)
- 60% **Lua** Support (VS Code Level + basic Lua Plugins)
- 80% **Latex** Support (VS Code Level + basic Latex Plugins)
- 80% **Markdown** Support (VS Code Level + basic Markdown Plugins)
- 80% **Ascii** Support (VS Code Level + basic MSI Plugins)
- 80% **GO** Support (VS Code Level + basic GO Plugins)
- 80% **Zig** Support (VS Code Level + basic Zig Plugins)
- 60% **Matlab** Support (VS Code Level + basic Matlab Plugins)
- 80% **PostgreSQL** voller Support
- 80% **MySQL** voller Support
- 80% **MariaDB** voller Support
- 80% **SQLite** nur lokale Dateien
- 80% **SQL Server** nur MSSQL
- 80% **Git** Support (VS Code Level + basic Git Plugins)

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

## Notes

* Some settings may be system-specific (Windows vs Linux) -Y *Linux - Arch Linux*.
* This configuration is tailored to my personal workflow and may not suit everyone.

## To do

- Commands!!!

# Requirements

<details>
<summary>Links</summary>

- https://www.lazyvim.org/keymaps
- https://neovim.io/
- https://github.com/neovim/neovim
- https://www.lazyvim.org/
- https://github.com/LazyVim/LazyVim

</details>
<!-- Installiere NeoVim: [`Neovim`](https://neovim.io/) -->

<!-- > **Hinweis:**
> Lade das Archiv `nvim-linux-x86_64.tar.gz` manuell von der NeoVim-Website herunter
> und speichere es im Ordner `~/Downloads`, bevor du die folgenden Befehle ausführst. -->

```bash
sudo pacman -Syu
sudo systemctl enable --now ufw # Wichtig -> Firewall aktivieren!!!

sudo pacman -S --needed git base-devel
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

sudo pacman -S --needed base-devel git

sudo pacman -S curl wget unzip base-devel cmark fzf luarocks gcc git-delta shellcheck lib32-gcc-libs
sudo bash -c 'grep -q "^\[multilib\]" /etc/pacman.conf || printf "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf'
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# cargo install --locked cargo-nextest cargo-benchcmp cargo-audit cargo-edit
# cargo install --locked critcmp
cargo install --locked cargo-nextest 
cargo install --locked cargo-audit 
cargo install --locked cargo-auditable 
cargo install --locked cargo-deny 
cargo install --locked flamegraph 
cargo install --locked samply
cargo install --locked cargo-watch
cargo install --locked cargo-expand
rustup component add rustfmt
# cargo install --locked cargo-watch cargo-expand 
sudo pacman -S make go

# Für C/C++ (keines extra)
# sudo pacman -S checksec # or binutils
yay -S checksec

# rustup component add rustfmt
sudo pacman -S clang cmake ninja gdb lldb rr
cargo install --locked probe-rs # or probe-rs-tools
sudo pacman -S jdk21-openjdk jdk-openjdk maven
sudo pacman -S nasm binutils
sudo pacman -S python-pwntools


# Für Go
# sudo pacman -S go
# go install golang.org/x/tools/gopls@latest
# go install golang.org/x/tools/cmd/goimports@latest
# Optional, empfohlen:
# curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.59.2
# go install github.com/go-delve/delve/cmd/dlv@latest

# Für Zig
# sudo pacman -S zig

# sudo archlinux-java set java-21-openjdk
# yay -S gradle

sudo pacman -S gradle
# sdk install gradle 8.6
```

```bash
# Ich würde noch Intellij installieren (java) -> https://www.jetbrains.com/toolbox-app/
# Für Java-Devs: Nutzt NeoVim mit jdtls für das tägliche Coding. Wenn es kompliziert wird, öffnet das Projekt einfach parallel in IntelliJ IDEA – die beiden ergänzen sich perfekt.
# In Rust ist NeoVim dank rust-analyzer fast unschlagbar. In C++ lohnt es sich aber oft, CLion (via Toolbox) als Backup für komplexes Debugging und CMake-Management zu haben.
cd Downloads/
tar -xzf jetbrains-toolbox-[VERSION].tar.gz # Ändere [VERSION] durch die ToolBox Version
cd jetbrains-toolbox-[VERSION]/bin
./jetbrains-toolbox
```

```bash
# sudo pacman -S code
```

```bash
# Ich würde noch Docker installieren
sudo pacman -S docker docker-compose
sudo systemctl enable --now docker
docker --version
```

```bash
# sudo pacman -S wl-clipboard fd python python-virtualenv python-pip
sudo pacman -S wl-clipboard fd python python-pip
# sudo pacman -S python-pipx
# pipx ensurepath
# pipx install black
# pipx install ruff

sudo pacman -S ripgrep
sudo pacman -S nodejs npm
sudo pacman -S gzip
sudo npm install -g typescript
# sudo pacman -S texlive-most zathura zathura-pdf-poppler
sudo pacman -S texlive-core texlive-latexrecommended texlive-fontsrecommended latexmk zathura zathura-pdf-poppler
# sudo pacman -S texlive-latexextra texlive-pictures texlive-fontsextra
sudo pacman -S hunspell hunspell-de hunspell-en_us
# sudo pacman -S ghostty  # besser für Lazyvim als gnome-terminal oder konsole (KDE)
# sudo pacman -S alacritty
# sudo pacman -S kitty
# sudo pacman -S wezterm
# sudo pacman -S jre-openjdk
# sudo pacman -S languagetool
# sudo pacman -S vim
sudo pacman -S acpi
```

```bash
# mkdir -p ~/.local/share/nvim/spell
# cd ~/.local/share/nvim/spell
# cp /usr/share/vim/vim*/spell/en.utf-8.spl ~/.local/share/nvim/spell/en_us.utf-8.spl
# cp /usr/share/vim/vim*/spell/de.utf-8.spl ~/.local/share/nvim/spell/de_de.utf-8.spl
cd ~/Downloads
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim
echo 'export PATH="$PATH:/opt/nvim/bin"' >> ~/.bashrc
source ~/.bashrc
# required
# mv ~/.config/nvim{,.bak}
# optional but recommended
# mv ~/.local/share/nvim{,.bak}
# mv ~/.local/state/nvim{,.bak}
# mv ~/.cache/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
# Das Entfernen von .git ist Absicht, sonst hängt man am Starter-Repo.
rm -rf ~/.config/nvim/.git 
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
fc-cache -fv
# git clone --depth=1 https://github.com/github/copilot.vim.git \
# ~/.config/nvim/pack/github/start/copilot.vim
nvim
```

```bash
# Könnte nützlich sein

sudo pacman -S fastfetch
sudo pacman -S htop
sudo pacman -S btop # nvim ~/.config/btop/btop.conf
sudo pacman -S nvtop
sudo pacman -S ranger w3m ranger-devicons
sudo pacman -S time
sudo pacman -S tmux
sudo pacman -S wofi
sudo pacman -S zoxide
sudo pacman -S ghex
sudo pacman -S bat
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
# sudo pacman -S just
# source /usr/share/doc/fzf/examples/key-bindings.bash # für fzf im Terminal -> Strg + R
echo 'source /usr/share/fzf/key-bindings.bash' >> ~/.bashrc
# npm install -g @mermaid-js/mermaid-cli
sudo pacman -S clamav
sudo freshclam
clamscan -r -i ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
clamscan -r -i ~/.cargo ~/.sdkman ~/.npm ~/.local/lib/python3*/site-packages ~/Downloads
sudo pacman -S rkhunter
sudo rkhunter --check
```

Danach kannst du wirklich einfach den Rest aus deiner [`README-neovim-config-Ubuntu.md`](./README-neovim-config-Ubuntu.md) übernehmen.
Nur die Installation ist anders – genau wie du wolltest.
Und später ggf. nochmal bei LazyVim schauen, falls sich Setup-Schritte geändert haben.

## Ghostty

```txt
# WINDOW / UI
window-decoration = auto
window-padding-x = 6
window-padding-y = 4
window-inherit-working-directory = true

confirm-close-surface = false

# HINTERGRUND (GLAS / HYPRLAND)
background = #18130b
background-opacity = 0.7
background-blur-radius = 20

# background-image = /home/jk/Pictures/walpaper4-new.jpg
# background-image-fit = cover
# background-image-position = center

# FONT
font-family = "JetBrainsMono Nerd Font Complete"
font-family-italic = "JetBrainsMono Nerd Font Complete"
font-family-bold = "JetBrainsMono Nerd Font Complete"
font-family-bold-italic = "JetBrainsMono Nerd Font Complete"
font-size = 13.5
window-title-font-family = "JetBrainsMono Nerd Font Complete"

adjust-cell-height = 0%
adjust-cell-width = 0%

# THEME
cursor-style = block

foreground = #ece1d4
background = #18130b

cursor-color = #ece1d4
cursor-text = #d2c4b4

selection-foreground = #3d2e16
selection-background = #dcc3a1

# ANSI palette
palette = 0=#4c4c4c
palette = 1=#ffb4ab
palette = 2=#ece1d4
palette = 3=#aca98a
palette = 4=#f1be6d
palette = 5=#ffb4ab
palette = 6=#ece1d4
palette = 7=#f0f0f0
palette = 8=#ece1d4
palette = 9=#c49ea0
palette = 10=#9ec49f
palette = 11=#c4c19e
palette = 12=#a39ec4
palette = 13=#c49ec4
palette = 14=#9ec3c4
palette = 15=#e7e7e7


# TERMINAL CORE
term = xterm-256color
shell-integration = fish
shell-integration-features = no-cursor

scrollback-limit = 30000

# CLIPBOARD & MAUS
clipboard-read = allow
clipboard-write = allow
copy-on-select = true
# mouse-hide-while-typing = true
confirm-close-surface = false

# KEYBINDS
keybind = ctrl+m=toggle_maximize
keybind = ctrl+shift+m=toggle_fullscreen
keybind = global:cmd+=toggle_quick_terminal
keybind = shift+ctrl+,=move_tab:-1
keybind = shift+ctrl+.=move_tab:+1

keybind = ctrl+shift+n=new_window
keybind = ctrl+shift+q=quit

# TABS
keybind = ctrl+shift+t=new_tab
keybind = ctrl+shift+w=close_surface
keybind = ctrl+tab=next_tab
keybind = ctrl+shift+tab=previous_tab

# SPLITS
keybind = ctrl+shift+o=new_split:right
keybind = ctrl+shift+e=new_split:down

keybind = alt+left=goto_split:left
keybind = alt+right=goto_split:right
keybind = alt+up=goto_split:up
keybind = alt+down=goto_split:down

keybind = alt+p=goto_split:previous
keybind = alt+n=goto_split:next

keybind = alt+shift+left=resize_split:left,10
keybind = alt+shift+right=resize_split:right,10
keybind = alt+shift+up=resize_split:up,10
keybind = alt+shift+down=resize_split:down,10

keybind = alt+shift+equal=equalize_splits
keybind = ctrl+shift+enter=toggle_split_zoom

# CLIPBOARD
keybind = performable:ctrl+shift+c=copy_to_clipboard
keybind = performable:ctrl+shift+v=paste_from_clipboard

# FONT SIZE
keybind = ctrl+equal=increase_font_size:1
keybind = ctrl+minus=decrease_font_size:1
keybind = ctrl+zero=reset_font_size

# CONFIG
keybind = ctrl+comma=open_config
keybind = ctrl+shift+comma=reload_config

```
