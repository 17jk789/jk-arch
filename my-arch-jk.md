Bitte installieren Sie eine Arch-basierte Distribution – vorzugsweise [Arch Linux](https://archlinux.org), [CachyOS](https://cachyos.org), [EndeavourOS](https://endeavouros.com), [Garuda Linux](https://garudalinux.org) oder [Manjaro](https://manjaro.org). Die Konfiguration sollte vollständig auf Hyprland unter Wayland basieren.

Fish und nicht bash oder zsh!!!

Bitte führen sie alle Commands aus und fügen sie .config in ihr Systhem ein.

### Zum Startpunkt wechseln

```bash
cd ~
```

```bash
# sudo cachyos-rate-mirrors

# DNS temporär auf Cloudflare (1.1.1.1) setzen
# echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf
```

### Das System aktualisieren

```bash
sudo pacman -Syu
```
### Paketdatenbank prüfen

```bash
pacman -Qk
```

### Die Werkzeuge für den Bau von Software installieren

```bash
sudo pacman -S --needed git base-devel
```

### Die end-4 Hyperland Konfiguration herunterladen und die Installation starten

```bash
git clone https://github.com/end-4/dots-hyprland.git
cd dots-hyprland
./setup install
```

### Die Firewall sofort einschalten und dauerhaft aktivieren

```bash
# sudo pacman -S ufw
sudo systemctl enable --now ufw # Wichtig -> Firewall aktivieren!!!

# sudo pacman -S firewalld
# sudo systemctl stop ufw          # UFW stoppen
# sudo systemctl disable ufw       # UFW Autostart aus
# sudo systemctl enable --now firewalld  # firewalld starten
```

### Den Quellcode von yay herunterladen und das Programm bauen und installieren

```bash
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### Kern-Werkzeuge und Entwickler-Tools installieren

```bash
sudo pacman -S curl wget unzip cmark fzf luarocks gcc git-delta shellcheck lib32-gcc-libs llvm clang lldb gdb strace ltrace radare2 gtk4 libadwaita network-manager-applet polkit-gnome librsvg adwaita-icon-theme
```

### Das Multilib-Repository in den Systemquellen aktivieren

```bash
sudo bash -c 'grep -q "^\[multilib\]" /etc/pacman.conf || printf "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf'
```

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --locked cargo-nextest 
# cargo install --locked cargo-audit 
# cargo install --locked probe-rs # or probe-rs-tools
# rustup component add rustfmt
cargo install --locked bacon
cargo install --locked flamegraph 
cargo install --locked samply
cargo install --locked cargo-expand
cargo install --locked cargo-show-asm
cargo install --locked cargo-deny 
# cargo install --locked cargo-auditable 
# cargo install --locked cargo-watch
# rustup component add rustfmt
# cargo install --locked cargo-bloat
# cargo install --locked cargo-binutils
```

### Plugin für Decompilation in radare2 (Terminal)

```bash
r2pm -U
r2pm -init
r2pm -i r2ghidra
```

### Go und Make über den Paketmanager installieren

```bash
sudo pacman -S make go
# go install golang.org/x/tools/gopls@latest
# go install golang.org/x/tools/cmd/goimports@latest
# Optional, empfohlen:
# curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.59.2
# go install github.com/go-delve/delve/cmd/dlv@latest
```

### Für C/C++ (keines extra)
```bash
# yay -S checksec
```

### C/C++ Compiler, Build-Systeme und Advanced Debugging installieren

```bash
sudo pacman -S clang cmake ninja gdb lldb rr
```

### Mehrere Java-Versionen und die Build-Tool Gradle und Maven installieren

```bash
sudo pacman -S jdk21-openjdk jdk25-openjdk jdk-openjdk maven
# archlinux-java status
# sudo archlinux-java set java-21-openjdk
sudo pacman -S gradle
# yay -S gradle
# sdk install gradle 8.6
```

### Den x86-Assembler und grundlegende Binär-Werkzeuge installieren

```bash
sudo pacman -S nasm binutils
```

### Das Exploit-Entwicklungs-Framework Pwntools installieren

```bash
sudo pacman -S python-pwntools
```

### Die Programmiersprache und Compiler-Toolchain Zig installieren

```bash
# sudo pacman -S zig
```

### Die JetBrains Toolbox installieren und starten

> Ich würde noch Intellij installieren (java) -> https://www.jetbrains.com/toolbox-app/
> Für Java-Devs: Nutzt NeoVim mit jdtls für das tägliche Coding. Wenn es kompliziert wird, öffnet das Projekt einfach parallel in IntelliJ IDEA – die beiden ergänzen sich perfekt.
> In Rust ist NeoVim dank rust-analyzer fast unschlagbar. In C++ lohnt es sich aber oft, CLion (via Toolbox) als Backup für komplexes Debugging und CMake-Management zu haben.

```bash
cd Downloads/
tar -xzf jetbrains-toolbox-[VERSION].tar.gz # Ändere [VERSION] durch die ToolBox Version
cd jetbrains-toolbox-[VERSION]/bin
./jetbrains-toolbox
```

### Docker und Erweiterungen installieren

```bash
sudo pacman -S docker docker-compose docker-buildx
sudo systemctl enable --now docker
docker --version
```

### Nützliche Systemwerkzeuge und Python einrichten

```bash
# sudo pacman -S wl-clipboard fd python python-virtualenv python-pip
sudo pacman -S wl-clipboard fd python python-pip
# sudo pacman -S python-pipx
# pipx ensurepath
# pipx install black
# pipx install ruff
```

### Ultraschnelle Textsuche installieren

```bash
sudo pacman -S ripgrep
```

### Die intelligente Ordner-Navigation einrichten

```bash
sudo pacman -S zoxide
```

### JavaScript-Laufzeitumgebung und Paketmanager installieren

```bash
sudo pacman -S nodejs npm
```

### Das Standard-Kompressionswerkzeug installieren

```bash
sudo pacman -S gzip
```

### TypeScript installieren

```bash
# sudo npm install -g typescript
```

### Die ultimative LaTeX-Umgebung installieren

```bash
sudo pacman -S texlive-meta latexmk zathura zathura-pdf-poppler
sudo pacman -S texlive-latexextra texlive-pictures, texlive-langgerman texlive-langenglish biber
sudo pacman -S texlab
```

### Die Rechtschreibprüfung für Deutsch und Englisch installieren

```bash
sudo pacman -S hunspell hunspell-de hunspell-en_us
```

### Moderne Terminal-Emulatoren installieren

```bash
sudo pacman -S ghostty  # besser für Lazyvim als gnome-terminal oder konsole (KDE)
sudo pacman -S foot
sudo pacman -S alacritty # sollte schon installirt sein auf cachy os
sudo pacman -S kitty # sollte schon installirt sein auf cachy os
# sudo pacman -S wezterm
# sudo pacman -S jre-openjdk
# sudo pacman -S languagetool
# sudo pacman -S vim
```

### Akku- und Hardware-Informationen auslesen

```bash
sudo pacman -S acpi
```

### LazyVim und JetBrains Mono Nerd Font installieren

```bash
sudo pacman -S neovim

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

nvim
```

## Fun:

### Das System-Informationswerkzeug Fastfetch installieren

```bash
sudo pacman -S fastfetch
```

### Den interaktiven Prozess-Viewer htop installieren

```bash
sudo pacman -S htop
```

### Den hochentwickelten System-Monitor btop installieren

```bash
sudo pacman -S btop # nvim ~/.config/btop/btop.conf
```

### Den GPU-Prozess-Monitor nvtop installieren

```bash
# sudo pacman -S nvtop
```

### Den Terminal-Dateimanager und die Bildvorschau installieren

```bash
sudo pacman -S ranger w3m
```

### Das Zeitmessungs-Werkzeug time installieren

```bash
sudo pacman -S time
```

### Das professionelle Benchmarking-Werkzeug Hyperfine installieren

```bash
sudo pacman -S hyperfine
```

### Den Terminal-Multiplexer tmux installieren

```bash
sudo pacman -S tmux
```

### Den Anwendungsstarter Wofi installieren

```bash
# sudo pacman -S wofi
```

### Die intelligente Ordner-Navigation zoxide installieren

```bash
# sudo pacman -S zoxide
```

### Den Hex-Editor GHex installieren

```bash
sudo pacman -S ghex
```

### Die moderne cat-Alternative bat installieren

```bash
sudo pacman -S bat
```

### Den ultraschnellen Terminal-Dateimanager Yazi installieren

```bash
sudo pacman -S yazi
```

### Das interaktive Git-Terminalwerkzeug LazyGit installieren

```bash
sudo pacman -S lazygit
```

### Den Verzeichnisbaum-Generator tree installieren

```bash
sudo pacman -S tree
```

### Das ultraschnelle Suchwerkzeug ripgrep installieren

```bash
sudo pacman -S ripgrep
```

### Das blitzschnelle Dateisuch-Werkzeug fd installieren

```bash
sudo pacman -S fd
```

### Die moderne und farbenfrohe ls-Alternative eza installieren

```bash
sudo pacman -S eza
```

### Die vereinfachten Community-Handbücher tldr installieren

```bash
sudo pacman -S tldr
```

### Den JSON-Datenprozessor jq installieren

```bash
sudo pacman -S jq
```

### Die grafische Monitor-Konfiguration nwg-displays installieren

```bash
sudo pacman -S nwg-displays
```

### Das Bildverarbeitungs-Framework ImageMagick installieren

```bash
sudo pacman -S imagemagick
```

### Den Tippfehler-Korrektor thefuck installieren

```bash
# sudo pacman -S thefuck
```

### Die Programmiersprache Lua in der Version 5.1 installieren

```bash
sudo pacman -S --needed lua51
```

### Microsoft Visual Studio Code (VS Code) über yay installieren
```bash
# sudo pacman -S code
yay -S visual-studio-code-bin
```

### Den Discord-Client über den Paketmanager installieren

```bash
yay -S discord
```

### Den Signal Messenger installieren

```bash
yay -S signal-desktop
```

### Den Brave Browser über yay installieren

```bash
yay -S brave-bin
```

### Den datenschutzfokussierten Mullvad Browser installieren

```bash
# yay -S mullvad-browser-bin
```

### Google Chrome über den AUR-Helfer installieren

```bash
# yay -S google-chrome
```

### Den datenschutzfokussierten LibreWolf Browser installieren

```bash
# yay -S librewolf-bin
```

### Die Firefox Developer Edition installieren

```bash
sudo pacman -S firefox-developer-edition
```

### Das grafische Archivierungsprogramm Ark installieren

```bash
sudo pacman -S ark
```

### sudo pacman -S kate

```bash
sudo pacman -S kate
```
 
### Der grafische Bildbetrachter Gwenview installieren

```bash
sudo pacman -S gwenview
```

### Der universelle Dokumentenbetrachter Okular installieren

```bash
sudo pacman -S okular
```

### Den universellen Medienplayer VLC installieren

```bash
sudo pacman -S vlc
```

### Den funktionsreichen Terminal-Emulator Konsole installieren

```bash
sudo pacman -S konsole
```

### Die Wissensdatenbank Obsidian installieren

```bash
sudo pacman -S obsidian
```

### Den grafischen Plasma-Systemmonitor installieren

```bash
sudo pacman -S plasma-systemmonitor
```

### Den Taskmanager Mission Center über yay installieren

```bash
yay -S mission-center
```

### Das digitale Mal- und Zeichenprogramm Krita installieren

```bash
sudo pacman -S krita
```

### Das Bildbearbeitungsprogramm GIMP installieren

```bash
sudo pacman -S gimp
```

### Das professionelle Videoschnittprogramm Kdenlive installieren

```bash
sudo pacman -S kdenlive
```

### Das plattformübergreifende Videoschnittprogramm Shotcut installieren

```bash
# sudo pacman -S shotcut
```

### Die 3D-Grafik- und Animations-Suite Blender installieren

```bash
sudo pacman -S blender
```

### Den E-Mail- und Kalender-Client Thunderbird installieren

```bash
# sudo pacman -S thunderbird
```

### Den wissenschaftlichen Taschenrechner Qalculate! installieren

```bash
sudo pacman -S qalculate-gtk
```

### Die Streaming- und Aufnahme-Software OBS Studio installieren

```bash
sudo pacman -S obs-studio
```

### Das Software-Zentrum Discover und das Flatpak-System installieren

```bash
sudo pacman -S discover flatpak
```

### Die Desktop-Uhr KClock installieren

```bash
sudo pacman -S kclock
```

### Den Morgen Calendar über yay installieren

```bash
# yay -S morgen-bin
```

### Das Smartphone-Integrationswerkzeug KDE Connect installieren

```bash
sudo pacman -S kdeconnect
```

### Eine ältere Python-Version (3.12) über yay installieren

```bash
# yay -S python312
```

### Die Office-Suite LibreOffice installieren

```bash
sudo pacman -S libreoffice-fresh libreoffice-fresh-de
```

### Die Microsoft-kompatiblen Liberation-Schriftarten installieren

```bash
sudo pacman -S ttf-liberation
```

### Das Sandbox-Sicherheitswerkzeug Firejail installieren

```bash
sudo pacman -S firejail
```

### Das vollständige Linux-Drucksystem (CUPS) einrichten

```bash
sudo pacman -S cups cups-filters ghostscript gutenprint avahi nss-mdns system-config-printer
```

### Die offiziellen HP-Druckertreiber (HPLIP) installieren

```bash
sudo pacman -S hplip
```

### Die moderne LaTeX-Alternative Tectonic und den Dokumenten-Konverter Pandoc einrichten

```bash
# sudo pacman -S pandoc tectonic
```

### Text-zu-PostScript-Konverter und PDF-Interpreter installieren

```bash
sudo pacman -S enscript ghostscript
```

### Den Drucker-Hintergrunddienst aktivieren

```bash
sudo systemctl enable --now cups.service
```

### Den Netzwerk-Erkennungsdienst Avahi aktivieren

```bash
sudo systemctl enable --now avahi-daemon.service
```

### Die Rust-Alternative für den sudo-Befehl installieren

```bash
# sudo pacman -S sudo-rs
```

### Die HEIF- und AVIF-Bildbibliothek libheif installieren

```bash
sudo pacman -S libheif
```

### Die erweiterten Bildformat-Plugins für KDE installieren

```bash
sudo pacman -S kimageformats
```

### Den Netzwerk-Bandbreiten-Monitor bandwhich installieren

```bash
sudo pacman -S bandwhich
```

### Den Netzwerk-Protokollanalysator Wireshark installieren

```bash
sudo pacman -S wireshark-qt
```

### Den zweispaltigen Dateimanager Krusader installieren

```bash
sudo pacman -S krusader
```

### Das offizielle 7-Zip-Kompressionswerkzeug installieren

```bash
sudo pacman -S 7zip
```

### QEMU, KVM und die grafische Verwaltung Virt-Manager installieren

```bash
sudo pacman -S qemu-full virt-manager libvirt virt-viewer dnsmasq
```

### Den Virtualisierungs-Dienst für KVM/QEMU aktivieren
```bash
sudo systemctl enable --now libvirtd
```

### Festplatten-Diagnosewerkzeuge scannen

```bash
# sudo smartctl --scan
```

### Erweiterte Gruppenrechte für native Kernel-Virtualisierung (KVM) setzen

```bash
sudo usermod -aG libvirt,kvm $(whoami)
```

### Das Highlight: Der optimale QEMU-Startbefehl (Die 2. Variante ist besser!)

```bash
qemu-system-x86_64 \
      -enable-kvm \
      -m 6144 \
      -cpu host \
      -smp 6 \
      -netdev user,id=n1 \
      -device virtio-net-pci,netdev=n1 \
      -vga virtio \
      -display gtk,gl=on \
      -drive file=kali-linux-2026.1-qemu-amd64.qcow2,format=qcow2

# or

qemu-system-x86_64 \
      -enable-kvm \
      -m 6144 \
      -cpu host \
      -smp 6 \
      -netdev user,id=n1 \
      -device virtio-net-pci,netdev=n1 \
      -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160,vgamem_mb=256 \
      -display gtk,gl=on \
      -drive file=kali-linux-2026.1-qemu-amd64.qcow2,format=qcow2

# und wen was nicht leuft:
# sudo pacman -S virglrenderer
```

### Den grafischen Audio-Mixer pwvucontrol installieren

```bash
sudo pacman -S pwvucontrol
```

### Den grafischen Audio-Verkabelungs-Manager qpwgraph installieren

```bash
# sudo pacman -S qpwgraph
```

### Die lokale KI-Laufzeitumgebung Ollama installieren

```bash
sudo pacman -S ollama
```

### Die S.M.A.R.T.-Festplattenüberwachung installieren

```bash
sudo pacman -S smartmontools
```

### Den Remote-Desktop-Client KRDC installieren

```bash
sudo pacman -S krdc
```

### Den ultraschnellen Download-Manager aria2 installieren

```bash
sudo pacman -S aria2
```

### Das strukturelle Diff-Werkzeug Difftastic installieren

```bash
sudo pacman -S difftastic
```

### Das offizielle GitHub-Kommandozeilenwerkzeug (GitHub CLI) installieren

```bash
# sudo pacman -S github-cli
```

### Das Software-Reverse-Engineering-Framework Ghidra über yay installieren

```bash
yay -S ghidra
```

### Das universitäre WLAN (eduroam) fehlerfrei einrichten

```bash
# sudo pacman -S --needed networkmanager python-dbus ca-certificates
# yay -S geteduroam-gui
```

### Die offizielle Open-Source-Alternative für Universitäts-VPNs installieren

```bash
# yay -S globalprotect-bin
sudo pacman -S globalprotect-openconnect
# run: gpclient launch-gui
# yay -S wireguird
# yay -S wireguard-gui-bin
```

### Nützliche Fish plugins

```bash
fisher install jorgebucaran/autopair.fish nickeb96/fish-vim edc/bass PatrickF1/fzf.fish
```

### Modernes Datei-Listing und ein interaktiver Terminal-Spickzettel

```bash
sudo pacman -S eza navi
```

### Die offizielle Spickzettel-Datenbank für navi hinzufügen

```bash
navi repo add denisidoro/cheats
```

### Die CachyOS-spezifischen Spickzettel für navi hinzufügen (Optional)

```bash
# navi repo add cachyos/cheats
```

### Für yazi: Die Desktop-Integrationswerkzeuge xdg-utils installieren

```bash
sudo pacman -S xdg-utils
```

### Für yazi: Die MIME-Typ-Erkennung perl-file-mimeinfo installieren

```bash
sudo pacman -S perl-file-mimeinfo
```

### Mauszeiger-Animationen (Cursor Shaders) für Ghostty einrichten

```bash
git clone https://github.com/sahaj-b/ghostty-cursor-shaders ~/.config/ghostty/shaders
```

```bash
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
grep -RinE \
'npm|node|curl.*\||wget.*\||bash -c|sh -c|eval|base64|openssl|nc |socat|python -c' \
~/.cache/yay/*/PKGBUILD
yay -Qm
ls ~/.cache/yay
grep "2026-06" /var/log/pacman.log | tail -100
grep -E "installed|upgraded" /var/log/pacman.log | tail -200
grep -R "atomic-lockfile" /tmp 2>/dev/null
grep -R "npm install" ~/.cache/yay 2>/dev/null
pacman -Qm
find ~ -iname "*atomic-lockfile*" 2>/dev/null
npm list -g 2>/dev/null | grep atomic-lockfile
grep -R "atomic-lockfile" /var/cache 2>/dev/null
grep -R "atomic-lockfile" ~/.cache/yay 2>/dev/null
sudo pacman -S clamav
sudo freshclam
clamscan -r -i ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
clamscan -r -i ~/.cargo ~/.sdkman ~/.npm ~/.local/lib/python3*/site-packages ~/Downloads
clamscan -r -i ~/.cache/yay
sudo pacman -S rkhunter
sudo rkhunter --update
sudo rkhunter --propupd
sudo rkhunter --check
```

### Den SSH-Server sofort ausschalten und dauerhaft deaktivieren

```bash
sudo systemctl disable --now sshd # Falls du SSH nicht brauchst
# sudo systemctl enable --now sshd # Wider einschalten, wen man es doch braucht
```

### Das Begrüßungsprogramm von CachyOS entfernen 

```bash
# sudo pacman -Rns cachyos-hello
```

### Instalation von En Croissant, eine moderne grafische Benutzeroberfläche (GUI) für Schachdatenbanken und Partienanalysen.

```bash
# yay -S en-croissant-bin
# sudo pacman -S webkit2gtk-4.1
# yay -S stockfish
# sudo pacman -S gst-plugins-good
```

### Den Boot-Bildschirm (Plymouth) anpassen und das System-Abbild neu bauen

```bash
# yay -S plymouth-theme-arch-logo
# sudo plymouth-set-default-theme -R arch-logo
# plymouth-set-default-theme
# yay -Rns plymouth-theme-arch-logo
# sudo plymouth-set-default-theme -R bgrt
# sudo mkinitcpio -P
# /home/jk/.config/quickshell/ii/assets/icons/
# arch-logo
```

## Nach der neovim config:

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
# printf "git:
#   paging:
#     colorArg: always
#     pager: delta --dark --paging=never --line-numbers
# os:
#   editCommand: 'nvim'" > ~/.config/lazygit/config.yml

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

und evt. bei Problemen:

```bash
# Installiert den stabileren Realtek WLAN-Treiber aus dem AUR und deaktiviert die fehlerhafte Kernel-Version
yay -S rtw88-dkms-git
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
# warp-cli register
warp-cli registration new
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
warp-cli dns families malware
warp-cli settings
# warp-cli connectivity-check
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

Wichtig:

```bash
tailscale ip
```

```bash
tailscale up --authkey [key]
```

# Swap erhöhen:

```bash
sudo nvim /etc/systemd/zram-generator.conf
```

```txt
[zram0]
zram-size = 16384
```

Nie über 1,5:1 gehen!!! Bei 16Gb RAM die über 24576 ZRAM, gehe, auch 1,5:1 ist die Schmerzgrenze.

```bash
sudo systemctl daemon-reload
sudo systemctl restart systemd-zram-setup@zram0.service
reboot
```

```bash
swapon --show
```

# cachy os optimirung

Prüfen, ob aktiv: Geben Sie im Terminal ein:

```bash
bashsystemctl status uksmd
```

Aktivieren (falls aus): Sollte er nicht laufen, starten Sie ihn mit:

```bash
sudo pacman -S cachyos-ksm-settings
bashsudo systemctl enable --now uksmd
# sudo systemctl disable --now uksmd
# sudo pacman -R cachyos-ksm-settings
```

# Remote Desktop Connection (Windows ↔ Linux)

```bash
sudo pacman -S xrdp 
sudo pacman -S xorgxrdp 
sudo systemctl enable xrdp 
sudo systemctl start xrdp 
sudo ufw allow from 192.168.1.0/24 to any port 3389 
sudo pacman -S fail2ban 
sudo systemctl enable --now fail2ban
```

# Remote Desktop für Hyprland (Windows ↔ Linux)

## Linux (Hyprland)

### Installieren

```bash id="hk4a3v"
sudo pacman -S sunshine fail2ban
```

```bash
mkdir -p ~/.config/systemd/user
nvim ~/.config/systemd/user/sunshine.service
```

```txt
[Unit]
Description=Sunshine Game Streaming Host
After=graphical-session.target

[Service]
ExecStart=/usr/bin/sunshine
Restart=on-failure

[Install]
WantedBy=default.target
```

### Starten

```bash id="x4a2mw"
systemctl --user daemon-reload
systemctl --user enable --now sunshine.service
sudo systemctl enable --now fail2ban
systemctl --user status sunshine
```

### Firewall (nur LAN)

```bash id="7xb7z4"
sudo ufw allow from 192.168.x.x to any port 47984:48010 proto tcp
sudo ufw allow from 192.168.x.x to any port 47998:48010 proto udp
```

### Setup öffnen

```text id="5q0s6k"
https://localhost:47990
```

Bei Problemen:

Gehe zu Configuration -> Audio/Video.Ändere den Wert bei Monitor Index.

evt.: alsa_output.pci-0000_e5_00.1.hdmi-stereo

oder auch einfach mal neustarten:

```bash
systemctl --user stop sunshine
sleep 2
systemctl --user start sunshine
```

Tip: Es kann bei Sunshine mit Kurserausblenden zu Probelem führen, diebezüglich würde ich volgende einstellungen für end-4 Hyperland bervorzugen:

```text
cursor {
    no_hardware_cursors = true
    inactive_timeout = 0
    zoom_factor = 1
    zoom_rigid = false
    zoom_disable_aa = true
    hotspot_padding = 1
}
```

# Windows

## Moonlight installieren

[Moonlight Official Website](https://moonlight-stream.org/?utm_source=chatgpt.com)

## Verbinden

```text id="0u3v9h"
Moonlight öffnen → Linux-PC auswählen → Pairing-Code eingeben
```

# OpenClaw

```
npm i -g openclaw@latest
openclaw onboard --install-daemon
openclaw models auth login-github-copilot
```
