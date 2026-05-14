Bitte installieren Sie eine Arch-basierte Distribution – vorzugsweise [Arch Linux](https://archlinux.org), [CachyOS](https://cachyos.org), [EndeavourOS](https://endeavouros.com), [Garuda Linux](https://garudalinux.org) oder [Manjaro](https://manjaro.org). Die Konfiguration sollte vollständig auf Hyprland unter Wayland basieren.

Fish und nicht bash oder zsh!!!

Bitte führen sie alle Commands aus und fügen sie .config in ihr Systhem ein.

```bash
cd ~
# sudo cachyos-rate-mirrors

# DNS temporär auf Cloudflare (1.1.1.1) setzen
# echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf

sudo pacman -Syu
pacman -Qk
git clone https://github.com/end-4/dots-hyprland.git
cd dots-hyprland
./setup install

# sudo pacman -S ufw
sudo systemctl enable --now ufw # Wichtig -> Firewall aktivieren!!!

# sudo pacman -S firewalld
# sudo systemctl stop ufw          # UFW stoppen
# sudo systemctl disable ufw       # UFW Autostart aus
# sudo systemctl enable --now firewalld  # firewalld starten

sudo pacman -S --needed git base-devel
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

sudo pacman -S curl wget unzip cmark fzf luarocks gcc git-delta shellcheck lib32-gcc-libs
sudo pacman -S llvm clang lldb gdb strace ltrace radare2
sudo pacman -S gtk4 libadwaita network-manager-applet polkit-gnome librsvg adwaita-icon-theme
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
cargo install --locked cargo-bloat
cargo install --locked cargo-binutils
cargo install --locked cargo-show-asm

# Plugin für Decompilation in radare2 (Terminal)
r2pm -U
r2pm -init
r2pm -i r2ghidra

# Zusätzliche Analyse-Tools für Rust
cargo install --locked panopticon cargo-show-asm

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
sudo pacman -S jdk25-openjdk

# archlinux-java status
# sudo archlinux-java set java-21-openjdk

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
sudo pacman -S zoxide
sudo pacman -S nodejs npm
sudo pacman -S gzip
sudo npm install -g typescript
# sudo pacman -S texlive-most zathura zathura-pdf-poppler
# sudo pacman -S texlive-basic texlive-latex texlive-latexrecommended texlive-fontsrecommended latexmk zathura zathura-pdf-poppler
sudo pacman -S texlive-meta latexmk zathura zathura-pdf-poppler
# sudo pacman -S texlive-latexextra texlive-pictures texlive-fontsextra
sudo pacman -S hunspell hunspell-de hunspell-en_us
sudo pacman -S ghostty  # besser für Lazyvim als gnome-terminal oder konsole (KDE)
sudo pacman -S foot
# sudo pacman -S alacritty # sollte schon installirt sein auf cachy os
# sudo pacman -S kitty # sollte schon installirt sein auf cachy os
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
# cd ~/Downloads
# wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
# tar -xzf nvim-linux-x86_64.tar.gz
# sudo mv nvim-linux-x86_64 /opt/nvim
# echo 'export PATH="$PATH:/opt/nvim/bin"' >> ~/.bashrc
# source ~/.bashrc
sudo pacman -S neovim
# required
# mv ~/.config/nvim{,.bak}
# optional but recommended
# mv ~/.local/share/nvim{,.bak}
# mv ~/.local/state/nvim{,.bak}
# mv ~/.cache/nvim{,.bak}
# git clone https://github.com/LazyVim/starter ~/.config/nvim
# # Das Entfernen von .git ist Absicht, sonst hängt man am Starter-Repo.
# rm -rf ~/.config/nvim/.git 
# mkdir -p ~/.local/share/fonts
# cd ~/.local/share/fonts
# wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
# unzip JetBrainsMono.zip -d JetBrainsMono
# fc-cache -fv
# LazyVim Starter klonen
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Git-Historie entfernen
rm -rf ~/.config/nvim/.git 

# Font-Verzeichnis erstellen und dorthin wechseln
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

# JetBrains Mono Nerd Font herunterladen und entpacken
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono

# Font-Cache aktualisieren
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
sudo pacman -S hyperfine
sudo pacman -S tmux
sudo pacman -S wofi
sudo pacman -S zoxide
sudo pacman -S ghex
sudo pacman -S bat
sudo pacman -S yazi
sudo pacman -S lazygit
sudo pacman -S tree
sudo pacman -S ripgrep
sudo pacman -S fd
sudo pacman -S eza
sudo pacman -S tldr
sudo pacman -S jq
sudo pacman -S nwg-displays
sudo pacman -S imagemagick
sudo pacman -S thefuck
# sudo pacman -S code
yay -S visual-studio-code-bin
yay -S discord
yay -S signal-desktop
yay -S brave-bin
# yay -S mullvad-browser-bin
# yay -S google-chrome
yay -S librewolf-bin
sudo pacman -S ark
sudo pacman -S kate
sudo pacman -S gwenview
sudo pacman -S okular
sudo pacman -S vlc
sudo pacman -S konsole
sudo pacman -S obsidian
sudo pacman -S plasma-systemmonitor
yay -S mission-center
sudo pacman -S krita
sudo pacman -S gimp
sudo pacman -S kdenlive
# sudo pacman -S shotcut
sudo pacman -S blender
sudo pacman -S thunderbird
sudo pacman -S qalculate-gtk
sudo pacman -S obs-studio
sudo pacman -S discover flatpak
sudo pacman -S kclock
yay -S morgen-bin
sudo pacman -S kdeconnect
yay -S python312
sudo pacman -S libreoffice-fresh libreoffice-fresh-de
sudo pacman -S ttf-liberation
sudo pacman -S firejail
sudo pacman -S cups cups-filters ghostscript gutenprint avahi nss-mdns system-config-printer
sudo pacman -S hplip
# sudo pacman -S pandoc tectonic
sudo pacman -S enscript ghostscript
sudo systemctl enable --now cups.service
sudo systemctl enable --now avahi-daemon.service
sudo pacman -S sudo-rs
sudo pacman -S libheif
sudo pacman -S kimageformats
sudo pacman -S bandwhich
sudo pacman -S wireshark-qt
sudo pacman -S krusader
sudo pacman -S 7zip
sudo pacman -S qemu-full virt-manager libvirt virt-viewer dnsmasq
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt,kvm $(whoami)
# Bsp.:
# qemu-system-x86_64 \
#       -enable-kvm \
#       -m 6144 \
#       -cpu host \
#       -smp 6 \
#       -netdev user,id=n1 \
#       -device virtio-net-pci,netdev=n1 \
#       -vga virtio \
#       -display gtk,gl=on \
#       -drive file=kali-linux-2026.1-qemu-amd64.qcow2,format=qcow2

# Uni: eduroam
sudo pacman -S --needed networkmanager python-dbus ca-certificates
yay -S geteduroam-gui

# Uni: vpn
# yay -S globalprotect-bin
sudo pacman -S globalprotect-openconnect
# run: gpclient launch-gui
# yay -S wireguird
# yay -S wireguard-gui-bin

fisher install jorgebucaran/autopair.fish nickeb96/fish-vim edc/bass PatrickF1/fzf.fish

sudo pacman -S eza navi
navi repo add denisidoro/cheats
# navi repo add cachyos/cheats

# set -l config_block '
# function fish_user_key_bindings
#     fish_vi_key_bindings

#     if functions -q _autopair_install
#         _autopair_install
#     end

#     # 1. Bestehende Bindings für Alt+L löschen (wichtig!)
#     bind -e \el
#     bind -M insert -e \el
#     bind -M default -e \el

#     # 2. Deine eigenen Bindings neu setzen
#     bind -M insert \eh prevd-or-backward-word
#     bind -M insert \el nextd-or-forward-word

#     bind -M default \eh prevd-or-backward-word
#     bind -M default \el nextd-or-forward-word

#     bind -M insert \cs "commandline -r 'ls -laa'; commandline -f execute"
#     bind -M default \cs "commandline -r 'ls -laa'; commandline -f execute"
# end'

# if not grep -q "fish_user_key_bindings" ~/.config/fish/config.fish
#     # echo $config_block >> ~/.config/fish/config.fish
#     echo "$config_block" >> ~/.config/fish/config.fish
#     echo "Die Vi-Autopair-Konfiguration wurde am Ende der config.fish hinzugefügt!"
# else
#     echo "Konfiguration bereits vorhanden oder manuell angepasst."
# end

# echo "thefuck --alias | source" >> ~/.config/fish/config.fish; and source ~/.config/fish/config.fish

# source ~/.config/fish/config.fish

# für yazi
sudo pacman -S xdg-utils
sudo pacman -S perl-file-mimeinfo

git clone https://github.com/sahaj-b/ghostty-cursor-shaders ~/.config/ghostty/shaders

# echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
# echo 'zoxide init fish | source' >> ~/.config/fish/config.fish
# sudo pacman -S just
# source /usr/share/doc/fzf/examples/key-bindings.bash # für fzf im Terminal -> Strg + R
# echo 'source /usr/share/fzf/key-bindings.bash' >> ~/.bashrc
# Erstellt das Verzeichnis, falls nicht vorhanden
mkdir -p ~/.config/fish/conf.d

# Aktiviert die fzf Tastenkombinationen für fish
# echo 'fzf_key_bindings' >> ~/.config/fish/config.fish
# echo "bind -M insert \cf 'yazi; commandline -f repaint'" >> ~/.config/fish/config.fish
# echo "bind -M default \cf 'yazi; commandline -f repaint'" >> ~/.config/fish/config.fish

# echo "bind -M insert \cn 'nvim (pwd); commandline -f repaint'" >> ~/.config/fish/config.fish
# echo "bind -M default \cn 'nvim (pwd); commandline -f repaint'" >> ~/.config/fish/config.fish

# echo "bind -M insert \cg 'lazygit; commandline -f repaint'" >> ~/.config/fish/config.fish
# echo "bind -M default \cg 'lazygit; commandline -f repaint'" >> ~/.config/fish/config.fish
# echo 'alias sudo="sudo-rs"' >> ~/.config/fish/config.fish
sudo pacman -S just

# npm install -g @mermaid-js/mermaid-cli
sudo pacman -S clamav
sudo freshclam
clamscan -r -i ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
clamscan -r -i ~/.cargo ~/.sdkman ~/.npm ~/.local/lib/python3*/site-packages ~/Downloads
sudo pacman -S rkhunter
sudo rkhunter --check

# sudo pacman -Rns cachyos-hello

# fun

yay -S en-croissant-bin
# sudo pacman -S webkit2gtk-4.1
# yay -S stockfish
sudo pacman -S gst-plugins-good

```

after neovim config:

```bash
# Cpp
find ~ -name ".clang-format" -path "*/.cache/nvim/*" -delete

# Java
mkdir -p ~/.config/nvim/lang-servers

curl -L \
https://raw.githubusercontent.com/google/styleguide/gh-pages/intellij-java-google-style.xml \
-o ~/.config/nvim/lang-servers/intellij-java-google-style.xml

# asm

# 1. Verzeichnis erstellen
mkdir -p ~/.config/asm-lsp/

# 2. Die Konfiguration schreiben (mit printf)
printf 'version = "0.10.0"

[default_config]
assembler = "gas"
instruction_set = "x86-64"

[default_config.opts]
compiler = "as"
diagnostics = true
default_diagnostics = true' > ~/.config/asm-lsp/.asm-lsp.toml

# 3. Bestätigung
echo "Globale Konfiguration unter ~/.config/asm-lsp/.asm-lsp.toml wurde erstellt."

# rust
rm ~/.cargo/bin/rust-analyzer

# markdown 
cd /home/jk/.local/share/nvim/lazy/markdown-preview.nvim
git checkout -- app/yarn.lock   

# lazygit

# Verzeichnis erstellen
mkdir -p ~/.config/lazygit/

# Die Konfiguration direkt mit printf schreiben (sicherer in fish)
printf "git:
  paging:
    colorArg: always
    pager: delta --dark --paging=never --line-numbers
os:
  editCommand: 'nvim'" > ~/.config/lazygit/config.yml

```

```vim
:lua vim.lsp.buf.format()
```

### emfehlungen:

```bash
nvim ~/.config/quickshell/ii/modules/common/Config.qml
```

zeile 476
```qml
# property list<string> excludedSites: ["quora.com", "facebook.com"]
property list<string> excludedSites: []
```

### BlackArch

```bash
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
# alles 2800 tools oder so
sudo pacman -S blackarch
sudo pacman -Syyu
```

### ufw ist langsam:

```bash
sudo nvim /etc/resolv.conf
```

```bash
# Generated by NetworkManager
# nameserver 127.0.0.0
nameserver 1.1.1.1
nameserver 8.8.8.8
options single-request
options edns0 trust-ad
```

### Langsames Internet

```bash
sudo nvim /etc/modprobe.d/8821ce.conf
```

and 

```text
options 8821ce rtw_power_mgnt=0 rtw_enusbss=0 rtw_ips_mode=0
```

```bash
# sudo update-initramfs -u
# sudo mkinitcpio -P # normalem Arch + GRUB
sudo limine-mkinitcpio # Arch + Limine
reboot
```

and

```bash
iw dev wlan0 get power_save
```

wen an

```bash
sudo iw dev wlan0 set power_save off
```

oder für immer:

```bash
sudo nvim /etc/NetworkManager/conf.d/wifi-powersave.conf
```

```text
[connection]
wifi.powersave = 2
```

Bedeutung:
2 = Power Save deaktiviert

Danach:

```bash
sudo systemctl restart NetworkManager
```

Prüfen:

```bash
iw dev wlan0 get power_save
```

```text
Power save: off
```

### librewulf google securtiy:

```bash
# Erstellt den Ordner und schreibt die Zeilen in die Datei
mkdir -p ~/.librewolf && printf 'defaultPref("browser.safebrowsing.malware.enabled", true);\ndefaultPref("browser.safebrowsing.phishing.enabled", true);\ndefaultPref("browser.safebrowsing.blockedURIs.enabled", true);\n' >> ~/.librewolf/librewolf.overrides.cfg
```

###  repairen von haskel

```bash
sudo pacman -S $(pacman -Qq | grep '^haskell-') shellcheck pandoc
sudo systemctl restart NetworkManager
sudo cachyos-rate-mirrors
```

# WARP Cloudflair "1.1.1.1"

```bash
yay -S cloudflare-warp-bin
```

Alternatively, for a version without the GUI taskbar (useful for servers), use cloudflare-warp-nox-bin.

```bash
sudo systemctl enable --now warp-svc
```

```bash
# bashwarp-cli register
warp-cli register
```

Connect:

```bash
# bashwarp-cli connect
warp-cli connect
```

Bei Problemen:

```bash
warp-cli registration new
warp-cli connect
warp-cli status
```

Wen es immer noch nicht leuft, warte kurtz: WARP baut Zeit um den Tunnel aufzubauen.

```bash
warp-cli status
```

Weitere Commands:

```bash
warp-cli disconnect     # disable WARP
warp-cli connect        # enable WARP
warp-cli status         # check status
warp-cli settings       # view settings
```

# TailScale

```bash
sudo pacman -S tailscale
sudo systemctl enable --now tailscaled
sudo tailscale up
```

Prüfen:

```bash
tailscale ip
tailscale status
```

Dann von Gerät A:

```bash
ping 100.x.x.x
```

Bei Problemen:

```bash
sudo ufw allow in on tailscale0
sudo ufw allow out on tailscale0
```
