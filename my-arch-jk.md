> ## 🚨 Arch Linux AUR-Malware? So prüfst du dein System!
> Im Juni 2026 gab es eine massive Supply-Chain-Attacke auf das Arch User Repository (AUR), bei der über 1600 Pakete mit Infostealern und eBPF-Rootkits infiziert wurden.
> Die Arch-Community hat ein großartiges Open-Source-Tool entwickelt, mit dem ihr euer System komplett durchleuchten könnt (inklusive aller Pacman-Logs, systemd-Dienste und npm/bun/yarn/pnpm-Caches).
> ## Schnell-Check in 3 Schritten:
> 1. Repository klonen und Ordner öffnen:
> 
> ```bash
> git clone https://github.com/lenucksi/aur-malware-check.git
> cd aur-malware-check
> ```
> 
> 2. Risikofreier Testlauf (holt die neuesten Listen, scannt ohne Root):
> 
> ```bash
> python -m aur_check --refresh-campaigns --dry-run
> ```
> 
> 3. Der vollständige Tiefenscan (erfordert sudo für eBPF- und Systemd-Prüfungen):
>
> ```bash
> sudo python -m aur_check --refresh --full
> ```
> 
> Wenn am Ende RESULT: CLEAN steht, ist alles im grünen Bereich! Falls das Tool anschlägt, solltet ihr umgehend eure Passwörter und SSH-Keys von einem anderen Gerät aus ändern.
> Bleibt sicher! 🐧

