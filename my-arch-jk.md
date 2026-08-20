<details>
<summary>🚨 Arch Linux AUR-Malware? So prüfst du dein System!</summary>

# 🚨 Arch Linux AUR-Malware? So prüfst du dein System!

Im Juni 2026 gab es eine massive Supply-Chain-Attacke auf das Arch User Repository (AUR), bei der über 1600 Pakete mit Infostealern und eBPF-Rootkits infiziert wurden.
Die Arch-Community hat ein großartiges Open-Source-Tool entwickelt, mit dem ihr euer System komplett durchleuchten könnt (inklusive aller Pacman-Logs, systemd-Dienste und npm/bun/yarn/pnpm-Caches).

## Schnell-Check in 3 Schritten

1. Repository klonen und Ordner öffnen

```bash
git clone https://github.com/lenucksi/aur-malware-check.git
cd aur-malware-check
```

2. Risikofreier Testlauf (holt die neuesten Listen, scannt ohne Root)

```bash
python -m aur_check --refresh-campaigns --dry-run
```

3. Der vollständige Tiefenscan (erfordert sudo für eBPF- und Systemd-Prüfungen)

```bash
sudo python -m aur_check --refresh --full
```

Wenn am Ende RESULT: CLEAN steht, ist alles im grünen Bereich! Falls das Tool anschlägt, solltet ihr umgehend eure Passwörter und SSH-Keys von einem anderen Gerät aus ändern.
Bleibt sicher! 🐧

</details>

Bitte installieren Sie eine Arch-basierte Distribution – vorzugsweise [Arch Linux](https://archlinux.org), [CachyOS](https://cachyos.org), [EndeavourOS](https://endeavouros.com), [Garuda Linux](https://garudalinux.org) oder [Manjaro](https://manjaro.org). Die Konfiguration sollte vollständig auf Hyprland unter Wayland basieren.

Fish und nicht bash oder zsh!!!

Bitte führen sie alle Commands aus und fügen sie .config in ihr Systhem ein.

- [🚨 Arch Linux AUR-Malware? So prüfst du dein System!](#-arch-linux-aur-malware-so-prüfst-du-dein-system)
  - [Schnell-Check in 3 Schritten](#schnell-check-in-3-schritten)
- [Meine Arch Config](#meine-arch-config)
  - [Entwicklung Plugins](#entwicklung-plugins)
    - [Zum Startpunkt wechseln](#zum-startpunkt-wechseln)
    - [Die schnellsten Mirrors finden](#die-schnellsten-mirrors-finden)
    - [DNS temporär auf Cloudflare (1.1.1.1) setzen](#dns-temporär-auf-cloudflare-1111-setzen)
    - [Das System aktualisieren](#das-system-aktualisieren)
    - [Die Werkzeuge für den Bau von Software installieren](#die-werkzeuge-für-den-bau-von-software-installieren)
    - [Die Firewall sofort einschalten und dauerhaft aktivieren](#die-firewall-sofort-einschalten-und-dauerhaft-aktivieren)
    - [Die end-4 Hyperland Konfiguration herunterladen und die Installation starten](#die-end-4-hyperland-konfiguration-herunterladen-und-die-installation-starten)
    - [Den Quellcode von yay herunterladen und das Programm bauen und installieren](#den-quellcode-von-yay-herunterladen-und-das-programm-bauen-und-installieren)
    - [Kern-Werkzeuge und Entwickler-Tools installieren](#kern-werkzeuge-und-entwickler-tools-installieren)
      - [Basis-Tools](#basis-tools)
      - [Compiler \& Toolchain](#compiler--toolchain)
      - [Debugging](#debugging)
      - [Reverse Engineering](#reverse-engineering)
      - [Fuzzing \& Performance](#fuzzing--performance)
      - [GUI-Bibliotheken](#gui-bibliotheken)
      - [Desktop-Integration](#desktop-integration)
      - [Lua-Entwicklung](#lua-entwicklung)
    - [Das Multilib-Repository in den Systemquellen aktivieren](#das-multilib-repository-in-den-systemquellen-aktivieren)
    - [Plugin für Decompilation in radare2 (Terminal)](#plugin-für-decompilation-in-radare2-terminal)
    - [Go und Make über den Paketmanager installieren](#go-und-make-über-den-paketmanager-installieren)
    - [Für C/C++ (keines extra)](#für-cc-keines-extra)
    - [C/C++ Advanced Debugging installieren](#cc-advanced-debugging-installieren)
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
  - [Fun](#fun)
    - [Das System-Informationswerkzeug Fastfetch installieren](#das-system-informationswerkzeug-fastfetch-installieren)
    - [Den interaktiven Prozess-Viewer htop installieren](#den-interaktiven-prozess-viewer-htop-installieren)
    - [Den hochentwickelten System-Monitor btop installieren](#den-hochentwickelten-system-monitor-btop-installieren)
    - [Den GPU-Prozess-Monitor nvtop installieren](#den-gpu-prozess-monitor-nvtop-installieren)
    - [Den Terminal-Dateimanager und die Bildvorschau installieren](#den-terminal-dateimanager-und-die-bildvorschau-installieren)
    - [Das Zeitmessungs-Werkzeug time installieren](#das-zeitmessungs-werkzeug-time-installieren)
    - [Installiere Radare2 (oft r2 genannt), den fortgeschrittenen Hex-Editor und Reverse-Engineering-Framework](#installiere-radare2-oft-r2-genannt-den-fortgeschrittenen-hex-editor-und-reverse-engineering-framework)
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
    - [GitKraken über yay installieren](#gitkraken-über-yay-installieren)
    - [Den Discord-Client (Vesktop) über den Paketmanager installieren](#den-discord-client-vesktop-über-den-paketmanager-installieren)
    - [Den Signal Messenger installieren](#den-signal-messenger-installieren)
    - [Den Brave Browser über yay installieren](#den-brave-browser-über-yay-installieren)
    - [Den datenschutzfokussierten Mullvad Browser installieren](#den-datenschutzfokussierten-mullvad-browser-installieren)
    - [Google Chrome über den AUR-Helfer installieren](#google-chrome-über-den-aur-helfer-installieren)
    - [Den datenschutzfokussierten LibreWolf Browser installieren](#den-datenschutzfokussierten-librewolf-browser-installieren)
    - [Die Firefox Developer Edition installieren](#die-firefox-developer-edition-installieren)
    - [Das grafische Archivierungsprogramm Ark installieren](#das-grafische-archivierungsprogramm-ark-installieren)
    - [Den erweiterten KDE-Texteditor Kate installieren](#den-erweiterten-kde-texteditor-kate-installieren)
    - [Der grafische Bildbetrachter Gwenview installieren](#der-grafische-bildbetrachter-gwenview-installieren)
    - [Der universelle Dokumentenbetrachter Okular installieren](#der-universelle-dokumentenbetrachter-okular-installieren)
    - [Den universellen Medienplayer VLC installieren](#den-universellen-medienplayer-vlc-installieren)
    - [Den Audio-Editor Audacity installieren](#den-audio-editor-audacity-installieren)
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
    - [Vagrant und das Libvirt-Plugin installieren](#vagrant-und-das-libvirt-plugin-installieren)
      - [Das Highlight: Der optimale QEMU-Startbefell für Ubuntu 26.04 LTS, Kali Linux 2026, Cachy OS + BlackArch Linux](#das-highlight-der-optimale-qemu-startbefell-für-ubuntu-2604-lts-kali-linux-2026-cachy-os--blackarch-linux)
        - [Ubuntu](#ubuntu)
          - [Ubuntu: Installation mit GTK und Sicherheits-Sandbox](#ubuntu-installation-mit-gtk-und-sicherheits-sandbox)
          - [Ubuntu: Standard-Start mit GTK-Display und Hardware-GL](#ubuntu-standard-start-mit-gtk-display-und-hardware-gl)
          - [Ubuntu: Erweiterte Ausführung mit SDL-OpenGL und Hardware-Virtualisierung](#ubuntu-erweiterte-ausführung-mit-sdl-opengl-und-hardware-virtualisierung)
          - [Ubuntu: Full-Featured mit Spice-Unterstützung und Audio-PipeWire](#ubuntu-full-featured-mit-spice-unterstützung-und-audio-pipewire)
          - [Ubuntu: High-Performance mit Cache=none und Native AIO](#ubuntu-high-performance-mit-cachenone-und-native-aio)
          - [Ubuntu: Spice-Server mit RNG-Entropie und Vollem Sicherheits-Setup](#ubuntu-spice-server-mit-rng-entropie-und-vollem-sicherheits-setup)
          - [Ubuntu: **Empfohlener Standard** (Optimiert für Performance \& Sicherheit)](#ubuntu-empfohlener-standard-optimiert-für-performance--sicherheit)
        - [Kali](#kali)
          - [Kali Linux: Minimal-Konfiguration für schnelle Tests](#kali-linux-minimal-konfiguration-für-schnelle-tests)
          - [Kali Linux: Erweitertes Setup mit hochauflösender Grafik](#kali-linux-erweitertes-setup-mit-hochauflösender-grafik)
          - [Kali Linux: Komfortabel mit Spice und Clipboard-Integration](#kali-linux-komfortabel-mit-spice-und-clipboard-integration)
          - [Kali Linux: Maximal sicher mit Q35-Maschine und RNG](#kali-linux-maximal-sicher-mit-q35-maschine-und-rng)
          - [Kali Linux: Kompakt mit 1080p-Auflösung und Spice](#kali-linux-kompakt-mit-1080p-auflösung-und-spice)
          - [Kali Linux: SDL-Display mit Hardware-Virtualisierung und Audio](#kali-linux-sdl-display-mit-hardware-virtualisierung-und-audio)
          - [Kali Linux: Hochperformant mit Cache=none und Native AIO](#kali-linux-hochperformant-mit-cachenone-und-native-aio)
          - [Kali Linux: **Empfohlene Standard-Konfiguration** (Sicher \& Schnell)](#kali-linux-empfohlene-standard-konfiguration-sicher--schnell)
          - [Kali Linux: **Minimales Sicherheits-Setup** für Isolation](#kali-linux-minimales-sicherheits-setup-für-isolation)
        - [Cachy OS + Black Arch](#cachy-os--black-arch)
          - [Cachy OS \& BlackArch: Vorbereitung (Disk \& UEFI-Variablen)](#cachy-os--blackarch-vorbereitung-disk--uefi-variablen)
          - [Cachy OS \& BlackArch: Installation mit UEFI und Sandbox](#cachy-os--blackarch-installation-mit-uefi-und-sandbox)
          - [Cachy OS \& BlackArch: **Empfohlene Konfiguration** (UEFI, OpenGL, PipeWire)](#cachy-os--blackarch-empfohlene-konfiguration-uefi-opengl-pipewire)
          - [Cachy OS \& BlackArch: **Minimales Sicherheits-Setup** ohne UEFI-Komplexität](#cachy-os--blackarch-minimales-sicherheits-setup-ohne-uefi-komplexität)
      - [Ubuntu Configuration](#ubuntu-configuration)
        - [Bei Ubuntu noch](#bei-ubuntu-noch)
      - [BlackArch Configuration](#blackarch-configuration)
        - [BlackArch installieren](#blackarch-installieren)
          - [Cool bei Kde Plasma](#cool-bei-kde-plasma)
        - [Pentesting Tools installieren](#pentesting-tools-installieren)
      - [Kali-Linux Configuration](#kali-linux-configuration)
        - [Passwort ändern](#passwort-ändern)
        - [Snap installieren](#snap-installieren)
        - [Basis-Tools](#basis-tools-1)
        - [Compiler \& Toolchain](#compiler--toolchain-1)
        - [Debugging](#debugging-1)
        - [Reverse Engineering](#reverse-engineering-1)
        - [Fuzzing \& Performance](#fuzzing--performance-1)
        - [GUI-Bibliotheken](#gui-bibliotheken-1)
        - [Benchmarking \& Profiling](#benchmarking--profiling)
        - [Rust](#rust)
        - [Java](#java)
        - [Docker](#docker)
        - [Ghidra](#ghidra)
        - [Fish](#fish)
        - [Update NeoVim](#update-neovim)
      - [Metaexploitable 2](#metaexploitable-2)
        - [Blackarch starten](#blackarch-starten)
        - [Metasploitable 2 starten](#metasploitable-2-starten)
        - [In Blackarch](#in-blackarch)
        - [In Metasploitable 2](#in-metasploitable-2)
        - [Verbindung testen: Von BlackArch aus](#verbindung-testen-von-blackarch-aus)
          - [Ping Metasploitable](#ping-metasploitable)
          - [Ping Internet (muss fehlschlagen)](#ping-internet-muss-fehlschlagen)
          - [Prüfe Firewall-Regeln](#prüfe-firewall-regeln)
        - [Metasploit starten](#metasploit-starten)
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
    - [chkrootkit](#chkrootkit)
    - [lynis](#lynis)
    - [AppArmor sauber aktivieren](#apparmor-sauber-aktivieren)
    - [Globales Menü aktivieren](#globales-menü-aktivieren)
    - [Den SSH-Server sofort ausschalten und dauerhaft deaktivieren](#den-ssh-server-sofort-ausschalten-und-dauerhaft-deaktivieren)
    - [Das Begrüßungsprogramm von CachyOS entfernen](#das-begrüßungsprogramm-von-cachyos-entfernen)
    - [Instalation von En Croissant, eine moderne grafische Benutzeroberfläche (GUI) für Schachdatenbanken und Partienanalysen.](#instalation-von-en-croissant-eine-moderne-grafische-benutzeroberfläche-gui-für-schachdatenbanken-und-partienanalysen)
    - [Den Boot-Bildschirm (Plymouth) anpassen und das System-Abbild neu bauen](#den-boot-bildschirm-plymouth-anpassen-und-das-system-abbild-neu-bauen)
  - [Nach der neovim config](#nach-der-neovim-config)
    - [Code über den LSP-Server im Editor formatieren](#code-über-den-lsp-server-im-editor-formatieren)
    - [Emfehlungen bei end-4](#emfehlungen-bei-end-4)
- [UFW ist langsam](#ufw-ist-langsam)
- [Langsames Internet](#langsames-internet)
- [Firefox ist langsam](#firefox-ist-langsam)
- [Librewulf Google securtiy](#librewulf-google-securtiy)
- [Reparieren von Haskell](#reparieren-von-haskell)
- [WARP Cloudflair "1.1.1.1"](#warp-cloudflair-1111)
- [TailScale](#tailscale)
- [Korrigiertes Skript (Optimiert für 16 GB RAM)](#korrigiertes-skript-optimiert-für-16-gb-ram)
- [Cachy OS optimirung](#cachy-os-optimirung)
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
- [Was ich noch machen würde](#was-ich-noch-machen-würde)
  - [1. System aktualisieren \& Fehler prüfen](#1-system-aktualisieren--fehler-prüfen)
  - [2. Netzwerk-Analyse (Der wichtigste Sicherheitscheck)](#2-netzwerk-analyse-der-wichtigste-sicherheitscheck)
  - [3.1. Paketdatenbank \& Integrität prüfen](#31-paketdatenbank--integrität-prüfen)
  - [3.2. Vertiefte Analyse (Logs \& Verdächtige Skripte)](#32-vertiefte-analyse-logs--verdächtige-skripte)
  - [3.3 Bei Fehlern das Programm neu installieren und:](#33-bei-fehlern-das-programm-neu-installieren-und)

# Meine Arch Config

## Entwicklung Plugins

### Zum Startpunkt wechseln

```bash
cd ~
```

### Die schnellsten Mirrors finden

```bash
sudo cachyos-rate-mirrors
```

### DNS temporär auf Cloudflare (1.1.1.1) setzen

```bash
echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf
```

### Das System aktualisieren

```bash
sudo pacman -Syu
```

### Die Werkzeuge für den Bau von Software installieren

```bash
sudo pacman -S --needed git base-devel
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

```bash
sudo systemctl status ufw
sudo ufw status verbose
ss -tulpen
```

### Die end-4 Hyperland Konfiguration herunterladen und die Installation starten

```bash
git clone https://github.com/end-4/dots-hyprland.git
cd dots-hyprland
```

```bash
git remote -v
git log --oneline -5
grep -RinE "curl|wget|bash -c|sh -c|eval|base64|sudo rm|rm -rf" .
```

```bash
./setup install
```

### Den Quellcode von yay herunterladen und das Programm bauen und installieren

```bash
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### Kern-Werkzeuge und Entwickler-Tools installieren

#### Basis-Tools

```bash
sudo pacman -S curl wget unzip git-delta fzf cmark shellcheck
```

#### Compiler & Toolchain

```bash
sudo pacman -S gcc lib32-gcc-libs llvm clang lldb cmake ninja valgrind clang-tools-extra flawfinder splint bear
```

#### Debugging

```bash
sudo pacman -S gdb gef pwndbg strace ltrace
```

#### Reverse Engineering

```bash
sudo pacman -S rizin binwalk yara elfutils checksec
```

#### Fuzzing & Performance

```bash
sudo pacman -S afl++ perf cppcheck
```

#### GUI-Bibliotheken

```bash
sudo pacman -S gtk4 libadwaita librsvg adwaita-icon-theme
```

#### Desktop-Integration

```bash
sudo pacman -S network-manager-applet polkit-gnome
```

#### Lua-Entwicklung

```bash
sudo pacman -S luarocks
```

```bash
# echo "source /usr/share/gef/gef.py" >> ~/.gdbinit
# echo "source /usr/share/pwndbg/gdbinit.py" >> ~/.gdbinit
```

```bash
# echo core | sudo tee /proc/sys/kernel/core_pattern
```

### Das Multilib-Repository in den Systemquellen aktivieren

```bash
sudo bash -c 'grep -q "^\[multilib\]" /etc/pacman.conf || printf "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf'
```

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --locked cargo-nextest 
cargo install --locked cargo-audit 
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
# r2pm -U
# r2pm -init
# r2pm -i r2ghidra
sudo pacman -Syu radare2 r2ghidra
# sudo pacman -S python-r2pipe
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

### C/C++ Advanced Debugging installieren

```bash
# yay -S rr
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
# sudo pacman -S texlive-meta latexmk zathura zathura-pdf-poppler
# sudo pacman -S texlive-latexextra texlive-pictures, texlive-langgerman texlive-langenglish biber
# sudo pacman -S texlab
# sudo pacman -S tectonic
# sudo pacman -S texlive-langgreek
sudo pacman -S texlive-meta texlive-latexextra texlive-pictures texlive-langgerman texlive-langenglish texlive-langgreek biber zathura zathura-pdf-poppler texlab tectonic
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

## Fun

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

### Installiere Radare2 (oft r2 genannt), den fortgeschrittenen Hex-Editor und Reverse-Engineering-Framework

```bash
sudo pacman -S radare2
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

### GitKraken über yay installieren

```bash
# wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz
# sudo tar -xvzf gitkraken-amd64.tar.gz
# sudo mv gitkraken /opt/
# sudo ln -s /opt/gitkraken/gitkraken /usr/local/bin/gitkraken
# mkdir -p ~/.local/share/applications; printf '%s\n' '[Desktop Entry]' 'Name=GitKraken' 'Comment=Git Client' 'Exec=/opt/gitkraken/gitkraken' 'Icon=/opt/gitkraken/gitkraken.png' 'Terminal=false' 'Type=Application' 'Categories=Development;' > ~/.local/share/applications/gitkraken.desktop

yay -S gitkraken
```

### Den Discord-Client (Vesktop) über den Paketmanager installieren

```bash
# yay -S discord
sudo pacman -S vesktop
```

Bie Problemen:

```bash
systemctl --user restart xdg-desktop-portal
systemctl --user restart xdg-desktop-portal-hyprland
systemctl --user status xdg-desktop-portal-hyprland
systemctl --user status xdg-desktop-portal
```

### Den Signal Messenger installieren

```bash
sudo pacman -S signal-desktop
# yay -S signal-desktop
```

### Den Brave Browser über yay installieren

```bash
sudo pacman -S brave-bin
# yay -S brave-bin
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

### Den erweiterten KDE-Texteditor Kate installieren

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
sudo pacman -Syu qemu-full virt-manager libvirt virt-viewer dnsmasq qemu-ui-gtk qemu-ui-sdl qemu-audio-pa spice-gtk virglrenderer libvdpau libva-mesa-driver spice-vdagent
```

#### Den Virtualisierungs-Dienst für KVM/QEMU aktivieren

```bash
sudo systemctl enable --now libvirtd
```

#### Festplatten-Diagnosewerkzeuge scannen

```bash
# sudo smartctl --scan
```

#### Erweiterte Gruppenrechte für native Kernel-Virtualisierung (KVM) setzen

```bash
sudo usermod -aG libvirt,kvm $(whoami)
```

### Vagrant und das Libvirt-Plugin installieren

```bash
# yay -S vagrant
# vagrant plugin install vagrant-libvirt
```

#### Das Highlight: Der optimale QEMU-Startbefell für Ubuntu 26.04 LTS, Kali Linux 2026, Cachy OS + BlackArch Linux

##### Ubuntu

###### Ubuntu: Installation mit GTK und Sicherheits-Sandbox

```bash
qemu-img create -f qcow2 ubuntu.qcow2 50G
```

###### Ubuntu: Standard-Start mit GTK-Display und Hardware-GL

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -cpu host,kvm=off \
  -smp sockets=1,cores=6,threads=1 \
  -m 10G \
  -vga none \
  -device virtio-vga-gl,xres=3840,yres=2160 \
  -display gtk,gl=on,grab-on-hover=on \
  -drive file=ubuntu.qcow2,if=virtio,cache=writeback,format=qcow2 \
  -cdrom /home/jk/ubuntu/ubuntu-26.04-desktop-amd64.iso \
  -boot d \
  -netdev user,id=net0,restrict=yes \
  -device virtio-net-pci,netdev=net0 \
  -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
  -rtc base=localtime,clock=vm \
  -no-user-config \
  -nodefaults \
  -device qemu-xhci \
  -device usb-tablet \
  -device usb-kbd
```

###### Ubuntu: Erweiterte Ausführung mit SDL-OpenGL und Hardware-Virtualisierung

```bash
qemu-system-x86_64 \
   -enable-kvm \
   -cpu host \
   -smp sockets=1,cores=6,threads=1 \
   -m 10G \
   -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160 \
   -display gtk,gl=on,zoom-to-fit=on \
   -drive file=ubuntu.qcow2,if=virtio,format=qcow2,cache=writeback \
   -device qemu-xhci \
   -device usb-tablet \
   -device usb-kbd \
   -netdev user,id=net0 \
   -device virtio-net-pci,netdev=net0 \
   -rtc base=localtime,clock=host
```

###### Ubuntu: Full-Featured mit Spice-Unterstützung und Audio-PipeWire

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time,kvm=on \
  -smp 6,sockets=1,cores=6,threads=1 \
  -m 10G \
  -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160 \
  -display sdl,gl=on,grab-mod=rctrl \
  -device virtio-blk-pci,drive=hd0,num-queues=6 \
  -drive file=ubuntu.qcow2,id=hd0,if=none,format=qcow2,cache=writeback,aio=threads,discard=unmap \
  -device qemu-xhci,id=xhci \
  -device usb-tablet,bus=xhci.0 \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -device virtio-serial-pci \
  -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
  -chardev spicevmc,id=spicechannel0,name=vdagent \
  -audiodev pipewire,id=audio0 \
  -device virtio-sound-pci,audiodev=audio0 \
  -rtc base=localtime,clock=host
```

###### Ubuntu: High-Performance mit Cache=none und Native AIO

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time \
  -smp 6,sockets=1,cores=6,threads=1 \
  -m 10G \
  -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160 \
  -display sdl,gl=on,grab-mod=rctrl \
  -device virtio-blk-pci,drive=hd0,num-queues=6 \
  -drive file=ubuntu.qcow2,id=hd0,if=none,format=qcow2,cache=none,aio=native,discard=unmap \
  -device qemu-xhci,id=xhci \
  -device usb-tablet,bus=xhci.0 \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -audiodev pipewire,id=audio0 \
  -device virtio-sound-pci,audiodev=audio0 \
  -rtc base=utc,clock=host \
  -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny
```

###### Ubuntu: Spice-Server mit RNG-Entropie und Vollem Sicherheits-Setup

```bash
qemu-system-x86_64 \
  -machine type=q35,accel=kvm \
  -enable-kvm \
  -sandbox on,obsolete=deny,elevateprivileges=deny,resourcecontrol=deny \
  -cpu host,migratable=off \
  -smp 6,sockets=1,cores=6,threads=1 \
  -m 10G \
  -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160 \
  -display spice-app,gl=on \
  -spice gl=on,image-compression=off,streaming-video=all \
  -device virtio-blk-pci,drive=hd0,num-queues=6 \
  -drive file=ubuntu.qcow2,id=hd0,if=none,format=qcow2,cache=none,aio=native,discard=unmap \
  -device qemu-xhci,id=xhci \
  -device usb-tablet,bus=xhci.0 \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -device virtio-serial-pci \
  -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
  -chardev spicevmc,id=spicechannel0,name=vdagent \
  -object rng-random,id=rng0,filename=/dev/urandom \
  -device virtio-rng-pci,rng=rng0 \
  -audiodev pipewire,id=audio0 \
  -device virtio-sound-pci,audiodev=audio0 \
  -rtc base=localtime,clock=host
```

###### Ubuntu: **Empfohlener Standard** (Optimiert für Performance & Sicherheit)

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -cpu host \
  -smp 6,sockets=1,cores=6,threads=1 \
  -m 10G \
  -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160 \
  # -global virtio-vga.max_hostmem=268435456 \
  -display sdl,gl=on,grab-mod=rctrl \
  -device virtio-blk-pci,drive=hd0,num-queues=6 \
  -drive file=ubuntu.qcow2,id=hd0,if=none,format=qcow2,cache=none,aio=native,discard=unmap \
  -device qemu-xhci,id=xhci \
  -device usb-tablet,bus=xhci.0 \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -audiodev pipewire,id=audio0 \
  -device virtio-sound-pci,audiodev=audio0 \
  -rtc base=utc,clock=host \
  -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny
```

##### Kali

###### Kali Linux: Minimal-Konfiguration für schnelle Tests

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
```

###### Kali Linux: Erweitertes Setup mit hochauflösender Grafik

```bash
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
```

###### Kali Linux: Komfortabel mit Spice und Clipboard-Integration

```bash
qemu-system-x86_64 \
    -enable-kvm \
    -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time,kvm=on \
    -smp 6,sockets=1,cores=6,threads=1 \
    -m 6G \
    -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160 \
    -display spice-app,gl=on \
    -device virtio-blk-pci,drive=hd0,num-queues=6 \
    -drive file=kali-linux-2026.2-qemu-amd64.qcow2,id=hd0,if=none,format=qcow2,cache=writeback,aio=threads,discard=unmap \
    -device qemu-xhci,id=xhci \
    -device usb-tablet,bus=xhci.0 \
    -netdev user,id=net0 \
    -device virtio-net-pci,netdev=net0 \
    -device virtio-serial-pci \
    -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
    -chardev spicevmc,id=spicechannel0,name=vdagent \
    -audiodev pipewire,id=audio0 \
    -device virtio-sound-pci,audiodev=audio0 \
    -rtc base=localtime,clock=host
```

###### Kali Linux: Maximal sicher mit Q35-Maschine und RNG

```bash
qemu-system-x86_64 \
  -machine type=q35,accel=kvm \
  -enable-kvm \
  -sandbox on,obsolete=deny,elevateprivileges=deny,resourcecontrol=deny \
  -cpu host,migratable=off \
  -smp 6,sockets=1,cores=6,threads=1 \
  -m 10G \
  -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160 \
  -display spice-app,gl=on \
  -spice gl=on,image-compression=off,streaming-video=all \
  -device virtio-blk-pci,drive=hd0,num-queues=6 \
  -drive file=kali-linux-2026.2-qemu-amd64.qcow2,id=hd0,if=none,format=qcow2,cache=none,aio=native,discard=unmap \
  -device qemu-xhci,id=xhci \
  -device usb-tablet,bus=xhci.0 \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -device virtio-serial-pci \
  -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
  -chardev spicevmc,id=spicechannel0,name=vdagent \
  -object rng-random,id=rng0,filename=/dev/urandom \
  -device virtio-rng-pci,rng=rng0 \
  -audiodev pipewire,id=audio0 \
  -device virtio-sound-pci,audiodev=audio0 \
  -rtc base=localtime,clock=host
```

###### Kali Linux: Kompakt mit 1080p-Auflösung und Spice

```bash
qemu-system-x86_64 \
    -enable-kvm \
    -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time,kvm=on \
    -smp 6,sockets=1,cores=6,threads=1 \
    -m 6G \
    -device virtio-vga-gl,max_outputs=1,xres=1920,yres=1080 \
    -display spice-app,gl=on \
    -device virtio-blk-pci,drive=hd0,num-queues=6 \
    -drive file=kali-linux-2026.2-qemu-amd64.qcow2,id=hd0,if=none,format=qcow2,cache=writeback,aio=threads,discard=unmap \
    -device qemu-xhci,id=xhci \
    -device usb-tablet,bus=xhci.0 \
    -netdev user,id=net0 \
    -device virtio-net-pci,netdev=net0 \
    -device virtio-serial-pci \
    -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
    -chardev spicevmc,id=spicechannel0,name=vdagent \
    -audiodev pipewire,id=audio0 \
    -device virtio-sound-pci,audiodev=audio0 \
    -rtc base=localtime,clock=host
```

###### Kali Linux: SDL-Display mit Hardware-Virtualisierung und Audio

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time,kvm=on \
  -smp 6,sockets=1,cores=6,threads=1 \
  -m 10G \
  -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160 \
  -display sdl,gl=on,grab-mod=rctrl \
  -device virtio-blk-pci,drive=hd0,num-queues=6 \
  -drive file=kali-linux-2026.2-qemu-amd64.qcow2,id=hd0,if=none,format=qcow2,cache=writeback,aio=threads,discard=unmap \
  -device qemu-xhci,id=xhci \
  -device usb-tablet,bus=xhci.0 \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -device virtio-serial-pci \
  -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
  -chardev spicevmc,id=spicechannel0,name=vdagent \
  -audiodev pipewire,id=audio0 \
  -device virtio-sound-pci,audiodev=audio0 \
  -rtc base=localtime,clock=host
```

###### Kali Linux: Hochperformant mit Cache=none und Native AIO

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time \
  -smp 6,sockets=1,cores=6,threads=1 \
  -m 10G \
  -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160 \
  -display sdl,gl=on,grab-mod=rctrl \
  -device virtio-blk-pci,drive=hd0,num-queues=6 \
  -drive file=kali-linux-2026.2-qemu-amd64.qcow2,id=hd0,if=none,format=qcow2,cache=none,aio=native,discard=unmap \
  -device qemu-xhci,id=xhci \
  -device usb-tablet,bus=xhci.0 \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -audiodev pipewire,id=audio0 \
  -device virtio-sound-pci,audiodev=audio0 \
  -rtc base=utc,clock=host \
  -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny
```

###### Kali Linux: **Empfohlene Standard-Konfiguration** (Sicher & Schnell)

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -cpu host \
  -smp 6,sockets=1,cores=6,threads=1 \
  -m 10G \
  -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160 \
  # -global virtio-vga.max_hostmem=268435456 \
  -display sdl,gl=on,grab-mod=rctrl \
  -device virtio-blk-pci,drive=hd0,num-queues=6 \
  -drive file=kali-linux-2026.2-qemu-amd64.qcow2,id=hd0,if=none,format=qcow2,cache=none,aio=native,discard=unmap \
  -device qemu-xhci,id=xhci \
  -device usb-tablet,bus=xhci.0 \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -audiodev pipewire,id=audio0 \
  -device virtio-sound-pci,audiodev=audio0 \
  -rtc base=utc,clock=host \
  -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny
```

###### Kali Linux: **Minimales Sicherheits-Setup** für Isolation

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -machine q35 \
  -cpu host \
  -smp 2 \
  -m 4G \
  -display gtk \
  -device virtio-vga \
  -drive file=kali-linux-2026.2-qemu-amd64.qcow2,if=virtio,format=qcow2,cache=none,aio=native,discard=unmap \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -rtc base=utc \
  -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
  -no-user-config
```

####### Fehlerbehebung: Fehlende Bibliotheken reparieren

```bash
sudo pacman -S virglrenderer
```

##### Cachy OS + Black Arch

###### Cachy OS & BlackArch: Vorbereitung (Disk & UEFI-Variablen)

```bash
qemu-img create -f qcow2 cachyos.qcow2 80G
```

```bash
cp /usr/share/edk2/x64/OVMF_VARS.4m.fd cachyos_VARS.fd
```

###### Cachy OS & BlackArch: Installation mit UEFI und Sandbox

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -machine q35 \
  -cpu host \
  -smp sockets=1,cores=6,threads=1 \
  -m 10G \
  -vga none \
  -device virtio-vga-gl,xres=1920,yres=1080 \
  -display gtk,gl=on,grab-on-hover=on \
  -drive file=cachyos.qcow2,if=virtio,cache=writeback,format=qcow2 \
  -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.4m.fd \
  -drive if=pflash,format=raw,file=cachyos_VARS.fd \
  -cdrom /home/jk/blackarch/cachyos-desktop-linux-260809.iso \
  -boot d \
  -netdev user,id=net0,restrict=no \
  -device virtio-net-pci,netdev=net0 \
  -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
  -rtc base=localtime,clock=vm \
  -device qemu-xhci \
  -device usb-tablet \
  -device usb-kbd
```

###### Cachy OS & BlackArch: **Empfohlene Konfiguration** (UEFI, OpenGL, PipeWire)

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -machine q35 \
  -cpu host \
  -smp 6,sockets=1,cores=6,threads=1 \
  -m 10G \
  -device virtio-vga-gl,max_outputs=1,xres=3840,yres=2160 \
  # -global virtio-vga.max_hostmem=268435456 \
  -display sdl,gl=on,grab-mod=rctrl \
  -drive file=cachyos.qcow2,if=none,id=hd0,format=qcow2,cache=none,aio=native,discard=unmap \
  -device virtio-blk-pci,drive=hd0,num-queues=6 \
  -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.4m.fd \
  -drive if=pflash,format=raw,file=cachyos_VARS.fd \
  -device qemu-xhci,id=xhci \
  -device usb-tablet,bus=xhci.0 \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -audiodev pipewire,id=audio0 \
  -device virtio-sound-pci,audiodev=audio0 \
  -rtc base=utc,clock=host \
  -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny
```

###### Cachy OS & BlackArch: **Minimales Sicherheits-Setup** ohne UEFI-Komplexität

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -machine q35 \
  -cpu host \
  -smp 6 \
  -m 8G \
  -display gtk \
  -device virtio-vga \
  -drive file=cachyos.qcow2,if=virtio,format=qcow2,cache=none,aio=native,discard=unmap \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -rtc base=utc \
  -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
  -no-user-config
```

####### Fehlerbehebung: Fehlende Bibliotheken reparieren

```bash
sudo pacman -S virglrenderer
```

<details>
<summary>Ubuntu Configuration</summary>

#### Ubuntu Configuration

##### Bei Ubuntu noch

```bash
sudo apt install spice-vdagent
```

</details>

<details>
<summary>BlackArch Configuration</summary>

#### BlackArch Configuration

Du kannst die gleiche config wie bei JK-Arch verwenden nur bitte kein Hyperland in der QEMU VM verweden sonder KDE Plasma oder XFCE.

##### BlackArch installieren

```bash
cd ~
curl -O https://blackarch.org/strap.sh
echo 00688950aaf5e5804d2abebb8d3d3ea1d28525ed strap.sh | sha1sum -c
cat strap.sh
```

```bash
chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syu
sudo pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u
```

###### Cool bei Kde Plasma

```bash
git clone --depth=1 https://github.com/catppuccin/kde catppuccin-kde && cd catppuccin-kde
cat ./install.sh
```

```bash
./install.sh
```

##### Pentesting Tools installieren

```bash
# sudo pacman -S blackarch -> 2.860 Tools

# Web-Hacking: sudo pacman -S blackarch-webapp
# Netzwerk-Werkzeuge: sudo pacman -S blackarch-network
# WLAN-Hacking: sudo pacman -S blackarch-wireless

sudo pacman -Syu \
  nmap \           # Port-Scan und Schwachstellen-Check
  metasploit \     # Exploitation
  hydra \          # Passwort-Cracking
  wireshark-qt \   # Netzwerk-Analyse
  john \           # Passwort-Hash-Cracking
  nikto \          # Web-Scanner (perfekt für Metasploitable)
  whatweb \        # Web-Technologie-Erkennung
  theHarvester \   # OSINT (E-Mails, Domains)
  shodan \         # Shodan-CLI (falls API-Key vorhanden)
  bind-tools \     # host, dig, nslookup
  tcpdump \        # Paket-Mitschnitt
  netcat-openbsd \ # Schweizer Taschenmesser
  koadic \         # C2 Framework
  setoolkit \      # Social Engineering
  sliver \         # Modernes C2 Framework
  powersploit \    # PowerShell Exploits
  sslyze \         # SSL/TLS Analyse
  sslscan \        # SSL/TLS Analyse
  testssl.sh       # SSL/TLS Analyse
  hashcat          # GPU-basiertes Cracking (optional)
```

</details>

<details>
<summary>Kali-Linux Configuration</summary>

#### Kali-Linux Configuration

##### Passwort ändern

```bash
passwd
```

##### Snap installieren

```bash
sudo apt install -y snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo reboot
```

und dann:

```bash
snap version
sudo snap install code --classic
# ✓ C/C++
# ✓ clangd
# ✓ CMake Tools
# ✓ CodeLLDB
# ✓ SonarQube for IDE
# ✓ Hex Editor
# ✓ x86 and x86_64 Assembly
# ✓ Makefile Tools
# ✓ GitLens
# ✓ Error Lens
sudo snap install firefox --beta
# about:config
# Suche nach: devtools
sudo snap install brave
```

##### Basis-Tools

```bash
sudo apt update
sudo apt install -y \
    curl wget unzip git fzf cmark shellcheck
```

##### Compiler & Toolchain

```bash
sudo apt install -y \
    build-essential gcc g++ clang llvm lldb cmake ninja-build clang-tidy valgrind clangd openjdk-21-jdk
```

##### Debugging

```bash
sudo apt install -y \
    gdb gdbserver strace ltrace gef
```

Go to `https://github.com/pwndbg/pwndbg/releases` and:

```bash
sudo apt install ./pwndbg_2026.07.29_amd64.deb
```

##### Reverse Engineering

```bash
sudo apt install -y \
    rizin binwalk yara elfutils
```

Go to `https://github.com/slimm609/checksec/releases` and:

```bash
sudo apt install ./checksec_3.2.0_amd64.deb 
```

##### Fuzzing & Performance

```bash
sudo apt install -y \
    afl++ linux-perf cppcheck
```

> Falls `linux-perf` nicht gefunden wird:

```bash
apt search linux-perf
```

##### GUI-Bibliotheken

```bash
sudo apt install -y \
    libgtk-4-dev libadwaita-1-dev librsvg2-dev adwaita-icon-theme
```

##### Benchmarking & Profiling

```bash
sudo apt install -y time hyperfine
```

##### Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

##### Java

```bash
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install gradle
```

##### Docker

```bash
# Ich würde noch Docker installieren
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
docker --version
```

##### Ghidra

```bash
sudo apt install -y ghidra
```

##### Fish

```bash
sudo apt install -y fish
chsh -s /usr/bin/fish
curl -sS https://starship.rs/install.sh | sh
sudo apt install -y zoxide
sudo apt install -y eza
sudo apt install -y neovim
# cargo install yazi-fm yazi-cli
# sudo apt install -y lazygit
# sudo apt install -y navi
sudo apt install -y fonts-firacode
sudo apt install -y ripgrep fd-find bat htop btop
sudo apt install -y kitty alacritty
sudo apt install -y wl-clipboard fd-find
sudo apt install -y python3-venv python3-pip
# sudo apt install pipx
# pipx ensurepath
# pipx install black
# pipx install ruff
sudo apt install -y ripgrep
sudo apt install -y nodejs npm
sudo apt install -y gzip
sudo npm install -g typescript
sudo apt install -y hunspell-de-de hunspell-en-us
sudo apt install -y acpi
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
```

```bash
cd ~/Downloads
sudo apt install -y libreadline-dev golang-go
cargo install asm-lsp --version 0.10.1
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

sudo mkdir -p /usr/share/fonts/truetype/nerd

sudo cp JetBrainsMono/*.ttf /usr/share/fonts/truetype/nerd/

sudo fc-cache -fv

rm JetBrainsMono.zip
cd ~

find_add_path /opt/nvim/bin

nvim
```

```bash
fish
```

```bash
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish -o fisher.fish
less fisher.fish
```

```bash
source fisher.fish
fisher install jorgebucaran/fisher
fisher install jorgebucaran/autopair.fish nickeb96/fish-vim edc/bass PatrickF1/fzf.fish
```

##### Update NeoVim

```bash
# 1) Alte Version prüfen
/opt/nvim/bin/nvim --version

# 2) Neue Version laden oder von https://neovim.io/
cd ~/Downloads
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# 3) Entpacken
tar -xzf nvim-linux-x86_64.tar.gz

# 4) Backup der alten Version (wichtig!)
sudo mv /opt/nvim /opt/nvim.bak

# 5) Neue Version installieren
sudo mv nvim-linux-x86_64 /opt/nvim

# 6) Test
/opt/nvim/bin/nvim --version
```

</details>

<details>
<summary>Metaexploitable 2 (test)</summary>

#### Metaexploitable 2

```bash
# 1. TAP Interface erstellen (sicherstellen, dass Ownership beim User bleibt)
# Wichtig: Wir nutzen 'user $USER', damit QEMU (als User) es nutzen kann.
sudo ip tuntap add dev tap0 mode tap user $USER

# 2. IP auf dem Host-Interface setzen (als "Gateway" für die VMs, aber kein Weiterleitung)
# Wir entfernen vorherige IPs, um Konflikte zu vermeiden
sudo ip addr flush dev tap0
sudo ip addr add 192.168.56.1/24 dev tap0

# 3. Interface aktivieren
sudo ip link set tap0 up

# 4. CRITICAL: IP Forwarding dauerhaft deaktivieren
# Dies verhindert, dass Daten vom TAP-Interface ins Internet weitergeleitet werden
sudo sysctl -w net.ipv4.ip_forward=0
# (Optional: Damit es nach Neustart erhalten bleibt, addiere es zu /etc/sysctl.conf)
# echo "net.ipv4.ip_forward = 0" | sudo tee -a /etc/sysctl.conf

# 5. Firewall-Regeln (Korrekte Reihenfolge!)

# A. Erlaube Verkehr zwischen den VMs im Subnetz (Muss zuerst!)
sudo iptables -A FORWARD -i tap0 -o tap0 -s 192.168.56.0/24 -d 192.168.56.0/24 -j ACCEPT

# B. Erlaube etablierte Verbindungen (für Rückantworten)
sudo iptables -A FORWARD -i tap0 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -i tap0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# C. Blockiere ALLEN anderen Verkehr (Muss ganz unten!)
sudo iptables -A INPUT -i tap0 -j DROP
sudo iptables -A FORWARD -i tap0 -j DROP
sudo iptables -A OUTPUT -o tap0 -j DROP

# D. (Optional) ARP blockieren? NEIN, lass es weg für normale Kommunikation.
# sudo iptables -A INPUT -i tap0 -p arp -j DROP

sudo iptables -L -n -v
```

##### Blackarch starten

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -cpu host \
  -smp 4,sockets=1,cores=4,threads=1 \
  -m 8G \
  -drive file=cachy.qcow2,id=hd0,if=none,format=qcow2,cache=none \
  -device virtio-blk-pci,drive=hd0 \
  -device virtio-net-pci,netdev=net0,mac=52:54:00:11:11:11 \
  -netdev tap,id=net0,ifname=tap0,script=no,downscript=no \
  -display sdl,gl=on \
  -name "BlackArch-Attacker" \
  -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny
```

##### Metasploitable 2 starten

```bash
# etv.: qemu-img convert -f vmdk -O qcow2 metasploitable2.vmdk metasploitable2.qcow2

qemu-system-x86_64 \
  -enable-kvm \
  -cpu host \
  -smp 2,sockets=1,cores=2,threads=1 \
  -m 2G \
  -drive file=metasploitable2.qcow2,id=hd0,if=none,format=qcow2,cache=none \
  -device virtio-blk-pci,drive=hd0 \
  -device virtio-net-pci,netdev=net0,mac=52:54:00:22:22:22 \
  -netdev tap,id=net0,ifname=tap0,script=no,downscript=no \
  -display sdl,gl=on \
  -name "Metasploitable2-Target" \
  -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny
```

##### In Blackarch

```bash
# sudo ip addr add 192.168.56.100/24 dev eth0
# sudo ip link set eth0 up

# IP setzen (z.B. 192.168.56.100)
sudo ip addr add 192.168.56.100/24 dev eth0
sudo ip link set eth0 up

# Gateway NICHT setzen
sudo route del default

ip addr
```

##### In Metasploitable 2

```bash
# sudo ifconfig eth0 192.168.56.101 netmask 255.255.255.0 up

# IP setzen (z.B. 192.168.56.101)
sudo ifconfig eth0 192.168.56.101 netmask 255.255.255.0 up

# Gateway NICHT setzen (damit kein Internet möglich ist)
# default gateway entfernen, falls vorhanden
sudo route del default

ifconfig
```

##### Verbindung testen: Von BlackArch aus

###### Ping Metasploitable

```bash
ping -c 3 192.168.56.101
# Sollte funktionieren
```

###### Ping Internet (muss fehlschlagen)

```bash
ping -c 3 8.8.8.8
# Sollte fehlschlagen: "Network unreachable" oder "Destination Host Unreachable"
```

###### Prüfe Firewall-Regeln

```bash
sudo iptables -L -n -v
# Du solltest DROP-Regeln für tap0 sehen
```

Wenn das klappt, bist du sicher im isolierten Netzwerk.

##### Metasploit starten

```bash
msfconsole
use exploit/multi/handler
# Oder einen spezifischen Exploit für Metasploitable, z.B. vsftpd
search vsftpd
use exploit/unix/ftp/vsftpd_234_backdoor
set RHOSTS 192.168.56.101
exploit
```

</details>

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
sudo pacman -S ghidra
# yay -S ghidra
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

### chkrootkit

```bash
# yay -S chkrootkit
# sudo chkrootkit
```

### lynis

```bash
sudo pacman -S lynis
sudo lynis audit system
```

### AppArmor sauber aktivieren

```bash
sudo pacman -S apparmor apparmor.d
```

Dann:

```bash
sudo systemctl enable --now apparmor
```

Danach:

```bash
sudo nvim /boot/limine.conf
```

und füge es hinzu:

```ini
lsm=landlock,lockdown,yama,integrity,apparmor,bpf
```

also:

```ini
# CachyOS Limine theme

...

/+CachyOS
  //linux-cachyos

  ...

  cmdline: quiet nowatchdog splash rw rootflags=subvol=/@ ... lsm=landlock,lockdown,yama,integrity,apparmor,bpf

```

Danach:

```bash
sudo nvim /etc/apparmor/parser.conf
```

und

```ini
write-cache
Optimize=compress-fast
cache-loc /etc/apparmor/earlypolicy/
```

Danach:

```bash
sudo reboot
```

und

```bash
sudo aa-status
```

### Globales Menü aktivieren

```bash
sudo pacman -S appmenu-gtk-module libdbusmenu-glib
```

### Den SSH-Server sofort ausschalten und dauerhaft deaktivieren

```bash
sudo systemctl disable --now sshd # Falls du SSH nicht brauchst
# sudo systemctl enable --now sshd # Wider einschalten, wen man es doch braucht
```

### Das Begrüßungsprogramm von CachyOS entfernen 

```bash
sudo pacman -R cachyos-hello
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
# /usr/share/plymouth/themes/cachyos/
# sudo mv ~/Pictures/auto.png /usr/share/plymouth/themes/cachyos/
# sudo mv watermark.png watermark3.png
# sudo mv auto.png watermark.png
# arch-logo
```

## Nach der neovim config

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

### Emfehlungen bei end-4

```bash
nvim ~/.config/quickshell/ii/modules/common/Config.qml
```

Zeile 480:

```qml
// property list<string> excludedSites: ["quora.com", "facebook.com"]
property list<string> excludedSites: []
```

# UFW ist langsam

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

# Langsames Internet

```bash
sudo nvim /etc/modprobe.d/8821ce.conf
```

und

```ini
options 8821ce rtw_power_mgnt=0 rtw_enusbss=0 rtw_ips_mode=0
```

```bash
# sudo update-initramfs -u
# sudo mkinitcpio -P # normalem Arch + GRUB
sudo limine-mkinitcpio # Arch + Limine
reboot
```

und

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

```ini
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

```ini
Power save: off
```

und evt. bei Problemen:

```bash
# sudo pacman -S linux-cachyos-headers
# Installiert den stabileren Realtek WLAN-Treiber aus dem AUR und deaktiviert die fehlerhafte Kernel-Version
yay -S rtw88-dkms-git
```

# Firefox ist langsam

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

# Librewulf Google securtiy

```bash
# Erstellt den Ordner und schreibt die Zeilen in die Datei
mkdir -p ~/.librewolf && printf 'defaultPref("browser.safebrowsing.malware.enabled", true);\ndefaultPref("browser.safebrowsing.phishing.enabled", true);\ndefaultPref("browser.safebrowsing.blockedURIs.enabled", true);\n' >> ~/.librewolf/librewolf.overrides.cfg
```

# Reparieren von Haskell

```bash
# Alt: ist nicht die empfohlene Methode, um Haskell-Pakete zu reparieren, und kann das Problem sogar verschlimmern.
# sudo pacman -S $(pacman -Qq | grep '^haskell-') shellcheck pandoc
# sudo systemctl restart NetworkManager
# sudo cachyos-rate-mirrors

# Neu:
# 1. Mirror-Liste aktualisieren für schnelle Downloads
sudo cachyos-rate-mirrors

# 2. System vollständig aktualisieren (baut Haskell-Pakete bei Bedarf neu)
sudo pacman -Syu

# 3. Nicht mehr benötigte Abhängigkeiten entfernen (bereinigt alte Bibliotheken)
sudo pacman -Rns $(pacman -Qdtq)

# 4. Spezifische Tools sicher neu installieren
sudo pacman -S --asexplicit shellcheck pandoc

```

> **Wichtige Änderungen gegenüber dem Original:**
> *   **Reihenfolge:** `cachyos-rate-mirrors` kommt jetzt an den Anfang, damit das Update schnell läuft.
> *   **Sicherheit:** Der riskante One-Liner `$(pacman -Qq | grep ...)` wurde entfernt. Stattdessen sorgt `pacman -Syu` dafür, dass alle Pakete konsistent neu gebaut werden, was bei Haskell zwingend notwendig ist.
> *   **Bereinigung:** Der Schritt `pacman -Rns $(pacman -Qdtq)` entfernt verwaiste Pakete, die oft die Ursache für Haskell-Fehler sind.
> *   **Entfernt:** `systemctl restart NetworkManager` wurde gestrichen, da er für die Paket-Reparatur irrelevant ist.   

# WARP Cloudflair "1.1.1.1"

```bash
sudo pacman -S cloudflare-warp-bin
# yay -S cloudflare-warp-bin
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

# Korrigiertes Skript (Optimiert für 16 GB RAM)

```bash
sudo nvim /etc/systemd/zram-generator.conf
```

```ini
[zram0]
# Setzt die Größe auf 100% des RAMs (hier 16GB), was komprimiert ca. 5-8GB physischen RAM nutzt.
# Das ist sicherer und performanter als künstliche Begrenzung auf 1,5x.
zram-size = 16384
# compression-algorithm = zstd
```

> Nie über 1,5:1 gehen!!! Bei 16Gb RAM die über 24576 ZRAM, gehe, auch 1,5:1 ist die Schmerzgrenze.

```bash
sudo systemctl daemon-reload
sudo systemctl restart systemd-zram-setup@zram0.service
reboot

# 3. Dienst sicher neu starten (ohne Reboot, falls genug RAM frei ist)
# sudo swapoff /dev/zram0 2>/dev/null || true
# sudo systemctl restart systemd-zram-setup@zram0.service
# sudo swapon /dev/zram0
```

```bash
zramctl
swapon --show
```

# Cachy OS optimirung

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

```ini
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

```bash
systemctl --user daemon-reload
systemctl --user enable --now sunshine.service
sudo systemctl enable --now fail2ban
systemctl --user status sunshine
```

### Firewall (nur LAN)

```bash
sudo ufw allow from 192.168.x.x to any port 47984:48010 proto tcp
sudo ufw allow from 192.168.x.x to any port 47998:48010 proto udp
```

```bash
sudo ufw delete allow from 192.168.x.x to any port 47984:48010 proto tcp
sudo ufw delete allow from 192.168.x.x to any port 47998:48010 proto udp
```

### Setup öffnen

```url
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

```ini
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

```ini
Moonlight öffnen → Linux-PC auswählen → Pairing-Code eingeben
```

# OpenClaw

```bash
# npm i -g openclaw@latest
# openclaw onboard --install-daemon
# openclaw models auth login-github-copilot
```

# Was ich noch machen würde

## 1. System aktualisieren & Fehler prüfen

```bash
sudo pacman -Syu

sudo pacman -Qk

systemctl --failed
```

## 2. Netzwerk-Analyse (Der wichtigste Sicherheitscheck)

```bash
ss -tulpen
```

> Hinweis: Achte hier besonders auf Dienste, die du nicht kennst oder die an 0.0.0.0 (weltweit erreichbar) lauschen. 

## 3.1. Paketdatenbank & Integrität prüfen

```bash
# pacman -Qk
# pacman -Qkk
sudo pacman -Qkk | grep -v "0 altered files"
pacman -Qm
```

## 3.2. Vertiefte Analyse (Logs & Verdächtige Skripte)

```bash
grep installed /var/log/pacman.log | tail -100
grep -RinE "curl|wget|base64|eval|bash -c|sh -c" ~/.cache/yay

# Kürzlich installierte Pakete ansehen
expac --timefmt='%Y-%m-%d %T' '%l %n' | sort -r | head -50

# Unbekannte laufende Dienste prüfen
systemctl --type=service --state=running
```

## 3.3 Bei Fehlern das Programm neu installieren und:

```bash
sudo systemctl --failed
sudo journalctl -p 3 -xb
```