Bitte installieren Sie eine Arch-basierte Distribution – vorzugsweise [Arch Linux](https://archlinux.org), [CachyOS](https://cachyos.org), [EndeavourOS](https://endeavouros.com), [Garuda Linux](https://garudalinux.org) oder [Manjaro](https://manjaro.org). Die Konfiguration sollte vollständig auf Hyprland unter Wayland basieren.

Fish und nicht bash oder zsh!!!

Bitte führen sie alle Commands aus und fügen sie .config in ihr Systhem ein.

- [Meine Arch Config](#meine-arch-config)
  - [Entwicklung Plugins](#entwicklung-plugins)
    - [Zum Startpunkt wechseln](#zum-startpunkt-wechseln)
    - [Das System aktualisieren](#das-system-aktualisieren)
    - [Paketdatenbank prüfen](#paketdatenbank-prüfen)
    - [Die Werkzeuge für den Bau von Software installieren](#die-werkzeuge-für-den-bau-von-software-installieren)
    - [Die end-4 Hyperland Konfiguration herunterladen und die Installation starten](#die-end-4-hyperland-konfiguration-herunterladen-und-die-installation-starten)
    - [Die Firewall sofort einschalten und dauerhaft aktivieren](#die-firewall-sofort-einschalten-und-dauerhaft-aktivieren)
    - [Den Quellcode von yay herunterladen und das Programm bauen und installieren](#den-quellcode-von-yay-herunterladen-und-das-programm-bauen-und-installieren)
    - [Kern-Werkzeuge und Entwickler-Tools installieren](#kern-werkzeuge-und-entwickler-tools-installieren)
    - [Das Multilib-Repository in den Systemquellen aktivieren](#das-multilib-repository-in-den-systemquellen-aktivieren)
    - [Plugin für Decompilation in radare2 (Terminal)](#plugin-für-decompilation-in-radare2-terminal)
    - [Go und Make über den Paketmanager installieren](#go-und-make-über-den-paketmanager-installieren)
    - [Für C/C++ (keines extra)](#für-cc-keines-extra)
    - [C/C++ Compiler, Build-Systeme und Advanced Debugging installieren](#cc-compiler-build-systeme-und-advanced-debugging-installieren)
    - [Mehrere Java-Versionen und die Build-Tool Gradle und Maven installieren](#mehrere-java-versionen-und-die-build-tool-gradle-und-maven-installieren)
    - [Den x86-Assembler und grundlegende Binär-Werkzeuge installieren](#den-x86-assembler-und-grundlegende-binär-werkzeuge-installieren)
    - [Das Exploit-Entwicklungs-Framework Pwntools installieren](#das-exploit-entwicklungs-framework-pwntools-installieren)
    - [Die Programmiersprache und Compiler-Toolchain Zig installieren](#die-programmiersprache-und-compiler-toolchain-zig-installieren)
    - [Die JetBrains Toolbox installieren und starten](#die-jetbrains-toolbox-installieren-und-starten)
    - [Docker und Erweiterungen installieren](#docker-und-erweiterungen-installieren)
    - [Nützliche Systemwerkzeuge und Python einrichten](#nützliche-systemwerkzeuge-und-python-einrichten)
    - [Ultraschnelle Textsuche installieren](#ultraschnelle-textsuche-installieren)
    - [Die intelligente Ordner-Navigation einrichten](#die-intelligente-ordner-navigation-einrichten)
    - [JavaScript-Laufzeitumgebung und Paketmanager installieren](#javascript-laufzeitumgebung-und-paketmanager-installieren)
    - [.NET SDK](#net-sdk)
    - [Das Standard-Kompressionswerkzeug installieren](#das-standard-kompressionswerkzeug-installieren)
    - [TypeScript installieren](#typescript-installieren)
    - [Die ultimative LaTeX-Umgebung installieren](#die-ultimative-latex-umgebung-installieren)
    - [Die Rechtschreibprüfung für Deutsch und Englisch installieren](#die-rechtschreibprüfung-für-deutsch-und-englisch-installieren)
    - [Moderne Terminal-Emulatoren installieren](#moderne-terminal-emulatoren-installieren)
    - [Akku- und Hardware-Informationen auslesen](#akku--und-hardware-informationen-auslesen)
    - [LazyVim und JetBrains Mono Nerd Font installieren](#lazyvim-und-jetbrains-mono-nerd-font-installieren)
  - [Fun:](#fun)
    - [Das System-Informationswerkzeug Fastfetch installieren](#das-system-informationswerkzeug-fastfetch-installieren)
    - [Den interaktiven Prozess-Viewer htop installieren](#den-interaktiven-prozess-viewer-htop-installieren)
    - [Den hochentwickelten System-Monitor btop installieren](#den-hochentwickelten-system-monitor-btop-installieren)
    - [Den GPU-Prozess-Monitor nvtop installieren](#den-gpu-prozess-monitor-nvtop-installieren)
    - [Den Terminal-Dateimanager und die Bildvorschau installieren](#den-terminal-dateimanager-und-die-bildvorschau-installieren)
    - [Das Zeitmessungs-Werkzeug time installieren](#das-zeitmessungs-werkzeug-time-installieren)
    - [Das professionelle Benchmarking-Werkzeug Hyperfine installieren](#das-professionelle-benchmarking-werkzeug-hyperfine-installieren)
    - [Den Terminal-Multiplexer tmux installieren](#den-terminal-multiplexer-tmux-installieren)
    - [Den Anwendungsstarter Wofi installieren](#den-anwendungsstarter-wofi-installieren)
    - [Die intelligente Ordner-Navigation zoxide installieren](#die-intelligente-ordner-navigation-zoxide-installieren)
    - [Den Hex-Editor GHex installieren](#den-hex-editor-ghex-installieren)
    - [Die moderne cat-Alternative bat installieren](#die-moderne-cat-alternative-bat-installieren)
    - [Den ultraschnellen Terminal-Dateimanager Yazi installieren](#den-ultraschnellen-terminal-dateimanager-yazi-installieren)
    - [Das interaktive Git-Terminalwerkzeug LazyGit installieren](#das-interaktive-git-terminalwerkzeug-lazygit-installieren)
    - [Den Verzeichnisbaum-Generator tree installieren](#den-verzeichnisbaum-generator-tree-installieren)
    - [Das ultraschnelle Suchwerkzeug ripgrep installieren](#das-ultraschnelle-suchwerkzeug-ripgrep-installieren)
    - [Das blitzschnelle Dateisuch-Werkzeug fd installieren](#das-blitzschnelle-dateisuch-werkzeug-fd-installieren)
    - [Die moderne und farbenfrohe ls-Alternative eza installieren](#die-moderne-und-farbenfrohe-ls-alternative-eza-installieren)
    - [Die vereinfachten Community-Handbücher tldr installieren](#die-vereinfachten-community-handbücher-tldr-installieren)
    - [Den JSON-Datenprozessor jq installieren](#den-json-datenprozessor-jq-installieren)
    - [Die grafische Monitor-Konfiguration nwg-displays installieren](#die-grafische-monitor-konfiguration-nwg-displays-installieren)
    - [Das Bildverarbeitungs-Framework ImageMagick installieren](#das-bildverarbeitungs-framework-imagemagick-installieren)
    - [Den Tippfehler-Korrektor thefuck installieren](#den-tippfehler-korrektor-thefuck-installieren)
    - [Die Programmiersprache Lua in der Version 5.1 installieren](#die-programmiersprache-lua-in-der-version-51-installieren)
    - [Microsoft Visual Studio Code (VS Code) über yay installieren](#microsoft-visual-studio-code-vs-code-über-yay-installieren)
    - [Den Discord-Client über den Paketmanager installieren](#den-discord-client-über-den-paketmanager-installieren)
    - [Den Signal Messenger installieren](#den-signal-messenger-installieren)
    - [Den Brave Browser über yay installieren](#den-brave-browser-über-yay-installieren)
    - [Den datenschutzfokussierten Mullvad Browser installieren](#den-datenschutzfokussierten-mullvad-browser-installieren)
    - [Google Chrome über den AUR-Helfer installieren](#google-chrome-über-den-aur-helfer-installieren)
    - [Den datenschutzfokussierten LibreWolf Browser installieren](#den-datenschutzfokussierten-librewolf-browser-installieren)
    - [Die Firefox Developer Edition installieren](#die-firefox-developer-edition-installieren)
    - [Das grafische Archivierungsprogramm Ark installieren](#das-grafische-archivierungsprogramm-ark-installieren)
    - [sudo pacman -S kate](#sudo-pacman--s-kate)
    - [Der grafische Bildbetrachter Gwenview installieren](#der-grafische-bildbetrachter-gwenview-installieren)
    - [Der universelle Dokumentenbetrachter Okular installieren](#der-universelle-dokumentenbetrachter-okular-installieren)
    - [Den universellen Medienplayer VLC installieren](#den-universellen-medienplayer-vlc-installieren)
    - [Den funktionsreichen Terminal-Emulator Konsole installieren](#den-funktionsreichen-terminal-emulator-konsole-installieren)
    - [Die Wissensdatenbank Obsidian installieren](#die-wissensdatenbank-obsidian-installieren)
    - [Den grafischen Plasma-Systemmonitor installieren](#den-grafischen-plasma-systemmonitor-installieren)
    - [Den Taskmanager Mission Center über yay installieren](#den-taskmanager-mission-center-über-yay-installieren)
    - [Das digitale Mal- und Zeichenprogramm Krita installieren](#das-digitale-mal--und-zeichenprogramm-krita-installieren)
    - [Das Bildbearbeitungsprogramm GIMP installieren](#das-bildbearbeitungsprogramm-gimp-installieren)
    - [Das professionelle Videoschnittprogramm Kdenlive installieren](#das-professionelle-videoschnittprogramm-kdenlive-installieren)
    - [Das professionelle All-in-One-Videoschnittprogramm DaVinci Resolve installieren](#das-professionelle-all-in-one-videoschnittprogramm-davinci-resolve-installieren)
    - [Das plattformübergreifende Videoschnittprogramm Shotcut installieren](#das-plattformübergreifende-videoschnittprogramm-shotcut-installieren)
    - [Die 3D-Grafik- und Animations-Suite Blender installieren](#die-3d-grafik--und-animations-suite-blender-installieren)
    - [Den E-Mail- und Kalender-Client Thunderbird installieren](#den-e-mail--und-kalender-client-thunderbird-installieren)
    - [Den wissenschaftlichen Taschenrechner Qalculate! installieren](#den-wissenschaftlichen-taschenrechner-qalculate-installieren)
    - [Die Streaming- und Aufnahme-Software OBS Studio installieren](#die-streaming--und-aufnahme-software-obs-studio-installieren)
    - [Das Software-Zentrum Discover und das Flatpak-System installieren](#das-software-zentrum-discover-und-das-flatpak-system-installieren)
    - [Die Desktop-Uhr KClock installieren](#die-desktop-uhr-kclock-installieren)
    - [Den Morgen Calendar über yay installieren](#den-morgen-calendar-über-yay-installieren)
    - [Das Smartphone-Integrationswerkzeug KDE Connect installieren](#das-smartphone-integrationswerkzeug-kde-connect-installieren)
    - [Eine ältere Python-Version (3.12) über yay installieren](#eine-ältere-python-version-312-über-yay-installieren)
    - [Die Office-Suite LibreOffice installieren](#die-office-suite-libreoffice-installieren)
    - [Die Microsoft-kompatiblen Liberation-Schriftarten installieren](#die-microsoft-kompatiblen-liberation-schriftarten-installieren)
    - [Das Sandbox-Sicherheitswerkzeug Firejail installieren](#das-sandbox-sicherheitswerkzeug-firejail-installieren)
    - [Das vollständige Linux-Drucksystem (CUPS) einrichten](#das-vollständige-linux-drucksystem-cups-einrichten)
    - [Die offiziellen HP-Druckertreiber (HPLIP) installieren](#die-offiziellen-hp-druckertreiber-hplip-installieren)
    - [Die moderne LaTeX-Alternative Tectonic und den Dokumenten-Konverter Pandoc einrichten](#die-moderne-latex-alternative-tectonic-und-den-dokumenten-konverter-pandoc-einrichten)
    - [Text-zu-PostScript-Konverter und PDF-Interpreter installieren](#text-zu-postscript-konverter-und-pdf-interpreter-installieren)
    - [Den Drucker-Hintergrunddienst aktivieren](#den-drucker-hintergrunddienst-aktivieren)
    - [Den Netzwerk-Erkennungsdienst Avahi aktivieren](#den-netzwerk-erkennungsdienst-avahi-aktivieren)
    - [Die Rust-Alternative für den sudo-Befehl installieren](#die-rust-alternative-für-den-sudo-befehl-installieren)
    - [Die HEIF- und AVIF-Bildbibliothek libheif installieren](#die-heif--und-avif-bildbibliothek-libheif-installieren)
    - [Die erweiterten Bildformat-Plugins für KDE installieren](#die-erweiterten-bildformat-plugins-für-kde-installieren)
    - [Den Netzwerk-Bandbreiten-Monitor bandwhich installieren](#den-netzwerk-bandbreiten-monitor-bandwhich-installieren)
    - [Den Netzwerk-Protokollanalysator Wireshark installieren](#den-netzwerk-protokollanalysator-wireshark-installieren)
    - [Den zweispaltigen Dateimanager Krusader installieren](#den-zweispaltigen-dateimanager-krusader-installieren)
    - [Das offizielle 7-Zip-Kompressionswerkzeug installieren](#das-offizielle-7-zip-kompressionswerkzeug-installieren)
    - [QEMU, KVM und die grafische Verwaltung Virt-Manager installieren](#qemu-kvm-und-die-grafische-verwaltung-virt-manager-installieren)
    - [Den Virtualisierungs-Dienst für KVM/QEMU aktivieren](#den-virtualisierungs-dienst-für-kvmqemu-aktivieren)
    - [Festplatten-Diagnosewerkzeuge scannen](#festplatten-diagnosewerkzeuge-scannen)
    - [Erweiterte Gruppenrechte für native Kernel-Virtualisierung (KVM) setzen](#erweiterte-gruppenrechte-für-native-kernel-virtualisierung-kvm-setzen)
    - [Das Highlight: Der optimale QEMU-Startbefehl (Die 2. Variante ist besser!)](#das-highlight-der-optimale-qemu-startbefehl-die-2-variante-ist-besser)
    - [Den grafischen Audio-Mixer pwvucontrol installieren](#den-grafischen-audio-mixer-pwvucontrol-installieren)
    - [Den grafischen Audio-Verkabelungs-Manager qpwgraph installieren](#den-grafischen-audio-verkabelungs-manager-qpwgraph-installieren)
    - [Die lokale KI-Laufzeitumgebung Ollama installieren](#die-lokale-ki-laufzeitumgebung-ollama-installieren)
    - [Die S.M.A.R.T.-Festplattenüberwachung installieren](#die-smart-festplattenüberwachung-installieren)
    - [Den Remote-Desktop-Client KRDC installieren](#den-remote-desktop-client-krdc-installieren)
    - [Den ultraschnellen Download-Manager aria2 installieren](#den-ultraschnellen-download-manager-aria2-installieren)
    - [Das strukturelle Diff-Werkzeug Difftastic installieren](#das-strukturelle-diff-werkzeug-difftastic-installieren)
    - [Das offizielle GitHub-Kommandozeilenwerkzeug (GitHub CLI) installieren](#das-offizielle-github-kommandozeilenwerkzeug-github-cli-installieren)
    - [Das Software-Reverse-Engineering-Framework Ghidra über yay installieren](#das-software-reverse-engineering-framework-ghidra-über-yay-installieren)
    - [Das universitäre WLAN (eduroam) fehlerfrei einrichten](#das-universitäre-wlan-eduroam-fehlerfrei-einrichten)
    - [Die offizielle Open-Source-Alternative für Universitäts-VPNs installieren](#die-offizielle-open-source-alternative-für-universitäts-vpns-installieren)
    - [Nützliche Fish plugins](#nützliche-fish-plugins)
    - [Modernes Datei-Listing und ein interaktiver Terminal-Spickzettel](#modernes-datei-listing-und-ein-interaktiver-terminal-spickzettel)
    - [Die offizielle Spickzettel-Datenbank für navi hinzufügen](#die-offizielle-spickzettel-datenbank-für-navi-hinzufügen)
    - [Die CachyOS-spezifischen Spickzettel für navi hinzufügen (Optional)](#die-cachyos-spezifischen-spickzettel-für-navi-hinzufügen-optional)
    - [Für yazi: Die Desktop-Integrationswerkzeuge xdg-utils installieren](#für-yazi-die-desktop-integrationswerkzeuge-xdg-utils-installieren)
    - [Für yazi: Die MIME-Typ-Erkennung perl-file-mimeinfo installieren](#für-yazi-die-mime-typ-erkennung-perl-file-mimeinfo-installieren)
    - [Mauszeiger-Animationen (Cursor Shaders) für Ghostty einrichten](#mauszeiger-animationen-cursor-shaders-für-ghostty-einrichten)
    - [Einen modularen Fish-Konfigurationsordner erstellen](#einen-modularen-fish-konfigurationsordner-erstellen)
    - [Den praktischen Befehls-Ausführer just installieren](#den-praktischen-befehls-ausführer-just-installieren)
    - [Überprüfung der AUR-Paketquellen auf Schadcode (Malware-Hunting)](#überprüfung-der-aur-paketquellen-auf-schadcode-malware-hunting)
    - [Suche nach der spezifischen Malware-Signatur (atomic-lockfile)](#suche-nach-der-spezifischen-malware-signatur-atomic-lockfile)
    - [Kontrolle installierter Fremdpakete \& Paketmanager-Historie](#kontrolle-installierter-fremdpakete--paketmanager-historie)
    - [Virenscan mit ClamAV (Deep Scan sensibler Entwickler-Ordner)](#virenscan-mit-clamav-deep-scan-sensibler-entwickler-ordner)
    - [Rootkit-Erkennung mit Rootkit Hunter (rkhunter)](#rootkit-erkennung-mit-rootkit-hunter-rkhunter)
    - [Den SSH-Server sofort ausschalten und dauerhaft deaktivieren](#den-ssh-server-sofort-ausschalten-und-dauerhaft-deaktivieren)
    - [Das Begrüßungsprogramm von CachyOS entfernen](#das-begrüßungsprogramm-von-cachyos-entfernen)
    - [Instalation von En Croissant, eine moderne grafische Benutzeroberfläche (GUI) für Schachdatenbanken und Partienanalysen.](#instalation-von-en-croissant-eine-moderne-grafische-benutzeroberfläche-gui-für-schachdatenbanken-und-partienanalysen)
    - [Den Boot-Bildschirm (Plymouth) anpassen und das System-Abbild neu bauen](#den-boot-bildschirm-plymouth-anpassen-und-das-system-abbild-neu-bauen)
  - [Nach der neovim config:](#nach-der-neovim-config)
    - [Code über den LSP-Server im Editor formatieren](#code-über-den-lsp-server-im-editor-formatieren)
    - [emfehlungen:](#emfehlungen)
    - [ufw ist langsam:](#ufw-ist-langsam)
    - [Langsames Internet](#langsames-internet)
    - [Firefox ist langsam](#firefox-ist-langsam)
    - [librewulf google securtiy:](#librewulf-google-securtiy)
    - [repairen von haskel](#repairen-von-haskel)
- [WARP Cloudflair "1.1.1.1"](#warp-cloudflair-1111)
- [TailScale](#tailscale)
- [Swap erhöhen:](#swap-erhöhen)
- [cachy os optimirung](#cachy-os-optimirung)
- [Remote Desktop Connection (Windows ↔ Linux)](#remote-desktop-connection-windows--linux)
- [Remote Desktop für Hyprland (Windows ↔ Linux)](#remote-desktop-für-hyprland-windows--linux)
  - [Linux (Hyprland)](#linux-hyprland)
    - [Installieren](#installieren)
    - [Starten](#starten)
    - [Firewall (nur LAN)](#firewall-nur-lan)
    - [Setup öffnen](#setup-öffnen)
- [Windows](#windows)
  - [Moonlight installieren](#moonlight-installieren)
  - [Verbinden](#verbinden)
- [OpenClaw](#openclaw)

# Meine Arch Config

## Entwicklung Plugins

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

### .NET SDK

```bash
sudo pacman -S dotnet-sdk
sudo pacman -S dotnet-runtime aspnet-runtime
fish_add_path $HOME/.dotnet/tools
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
sudo pacman -S tectonic
sudo pacman -S texlive-langgreek
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

### Den Audio-Editor Audacity installieren

```bash
sudo pacman -S audacity
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
# yay -S mission-center
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

### Das professionelle All-in-One-Videoschnittprogramm DaVinci Resolve installieren

```bash
sudo pacman -S davinci-resolve

# Bei CachyOS reicht die Installation von davinci-resolve meistens aus.
# Bei anderen Arch-basierten Distributionen müssen die Treiber manuell installiert werden:
# sudo pacman -S cuda opencl-nvidia
# sudo pacman -S rocm-opencl-runtime

# ffmpeg -i eingabe.mp4 -c:v prores_ks -profile:v 3 -c:a pcm_s16le ausgabe.mov
# mkdir -p konvertiert && for f in *.mp4; do ffmpeg -i "$f" -c:v prores_ks -profile:v 3 -c:a pcm_s16le "konvertiert/${f%.mp4}.mov"; done
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
# sudo pacman -S xdg-desktop-portal xdg-desktop-portal-hyprland pipewire wireplumber
# systemctl --user status xdg-desktop-portal
# systemctl --user status xdg-desktop-portal-hyprland
# systemctl --user restart xdg-desktop-portal
# systemctl --user restart xdg-desktop-portal-hyprland
# systemctl --user restart pipewire wireplumber
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
# https://github.com/catppuccin/ghidra/blob/main/themes/catppuccin-mocha.theme
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

### Einen modularen Fish-Konfigurationsordner erstellen

```bash
mkdir -p ~/.config/fish/conf.d
```

### Den praktischen Befehls-Ausführer just installieren
```bash
sudo pacman -S just
```

### Überprüfung der AUR-Paketquellen auf Schadcode (Malware-Hunting)

```bash
# npm install -g @mermaid-js/mermaid-cli
grep -RinE \
'npm|node|curl.*\||wget.*\||bash -c|sh -c|eval|base64|openssl|nc |socat|python -c' \
~/.cache/yay/*/PKGBUILD
grep -R "atomic-lockfile" /tmp 2>/dev/null
grep -R "npm install" ~/.cache/yay 2>/dev/null
pacman -Qm
```

### Suche nach der spezifischen Malware-Signatur (atomic-lockfile)

```bash
find ~ -iname "*atomic-lockfile*" 2>/dev/null
npm list -g 2>/dev/null | grep atomic-lockfile
grep -R "atomic-lockfile" /var/cache 2>/dev/null
grep -R "atomic-lockfile" ~/.cache/yay 2>/dev/null
```

### Kontrolle installierter Fremdpakete & Paketmanager-Historie

```bash
yay -Qm
ls ~/.cache/yay
grep "2026-06" /var/log/pacman.log | tail -100
grep -E "installed|upgraded" /var/log/pacman.log | tail -200
```

### Virenscan mit ClamAV (Deep Scan sensibler Entwickler-Ordner)

```bash
sudo pacman -S clamav
sudo freshclam
clamscan -r -i ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
clamscan -r -i ~/.cargo ~/.sdkman ~/.npm ~/.local/lib/python3*/site-packages ~/Downloads
clamscan -r -i ~/.cache/yay
```

### Rootkit-Erkennung mit Rootkit Hunter (rkhunter)

```bash
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
sudo pacman -R cachyos-hell
rm ~/.config/autostart/cachyos-hello.desktop
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

# ASM Verzeichnis erstellen
mkdir -p ~/.config/asm-lsp/

# Die Konfiguration schreiben (mit printf)
# printf 'version = "0.10.0"

# [default_config]
# assembler = "gas"
# instruction_set = "x86-64"

# [default_config.opts]
# compiler = "as"
# diagnostics = true
# default_diagnostics = true' > ~/.config/asm-lsp/.asm-lsp.toml

# rust
rm ~/.cargo/bin/rust-analyzer

# markdown 
cd /home/jk/.local/share/nvim/lazy/markdown-preview.nvim
git checkout -- app/yarn.lock   

# lazygit Verzeichnis erstellen
mkdir -p ~/.config/lazygit/

# Die Konfiguration direkt mit printf schreiben (sicherer in fish)
# printf "git:
#   paging:
#     colorArg: always
#     pager: delta --dark --paging=never --line-numbers
# os:
#   editCommand: 'nvim'" > ~/.config/lazygit/config.yml

```

### Code über den LSP-Server im Editor formatieren

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
# sudo pacman -S linux-cachyos-headers
# Installiert den stabileren Realtek WLAN-Treiber aus dem AUR und deaktiviert die fehlerhafte Kernel-Version
yay -S rtw88-dkms-git
```

### Firefox ist langsam

> Ist nicht notwenig bei modernen Linux OS.
Firefox nutzt unter Linux nicht immer automatisch deine Grafikkarte. So schaltest du sie manuell ein:
- Gib `about:config` in die Adresszeile ein und bestätige die Warnung.
- Suche nach der Einstellung: `layers.acceleration.force-enabled`
- Klicke doppelt darauf, um den Wert auf `true` zu setzen.

> Diese Einstellung sorgt dafür, dass Firefox die SSD nicht mehr beansprucht und stattdessen alle temporären Daten direkt im blitzschnellen Arbeitsspeicher (RAM) ablegt.
Nur RAM-Cache nutzen (Einfachste Methode):
Dies kann durch das Ändern der internen Einstellungen im Firefox erfolgen.
- Öffne `about:config`.
- Suche nach der Einstellung `browser.cache.disk.enable`.
- Klicke doppelt darauf, um den Wert auf `false` zu setzen.

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
