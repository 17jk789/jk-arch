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

## Inhaltsverzeichnis

- [My NeoVim "Settings"](#my-neovim-settings)
  - [Disclaimer](#disclaimer)
  - [License](#license)
  - [Inhaltsverzeichnis](#inhaltsverzeichnis)
  - [Notes](#notes)
  - [To do](#to-do)
- [Requirements](#requirements)
  - [Update NeoVim](#update-neovim)
  - [NeoVim Löschen](#neovim-löschen)
    - [Programm und Binaries löschen](#programm-und-binaries-löschen)
    - [Konfiguration und Daten löschen (LazyVim)](#konfiguration-und-daten-löschen-lazyvim)
- [Inits](#inits)
  - [Python](#python)
    - [create-python-pro.sh](#create-python-prosh)
    - [create-python-jup-pro.sh](#create-python-jup-prosh)
  - [Rust](#rust)
  - [Java](#java)
    - [crate-java-pro.sh](#crate-java-prosh)
  - [C++](#c)
    - [create-cpp-pro.sh](#create-cpp-prosh)
  - [C](#c-1)
    - [create-c-pro.sh](#create-c-prosh)
  - [TypeScript und JavaScript](#typescript-und-javascript)
  - [GO](#go)
  - [Zig](#zig)
  - [Ascii](#ascii)
    - [GNU Assembler (gas)](#gnu-assembler-gas)
    - [NASM (AT\&T-Syntax statt Intel-Syntax)](#nasm-att-syntax-statt-intel-syntax)
  - [DB](#db)
    - [MySQL](#mysql)
      - [create-mysql-pro.sh](#create-mysql-prosh)
    - [PostgreSQL](#postgresql)
      - [create-psql-pro.sh](#create-psql-prosh)
    - [MariaDB](#mariadb)
      - [create-maria-pro.sh](#create-maria-prosh)
- [Ghostty Configuration](#ghostty-configuration)
- [Kitty Configuration](#kitty-configuration)
- [Alacritty Configuration](#alacritty-configuration)
  - [oh-my-posh](#oh-my-posh)
  - [ranger](#ranger)
- [LazyVim Configuration](#lazyvim-configuration)
  - [Struktur](#struktur)
  - [init.lua](#initlua)
  - [config/options.lua](#configoptionslua)
  - [config/keymaps.lua](#configkeymapslua)
  - [plugins/lsp.lua](#pluginslsplua)
  - [plugins/completion.lua](#pluginscompletionlua)
  - [plugins/rust.lua](#pluginsrustlua)
  - [plugins/cpp.lua](#pluginscpplua)
  - [plugins/java.lua](#pluginsjavalua)
  - [plugins/checkstyle.lua](#pluginscheckstylelua)
  - [plugins/python.lua](#pluginspythonlua)
  - [lsp/python.lua](#lsppythonlua)
  - [lsp/lua.lua](#lsplualua)
  - [plugins/html.lua](#pluginshtmllua)
  - [lsp/html.lua](#lsphtmllua)
  - [lsp/css.lua](#lspcsslua)
  - [plugins/javascript.lua](#pluginsjavascriptlua)
  - [plugins/typescript.lua](#pluginstypescriptlua)
  - [plugins/web-dev.lua](#pluginsweb-devlua)
  - [plugins/asm.lua](#pluginsasmlua)
  - [plugins/go.lua](#pluginsgolua)
  - [plugins/zig.lua](#pluginsziglua)
  - [plugins/db.lua](#pluginsdblua)
  - [plugins/bash.lua](#pluginsbashlua)
  - [plugins/matlab.lua](#pluginsmatlablua)
  - [plugins/programmierprojekt.lua](#pluginsprogrammierprojektlua)
  - [plugins/dap.lua](#pluginsdaplua)
  - [config/autocmds.lua](#configautocmdslua)
  - [plugins/image\_toggle.lua](#pluginsimage_togglelua)
  - [plugins/mason.lua](#pluginsmasonlua)
  - [plugins/theme.lua](#pluginsthemelua)
  - [plugins/latex.lua](#pluginslatexlua)
  - [plugins/ui.lua](#pluginsuilua)
  - [plugins/treesitter.lua](#pluginstreesitterlua)
  - [plugins/treesitter-context.lua](#pluginstreesitter-contextlua)
  - [plugins/markdown.lua](#pluginsmarkdownlua)
  - [plugins/ltex.lua](#pluginsltexlua)
  - [plugins/notify.lua](#pluginsnotifylua)
  - [plugins/git.lua](#pluginsgitlua)
  - [plugins/alpha.lua](#pluginsalphalua)
  - [plugins/fzf.lua](#pluginsfzflua)
  - [config/lazyvim.lua](#configlazyvimlua)
  - [plugins/snacks.lua](#pluginssnackslua)
  - [config/lazy.lua](#configlazylua)
  - [config/copilot.lua](#configcopilotlua)
  - [config/avante.lua](#configavantelua)
  - [config/noice.lua](#confignoicelua)
  - [config/lualine.lua](#configlualinelua)
  - [config/discord.lua](#configdiscordlua)

## Notes

* Some settings may be system-specific (Windows vs Linux) -Y *Linux - Ubuntu 24.04.03/24.04.04 LTS*.
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

<!-- Installiere NeoVim: [`Neovim`](https://neovim.io/)

> **Hinweis:**  
> Lade das Archiv `nvim-linux-x86_64.tar.gz` manuell von der NeoVim-Website herunter  
> und speichere es im Ordner `~/Downloads`, bevor du die folgenden Befehle ausführst. -->

```bash
sudo apt update
sudo ufw enable # Wichtig -> Firewall aktivieren!!!
sudo apt install curl wget unzip build-essential cmark fzf luarocks gcc-multilib git-delta shellcheck
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
sudo apt install make golang-go

# Für C/C++ (keines extra)
sudo apt install checksec # or binutils

# rustup component add rustfmt
sudo apt install clang cmake ninja-build gdb lldb rr
cargo install --locked probe-rs # or probe-rs-tools
sudo apt install openjdk-21-jdk openjdk-25-jdk maven
sudo apt install nasm binutils

# Für Go
# sudo apt install golang-go
# go install golang.org/x/tools/gopls@latest
# go install golang.org/x/tools/cmd/goimports@latest
# Optional, empfohlen:
# curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.59.2
# go install github.com/go-delve/delve/cmd/dlv@latest

# Für Zig
# sudo apt install zig

# sudo update-alternatives --config java
# sudo snap install gradle --classic

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install gradle
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
# sudo snap install code --classic
```

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

```bash
sudo apt install wl-clipboard fd-find
sudo apt install python3-venv python3-pip
# sudo apt install pipx
# pipx ensurepath
# pipx install black
# pipx install ruff

sudo apt install ripgrep
sudo apt install nodejs npm
sudo apt install gzip
sudo npm install -g typescript
# sudo apt install texlive-full latexmk zathura zathura-pdf-poppler
sudo apt install texlive-base texlive-latex-recommended texlive-fonts-recommended latexmk zathura zathura-pdf-poppler
# sudo apt install texlive-latex-extra texlive-pictures texlive-fonts-extra
sudo apt install hunspell-de-de hunspell-en-us
sudo snap install ghostty --classic  # besser für Lazyvim als gnome-terminal oder konsole (KDE)
# sudo apt install alacritty
# sudo apt install kitty
# sudo apt install wezterm
# sudo apt install default-jre
# sudo snap install languagetool
# sudo apt install vim vim-common
sudo apt install acpi
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

sudo apt install htop
sudo apt install btop # nvim ~/.config/btop/btop.conf
sudo apt install nvtop
sudo apt install ranger w3m-img ranger-devicons
sudo apt install time
sudo apt install tmux
sudo apt install wofi
sudo apt install zoxide
sudo apt install ghex
sudo apt install bat
sudo apt install dos2unix
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
# sudo apt install just
# source /usr/share/doc/fzf/examples/key-bindings.bash # für fzf im Terminal -> Strg + R
echo 'source /usr/share/doc/fzf/examples/key-bindings.bash' >> ~/.bashrc
# npm install -g @mermaid-js/mermaid-cli
sudo apt install clamav clamav-daemon
sudo freshclam
clamscan -r -i ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
clamscan -r -i ~/.cargo ~/.sdkman ~/.npm ~/.local/lib/python3*/site-packages ~/Downloads
sudo apt install rkhunter
sudo rkhunter --check
```

## Update NeoVim

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

Wenn alles OK:

```bash
sudo rm -rf /opt/nvim.bak
```

## NeoVim Löschen

### Programm und Binaries löschen 

```bash
sudo rm -rf /opt/nvim
```

### Konfiguration und Daten löschen (LazyVim)

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

# Inits

## Python

```bash
mkdir mein_python_projekt
cd mein_python_projekt
python -m venv venv
source venv/bin/activate
touch main.py
# pip install 'python-lsp-server[all]' black ruff debugpy
# pip install pynvim jupyter-client ipykernel 
# pip install black ruff
# Optional:
# python -m ipykernel install --user
nvim .
```

oder:

```bash
vim ~/create-python-pro.sh
chmod +x create-python-pro.sh
~/create-python-pro.sh new mein-python-projekt
nvim .
```

### create-python-pro.sh

```bash
#!/bin/bash

# create-python-pro.sh

# # Prüfen, ob der Benutzer ein Argument übergeben hat
# if [ "$1" != "new" ] || [ -z "$2" ]; then
#     echo "Usage: $0 new <projektname>"
#     exit 1
# fi

# PROJECT_NAME=$2

# # Projektordner erstellen und wechseln
# mkdir "$PROJECT_NAME"
# cd "$PROJECT_NAME" || exit

# # Virtuelle Umgebung erstellen
# python3 -m venv venv

# create-python-pro.sh
set -e

# Prüfen auf korrekte Argumente
if [[ "$1" != "new" ]] || [[ -z "$2" ]]; then
    echo "Usage: $0 new <projektname>"
    exit 1
fi

PROJECT_NAME=$2
PROJECT_DIR="$(pwd)/$PROJECT_NAME"

# Prüfen, ob Ordner existiert
if [[ -d "$PROJECT_DIR" ]]; then
    echo "❌ Fehler: Ordner $PROJECT_NAME existiert hier bereits!"
    exit 1
fi

# Struktur erstellen (src-Layout wird für 2025 empfohlen)
mkdir -p "$PROJECT_DIR/src" "$PROJECT_DIR/tests"
cd "$PROJECT_DIR"

# Virtuelle Umgebung (venv) erstellen
python3 -m venv venv

# Virtuelle Umgebung aktivieren
# Hinweis: Dies funktioniert nur im Skript, wenn man 'source' im aktuellen Shell ausführt
# Für interaktive Nutzung: der Benutzer muss manuell aktivieren
echo "Aktiviere die virtuelle Umgebung mit: source venv/bin/activate"

# Hauptdatei erstellen
touch main.py

# Python-Tools installieren
# Aktiviert nur für diesen Befehl die venv automatisch
source venv/bin/activate
pip install --upgrade pip
pip install bandit
# pip install 'python-lsp-server[all]' black ruff debugpy
# pip install pynvim jupyter-client ipykernel 
# pip install black ruff
# Optional:
# python -m ipykernel install --user

```

### create-python-jup-pro.sh

```bash
#!/bin/bash

# create-python-pro.sh

# # Prüfen, ob der Benutzer ein Argument übergeben hat
# if [ "$1" != "new" ] || [ -z "$2" ]; then
#     echo "Usage: $0 new <projektname>"
#     exit 1
# fi

# PROJECT_NAME=$2

# # Projektordner erstellen und wechseln
# mkdir "$PROJECT_NAME"
# cd "$PROJECT_NAME" || exit

# # Virtuelle Umgebung erstellen
# python3 -m venv venv

# create-python-pro.sh
set -e

# Prüfen auf korrekte Argumente
if [[ "$1" != "new" ]] || [[ -z "$2" ]]; then
    echo "Usage: $0 new <projektname>"
    exit 1
fi

PROJECT_NAME=$2
PROJECT_DIR="$(pwd)/$PROJECT_NAME"

# Prüfen, ob Ordner existiert
if [[ -d "$PROJECT_DIR" ]]; then
    echo "❌ Fehler: Ordner $PROJECT_NAME existiert hier bereits!"
    exit 1
fi

# Struktur erstellen (src-Layout wird für 2025 empfohlen)
mkdir -p "$PROJECT_DIR/src" "$PROJECT_DIR/tests"
cd "$PROJECT_DIR"

# Virtuelle Umgebung (venv) erstellen
python3 -m venv venv

# Virtuelle Umgebung aktivieren
# Hinweis: Dies funktioniert nur im Skript, wenn man 'source' im aktuellen Shell ausführt
# Für interaktive Nutzung: der Benutzer muss manuell aktivieren
echo "Aktiviere die virtuelle Umgebung mit: source venv/bin/activate"

# Hauptdatei erstellen
touch main.py

# Python-Tools installieren
# Aktiviert nur für diesen Befehl die venv automatisch
source venv/bin/activate
pip install --upgrade pip
pip install pynvim jupyter_client ipykernel pylatexenc jupytext pynvim nbformat nbconvert notebook bandit
# python -m ipykernel install --user --name mein_projekt
python -m ipykernel install --user --name=pneovim --display-name "Python (P-NeoVim)"
sudo chown -R $USER:$USER /home/jk/.local/share/jupyter
mkdir -p /home/jk/.local/share/jupyter/runtime
chmod -R 700 /home/jk/.local/share/jupyter/runtime
# pip install 'python-lsp-server[all]' black ruff debugpy
# pip install pynvim jupyter-client ipykernel 
# pip install black ruff
# Optional:
# python -m ipykernel install --user

```

## Rust

```bash
cargo new mein_rust_projekt
cd mein_rust_projekt
cargo deny init
nvim .
```

## Java

```bash
mkdir new my-java-project
cd new my-java-project
gradle init
nvim .
```

oder

```bash
vim ~/create-java-pro.sh
chmod +x ~/create-java-pro.sh
~/create-java-pro.sh new my-java-project
cd ~/my-java-project
nvim .
```

### crate-java-pro.sh

```bash
#!/usr/bin/env bash

# crate-java-pro.sh
# set -e

# COMMAND=$1
# PROJECT_NAME=$2

# if [[ "$COMMAND" != "new" || -z "$PROJECT_NAME" ]]; then
#   echo "Usage: $0 new <project-name>"
#   exit 1
# fi

# mkdir -p "$PROJECT_NAME"
# cd "$PROJECT_NAME"

# WICHTIG: Verzeichnis MUSS leer sein
# if [ "$(ls -A .)" ]; then
#   echo "❌ Verzeichnis ist nicht leer. gradle init bricht ab."
#   exit 1
# fi

# gradle init \
#   --type java-application \
#   --dsl groovy \
#   --test-framework junit-jupiter \
#   --project-name "$PROJECT_NAME" \
#   --package com.example.app \
#   --no-incubating

# gradle build -x test

# JAR_FILE=$(ls build/libs/*.jar | head -n 1)

# echo "Java-Programm wird mit Debug-Flag gestartet"

# java \
#   -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 \
#   -jar "$JAR_FILE"

#!/usr/bin/env bash

# crate-java-pro.sh
# Minimal Maven Java-Projekt erstellen für NeoVim + jdtls

set -e

COMMAND=$1
PROJECT_NAME=$2

if [[ "$COMMAND" != "new" || -z "$PROJECT_NAME" ]]; then
  echo "Usage: $0 new <project-name>"
  exit 1
fi

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# WICHTIG: Verzeichnis MUSS leer sein
if [ "$(ls -A .)" ]; then
  echo "❌ Verzeichnis ist nicht leer. Abbruch."
  exit 1
fi

# Projektstruktur erstellen
mkdir -p src/main/java src/test/java

# App.java erstellen
cat > src/main/java/App.java <<EOL
package com.example.app;

public class App {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
EOL

# TestApp.java erstellen
cat > src/test/java/TestApp.java <<EOL
package com.example.app;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestApp {
    @Test
    public void sampleTest() {
        assertTrue(true);
    }
}
EOL

# Minimaler pom.xml
cat > pom.xml <<EOL
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">

    <modelVersion>4.0.0</modelVersion>
    <groupId>com.example</groupId>
    <artifactId>$PROJECT_NAME</artifactId>
    <version>1.0-SNAPSHOT</version>
    <properties>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-api</artifactId>
            <version>5.10.0</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-engine</artifactId>
            <version>5.10.0</version>
            <scope>test</scope>
        </dependency>
    </dependencies>
</project>
EOL

# https://github.com/nvim-java/nvim-java ersetzt das!
# java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar <deinJar>.jar

echo "✅ Java-Projekt '$PROJECT_NAME' erstellt!"
echo "Öffne in NeoVim: nvim $PROJECT_NAME"

```

## C++

```bash
vim ~/create-cpp-pro.sh
chmod +x ~/create-cpp-pro.sh
~/create-cpp-pro.sh new my-cpp-project
cd ~/my-cpp-project
nvim .
```

### create-cpp-pro.sh

```bash
#!/bin/bash

# create-cpp-pro.sh

# set -e

# # Usage: ./create-cpp-pro.sh new <project-name>
# COMMAND=$1
# PROJECT_NAME=$2

# if [[ "$COMMAND" != "new" ]] || [[ -z "$PROJECT_NAME" ]]; then
#   echo "Usage: $0 new <project-name>"
#   exit 1
# fi

# PROJECT_DIR="$HOME/$PROJECT_NAME"
# mkdir -p "$PROJECT_DIR"
# cd "$PROJECT_DIR"
# echo "Projektverzeichnis erstellt: $PROJECT_DIR"

# mkdir -p src include build
# echo "C/C++ Standardstruktur erstellt: src/, include/, build/"

# # Beispiel main.cpp
# cat > src/main.cpp <<EOF
# #include <iostream>

# int main() {
#     std::cout << "Hello C++ from LazyVim!" << std::endl;
#     return 0;
# }
# EOF
# echo "Beispiel main.cpp erstellt"

# # CMakeLists.txt
# cat > CMakeLists.txt <<EOF
# cmake_minimum_required(VERSION 3.16)
# project(${PROJECT_NAME})

# set(CMAKE_CXX_STANDARD 23)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)

# include_directories(include)

# add_executable(${PROJECT_NAME} src/main.cpp)
# EOF
# echo "CMakeLists.txt erstellt"

# echo ""
# echo "✅ Fertig! Projekt '$PROJECT_NAME' ist bereit."
# echo "Build: cd $PROJECT_DIR/build && cmake .. && cmake --build ."

set -e

# Usage: ./create-cpp-pro.sh new <project-name>
COMMAND=$1
PROJECT_NAME=$2

if [[ "$COMMAND" != "new" ]] || [[ -z "$PROJECT_NAME" ]]; then
  echo "Usage: $0 new <project-name>"
  exit 1
fi

# PROJECT_DIR="$HOME/$PROJECT_NAME"
PROJECT_DIR="$(pwd)/$PROJECT_NAME"

if [[ -d "$PROJECT_DIR" ]]; then
  echo "❌ Fehler: $PROJECT_DIR existiert schon!"
  exit 1
fi

mkdir -p "$PROJECT_DIR/src" "$PROJECT_DIR/include" "$PROJECT_DIR/build"
cd "$PROJECT_DIR"

# Beispiel main.cpp
cat > src/main.cpp <<EOF
#include <iostream>

int main() {
    std::cout << "Hello C++ from Julian!" << std::endl;
    return 0;
}
EOF

# CMakeLists.txt mit fester "app" Binary
cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.10)
project(${PROJECT_NAME} VERSION 1.0 LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR})

# Die Binary heißt IMMER app
add_executable(app src/main.cpp)
target_include_directories(app PUBLIC include)
EOF

cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build
ln -s build/compile_commands.json .
echo -e "---\nLanguage: Cpp\nBasedOnStyle: Google\nIndentWidth: 4\nTabWidth: 4\nUseTab: Never\n..." > ./.clang-format

git init -q
cat > .gitignore <<EOF
build/
.cache/
compile_commands.json
*.o
app
EOF

echo ""
echo "✅ C++-Projekt '$PROJECT_NAME' bereit!"
echo "Binary: $PROJECT_DIR/build/app"

```

## C

```bash
vim ~/create-c-pro.sh
chmod +x ~/create-c-pro.sh
~/create-c-pro.sh new my-c-project
cd ~/my-c-project
nvim .
```

### create-c-pro.sh

```bash
#!/bin/bash

# create-c-pro.sh

set -e

# Usage: ./create-c-pro.sh new <project-name>
COMMAND=$1
PROJECT_NAME=$2

if [[ "$COMMAND" != "new" ]] || [[ -z "$PROJECT_NAME" ]]; then
  echo "Usage: $0 new <project-name>"
  exit 1
fi

# PROJECT_DIR="$HOME/$PROJECT_NAME"
PROJECT_DIR="$(pwd)/$PROJECT_NAME"

if [[ -d "$PROJECT_DIR" ]]; then
  echo "❌ Fehler: $PROJECT_DIR existiert schon!"
  exit 1
fi

mkdir -p "$PROJECT_DIR/src" "$PROJECT_DIR/include" "$PROJECT_DIR/build"
cd "$PROJECT_DIR"

# Beispiel main.c (C statt C++)
cat > src/main.c <<EOF
#include <stdio.h>

int main() {
    printf("Hello C from Julian!\n");
    return 0;
}
EOF

# CMakeLists.txt angepasst für C
cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.10)
# Sprache auf C umstellen
project(${PROJECT_NAME} VERSION 1.0 LANGUAGES C)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# C-Standard statt CXX-Standard setzen
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR})

# Binary nutzt nun src/main.c
add_executable(app src/main.c)
target_include_directories(app PUBLIC include)
EOF

# Build-Prozess (identisch)
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build
ln -s build/compile_commands.json .
echo -e "---\nLanguage: Cpp\nBasedOnStyle: Google\nIndentWidth: 4\nTabWidth: 4\nUseTab: Never\n..." > ./.clang-format

echo ""
echo "✅ C-Projekt '$PROJECT_NAME' bereit!"
echo "Binary: $PROJECT_DIR/build/app"

```

## TypeScript und JavaScript

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
source ~/.bashrc
npm create vite@latest mein-projekt -- --template vanilla-ts
cd mein-projekt
npm install
npm run dev
```

## GO

```bash
mkdir mein-go-projekt && cd mein-go-projekt
go mod init mein-projekt
touch main.go
go run main.go
```

## Zig

```bash
mkdir mein-zig-projekt && cd mein-zig-projekt
zig init
zig build run
```

## Ascii

### GNU Assembler (gas)

```bash
mkdir mein-gas-projekt && cd mein-gas-projekt
git init
touch main.s
as main.s -o main.o
ld main.o -o mein-programm
./mein-programm
```

### NASM (AT&T-Syntax statt Intel-Syntax)

```bash
mkdir mein-asm-projekt && cd mein-asm-projekt
git init
touch main.asm
nasm -f elf64 main.asm -o main.o
ld main.o -o mein-programm
./mein-programm
```

## DB

### MySQL

```bash
nvim ~/create-mysql-pro.sh
chmod +x ~/create-mysql-pro.sh
~/create-mysql-pro.sh new mein-mysql-projekt
cd mein-mysql-projekt
# docker compose up -d
sudo docker compose up -d
source dbee-env.sh
nvim .
```

```bash
docker compose stop # Nur stoppen (Daten bleiben erhalten)
docker compose down # Komplett beenden & aufräumen
```

#### create-mysql-pro.sh

```bash
#!/usr/bin/env bash

# ~/create-mysql-pro.sh

# # Überprüfen, ob die Argumente korrekt sind
# if [ "$1" != "new" ] || [ -z "$2" ]; then
#     echo "Usage: ~/create-mysql-pro.sh new <projekt-name>"
#     exit 1
# fi

# PROJ_NAME=$2

# # Projektordner erstellen
# mkdir -p "$PROJ_NAME/init-db"
# cd "$PROJ_NAME"

# # docker-compose.yml erstellen (passend zu deiner nvim-dbee Konfig)
# cat << 'DOCKER' > docker-compose.yml
# services:
#   mysql:
#     image: mysql:8.0
#     container_name: ${PWD##*/}_mysql
#     environment:
#       MYSQL_ROOT_PASSWORD: rootpassword
#       MYSQL_DATABASE: test_db
#     ports:
#       - "127.0.0.1:3306:3306"
#     volumes:
#       - ./init-db:/docker-entrypoint-initdb.d
#       - mysql_data:/var/lib/mysql

#   postgres:
#     image: postgres:15
#     container_name: ${PWD##*/}_postgres
#     environment:
#       POSTGRES_USER: postgres
#       POSTGRES_PASSWORD: postgres
#       POSTGRES_DB: test_db
#     ports:
#       - "127.0.0.1:5432:5432"
#     volumes:
#       - ./init-db:/docker-entrypoint-initdb.d
#       - postgres_data:/var/lib/postgresql/data

# volumes:
#   mysql_data:
#   postgres_data:
# DOCKER

# # Test-Daten für MySQL & Postgres erstellen
# cat << 'SQL' > init-db/setup.sql
# -- Dieses Script läuft in beiden DBs beim ersten Start
# CREATE TABLE IF NOT EXISTS users (
#     id INT PRIMARY KEY,
#     name VARCHAR(50)
# );

# INSERT INTO users (id, name) VALUES (1, 'Admin'), (2, 'Dev User') 
# ON CONFLICT DO NOTHING; -- Postgres Syntax
# -- MySQL ignoriert Fehler bei Duplikaten oft durch das Script-Format
# SQL

# echo "✅ My-SQL-Projekt '$PROJ_NAME' wurde erstellt."
# echo "Starte die Server mit: cd $PROJ_NAME && docker compose up -d"

set -euo pipefail

if [ "${1:-}" != "new" ] || [ -z "${2:-}" ]; then
  echo "Usage: create-mysql-pro.sh new <project-name>"
  exit 1
fi

PROJ="$2"

if [ -d "$PROJ" ]; then
  echo "Directory already exists."
  exit 1
fi

mkdir -p "$PROJ/init-db/mysql"
mkdir -p "$PROJ/init-db/postgres"
cd "$PROJ"

# -----------------------------
# Secure password generation
# -----------------------------
gen_pass() { openssl rand -base64 32 | tr -dc 'A-Za-z0-9' | head -c 32; }

MYSQL_ROOT_PASSWORD=$(gen_pass)
MYSQL_USER_PASSWORD=$(gen_pass)
POSTGRES_PASSWORD=$(gen_pass)

# -----------------------------
# Random free ports (optional, fallback)
# -----------------------------
MYSQL_PORT=$(shuf -i 20000-40000 -n 1)
POSTGRES_PORT=$(shuf -i 40001-60000 -n 1)

# -----------------------------
# .env
# -----------------------------
cat > .env <<EOF
MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
MYSQL_DATABASE=app_db
MYSQL_USER=app_user
MYSQL_PASSWORD=$MYSQL_USER_PASSWORD
MYSQL_PORT=$MYSQL_PORT

POSTGRES_DB=app_db
POSTGRES_USER=app_user
POSTGRES_PASSWORD=$POSTGRES_PASSWORD
POSTGRES_PORT=$POSTGRES_PORT
EOF

# -----------------------------
# .gitignore
# -----------------------------
cat > .gitignore <<EOF
.env
docker-data/
EOF

# -----------------------------
# docker-compose.yml
# -----------------------------
cat << 'DOCKER' > docker-compose.yml
services:
  mysql:
    image: mysql:8.0
    env_file: .env
    restart: unless-stopped
    ports:
      - "127.0.0.1:${MYSQL_PORT}:3306"
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 5s
      timeout: 3s
      retries: 10
    volumes:
      - mysql_data:/var/lib/mysql
      # Bindet dein SQL-Skript ein:
      - ./init-db/mysql/init.sql:/docker-entrypoint-initdb.d/init.sql

  postgres:
    image: postgres:15
    env_file: .env
    restart: unless-stopped
    ports:
      - "127.0.0.1:${POSTGRES_PORT}:5432"
    environment: # Diese Sektion MUSS für Postgres rein!
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ${POSTGRES_USER}"]
      interval: 5s
      timeout: 3s
      retries: 10
    volumes:
      - postgres_data:/var/lib/postgresql/data
      # Bindet dein SQL-Skript ein:
      - ./init-db/postgres/init.sql:/docker-entrypoint-initdb.d/init.sql

volumes:
  mysql_data:
  postgres_data:

DOCKER

# -----------------------------
# MySQL init script
# -----------------------------
cat << 'SQL' > init-db/mysql/init.sql
CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);
INSERT IGNORE INTO users VALUES (1,'Admin'),(2,'Dev User');
SQL

# -----------------------------
# Postgres init script
# -----------------------------
cat << 'SQL' > init-db/postgres/init.sql
CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);
INSERT INTO users VALUES (1,'Admin'),(2,'Dev User')
ON CONFLICT DO NOTHING;
SQL

# -----------------------------
# DBEE Loader Script
# -----------------------------
cat << 'SH' > dbee-env.sh
#!/usr/bin/env bash
# HINWEIS: Dieses Skript muss mit 'source ./dbee-env.sh' aufgerufen werden!

if [ ! -f ".env" ]; then
    echo "❌ .env file not found."
    return 1 2>/dev/null || exit 1
fi

# Lädt Variablen aus .env (ohne Kommentare)
export $(grep -v '^#' .env | xargs)

echo "🔄 Waiting for databases to become healthy..."

wait_for_health() {
    local service=$1
    local retries=20
    while [ $retries -gt 0 ]; do
        # Nutzt den Service-Namen direkt über docker inspect
        local status=$(sudo docker inspect --format='{{.State.Health.Status}}' "$(sudo docker compose ps -q $service)" 2>/dev/null || echo "starting")
        if [ "$status" = "healthy" ]; then
            echo "✅ $service is healthy."
            return 0
        fi
        sleep 2
        retries=$((retries - 1))
    done
    echo "❌ $service health check failed."
    return 1
}

wait_for_health mysql || return 1
wait_for_health postgres || return 1

# Ports dynamisch ermitteln (falls sie in .env von 3306/5432 abweichen)
MYSQL_PORT_REAL=$(sudo docker compose port mysql 3306 | cut -d: -f2)
POSTGRES_PORT_REAL=$(sudo docker compose port postgres 5432 | cut -d: -f2)

# Falls MYSQL_USER leer ist, nutzen wir root
USER_M=${MYSQL_USER:-root}
PASS_M=${MYSQL_PASSWORD:-$MYSQL_ROOT_PASSWORD}

# DBEE_CONNECTIONS Format (Wichtig: kein Leerzeichen in der URL)
export DBEE_CONNECTIONS='[
  {
    "name": "MySQL_'$(basename "$PWD")'",
    "type": "mysql",
    "url": "'$USER_M':'$PASS_M'@tcp(127.0.0.1:'$MYSQL_PORT_REAL')/'$MYSQL_DATABASE'"
  },
  {
    "name": "Postgres_'$(basename "$PWD")'",
    "type": "postgres",
    "url": "postgres://'$POSTGRES_USER':'$POSTGRES_PASSWORD'@127.0.0.1:'$POSTGRES_PORT_REAL'/'$POSTGRES_DB'?sslmode=disable"
  }
]'

echo "🔐 DBEE_CONNECTIONS exported for this session."
echo "🚀 Start Neovim now: nvim"

SH

chmod +x dbee-env.sh

echo ""
echo "✅ Project '$PROJ' created."
echo "Start with:"
echo "  cd $PROJ && docker compose up -d"
echo "Then:"
echo "  source dbee-env.sh"
echo "  nvim"

```

### PostgreSQL

```bash
nvim ~/create-psql-pro.sh
chmod +x ~/create-psql-pro.sh
~/create-psql-pro.sh new mein-psql-projekt
cd mein-psql-projekt
sudo docker compose up -d
source dbee-env.sh
nvim .
```

```bash
docker compose stop # Nur stoppen (Daten bleiben erhalten)
docker compose down # Komplett beenden & aufräumen
```

#### create-psql-pro.sh

```bash
#!/usr/bin/env bash

# ~/create-psql-pro.sh

# # Überprüfen, ob die Argumente korrekt sind
# if [ "$1" != "new" ] || [ -z "$2" ]; then
#     echo "Usage: ~/create-psql-pro.sh new <projekt-name>"
#     exit 1
# fi

# PROJ_NAME=$2

# # Projektordner erstellen
# mkdir -p "$PROJ_NAME/init-db"
# cd "$PROJ_NAME"

# # docker-compose.yml erstellen (nur für PostgreSQL)
# cat << 'DOCKER' > docker-compose.yml
# services:
#   postgres:
#     image: postgres:15
#     container_name: ${PWD##*/}_postgres
#     environment:
#       POSTGRES_USER: postgres
#       POSTGRES_PASSWORD: postgres
#       POSTGRES_DB: test_db
#     ports:
#       - "5432:5432"
#     volumes:
#       - ./init-db:/docker-entrypoint-initdb.d
#       - postgres_data:/var/lib/postgresql/data

# volumes:
#   postgres_data:
# DOCKER

# # Test-Daten speziell für PostgreSQL erstellen
# cat << 'SQL' > init-db/setup.sql
# -- Setup-Script für PostgreSQL
# CREATE TABLE IF NOT EXISTS users (
#     id SERIAL PRIMARY KEY,
#     name VARCHAR(50),
#     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
# );

# INSERT INTO users (name) VALUES ('Admin'), ('Postgres-User') 
# ON CONFLICT DO NOTHING;
# SQL

# echo "✅ Post-SQL-Projekt '$PROJ_NAME' wurde erstellt."
# echo "Starte den Server mit: cd $PROJ_NAME && docker compose up -d"

set -Eeuo pipefail

# ----------------------------------------
# Usage check
# ----------------------------------------
if [[ "${1:-}" != "new" ]] || [[ -z "${2:-}" ]]; then
  echo "Usage: $0 new <project-name>"
  exit 1
fi

PROJ_NAME="$2"

if [[ -d "$PROJ_NAME" ]]; then
  echo "❌ Directory '$PROJ_NAME' already exists."
  exit 1
fi

# ----------------------------------------
# Dependency check
# ----------------------------------------
for cmd in docker openssl shuf; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "❌ Required command not found: $cmd"
    exit 1
  fi
done

# ----------------------------------------
# Create structure
# ----------------------------------------
mkdir -p "$PROJ_NAME/init-db/postgres"
cd "$PROJ_NAME"

# ----------------------------------------
# Secure password generation
# ----------------------------------------
gen_pass() {
  openssl rand -base64 48 | tr -dc 'A-Za-z0-9' | head -c 32
}

POSTGRES_USER_PASSWORD="$(gen_pass)"

# ----------------------------------------
# Find real free port
# ----------------------------------------
find_free_port() {
  while true; do
    port=$(shuf -i 40001-60000 -n 1)
    if ! ss -ltn | awk '{print $4}' | grep -q ":$port$"; then
      echo "$port"
      return
    fi
  done
}

POSTGRES_PORT="$(find_free_port)"

# ----------------------------------------
# .env (never commit this)
# ----------------------------------------
cat > .env <<EOF
POSTGRES_DB=app_db
POSTGRES_USER=app_user
POSTGRES_PASSWORD=$POSTGRES_USER_PASSWORD
POSTGRES_PORT=$POSTGRES_PORT
EOF

chmod 600 .env

# ----------------------------------------
# .gitignore
# ----------------------------------------
cat > .gitignore <<EOF
.env
EOF

# ----------------------------------------
# docker-compose.yml
# ----------------------------------------
cat <<'DOCKER' > docker-compose.yml
services:
  postgres:
    image: postgres:15-alpine
    container_name: ${COMPOSE_PROJECT_NAME:-pg_project}_postgres
    env_file: .env
    restart: unless-stopped
    ports:
      - "127.0.0.1:${POSTGRES_PORT}:5432"
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB}"]
      interval: 5s
      timeout: 3s
      retries: 10
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./init-db/postgres:/docker-entrypoint-initdb.d:ro

volumes:
  postgres_data:
DOCKER

# ----------------------------------------
# Init SQL
# ----------------------------------------
cat <<'SQL' > init-db/postgres/init.sql
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name)
VALUES ('Admin'), ('Postgres-User')
ON CONFLICT DO NOTHING;
SQL

# ----------------------------------------
# DBEE loader script
# ----------------------------------------
cat <<'SH' > dbee-env.sh
#!/usr/bin/env bash
set -Eeuo pipefail

if [[ ! -f ".env" ]]; then
  echo "❌ .env file not found."
  return 1 2>/dev/null || exit 1
fi

# Sauberes Laden ohne Code Injection Risiko
while IFS='=' read -r key value; do
  [[ "$key" =~ ^#.*$ || -z "$key" ]] && continue
  export "$key=$value"
done < .env

echo "🔄 Waiting for Postgres to become healthy..."

container_id=$(docker compose ps -q postgres)

if [[ -z "$container_id" ]]; then
  echo "❌ Postgres container not running."
  return 1
fi

retries=30
while [[ $retries -gt 0 ]]; do
  status=$(docker inspect --format='{{.State.Health.Status}}' "$container_id" 2>/dev/null || echo "starting")
  if [[ "$status" == "healthy" ]]; then
    echo "✅ Postgres is healthy."
    break
  fi
  sleep 2
  retries=$((retries - 1))
done

if [[ $retries -le 0 ]]; then
  echo "❌ Postgres failed health check."
  return 1
fi

POSTGRES_PORT_REAL=$(docker compose port postgres 5432 | awk -F: '{print $2}')

export DBEE_CONNECTIONS="[
  {
    \"name\": \"Postgres $(basename "$PWD")\",
    \"type\": \"postgres\",
    \"url\": \"postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@127.0.0.1:${POSTGRES_PORT_REAL}/${POSTGRES_DB}?sslmode=disable\"
  }
]"

echo "🔐 DBEE_CONNECTIONS exported."
echo "🚀 Start Neovim now: nvim"
SH

chmod +x dbee-env.sh

# ----------------------------------------
# Final Output
# ----------------------------------------
echo ""
echo "✅ PostgreSQL project '$PROJ_NAME' created."
echo ""
echo "Start with:"
echo "  cd $PROJ_NAME"
echo "  docker compose up -d"
echo ""
echo "Then:"
echo "  source dbee-env.sh"
echo "  nvim"

```

### MariaDB

```bash
nvim ~/create-maria-pro.sh
chmod +x ~/create-maria-pro.sh
~/create-maria-pro.sh new mein-maria-projekt
cd mein-maria-projekt
sudo docker compose up -d
source dbee-env.sh
nvim .
```

```bash
docker compose stop # Nur stoppen (Daten bleiben erhalten)
docker compose down # Komplett beenden & aufräumen
```

#### create-maria-pro.sh

```bash
#!/usr/bin/env bash

# ~/create-maria-pro.sh

# # Überprüfen, ob die Argumente korrekt sind
# if [ "$1" != "new" ] || [ -z "$2" ]; then
#     echo "Usage: ~/create-maria-pro.sh new <projekt-name>"
#     exit 1
# fi

# PROJ_NAME=$2

# # Projektordner erstellen
# mkdir -p "$PROJ_NAME/init-db"
# cd "$PROJ_NAME"

# # docker-compose.yml erstellen (speziell für MariaDB)
# # Hinweis: In dbee nutzt du den "mysql" Typ für die Verbindung
# cat << 'DOCKER' > docker-compose.yml
# services:
#   mariadb:
#     image: mariadb:latest
#     container_name: ${PWD##*/}_mariadb
#     environment:
#       MARIADB_ROOT_PASSWORD: rootpassword
#       MARIADB_DATABASE: test_db
#     ports:
#       - "3306:3306"
#     volumes:
#       - ./init-db:/docker-entrypoint-initdb.d
#       - maria_data:/var/lib/mysql

# volumes:
#   maria_data:
# DOCKER

# # Test-Daten für MariaDB erstellen
# cat << 'SQL' > init-db/setup.sql
# -- Setup-Script für MariaDB
# CREATE TABLE IF NOT EXISTS users (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     name VARCHAR(50),
#     status VARCHAR(20) DEFAULT 'active'
# );

# INSERT INTO users (name) VALUES ('Admin'), ('MariaDB-User');
# SQL

# echo "✅ MariaDB-Projekt '$PROJ_NAME' wurde erstellt."
# echo "Starte den Server mit: cd $PROJ_NAME && docker compose up -d"

set -Eeuo pipefail

# ----------------------------------------
# Usage check
# ----------------------------------------
if [[ "${1:-}" != "new" ]] || [[ -z "${2:-}" ]]; then
  echo "Usage: $0 new <project-name>"
  exit 1
fi

PROJ_NAME="$2"

if [[ -d "$PROJ_NAME" ]]; then
  echo "❌ Directory '$PROJ_NAME' already exists."
  exit 1
fi

# ----------------------------------------
# Dependency check
# ----------------------------------------
for cmd in docker openssl shuf ss; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "❌ Required command not found: $cmd"
    exit 1
  fi
done

# ----------------------------------------
# Create structure
# ----------------------------------------
mkdir -p "$PROJ_NAME/init-db/mariadb"
cd "$PROJ_NAME"

# ----------------------------------------
# Secure password generation
# ----------------------------------------
gen_pass() {
  openssl rand -base64 48 | tr -dc 'A-Za-z0-9' | head -c 32
}

MARIADB_ROOT_PASSWORD="$(gen_pass)"
MARIADB_USER_PASSWORD="$(gen_pass)"

# ----------------------------------------
# Find real free port
# ----------------------------------------
find_free_port() {
  while true; do
    port=$(shuf -i 20000-40000 -n 1)
    if ! ss -ltn | awk '{print $4}' | grep -q ":$port$"; then
      echo "$port"
      return
    fi
  done
}

MARIADB_PORT="$(find_free_port)"

# ----------------------------------------
# .env (never commit)
# ----------------------------------------
cat > .env <<EOF
MARIADB_ROOT_PASSWORD=$MARIADB_ROOT_PASSWORD
MARIADB_DATABASE=app_db
MARIADB_USER=app_user
MARIADB_PASSWORD=$MARIADB_USER_PASSWORD
MARIADB_PORT=$MARIADB_PORT
EOF

chmod 600 .env

# ----------------------------------------
# .gitignore
# ----------------------------------------
cat > .gitignore <<EOF
.env
EOF

# ----------------------------------------
# docker-compose.yml
# ----------------------------------------
cat <<'DOCKER' > docker-compose.yml
services:
  mariadb:
    image: mariadb:11.3
    container_name: ${COMPOSE_PROJECT_NAME:-maria_project}_mariadb
    env_file: .env
    restart: unless-stopped
    ports:
      - "127.0.0.1:${MARIADB_PORT}:3306"
    environment:
      MARIADB_ROOT_PASSWORD: ${MARIADB_ROOT_PASSWORD}
      MARIADB_DATABASE: ${MARIADB_DATABASE}
      MARIADB_USER: ${MARIADB_USER}
      MARIADB_PASSWORD: ${MARIADB_PASSWORD}
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 5s
      timeout: 3s
      retries: 10
    volumes:
      - mariadb_data:/var/lib/mysql
      - ./init-db/mariadb:/docker-entrypoint-initdb.d:ro

volumes:
  mariadb_data:
DOCKER

# ----------------------------------------
# Init SQL
# ----------------------------------------
cat <<'SQL' > init-db/mariadb/init.sql
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name)
VALUES ('Admin'), ('MariaDB-User');
SQL

# ----------------------------------------
# DBEE loader script
# ----------------------------------------
cat <<'SH' > dbee-env.sh
#!/usr/bin/env bash
set -Eeuo pipefail

if [[ ! -f ".env" ]]; then
  echo "❌ .env file not found."
  return 1 2>/dev/null || exit 1
fi

# Safe .env loading (no code execution)
while IFS='=' read -r key value; do
  [[ "$key" =~ ^#.*$ || -z "$key" ]] && continue
  export "$key=$value"
done < .env

echo "🔄 Waiting for MariaDB to become healthy..."

container_id=$(docker compose ps -q mariadb)

if [[ -z "$container_id" ]]; then
  echo "❌ MariaDB container not running."
  return 1
fi

retries=30
while [[ $retries -gt 0 ]]; do
  status=$(docker inspect --format='{{.State.Health.Status}}' "$container_id" 2>/dev/null || echo "starting")
  if [[ "$status" == "healthy" ]]; then
    echo "✅ MariaDB is healthy."
    break
  fi
  sleep 2
  retries=$((retries - 1))
done

if [[ $retries -le 0 ]]; then
  echo "❌ MariaDB failed health check."
  return 1
fi

MARIADB_PORT_REAL=$(docker compose port mariadb 3306 | awk -F: '{print $2}')

export DBEE_CONNECTIONS="[
  {
    \"name\": \"MariaDB $(basename "$PWD")\",
    \"type\": \"mysql\",
    \"url\": \"${MARIADB_USER}:${MARIADB_PASSWORD}@tcp(127.0.0.1:${MARIADB_PORT_REAL})/${MARIADB_DATABASE}\"
  }
]"

echo "🔐 DBEE_CONNECTIONS exported."
echo "🚀 Start Neovim now: nvim"
SH

chmod +x dbee-env.sh

# ----------------------------------------
# Final Output
# ----------------------------------------
echo ""
echo "✅ MariaDB project '$PROJ_NAME' created."
echo ""
echo "Start with:"
echo "  cd $PROJ_NAME"
echo "  docker compose up -d"
echo ""
echo "Then:"
echo "  source dbee-env.sh"
echo "  nvim"

```

# Ghostty Configuration

> [More](https://gist.github.com/hensg/43bc71c21d1f79385892352a390aa2ca)

```bash
git clone https://github.com/sahaj-b/ghostty-cursor-shaders ~/.config/ghostty/shaders
# ln -s ~/.config/kitty/colors-matugen.conf ~/.config/ghostty/themes/matugen
```

```bash
vim ~/.config/ghostty/config
```

```bash
# WINDOW / UI
window-decoration = auto
window-padding-x = 6
window-padding-y = 4
window-inherit-working-directory = true

# macOS-SPEZIFISCH 
# macos-titlebar-style = tabs 
# macos-titlebar-proxy-icon = hidden 
# macos-option-as-alt = true

# HINTERGRUND
background-opacity = 0.85
# background = #000000
# background-blur-radius = 10 # Weichzeichner-Radius
background-blur = macos-glass-regular
background-opacity = 0.5	

# Pfad zum Bild (achte auf .jpg)
# background-image = /home/jk/Pictures/walpaper4-new.jpg

# Füllt das Fenster komplett aus (behält Proportionen, schneidet Ränder ggf. ab)
# background-image-fit = cover

# Zentriert das Bild, damit die Ränder gleichmäßig beschnitten werden
# background-image-position = center

# FONT
font-family = "JetBrainsMono Nerd Font Complete"
font-family-italic = "JetBrainsMono Nerd Font Complete"
font-family-bold = "JetBrainsMono Nerd Font Complete"
font-family-bold-italic = "JetBrainsMono Nerd Font Complete"
font-size = 13.5 
window-title-font-family = "JetBrainsMono Nerd Font Complete"
# font-feature = liga,calt
# grapheme-width-method = "unicode"
# font-family = "Noto Color Emoji" 

adjust-cell-height = 0%
adjust-cell-width = 0%

# CURSOR
cursor-style = block
# cursor-color = #25be6a
# cursor-color = #f5a97f
# cursor-text = #f2f4f8

# theme = Catppuccin Mocha
# theme = matugen

foreground = #dee3e5
background = #0f1416
selection-foreground = #1d343a
selection-background = #b2cbd2

cursor-color = #dee3e5
cursor-text = #bfc8cb

# Black
palette = 0=#4c4c4c
palette = 8=#dee3e5

# Red
palette = 1=#ffb4ab
palette = 9=#c49ea0

# Green
palette = 2=#dee3e5
palette = 10=#9ec49f

# Yellow
palette = 3=#aca98a
palette = 11=#c4c19e

# Blue
palette = 4=#84d2e6
palette = 12=#a39ec4

# Magenta
palette = 5=#ffb4ab
palette = 13=#c49ec4

# Cyan
palette = 6=#dee3e5
palette = 14=#9ec3c4

# White
palette = 7=#f0f0f0
palette = 15=#e7e7e7

# AUSWAHL 
# selection-foreground = #f2f4f8 
# selection-background = #525253
#
# # COLORS (Carbonfox-like)
# foreground = #f2f4f8
#
# palette = 0=#282828
# palette = 1=#ee5396
# palette = 2=#25be6a
# palette = 3=#08bdba
# palette = 4=#78a9ff
# palette = 5=#be95ff
# palette = 6=#33b1ff
# palette = 7=#dfdfe0
#
# palette = 8=#484848
# palette = 9=#f16da6
# palette = 10=#46c880
# palette = 11=#2dc7c4
# palette = 12=#8cb6ff
# palette = 13=#c8a5ff
# palette = 14=#52bdff
# palette = 15=#e4e4e5

# INDEXED COLORS (optional) 
# palette = 16=#3ddbd9 
# palette = 17=#ff7eb6

# CURSOR
# cursor-style = block
# cursor-color = #ff9f1c
# cursor-text = #0f1115

# AUSWAHL
# selection-foreground = #ffffff
# selection-background = #3a3f4b

# COLORS (Dark Neon Slate)
# foreground = #e6eaf2

# palette = 0=#1b1f27
# palette = 1=#ff5c8a
# palette = 2=#2ec27e
# palette = 3=#f6c177
# palette = 4=#5ea1ff
# palette = 5=#c678dd
# palette = 6=#4fd1c5
# palette = 7=#cfd6e6

# palette = 8=#3a4152
# palette = 9=#ff7aa2
# palette = 10=#4be39a
# palette = 11=#ffd58a
# palette = 12=#7ab0ff
# palette = 13=#d59cff
# palette = 14=#6be6d8
# palette = 15=#ffffff

# CURSOR
# cursor-style = block
# cursor-color = #00e0ff
# cursor-text = #0b0f14

# AUSWAHL
# selection-foreground = #e6edf3
# selection-background = #2a3040

# COLORS (Cyber Abyss)
# foreground = #dce3ea

# palette = 0=#0b0f14
# palette = 1=#ff4d6d
# palette = 2=#2dd4bf
# palette = 3=#ffd166
# palette = 4=#4dabf7
# palette = 5=#b388ff
# palette = 6=#00e0ff
# palette = 7=#cdd6f4

# palette = 8=#1c2330
# palette = 9=#ff758f
# palette = 10=#5eead4
# palette = 11=#ffe08a
# palette = 12=#74c0fc
# palette = 13=#c8a6ff
# palette = 14=#6be6ff
# palette = 15=#ffffff

# TERMINAL CORE
# term = ghostty
# term = xterm
# term = screen-256color
# term = tmux-256color
# term = alacritty
# term = wezterm
# term = kitty
# term = xterm-kitty
# term = foot
term = xterm-256color
# cursor-style = block
# shell-integration = bash
shell-integration = fish
# cursor-style-blink = false
shell-integration-features = no-cursor
custom-shader = "shaders/cursor_warp.glsl"
custom-shader-animation = always

# SCROLLBACK
scrollback-limit = 300000

# CLIPBOARD & MAUS
clipboard-read = allow
clipboard-write = allow
copy-on-select = true
mouse-hide-while-typing = true
confirm-close-surface = false

# SHELL INTEGRATION 
# shell-integration-features = no-cursor

# KEYBINDS 
keybind = ctrl+m=toggle_maximize 
keybind = ctrl+shift+m=toggle_fullscreen 
keybind = global:cmd+=toggle_quick_terminal 
keybind = shift+ctrl+,=move_tab:-1 
keybind = shift+ctrl+.=move_tab:+1

# WINDOW MANAGEMENT
keybind = ctrl+shift+n=new_window
keybind = ctrl+shift+q=quit
# keybind = ctrl+enter=toggle_fullscreen

# TABS
keybind = ctrl+shift+t=new_tab
keybind = ctrl+shift+w=close_surface
keybind = ctrl+tab=next_tab
keybind = ctrl+shift+tab=previous_tab

# SPLITS CREATE
keybind = ctrl+shift+o=new_split:right
keybind = ctrl+shift+e=new_split:down

# SPLIT NAVIGATION (DE-safe)
keybind = alt+left=goto_split:left
keybind = alt+right=goto_split:right
keybind = alt+up=goto_split:up
keybind = alt+down=goto_split:down

keybind = alt+p=goto_split:previous
keybind = alt+n=goto_split:next

# SPLIT RESIZE
keybind = alt+shift+left=resize_split:left,10
keybind = alt+shift+right=resize_split:right,10
keybind = alt+shift+up=resize_split:up,10
keybind = alt+shift+down=resize_split:down,10

keybind = alt+shift+equal=equalize_splits

# SPLIT ZOOM
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

# Kopieren mit Strg + C
# keybind = ctrl+c=copy_to_clipboard

# Einfügen mit Strg + V
# keybind = ctrl+v=paste_from_clipboard

# keybind = shift+r=text:ranger\r

```

# Kitty Configuration

```bash
nvim ~/.config/kitty/kitty.conf
```

```bash
# WINDOW / UI
hide_window_decorations no
window_padding_width 6 4
confirm_os_window_close 0

# macOS-SPEZIFISCH (Kitty Syntax)
# macos_titlebar_color system
# macos_option_as_alt yes

# HINTERGRUND
background #000000
# background_opacity 0.85
# background_blur 10

# Pfad zum Bild
background_image /home/jk/Pictures/walpaper4-new.jpg
background_image_layout scaled
# Kitty nutzt 'scaled', 'mirror', 'tiled' oder 'centered'. 
# 'scaled' kommt 'cover' am nächsten.

# FONT
font_family      JetBrainsMono Nerd Font
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size        13.5

# CURSOR
cursor_shape block

# THEME (Catppuccin Mocha manuell oder via 'kitty +kitten themes')
# Da Kitty Themes meist externe Dateien sind, hier die Core-Farben:
include current-theme.conf


# Catppuccin Mocha für Kitty

foreground              #cdd6f4
background              #1e1e2e
selection_foreground    #1e1e2e
selection_background    #f5e0dc

# Cursor Farben
cursor                  #f5e0dc
cursor_text_color       #1e1e2e

# URL Farbe
url_color               #f5e0dc

# Kitty Window Border Farben
active_border_color     #b4befe
inactive_border_color   #6c7086
bell_border_color       #f9e2af

# Tab Bar Farben
active_tab_foreground   #11111b
active_tab_background   #cba6f8
inactive_tab_foreground #cdd6f4
inactive_tab_background #181825
tab_bar_background      #11111b

# Die 16 Terminal Farben

# Black
color0 #45475a
color8 #585b70

# Red
color1 #f38ba8
color9 #f38ba8

# Green
color2  #a6e3a1
color10 #a6e3a1

# Yellow
color3  #f9e2af
color11 #f9e2af

# Blue
color4  #89b4fa
color12 #89b4fa

# Magenta
color5  #f5c2e7
color13 #f5c2e7

# Cyan
color6  #94e2d5
color14 #94e2d5

# White
color7  #bac2de
color15 #a6adc8

# TERMINAL CORE
term xterm-256color

# SCROLLBACK
scrollback_lines 20000

# CLIPBOARD & MAUS
copy_on_select yes
focus_follows_mouse no
mouse_hide_wait 3.0

# KEYBINDS (Korrekt übersetzt auf Kitty-Aktionen)

# WINDOW MANAGEMENT
map ctrl+shift+n new_os_window
map ctrl+shift+q quit
map ctrl+shift+m toggle_maximized
map ctrl+shift+f toggle_fullscreen

# TABS
map ctrl+shift+t new_tab
map ctrl+shift+w close_tab
map ctrl+tab next_tab
map ctrl+shift+tab previous_tab
map shift+ctrl+, move_tab_backward
map shift+ctrl+. move_tab_forward

# SPLITS (Layout muss auf 'splits' stehen: enabled_layouts splits)
enabled_layouts splits
map ctrl+shift+o launch --location=vsplit
map ctrl+shift+e launch --location=hsplit

# SPLIT NAVIGATION
map alt+left neighboring_window left
map alt+right neighboring_window right
map alt+up neighboring_window up
map alt+down neighboring_window down

# SPLIT RESIZE
map alt+shift+left resize_window narrower 10
map alt+shift+right resize_window wider 10
map alt+shift+up resize_window taller 10
map alt+shift+down resize_window shorter 10

# SPLIT ZOOM
map ctrl+shift+enter toggle_layout_action zoom_toggle

# CLIPBOARD
map ctrl+shift+c copy_to_clipboard
map ctrl+shift+v paste_from_clipboard

# FONT SIZE
map ctrl+plus change_font_size all +1.0
map ctrl+minus change_font_size all -1.0
map ctrl+zero  change_font_size all 0

# CONFIG
map ctrl+comma edit_config
map ctrl+shift+comma load_config_file

# Ranger Shortcut
map shift+r combine : send_text all ranger\r

# cursor #25be6a
cursor #f5a97f
cursor_text_color #f2f4f8
shell_integration no-cursor

background_opacity 0.8
dynamic_background_opacity yes
# window_padding_width 15
# hide_window_decorations yes
# wayland_titlebar_color #f5a97f
wayland_titlebar_color #1e1e2e

```

# Alacritty Configuration

```bash
mkdir -p ~/.config/alacritty
vim ~/.config/alacritty/alacritty.toml
```

```bash
mkdir -p ~/.config/alacritty
nano ~/.config/alacritty/alacritty.toml
```

```toml
[window]
# decorations = "None"

# Standard-Transparenz (80%)
opacity = 0.91

[[keyboard.bindings]]
key = "M"
mods = "Control"
action = "ToggleMaximized"

[[keyboard.bindings]]
key = "M"
mods = "Control|Shift"
action = "ToggleFullscreen"

[font]
normal = { family = "JetBrainsMono Nerd Font", style = "Regular" }
bold   = { family = "JetBrainsMono Nerd Font", style = "Bold" }
italic = { family = "JetBrainsMono Nerd Font", style = "Italic" }

term = "xterm-256color"
scrollback-limit = 3000000

[[keyboard.bindings]]
key = "M"
mods = "Control"
action = "ToggleMaximized"

[[keyboard.bindings]]
key = "M"
mods = "Control|Shift"
action = "ToggleFullscreen"

[[keyboard.bindings]]
key = ","
mods = "Control|Shift"
action = "ReloadConfig"

[[keyboard.bindings]]
key = "Enter"
mods = "Control|Shift"
action = "ToggleSplitZoom"

[[keyboard.bindings]]
key = "c"
mods = "Control|Shift"
action = "Copy"

[[keyboard.bindings]]
key = "v"
mods = "Control|Shift"
action = "Paste"

[[keyboard.bindings]]
key = "Equal"
mods = "Control"
action = "IncreaseFontSize"

[[keyboard.bindings]]
key = "Minus"
mods = "Control"
action = "DecreaseFontSize"

[[keyboard.bindings]]
key = "0"
mods = "Control"
action = "ResetFontSize"

# Tab & window management
[[keyboard.bindings]]
key = "t"
mods = "Control|Shift"
action = "SpawnNewTab"

[[keyboard.bindings]]
key = "w"
mods = "Control|Shift"
action = "Close"

[[keyboard.bindings]]
key = "n"
mods = "Control|Shift"
action = "SpawnNewWindow"

[[keyboard.bindings]]
key = "q"
mods = "Control|Shift"
action = "Quit"

[[keyboard.bindings]]
key = "Tab"
mods = "Control"
action = "NextTab"

[[keyboard.bindings]]
key = "Tab"
mods = "Control|Shift"
action = "PreviousTab"

# Split creation
[[keyboard.bindings]]
key = "O"
mods = "Control|Shift"
action = "SpawnSplitRight"

[[keyboard.bindings]]
key = "E"
mods = "Control|Shift"
action = "SpawnSplitDown"

# Split navigation
[[keyboard.bindings]]
key = "Left"
mods = "Alt"
action = "ActivateSplitLeft"

[[keyboard.bindings]]
key = "Right"
mods = "Alt"
action = "ActivateSplitRight"

[[keyboard.bindings]]
key = "Up"
mods = "Alt"
action = "ActivateSplitUp"

[[keyboard.bindings]]
key = "Down"
mods = "Alt"
action = "ActivateSplitDown"

# Split resize
[[keyboard.bindings]]
key = "Left"
mods = "Alt|Shift"
action = "ResizeSplitLeft"

[[keyboard.bindings]]
key = "Right"
mods = "Alt|Shift"
action = "ResizeSplitRight"

[[keyboard.bindings]]
key = "Up"
mods = "Alt|Shift"
action = "ResizeSplitUp"

[[keyboard.bindings]]
key = "Down"
mods = "Alt|Shift"
action = "ResizeSplitDown"

[[keyboard.bindings]]
key = "Equal"
mods = "Alt|Shift"
action = "EqualizeSplits"

[colors.primary]
background = "#1E1E2E"
foreground = "#CDD6F4"
dim_foreground = "#CDD6F4"
bright_foreground = "#CDD6F4"

[colors.cursor]
text = "#1E1E2E"
cursor = "#F5E0DC"

[colors.vi_mode_cursor]
text = "#1EE2E"
cursor = "#B4BEFE"

[colors.search.matches]
foreground = "#1E1E2E"
background = "#A6ADC8"

[colors.search.focused_match]
foreground = "#1E1E2E"
background = "#A6E3A1"

[colors.footer_bar]
foreground = "#1E1E2E"
background = "#A6ADC8"

[colors.hints.start]
foreground = "#1E1E2E"
background = "#F9E2AF"

[colors.hints.end]
foreground = "#1E1E2E"
background = "#A6ADC8"

[colors.selection]
text = "#1E1E2E"
background = "#F5E0DC"

[colors.normal]
black   = "#45475A"
red     = "#F38BA8"
green   = "#A6E3A1"
yellow  = "#F9E2AF"
blue    = "#89B4FA"
magenta = "#F5C2E7"
cyan    = "#94E2D5"
white   = "#BAC2DE"

[colors.bright]
black   = "#585B70"
red     = "#F38BA8"
green   = "#A6E3A1"
yellow  = "#F9E2AF"
blue    = "#89B4FA"
magenta = "#F5C2E7"
cyan    = "#94E2D5"
white   = "#A6ADC8"

[colors.dim]
black   = "#45475A"
red     = "#F38BA8"
green   = "#A6E3A1"
yellow  = "#F9E2AF"
blue    = "#89B4FA"
magenta = "#F5C2E7"
cyan    = "#94E2D5"
white   = "#BAC2DE"

[[colors.indexed_colors]]
index = 16
color = "#A6ADC8"

[[colors.indexed_colors]]
index = 17
color = "#F5C2E7"

# Nightfox Alacritty Colors
## name: carbonfox
## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/carbonfox/alacritty.toml

# [colors.primary]
# background = "#000000"
# background = "#161616"
# foreground = "#f2f4f8"
# dim_foreground = "#b6b8bb"
# bright_foreground = "#f9fbff"

# [colors.cursor]
# text = "#f2f4f8"
# cursor = "#25be6a"

# [colors.vi_mode_cursor]
# text = "#f2f4f8"
# cursor = "#33b1ff"

# [colors.search.matches]
# foreground = "#f2f4f8"
# background = "#525253"

# [colors.search.focused_match]
# foreground = "#f2f4f8"
# background = "#3ddbd9"

# [colors.footer_bar]
# foreground = "#f2f4f8"
# background = "#353535"

# [colors.hints.start]
# foreground = "#f2f4f8"
# background = "#3ddbd9"

# [colors.hints.end]
# foreground = "#f2f4f8"
# background = "#353535"

# [colors.selection]
# text = "#f2f4f8"
# background = "#2a2a2a"
# background = "#52bdff"

# [colors.normal]
# black = "#282828"
# red = "#ee5396"
# green = "#25be6a"
# yellow = "#08bdba"
# blue = "#78a9ff"
# magenta = "#be95ff"
# cyan = "#33b1ff"
# white = "#dfdfe0"

# [colors.bright]
# black = "#484848"
# red = "#f16da6"
# green = "#46c880"
# yellow = "#2dc7c4"
# blue = "#8cb6ff"
# magenta = "#c8a5ff"
# cyan = "#52bdff"
# white = "#e4e4e5"

# [colors.dim]
# black = "#222222"
# red = "#ca4780"
# green = "#1fa25a"
# yellow = "#07a19e"
# blue = "#6690d9"
# magenta = "#a27fd9"
# cyan = "#2b96d9"
# white = "#bebebe"

# [[colors.indexed_colors]]
# index = 16
# color = "#3ddbd9"

# [[colors.indexed_colors]]
# index = 17
# color = "#ff7eb6"

# Nightfox Alacritty Colors
## name: nightfox
## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/alacritty.toml

# [colors.primary]
# background = "#192330"
# foreground = "#cdcecf"
# dim_foreground = "#aeafb0"
# bright_foreground = "#d6d6d7"

# [colors.cursor]
# text = "#cdcecf"
# cursor = "#aeafb0"

# [colors.vi_mode_cursor]
# text = "#cdcecf"
# cursor = "#63cdcf"

# [colors.search.matches]
# foreground = "#cdcecf"
# background = "#3c5372"

# [colors.search.focused_match]
# foreground = "#cdcecf"
# background = "#81b29a"

# [colors.footer_bar]
# foreground = "#cdcecf"
# background = "#29394f"

# [colors.hints.start]
# foreground = "#cdcecf"
# background = "#f4a261"

# [colors.hints.end]
# foreground = "#cdcecf"
# background = "#29394f"

# [colors.selection]
# text = "#cdcecf"
# background = "#2b3b51"

# [colors.normal]
# black = "#393b44"
# red = "#c94f6d"
# green = "#81b29a"
# yellow = "#dbc074"
# blue = "#719cd6"
# magenta = "#9d79d6"
# cyan = "#63cdcf"
# white = "#dfdfe0"

# [colors.bright]
# black = "#575860"
# red = "#d16983"
# green = "#8ebaa4"
# yellow = "#e0c989"
# blue = "#86abdc"
# magenta = "#baa1e2"
# cyan = "#7ad5d6"
# white = "#e4e4e5"

# [colors.dim]
# black = "#30323a"
# red = "#ab435d"
# green = "#6e9783"
# yellow = "#baa363"
# blue = "#6085b6"
# magenta = "#8567b6"
# cyan = "#54aeb0"
# white = "#bebebe"

# [[colors.indexed_colors]]
# index = 16
# color = "#f4a261"

# [[colors.indexed_colors]]
# index = 17
# color = "#d67ad2"

# Nightfox Alacritty Colors
## name: carbonfox
## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/carbonfox/alacritty.toml

# [colors.primary]
# background = "#161616"
# foreground = "#f2f4f8"
# dim_foreground = "#b6b8bb"
# bright_foreground = "#f9fbff"

# [colors.cursor]
# text = "#f2f4f8"
# cursor = "#b6b8bb"

# [colors.vi_mode_cursor]
# text = "#f2f4f8"
# cursor = "#33b1ff"

# [colors.search.matches]
# foreground = "#f2f4f8"
# background = "#525253"

# [colors.search.focused_match]
# foreground = "#f2f4f8"
# background = "#3ddbd9"

# [colors.footer_bar]
# foreground = "#f2f4f8"
# background = "#353535"

# [colors.hints.start]
# foreground = "#f2f4f8"
# background = "#3ddbd9"

# [colors.hints.end]
# foreground = "#f2f4f8"
# background = "#353535"

# [colors.selection]
# text = "#f2f4f8"
# background = "#2a2a2a"

# [colors.normal]
# black = "#282828"
# red = "#ee5396"
# green = "#25be6a"
# yellow = "#08bdba"
# blue = "#78a9ff"
# magenta = "#be95ff"
# cyan = "#33b1ff"
# white = "#dfdfe0"

# [colors.bright]
# black = "#484848"
# red = "#f16da6"
# green = "#46c880"
# yellow = "#2dc7c4"
# blue = "#8cb6ff"
# magenta = "#c8a5ff"
# cyan = "#52bdff"
# white = "#e4e4e5"

# [colors.dim]
# black = "#222222"
# red = "#ca4780"
# green = "#1fa25a"
# yellow = "#07a19e"
# blue = "#6690d9"
# magenta = "#a27fd9"
# cyan = "#2b96d9"
# white = "#bebebe"

# [[colors.indexed_colors]]
# index = 16
# color = "#3ddbd9"

# [[colors.indexed_colors]]
# index = 17
# color = "#ff7eb6"

```

## oh-my-posh 

> würde ich nicht wirklich empfehlen, aber cool!

```bash
# curl -s https://ohmyposh.dev/install.sh | bash -s && \
# mkdir -p ~/.poshthemes && \
# oh-my-posh get theme illusi0n --output ~/.poshthemes/illusi0n.omp.json && \
# grep -qxF 'eval "$(oh-my-posh init bash --config ~/.poshthemes/illusi0n.omp.json)"' ~/.bashrc || echo 'eval "$(oh-my-posh init bash --config ~/.poshthemes/illusi0n.omp.json)"' >> ~/.bashrc && \
# source ~/.bashrc
```

## ranger

```bash
nvim ~/.config/ranger/rifle.conf
```

```text
# Suche diese Zeile und setze nvim nach vorne:
mime ^text,  label editor = nvim -- "$@"
!mime ^text, label editor, ext xml|json|csv|tex|py|pl|rb|js|sh|php = nvim -- "$@"
```

# LazyVim Configuration

## Struktur

```bash
cd ~/.config/nvim/lua
```

```text
~/.config/nvim/
├── init.lua
└── lua/
    ├── config/
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   ├── lazyvim.lua
    │   └── options.lua
    ├── lsp/
    │   ├── css.lua
    │   ├── html.lua
    │   ├── lua.lua
    │   └── python.lua
    └── plugins/
        ├── alpha.lua
        ├── asm.lua
        ├── avante.lua
        ├── bash.lua
        ├── checkstyle.lua
        ├── cpp.lua
        ├── completion.lua
        ├── copilot.lua
        ├── dap.lua
        ├── db.lua
        ├── discord.lua
        ├── fzf.lua
        ├── git.lua
        ├── image_toggle.lua
        ├── go.lua
        ├── java.lua
        ├── javascript.lua
        ├── latex.lua
        ├── lazy.lua
        ├── lsp.lua
        ├── ltex.lua
        ├── lualine.lua
        ├── markdown.lua
        ├── mason.lua
        ├── matlab.lua
        ├── noice.lua
        ├── programmierprojekt.lua
        ├── notify.lua
        ├── rust.lua
        ├── snacks.lua
        ├── theme.lua
        ├── treesitter.lua
        ├── treesitter-context.lua
        ├── typescript.lua
        ├── ui.lua
        └── web-dev.lua
        └── zig.lua
```

## init.lua

LazyVim lädt automatisch alles aus `lua/config/` und `lua/plugins/`.

```bash
cd ~/.config/nvim
```

```bash
vim init.lua
```

```bash
nano init.lua
```

## config/options.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim config/options.lua
```

```bash
nano config/options.lua
```

```bash
code config/options.lua
```

```lua
-- config/options.lua

vim.opt.number = true
vim.opt.relativenumber = true
-- vim.cmd [[
--   augroup NumberToggle
--     autocmd!
--     autocmd InsertEnter * set norelativenumber
--     autocmd InsertLeave * set relativenumber
--   augroup END
-- ]]

-- vim.keymap.set("t", "<C-g>", [[>C-\><C-n>]], { noremap = true, silent = true})
vim.keymap.set("t", "<C-g>", "<C-\\><C-n>", { noremap = true, silent = true })

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 9

-- new
vim.opt.smarttab = true
vim.opt.autoindent = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 250

vim.opt.mouse = "a"
-- vim.opt.mouse = "nvi"

-- vim.opt.winbar = "%=%m %f  | %l/%L"

local function get_ls_style()
  local path = vim.fn.expand("%:p")
  if path == "" then
    return ""
  end

  -- Home kürzen zu ~
  local home = vim.fn.expand("$HOME")
  local rel_path = path:gsub("^" .. vim.pesc(home), "~")

  -- File stats
  local stat = vim.uv.fs_stat(path)
  if not stat then
    return rel_path
  end

  local perms = vim.fn.getfperm(path)
  local size = stat.size

  local mtime = os.date("%b %d %H:%M", stat.mtime.sec)

  -- local file = vim.fn.fnamemodify(path, ":t")

  -- local text = table.concat({
  --   -- " " .. rel_path,
  --   rel_path,
  --   "󰌾 " .. perms,
  --   "󰈔 " .. size .. "B",
  --   " " .. mtime,
  --   -- "󰈙 " .. file,
  -- }, " › ")

  local text = table.concat({
    -- " " .. rel_path,
    rel_path,
    perms,
    size .. "B",
    mtime,
    -- "󰈙 " .. file,
  }, " › ")

  -- limit 80% window width
  local winwidth = vim.fn.winwidth(0)
  local maxlen = math.floor(winwidth * 0.8)

  if vim.fn.strdisplaywidth(text) > maxlen then
    text = vim.fn.strcharpart(text, 0, maxlen - 1) .. "…"
  end

  return "%=%m " .. text
end

_G.winbar = get_ls_style
vim.opt.winbar = "%!v:lua.winbar()"

-- vim.filetype.add({
--   extension = {
--     fxml = "xml",
--   },
-- })

-- Mason-Binaries zum System-Pfad hinzufügen (behebt "CLI not found")
vim.env.PATH = vim.fn.expand("$HOME/.local/share/nvim/mason/bin:") .. vim.env.PATH

-- In lua/config/options.lua ganz unten:
vim.opt.rtp:prepend("/home/jk/.local/share/nvim/site")

-- In lua/config/options.lua (ganz oben)
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- Beruhigt den Snacks-Healthcheck
vim.api.nvim_set_hl(0, "SnacksNormal", { fg = "#cba6f7", bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#585b70", bg = "NONE" })

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,
    source = "if_many",
  },
  float = {
    border = "rounded",
  },
  severity_sort = true,
})

-- vim.opt.guicursor = "n-v-c:block,i:block-blinkwait500-blinkon500-blinkoff500"

```

## config/keymaps.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim config/keymaps.lua
```

```bash
nano config/keymaps.lua
```

```bash
code config/keymaps.lua
```

```lua
-- config/keymaps.lua

-- local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Safe Keymap Helper (setzt nur wenn frei)
local function map_if_free(mode, lhs, rhs, opts)
  if vim.fn.mapcheck(lhs, mode) == "" then
    vim.keymap.set(mode, lhs, rhs, opts or { noremap = true, silent = true })
  end
end

vim.keymap.set("n", "<C-p>", ":Telescope find_files<cr>", { desc = "Find Files (Telescope)", silent = true, noremap = true })
vim.keymap.set("n", "<C-f>", ":Telescope live_grep<cr>", { desc = "Telescope Live Grep", silent = true, buffer = true })
vim.keymap.set("n", "<C-o>", ":Telescope lsp_document_symbols<cr>", { desc = "Telescope LSP Document Symbols", silent = true, buffer = true })
-- vim.keymap.set("n", "<C-m>", ":TroubleToggle<cr>", { desc = "Trouble Toggle", silent = true, buffer = true })
vim.keymap.set("n", "<leader>xx", ":TroubleToggle<cr>", { desc = "Trouble Toggle", silent = true, buffer = true })
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<cr>", { desc = "NvimTree Toggle", silent = true, buffer = true })

vim.keymap.set("n", "<leader>f<space>", "<cmd>FzfLua files<cr>", { desc = "Fzf Find Files", silent = true })

-- vim.keymap.set("n", "<C-_>", "gcc", { desc = "Toggle Comment", silent = true, buffer = true })
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle Comment", silent = true, buffer = true })
-- vim.keymap.set("v", "<C-_>", "gc", { desc = "Toggle Comment (Visual)", silent = true, buffer = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle Comment", silent = true, buffer = true })

vim.keymap.set("n", "<C-S-p>", ":Telescope commands<cr>", { desc = "Telescope Commands", silent = true, buffer = true })

-- vim.keymap.set("n", "<C-Tab>", ":bnext<cr>", { desc = "Switch to Next Buffer", silent = true, buffer = true })
vim.keymap.set("n", "<leader>bn", ":bnext<cr>", { desc = "Next Buffer", silent = true, buffer = true })
-- vim.keymap.set("n", "<C-S-Tab>", ":bprevious<cr>", { desc = "Switch to Previous Buffer", silent = true, buffer = true })
vim.keymap.set("n", "<leader>bp", ":bprevious<cr>", { desc = "Previous Buffer", silent = true, buffer = true })

vim.keymap.set("n", "<C-s>", ":w<cr>", { desc = "Save File", silent = true, buffer = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>a", { desc = "Save File and Continue Editing", silent = true, buffer = true })

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to Definition", silent = true, buffer = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Show References", silent = true, buffer = true })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show Hover Info", silent = true, buffer = true })

vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- vim.keymap.set("n", "<C-m>", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Show Diagnostic Float", silent = true, buffer = true })
-- vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Go to Previous Diagnostic", silent = true, buffer = true })
-- vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Go to Next Diagnostic", silent = true, buffer = true })

-- vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { desc = "DAP Continue", silent = true, buffer = true })
-- vim.keymap.set("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "DAP Toggle Breakpoint", silent = true, buffer = true })
-- vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", { desc = "DAP Step Over", silent = true, buffer = true })
-- vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", { desc = "DAP Step Into", silent = true, buffer = true })
-- vim.keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", { desc = "DAP Step Out", silent = true, buffer = true })

vim.keymap.set("n", "L", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "H", ":BufferLineCyclePrev<CR>", { silent = true })

-- vim.keymap.set("n", "<C-d>", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle DAP UI", silent = true, buffer = true })
vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", { desc = "DAP UI Toggle", silent = true, buffer = true })
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>", { desc = "DAP Open REPL", silent = true, buffer = true })

vim.keymap.set("n", "<leader>cf", ":ConformInfo<CR>", { desc = "Conform: Formatter Info" })

-- Clipboard yanking (system clipboard)
-- vim.keymap.set({ "n", "v" }, "y", '"+y', { noremap = true, silent = true })
-- vim.keymap.set("n", "yy", '"+yy', { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "o" }, "y", '"+y', { noremap = true, silent = true })
vim.keymap.set({ "n", "o" }, "yy", '"+yy', { noremap = true, silent = true })

-- d / dd NICHT ins Clipboard (Black-hole register)
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Range Code Action" })

local function get_current_dir()
  return vim.fn.expand("%:p:h")
end

local function build_path(dir, file)
  return vim.fn.fnameescape(dir .. "/" .. file)
end

local function ensure_dir(path)
  local dir = vim.fn.fnamemodify(path, ":h")
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end
end

function _G.complete_from_current_dir(arglead)
  local dir = get_current_dir()
  local results = vim.fn.getcompletion(dir .. "/" .. arglead, "file")

  return vim.tbl_map(function(path)
    return path:gsub("^" .. dir .. "/", "")
  end, results)
end

local function open_relative(cmd, raw_args)
  local dir = get_current_dir()

  -- split nur beim ersten |
  local file, extra = raw_args:match("^(.-)%s*|%s*(.+)$")

  if not file then
    file = raw_args
  end

  -- Datei / Split
  if file == "" then
    vim.cmd(cmd)
  else
    local full_path = dir .. "/" .. file
    ensure_dir(full_path)
    vim.cmd(cmd .. " " .. build_path(dir, file))
  end

  -- Extra Commands (z.B. term, terminal, etc.)
  if extra and extra ~= "" then
    -- wenn irgendein terminal command vorkommt
    if extra:match("^term") or extra:match("^terminal") then
      vim.cmd("lcd " .. vim.fn.fnameescape(dir))
    end

    vim.cmd(extra)
  end
end

vim.api.nvim_create_user_command("Ee", function(opts)
  open_relative("edit", opts.args)
end, {
  nargs = "*",
  complete = "customlist,v:lua.complete_from_current_dir",
})

vim.api.nvim_create_user_command("Spp", function(opts)
  open_relative("split", opts.args)
end, {
  nargs = "*",
  complete = "customlist,v:lua.complete_from_current_dir",
})

vim.api.nvim_create_user_command("Vspp", function(opts)
  open_relative("vsplit", opts.args)
end, {
  nargs = "*",
  complete = "customlist,v:lua.complete_from_current_dir",
})

-- :Open <file> -> öffnet Datei mit xdg-open / OS Default App
vim.api.nvim_create_user_command("Open", function(opts)
  local file = opts.args ~= "" and opts.args or vim.fn.expand("%:p")

  if vim.fn.filereadable(file) == 0 then
    vim.notify("File not found: " .. file, vim.log.levels.ERROR)
    return
  end

  -- Tool-Auswahl: wslview für WSL, xdg-open für natives Linux
  local cmd = vim.env.WSL_DISTRO_NAME ~= nil and "wslview" or "xdg-open"

  -- Prüfen, ob das Tool überhaupt existiert
  if vim.fn.executable(cmd) == 0 then
    vim.notify("Programm '" .. cmd .. "' not found. Please install it!", vim.log.levels.ERROR)
    return
  end

  vim.fn.jobstart({ cmd, file }, { detach = true })
end, {
  nargs = "?",
  complete = "file",
})

vim.api.nvim_create_user_command("Openn", function(opts)
  local dir = vim.fn.expand("%:p:h")

  -- wenn kein Argument → aktuelle Datei
  local file
  if opts.args == "" then
    file = vim.fn.expand("%:p")
  else
    file = dir .. "/" .. opts.args
  end

  file = vim.fn.fnameescape(file)

  -- prüfen ob Datei existiert
  if vim.fn.filereadable(file) == 0 then
    vim.notify("File not found: " .. file, vim.log.levels.ERROR)
    return
  end

  -- Tool wählen
  local cmd = vim.env.WSL_DISTRO_NAME ~= nil and "wslview" or "xdg-open"

  if vim.fn.executable(cmd) == 0 then
    vim.notify("Programm '" .. cmd .. "' not found!", vim.log.levels.ERROR)
    return
  end

  -- öffnen
  vim.fn.jobstart({ cmd, file }, { detach = true })
end, {
  nargs = "?",
  complete = "customlist,v:lua.complete_from_current_dir",
})

-- Explorer öffnen, sollte schon gehen.
-- map_if_free("n", "<leader>e", Snacks.picker.explorer)
-- vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })

map_if_free("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
map_if_free("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })

-- Git Basics
map_if_free("n", "<leader>gb", "<cmd>G blame<cr>", { desc = "Git Blame", silent = true})
map_if_free("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview Open", silent = true })
map_if_free("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "Diffview File History", silent = true })
map_if_free("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git Commit", silent = true })
map_if_free("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Git Push", silent = true })
map_if_free("n", "<leader>gl", "<cmd>Git pull<cr>", { desc = "Git Pull", silent = true })

-- Git Status öffnen
-- map_if_free("n", "<leader>g", Snacks.picker.git_status, { desc = "Git Status Picker" })
vim.keymap.set("n", "<leader>g", function() Snacks.picker.git_status() end, { desc = "Git Status" })

-- Hunks
-- map_if_free("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Go to Next Git Hunk" })
-- map_if_free("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Go to Previous Git Hunk" })
map_if_free("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Gitsigns Stage Hunk", silent = true })
map_if_free("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Gitsigns Reset Hunk", silent = true })
map_if_free("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Gitsigns Preview Hunk", silent = true })
map_if_free("n", "<leader>hb", "<cmd>Gitsigns blame_line<cr>", { desc = "Gitsigns Blame Line", silent = true })
map_if_free("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Gitsigns Stage Buffer", silent = true })
map_if_free("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Gitsigns Reset Buffer", silent = true })
map_if_free("n", "<leader>hd", "<cmd>Gitsigns diffthis<cr>", { desc = "Gitsigns Diff This", silent = true })
map_if_free("n", "<leader>hD", "<cmd>Gitsigns diffthis ~<cr>", { desc = "Gitsigns Diff This ~", silent = true })


-- Toggle Git UI
map_if_free("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Gitsigns Toggle Current Line Blame", silent = true })
map_if_free("n", "<leader>ts", "<cmd>Gitsigns toggle_signs<cr>", { desc = "Gitsigns Toggle Signs", silent = true })
map_if_free("n", "<leader>tn", "<cmd>Gitsigns toggle_numhl<cr>", { desc = "Gitsigns Toggle Number Highlight", silent = true })
map_if_free("n", "<leader>tl", "<cmd>Gitsigns toggle_linehl<cr>", { desc = "Gitsigns Toggle Line Highlight", silent = true })
map_if_free("n", "<leader>tw", "<cmd>Gitsigns toggle_word_diff<cr>", { desc = "Gitsigns Toggle Word Diff", silent = true })


-- Extra Git Commands (nicht typisch in LazyVim)
map_if_free("n", "<leader>gco", "<cmd>Git checkout<cr>", { desc = "Git Checkout", silent = true })
-- map_if_free("n", "<leader>gcb", "<cmd>Git checkout -b ")
map_if_free("n", "<leader>gcb", function()
  vim.ui.input({ prompt = "New branch name: " }, function(branch)
    if branch and branch ~= "" then
      vim.cmd("Git checkout -b " .. branch)
    end
  end)
end)
map_if_free("n", "<leader>gca", "<cmd>Git commit --amend<cr>", { desc = "Git Commit Amend", silent = true })
map_if_free("n", "<leader>gss", "<cmd>Git stash<cr>", { desc = "Git Stash", silent = true })
map_if_free("n", "<leader>gsp", "<cmd>Git stash pop<cr>", { desc = "Git Stash Pop", silent = true })
map_if_free("n", "<leader>gf", "<cmd>Git fetch<cr>", { desc = "Git Fetch", silent = true })
map_if_free("n", "<leader>gr", "<cmd>Git remote -v<cr>", { desc = "Git Remote -v", silent = true })
-- map_if_free("n", "<leader>glo", "<cmd>Git log --oneline --graph<cr>")
map_if_free("n", "<leader>glo", "<cmd>Git log --oneline --graph --decorate --all<cr>", { desc = "Git Log Oneline Graph", silent = true })
map_if_free("n", "<leader>gdc", "<cmd>DiffviewClose<cr>", { desc = "Diffview Close", silent = true })

-- Schneller Wechsel zwischen geändert Dateien in Diffview
-- Wenn Diffview offen ist, kannst du mit diesen Keys durch die Dateien springen
map_if_free("n", "<leader>gn", "<cmd>DiffviewNextFile<cr>", { desc = "Git: Next File in Diff" })
map_if_free("n", "<leader>gN", "<cmd>DiffviewPrevFile<cr>", { desc = "Git: Prev File in Diff" })

-- Test
-- Schaltet Autoformat komplett AUS oder AN (für LSP und Conform)
vim.keymap.set("n", "<leader>ta", function()
  vim.g.autoformat = not vim.g.autoformat
  if vim.g.autoformat then
    print("Autoformat: ON (Watch out for legacy code!)")
  else
    print("Autoformat: OFF (Safe mode enabled)")
  end
end, { desc = "Toggle Autoformat Global" })

-- local json_file = vim.fn.expand("~/.config/nvim/image_toggle_status.json")

-- -- JSON erstellen, falls nicht existiert
-- if vim.fn.filereadable(json_file) == 0 then
--   vim.fn.writefile({ vim.fn.json_encode({ display = false }) }, json_file)
-- end

-- -- Hilfsfunktion, um Status in die JSON zu schreiben
-- local function save_status(value)
--   vim.fn.writefile({ vim.fn.json_encode({ display = value }) }, json_file)
-- end

-- -- Commands, die nur JSON ändern
-- vim.api.nvim_create_user_command("ImageON", function()
--   save_status(true)
--   print("JSON: display = true")
-- end, {})

-- vim.api.nvim_create_user_command("ImageOFF", function()
--   save_status(false)
--   print("JSON: display = false")
-- end, {})

-- vim.api.nvim_create_user_command("ImageToggle", function()
--   local ok, data = pcall(vim.fn.json_decode, table.concat(vim.fn.readfile(json_file), "\n"))
--   local current = ok and data and data.display or false
--   save_status(not current)
--   print("JSON: display = " .. tostring(not current))
-- end, {})

-- -- Keymaps
-- vim.keymap.set("n", "<leader>io", "<cmd>ImageON<cr>", { noremap = true, silent = true, desc = "ImageON" })
-- vim.keymap.set("n", "<leader>if", "<cmd>ImageOFF<cr>", { noremap = true, silent = true, desc = "ImageOFF" })
-- vim.keymap.set("n", "<leader>it", "<cmd>ImageToggle<cr>", { noremap = true, silent = true, desc = "ImageToggle" })

-- -- Copilot Accept (wie VS Code Tab)
-- vim.keymap.set("i", "<Tab>", function()
--   if vim.fn["copilot#Accept"]("") ~= "" then
--     return vim.fn["copilot#Accept"]("<CR>")
--   end
--   return "<Tab>"
-- end, { expr = true, silent = true })

-- -- Copilot Navigation
-- vim.keymap.set("i", "<C-l>", "<Plug>(copilot-next)")
-- vim.keymap.set("i", "<C-h>", "<Plug>(copilot-previous)")
-- vim.keymap.set("i", "<C-e>", "<Plug>(copilot-dismiss)")

-- -- Toggle AI Mode
-- vim.keymap.set("n", "<leader>ai", function()
--   if vim.g.copilot_enabled then
--     vim.cmd("Copilot disable")
--     vim.g.copilot_enabled = false
--     vim.g.blink_cmp_enabled = true
--     print("Copilot OFF | blink ON")
--   else
--     vim.cmd("Copilot enable")
--     vim.g.copilot_enabled = true
--     vim.g.blink_cmp_enabled = false
--     print("Copilot ON | blink OFF")
--   end
-- end, { desc = "Toggle Copilot / blink" })

vim.api.nvim_create_user_command("LspInfo", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  if vim.tbl_isempty(clients) then
    vim.notify("No active LSP clients", vim.log.levels.INFO)
    return
  end

  local buf = vim.api.nvim_get_current_buf()
  local lines = {}

  table.insert(lines, "Active LSP clients (buffer " .. buf .. "):\n")

  for _, client in ipairs(clients) do
    -- SICHERER AUFRUF: pcall verhindert, dass nvim-java/jdtls alles zum Absturz bringt
    local success, cmd_list = pcall(function()
      local raw = client.config.cmd
      if type(raw) == "function" then
        return raw()
      end
      return raw
    end)

    -- Fallback, falls der Aufruf fehlschlägt oder kein Table kommt
    if not success or type(cmd_list) ~= "table" then
      cmd_list = { "Befehl konnte nicht gelesen werden (LSP geschützt)" }
    end

    table.insert(lines, "• Name: " .. client.name)
    table.insert(lines, "  id: " .. client.id)
    table.insert(lines, "  root: " .. (client.config.root_dir or "nil"))
    table.insert(lines, "  cmd: " .. table.concat(cmd_list, " "))
    table.insert(lines, "")
  end

  vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, {
    title = "LSP Info",
  })
end, {})

vim.api.nvim_create_user_command("LspClient", function()
  vim.cmd("checkhealth lsp")
end, {})


vim.api.nvim_create_user_command("LspClient", function()
  vim.cmd("checkhealth lsp")
end, {})


```

## plugins/lsp.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/lsp.lua
```

```bash
nano plugins/lsp.lua
```

```bash
code plugins/lsp.lua
```

```lua
-- plugins/lsp.lua

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     opts = {
--       servers = {
--         rust_analyzer = {
--           settings = {
--             ["rust-analyzer"] = {
--               cargo = { allFeatures = true },
--               checkOnSave = { command = "clippy" }, -- slow
--               -- checkOnSave = { command = "check" } -- faster
--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--               },
--             },
--           },
--         },
--         clangd = {
--           cmd = {
--             "clangd",
--             "--background-index",
--             "--clang-tidy",
--             "--completion-style=detailed",
--             "--header-insertion=never",
--           },
--         },
--       },
--     },
--   },
-- }

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     opts = {
--       servers = {
--         clangd = {
--           cmd = {
--             "clangd",
--             "--background-index",
--             "--clang-tidy",
--             "--completion-style=detailed",
--             "--header-insertion=never",
--           },
--         },
--       },
--     },
--   },
-- }

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--header-insertion=never",
          },
        },

        rust_analyzer = {
          enabled = false,
        },
        -- rust_analyzer = {
        --   settings = {
        --     ["rust-analyzer"] = {
        --       diagnostics = {
        --         disabled = {
        --           "unresolved-proc-macro",
        --           "unlinked-file",
        --         },
        --       },

        --       formatting = {
        --         useCrate = true,  -- verwendet rustfmt
        --       },

        --       cargo = {
        --         allFeatures = true,
        --         buildScripts = { enable = true },
        --       },

        --       procMacro = { enable = true },
        --       lens = { enable = true },

        --       completion = {
        --         autoimport = { enable = true },
        --       },

        --       checkOnSave = {
        --         command = "clippy",  -- Linter: Findet Stilfehler und logische Patzer (sehr gründlich)
        --         -- command = "check", -- Standard: Prüft nur, ob der Code kompiliert (schnellste Option)
        --         -- command = "test", -- Tests: Validiert auch den Code innerhalb deiner Test-Module
        --         -- command = "build", -- Kompilieren: Erstellt das komplette Binary (langsam, meist unnötig für LSP)
        --       },

        --       inlayHints = {
        --         enable = true,
        --         typeHints = true,
        --         parameterHints = true,
        --         lifetimeElisionHints = "always",
        --         closureReturnTypeHints = { enable = "always" },
        --         bindingModeHints = { enable = true },
        --       },

        --       files = {
        --         watcher = "client",
        --       },
        --     },
        --   },
        -- },
      },
    },
  },
}

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     opts = {
--       servers = {
--         clangd = {
--           cmd = {
--             "clangd",
--             "--background-index",
--             "--clang-tidy",
--             "--completion-style=detailed",
--             "--header-insertion=never",
--           },
--         },

--         rust_analyzer = {
--           settings = {
--             ["rust-analyzer"] = {
--               diagnostics = {
--                 disabled = {
--                   "unresolved-proc-macro",
--                   "unlinked-file",
--                 },
--               },

--               cargo = {
--                 allFeatures = true,
--                 buildScripts = { enable = true },
--               },

--               procMacro = { enable = true },
--               lens = { enable = true },

--               completion = {
--                 autoimport = { enable = true },
--               },

--               checkOnSave = {
--                 command = "clippy",
--               },

--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--                 closureReturnTypeHints = { enable = "always" },
--                 bindingModeHints = { enable = true },
--               },

--               files = {
--                 watcher = "client",
--               },
--             },
--           },
--         },

--         local jdtls = require('jdtls')

--         jdtls.start_or_attach({
--           cmd = {'jdtls'},  -- Pfad zu jdtls, evtl. '/usr/local/bin/jdtls'
--           root_dir = require('jdtls.setup').find_root({'.git', 'pom.xml', 'build.gradle'}),
--           settings = {
--             java = {
--               signatureHelp = { enabled = true },
--               contentProvider = { preferred = 'fernflower' }
--             }
--           }
--         })
--       },
--     },
--   },
-- }

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     opts = {
--       servers = {
--         -- C/C++ LSP
--         clangd = {
--           cmd = {
--             "clangd",
--             "--background-index",
--             "--clang-tidy",
--             "--completion-style=detailed",
--             "--header-insertion=never",
--           },
--         },

--         -- Rust LSP
--         rust_analyzer = {
--           settings = {
--             ["rust-analyzer"] = {
--               diagnostics = { disabled = { "unresolved-proc-macro", "unlinked-file" } },
--               cargo = { allFeatures = true, buildScripts = { enable = true } },
--               procMacro = { enable = true },
--               lens = { enable = true },
--               completion = { autoimport = { enable = true } },
--               checkOnSave = { command = "clippy" },
--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--                 closureReturnTypeHints = { enable = "always" },
--                 bindingModeHints = { enable = true },
--               },
--               files = { watcher = "client" },
--             },
--           },
--         },
--       },
--     },
--   },
-- }

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     opts = {
--       servers = {
--         rust_analyzer = {
--           settings = {
--             ["rust-analyzer"] = {
--               cargo = { allFeatures = true },
--               checkOnSave = { command = "check" },
--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--               },
--             },
--           },
--         },
--         clangd = { 
--           cmd = {
--             "clangd",
--             "--background-index",
--             "--clang-tidy",
--             "--completion-style=detailed",
--             "--header-insertion=never",
--           },
--         },
--       },
--     },
--   },
-- }

-- return {
--   {
--    "neovim/nvim-lspconfig",
--    dependencies = {
--      "mason-org/mason.nvim",
--      "mason-org/mason-lspconfig.nvim",
--     },
--     opts = {
--       servers = {
--         rust_analyzer = {
--           root_dir = function(fname)
--             return require("lspconfig.util")
--               .root_pattern("Cargo.toml", ".git")(fname)
--               or vim.fn.getcwd()
--           end,
-- 
--           -- on_attach sorgt dafür, dass Shortcuts nur in Rust aktiviert sind
--           on_attach = function(_, bufnr)
--             local map = vim.keymap.set
--             local opts = { noremap = true, silent = true, buffer = bufnr }
-- 
--             -- Cargo Shortcuts
--             map("n", "<leader>rr", function()
--               vim.cmd("split | terminal cargo run")
--             end, opts)
-- 
--             map("n", "<leader>rd", function()
--               vim.cmd("split | terminal cargo debug")
--             end, opts)
-- 
--             map("n", "<leader>rb", function()
--               vim.cmd("split | terminal cargo build")
--             end, opts)
-- 
--             map("n", "<leader>rt", function()
--               vim.cmd("split | terminal cargo test")
--             end, opts)
-- 
--             map("n", "<leader>rc", function()
--               vim.cmd("edit Cargo.toml")
--             end, opts)
-- 
--             -- LSP Commands
--             map("n", "<leader>rh", function()
--               vim.lsp.buf.hover()
--             end, opts)
-- 
--             map("n", "<leader>re", function()
--               vim.lsp.buf.execute_command({
--                 command = "rust-analyzer.expandMacro",
--                 arguments = { vim.uri_from_bufnr(bufnr) },
--               })
--             end, opts)
-- 
--             map("n", "<leader>rf", function()
--               vim.lsp.buf.format({ async = true })
--             end, opts)
--           end,
-- 
--           settings = {
--             ["rust-analyzer"] = {
--               cargo = { allFeatures = true },
--               checkOnSave = { command = "clippy" },
--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--               },
--             },
--           },
--         },
-- 
--         clangd = {
--           cmd = {
--             "clangd",
--             "--background-index",
--             "--clang-tidy",
--             "--completion-style=detailed",
--             "--header-insertion=never",
--           },
--         },
--       },
--     },
--   },
-- }

```

## plugins/completion.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/completion.lua
```

```bash
nano plugins/completion.lua
```

```bash
code plugins/completion.lua
```

```lua
-- plugins/completion.lua

-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     opts = function(_, opts)
--       local cmp = require("cmp")

--       opts.mapping = cmp.mapping.preset.insert({
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       })

--       opts.experimental = { ghost_text = false }
--     end,
--   },
-- }

-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--       "L3MON4D3/LuaSnip",
--     },
--     opts = function(_, opts)
--       local cmp = require("cmp")

--       opts.sources = cmp.config.sources({
--         { name = "nvim_lsp" },
--       })

--       opts.mapping = cmp.mapping.preset.insert({
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       })

--       opts.experimental = { ghost_text = false }
--     end,
--   },
-- }

-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--       "L3MON4D3/LuaSnip",
--     },
--     opts = function(_, opts)
--       local cmp = require("cmp")

--       opts.sources = cmp.config.sources({
--         { name = "nvim_lsp" },
--       })

--       opts.mapping = cmp.mapping.preset.insert({
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<CR>"] = cmp.mapping.confirm({ select = false }), -- safer

--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),

--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       })

--       -- Ghost text ist nice, aber manchmal störend.
--       opts.experimental = { ghost_text = false }
--     end,
--   },
-- }

-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-path",
--       "L3MON4D3/LuaSnip",
--     },
--     opts = function(_, opts)
--       local cmp = require("cmp")

--       opts.completion = {
--         completeopt = "menu,menuone,noselect",
--       }

--       -- IntelliSense-ähnliche Priorisierung
--       opts.sources = cmp.config.sources({
--         { name = "nvim_lsp", priority = 1000 },
--         { name = "path", priority = 750 },
--         { name = "buffer", priority = 500, keyword_length = 3 },
--       })

--       opts.mapping = cmp.mapping.preset.insert({
--         ["<C-Space>"] = cmp.mapping.complete(),

--         -- Kein Auto-Accept → sicher
--         ["<CR>"] = cmp.mapping.confirm({
--           select = false,
--           behavior = cmp.ConfirmBehavior.Insert,
--         }),

--         -- Tab nur wenn Menü sichtbar
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),

--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       })

--       -- Kein Ghost-Text (IntelliSense-Style)
--       opts.experimental = {
--         ghost_text = false,
--       }

--       return opts
--     end,
--   },
-- }

-- return {
--   {
--     "saghen/blink.cmp",
--     event = "InsertEnter",
--     dependencies = {
--       "rafamadriz/friendly-snippets",
--     },

--     opts = {
--       keymap = {
--         preset = "default",

--         ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },

--         ["<CR>"] = {
--           "accept",
--           auto_select = false, -- kein auto accept
--         },

--         ["<Tab>"] = {
--           function(cmp)
--             if cmp.is_visible() then
--               return cmp.select_next()
--             end
--           end,
--           "snippet_forward",
--           "fallback",
--         },

--         ["<S-Tab>"] = {
--           function(cmp)
--             if cmp.is_visible() then
--               return cmp.select_prev()
--             end
--           end,
--           "snippet_backward",
--           "fallback",
--         },
--       },

--       completion = {
--         menu = {
--           auto_show = true,
--         },
--         ghost_text = {
--           enabled = false, -- IntelliSense Style
--         },
--       },

--       sources = {
--         default = { "lsp", "path", "buffer" },

--         providers = {
--           lsp = {
--             score_offset = 1000,
--           },
--           path = {
--             score_offset = 750,
--           },
--           buffer = {
--             score_offset = 500,
--             min_keyword_length = 3,
--           },
--         },
--       },

--       signature = {
--         enabled = true, -- wichtig für Rust/C++ etc.
--       },
--     },
--   },
-- }

-- return {
--   {
--     "saghen/blink.cmp",
--     event = "InsertEnter",
--     dependencies = {
--       "rafamadriz/friendly-snippets",
--     },

--     opts = {
--       enabled = function()
--         return vim.g.blink_cmp_enabled ~= false
--       end,

--       keymap = {
--         preset = "default",

--         ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },

--         -- ["<CR>"] = {
--         --   "accept",
--         --   auto_select = false,
--         -- },

--         ["<CR>"] = {
--           function(cmp)
--             if cmp.is_visible() and cmp.get_selected_item() then
--               return cmp.accept()
--             end
--           end,
--           "fallback",
--         },

--         ["<Tab>"] = {
--           function(cmp)
--             if cmp.is_visible() then
--               return cmp.select_next()
--             end
--           end,
--           "snippet_forward",
--           "fallback",
--         },

--         ["<S-Tab>"] = {
--           function(cmp)
--             if cmp.is_visible() then
--               return cmp.select_prev()
--             end
--           end,
--           "snippet_backward",
--           "fallback",
--         },
--       },

--       completion = {
--         menu = { auto_show = true },
--         ghost_text = { enabled = false },
--       },

--       sources = {
--         default = { "lsp", "path", "buffer" },
--         providers = {
--           lsp = { score_offset = 1000 },
--           path = { score_offset = 750 },
--           buffer = {
--             score_offset = 500,
--             min_keyword_length = 3,
--           },
--         },
--       },

--       signature = { enabled = true },
--     },
--   },
-- }

-- return {
--   {
--     "saghen/blink.cmp",
--     event = "InsertEnter",
--     dependencies = {
--       "rafamadriz/friendly-snippets",
--     },

--     opts = {
--       keymap = {
--         preset = "default",

--         ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },

--         -- ["<CR>"] = {
--         --   "accept",
--         --   auto_select = false,
--         -- },

--         ["<CR>"] = {
--           function(cmp)
--             if cmp.is_visible() and cmp.get_selected_item() then
--               return cmp.accept()
--             end
--           end,
--           "fallback",
--         },

--         ["<Tab>"] = {
--           function(cmp)
--             if cmp.is_visible() then
--               return cmp.select_next()
--             end
--           end,
--           "snippet_forward",
--           "fallback",
--         },

--         ["<S-Tab>"] = {
--           function(cmp)
--             if cmp.is_visible() then
--               return cmp.select_prev()
--             end
--           end,
--           "snippet_backward",
--           "fallback",
--         },
--       },

--       completion = {
--         menu = { auto_show = true },
--         ghost_text = { enabled = false },
--       },

--       sources = {
--         default = { "lsp", "path", "buffer" },
--         providers = {
--           lsp = { score_offset = 1000 },
--           path = { score_offset = 750 },
--           buffer = {
--             score_offset = 500,
--             min_keyword_length = 3,
--           },
--         },
--       },

--       signature = { enabled = true },
--     },
--   },
-- }

return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    opts = {
      enabled = function()
        return vim.g.blink_cmp_enabled ~= false
      end,

      keymap = {
        preset = "default",

        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },

        ["<CR>"] = {
          function(cmp)
            if cmp.is_visible() and cmp.get_selected_item() then
              return cmp.accept()
            end
          end,
          "fallback",
        },

        -- ELITE TAB (Copilot + blink perfekt kombiniert)
        ["<Tab>"] = {
          function(cmp)
            -- 1. Copilot FIRST
            local copilot = vim.fn["copilot#Accept"]("")
            if copilot ~= "" then
              vim.api.nvim_feedkeys(copilot, "n", false)
              return true
            end

            -- 2. Completion
            if cmp.is_visible() then
              return cmp.select_next()
            end

            -- 3. Snippet
            if cmp.snippet_active() then
              return cmp.snippet_forward()
            end

            return false
          end,
          "fallback",
        },


        ["<S-Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_prev()
            end
          end,
          "snippet_backward",
          "fallback",
        },
      },

      completion = {
        menu = {
          auto_show = true,
          -- border = "rounded", -- nicer UI
        },

        list = {
          selection = {
            preselect = false, -- verhindert falsche auto-selections
          },
        },

        ghost_text = {
          enabled = false, -- wichtig für Copilot!
        },

        -- Copilot-safe
        accept = {
          auto_brackets = {
            enabled = false,
          },
        },
      },

      sources = {
        default = { "lsp", "path", "buffer" },

        providers = {
          lsp = { score_offset = 1000 },
          path = { score_offset = 750 },

          buffer = {
            score_offset = 500,
            min_keyword_length = 4, -- weniger spam = mehr performance
          },
        },
      },

      signature = {
        enabled = true,
      },
    },
  },
}

```

## plugins/rust.lua

Wichtig: **Keine doppelte rust-analyzer Konfiguration** — das macht nur LSPConfig.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/rust.lua
```

```bash
nano plugins/rust.lua
```

```bash
code plugins/rust.lua
```

```lua
-- plugins/rust.lua

-- return {
--   {
--     "Saecki/crates.nvim",
--     ft = { "rust", "toml" },
--     config = function()
--       require("crates").setup()
--     end,
--   },
-- }

-- return {
--   {
--     "simrat39/rust-tools.nvim", -- alt!!!
--     ft = { "rust" },
--     dependencies = {
--       "neovim/nvim-lspconfig",
--       "nvim-lua/plenary.nvim",
--     },
--     opts = function()
--       return {
--         server = {
--           on_attach = function(_, bufnr)
--             local opts = { noremap = true, silent = true, buffer = bufnr }
--             vim.keymap.set("n", "<Leader>rr", ":split | terminal cargo run<CR>", opts)
--             vim.keymap.set("n", "<Leader>rd", ":split | terminal cargo debug<CR>i", opts)
--             vim.keymap.set("n", "<Leader>rh", "<cmd>RustHoverActions<CR>", opts)
--             vim.keymap.set("n", "<Leader>rc", "<cmd>RustOpenCargo<CR>", opts)
--           end,
--           settings = {
--             ["rust-analyzer"] = {
--               cargo = { allFeatures = true },
--               checkOnSave = { command = "clippy" },
--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--               },
--             },
--           },
--         },
--       }
--     end,
--   },

--   {
--     "Saecki/crates.nvim",
--     ft = { "rust", "toml" },
--     config = function()
--       require("crates").setup()
--     end,
--   },
-- }

-- return {
--   {
--     "simrat39/rust-tools.nvim", -- This repository was archived by the owner on Jan 3, 2024. It is now read-only. 
--     ft = { "rust" },
--     dependencies = {
--       "neovim/nvim-lspconfig",
--       "nvim-lua/plenary.nvim",
--     },
--     opts = function()
--       return {
--         server = {
--           on_attach = function(_, bufnr)
--             local opts = { noremap = true, silent = true, buffer = bufnr }

--             vim.keymap.set("n", "<Leader>rr", ":split | terminal cargo run<CR>", opts)
--             vim.keymap.set("n", "<Leader>rd", ":split | terminal cargo debug<CR>i", opts)
--             vim.keymap.set("n", "<Leader>rb", ":split | terminal cargo build<CR>i", opts)
--             vim.keymap.set("n", "<Leader>rh", "<cmd>RustHoverActions<CR>", opts)
--             vim.keymap.set("n", "<Leader>rc", "<cmd>RustOpenCargo<CR>", opts)

--             -- Auto Reload: Rust Analyzer neu laden wenn neue Datei erstellt wird
--             -- vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
--             --   pattern = { "*.rs", "Cargo.toml" },
--             --   callback = function()
--             --     -- nur wenn rust-tools aktiv ist
--             --     local ok, _ = pcall(vim.cmd, "RustReloadWorkspace")
--             --     if not ok then
--             --       -- fallback: LSP Restart
--             --       pcall(vim.cmd, "LspRestart")
--             --     end
--             --   end,
--             -- })
--           end,

--           settings = {
--             ["rust-analyzer"] = {
--               diagnostics = {
--                 disabled = { "unresolved-proc-macro", "unlinked-file" },
--               },
--               cargo = { allFeatures = true },
--               checkOnSave = { command = "clippy" },
--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--               },
--             },
--           },
--         },
--       }
--     end,
--   },

--   {
--     "Saecki/crates.nvim",
--     ft = { "rust", "toml" },
--     config = function()
--       require("crates").setup()
--     end,
--   },
-- }

-- return {
--   {
--     "simrat39/rust-tools.nvim", -- This repository was archived by the owner on Jan 3, 2024. It is now read-only. 
--     ft = { "rust" },
--     dependencies = {
--       "neovim/nvim-lspconfig",
--       "nvim-lua/plenary.nvim",
--     },
--     opts = function()
--       return {
--         server = {
--           on_attach = function(_, bufnr)
--             local opts = { noremap = true, silent = true, buffer = bufnr }

--             vim.keymap.set("n", "<Leader>rr", ":split | terminal cargo run<CR>", opts)
--             vim.keymap.set("n", "<Leader>rd", ":split | terminal cargo debug<CR>i", opts)
--             vim.keymap.set("n", "<Leader>rb", ":split | terminal cargo build<CR>i", opts)
--             vim.keymap.set("n", "<Leader>rh", "<cmd>RustHoverActions<CR>", opts)
--             vim.keymap.set("n", "<Leader>rc", "<cmd>RustOpenCargo<CR>", opts)

--             -- Auto Reload: Rust Analyzer neu laden wenn neue Datei erstellt wird
--             -- vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
--             --   pattern = { "*.rs", "Cargo.toml" },
--             --   callback = function()
--             --     -- nur wenn rust-tools aktiv ist
--             --     local ok, _ = pcall(vim.cmd, "RustReloadWorkspace")
--             --     if not ok then
--             --       -- fallback: LSP Restart
--             --       pcall(vim.cmd, "LspRestart")
--             --     end
--             --   end,
--             -- })
--           end,

--           settings = {
--             ["rust-analyzer"] = {
--               diagnostics = {
--                 disabled = {
--                   "unresolved-proc-macro",
--                   "unlinked-file",
--                 },
--                 experimental = {
--                   enable = true,
--                 },
--               },

--               cargo = {
--                 allFeatures = true,
--                 buildScripts = {
--                   enable = true,
--                 },
--               },

--               procMacro = {
--                 enable = true,
--               },

--               lens = {
--                 enable = true,
--               },

--               completion = {
--                 autoimport = {
--                   enable = true,
--                 },
--               },

--               checkOnSave = {
--                 command = "clippy",
--               },

--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--                 closureReturnTypeHints = {
--                   enable = "always",
--                 },
--                 bindingModeHints = {
--                   enable = true,
--                 },
--               },

--               files = {
--                 watcher = "client",
--               },
--             }
--           },
--         },
--       }
--     end,
--   },

--   {
--     "Saecki/crates.nvim",
--     ft = { "rust", "toml" },
--     config = function()
--       require("crates").setup()
--     end,
--   },
-- }

-- return {
--   {
--     "Saecki/crates.nvim",
--     ft = { "rust", "toml" },
--     config = function()
--       require("crates").setup({
--         completion = {
--           cmp = { enabled = true },
--         },
--         popup = {
--           border = "rounded",
--         },
--       })
--     end,
--   },
-- }

-- return {
--   {
--     "Saecki/crates.nvim",
--     ft = { "toml" },
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "hrsh7th/nvim-cmp",
--     },
--     config = function()
--       local ok, crates = pcall(require, "crates")
--       if not ok then
--         return
--       end

--       crates.setup({
--         completion = {
--           cmp = { enabled = true },
--         },
--         popup = {
--           border = "rounded",
--         },
--       })
--     end,
--   },
-- }

-- return {
--   -- {
--   --   "Saecki/crates.nvim",
--   --   ft = { "toml" },
--   --   dependencies = {
--   --     "nvim-lua/plenary.nvim",
--   --     -- "hrsh7th/nvim-cmp", -- blink.cmp braucht das nicht, sonst lädst du unnötig nvim-cmp mit
--   --   },
--   --   config = function()
--   --     require("crates").setup({
--   --       popup = {
--   --         border = "rounded",
--   --       },
--   --     })
--   --   end,
--   -- },

--   {
--     "Saecki/crates.nvim",
--     ft = { "toml" },
--     event = { "BufRead Cargo.toml" }, -- lädt nur bei Cargo.toml
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--     },
--     opts = {
--       popup = {
--         border = "rounded",
--       },
--       completion = {
--         crates = {
--           enabled = true,
--         },
--       },
--     },
--   },

--   -- {
--   --   "nvim-neotest/neotest",
--   --   dependencies = {
--   --     "nvim-neotest/nvim-nio",
--   --     "rouge8/neotest-rust", -- Dieser Adapter ist LSP-unabhängig - aber This repository was archived by the owner on Aug 19, 2025. It is now read-only. 
--   --   },
--   --   config = function()
--   --     require("neotest").setup({
--   --       adapters = {
--   --         require("neotest-rust")({
--   --           args = { "--nocapture" },
--   --           -- Er erkennt Tests über Treesitter, egal was dein LSP macht
--   --         }),
--   --       },
--   --     })
--   --   end,
--   -- },

--   {
--     "stevearc/aerial.nvim",
--     ft = { "rust" }, -- toml/lua nicht nötig, wenn Rust-only
--     keys = {
--       { "<leader>rua", "<cmd>AerialToggle! right<CR>", desc = "Rust Outline" },
--     },
--     opts = {
--       backends = { "lsp" }, -- nur LSP wenn rust-analyzer gut konfiguriert
--       layout = {
--         min_width = 35,
--         default_direction = "right",
--         placement = "window",
--       },
--       attach_mode = "global",
--       show_guides = true,
--       close_on_select = true,
--       filter_kind = false, -- professioneller: nichts hart filtern
--     },
--   }
-- }

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^8",
    ft = { "rust" },

    config = function()
      vim.g.rustaceanvim = {

        -------------------------
        -- TOOLS
        -------------------------

        tools = {
          autoSetHints = true,

          hover_actions = {
            auto_focus = true,
          },

          inlay_hints = {
            auto = true,
            show_parameter_hints = true,
            parameter_hints_prefix = " ",
            other_hints_prefix = "=> ",
          },
        },

        -------------------------
        -- LSP SERVER
        -------------------------

        server = {

          on_attach = function(_, bufnr)

            -- local map = function(keys, func, desc)
            --   vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            -- end

            local map = function(keys, func, desc)
              vim.keymap.set("n", keys, func, {
                buffer = bufnr,
                desc = desc or "",
              })
            end

            -- Rust spezielle Features

            map("<leader>re", function()
              vim.cmd.RustLsp("expandMacro")
            end, "Expand Macro")

            map("<leader>rh", function()
              vim.cmd.RustLsp("hoverActions")
            end, "Hover Actions")

            map("<leader>rca", function()
              vim.cmd.RustLsp("codeAction")
            end, "Rust Code Action")

            map("<leader>rj", function()
              vim.cmd.RustLsp("joinLines")
            end, "Join Lines")

            map("<leader>rr", function()
              vim.cmd.RustLsp("runnables")
            end, "Rust Runnables")

            map("<leader>rd", function()
              vim.cmd.RustLsp("debuggables")
            end, "Rust Debuggables")

            map("<leader>rt", function()
              vim.cmd.RustLsp("testables")
            end, "Rust Testables")

            map("<leader>rrx", function()
              vim.cmd("!cargo clippy --all --all-features -- -Dwarnings")
            end, "Run full clippy")
          end,

          -------------------------
          -- rust-analyzer settings
          -------------------------

          default_settings = {
            ["rust-analyzer"] = {

              diagnostics = {
                enable = true,
                experimental = {
                  enable = true,
                },
              },

              -------------------------
              -- Clippy on Save
              -------------------------

              checkOnSave = {
                command = "clippy",

                -- This enables full Clippy analysis on every save.
                -- It is very accurate but also a CPU-heavy operation ("CPU killer"),
                -- especially in large projects or WSL environments.
                -- extraArgs = {
                --   "--all",
                --   "--all-features",
                --   "--",
                --   "-Dwarnings",
                -- },
              },

              -------------------------
              -- Cargo
              -------------------------

              cargo = {
                allFeatures = true,
                buildScripts = {
                  enable = true,
                },
                loadOutDirsFromCheck = true,
                autoreload = true,
              },

              -------------------------
              -- Proc Macros
              -------------------------

              procMacro = {
                enable = true,
              },

              -------------------------
              -- Completion
              -------------------------

              -- completion = {

              --   autoimport = {
              --     enable = true,
              --   },

              --   autoself = {
              --     enable = true,
              --   },

              --   postfix = {
              --     enable = true,
              --   },

              --   callable = {
              --     snippets = "fill_arguments",
              --   },

              --   fullFunctionSignatures = {
              --     enable = true,
              --   },
              -- },

              completion = {
                autoimport = {
                  enable = true,
                },

                autoself = {
                  enable = true,
                },

                postfix = {
                  enable = true,
                },

                callable = {
                  snippets = "fill_arguments",
                  -- snippets = "none", -- momenates Problem neovim 0.12
                },

                fullFunctionSignatures = {
                  enable = true,
                },

                completionItemLabelDetails = {
                  enable = true,
                },

                limit = {
                  maxItems = 200,
                },

                hideDeprecated = true,
              },

              -------------------------
              -- Inlay hints
              -------------------------

              -- inlayHints = {

              --   bindingModeHints = {
              --     enable = true,
              --   },

              --   chainingHints = {
              --     enable = true,
              --   },

              --   closingBraceHints = {
              --     enable = true,
              --     minLines = 1,
              --   },

              --   closureReturnTypeHints = {
              --     enable = "always",
              --   },

              --   lifetimeElisionHints = {
              --     enable = "always",
              --     useParameterNames = true,
              --   },

              --   parameterHints = {
              --     enable = true,
              --   },

              --   typeHints = {
              --     enable = true,
              --   },
              -- },

              inlayHints = {
                bindingModeHints = {
                  enable = true,
                },

                chainingHints = {
                  enable = true,
                },

                closingBraceHints = {
                  enable = true,
                  minLines = 1,
                },

                closureReturnTypeHints = {
                  enable = "always",
                },

                lifetimeElisionHints = {
                  enable = "always",
                  useParameterNames = true,
                },

                parameterHints = {
                  enable = true,
                },

                typeHints = {
                  enable = true,
                },

                renderColons = true,
                locationLinks = true,

                maxLength = 25,
              },

              -------------------------
              -- CodeLens
              -------------------------

              -- lens = {
              --   enable = true,
              --   run = true,
              --   debug = true,
              --   implementations = true,
              --   references = true,
              -- },

              lens = {
                enable = true,
                run = true,
                debug = true,
                implementations = true,
                references = true,
                refresh = true,
              },

              -------------------------
              -- Hover
              -------------------------

              hover = {
                actions = {
                  enable = true,
                },
              },

              -------------------------
              -- Performance Boost
              -------------------------

              files = {
                -- watcher = "client",
                watcher = "server",
              },
            },
          },
        },

        -------------------------
        -- Debug Adapter
        -------------------------

        dap = {
          adapter = require("rustaceanvim.config").get_codelldb_adapter(
            vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
            vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.so"
          ),
        },
      }
    end,
  },

  -- crates bleibt gleich (perfekt)
  {
    "Saecki/crates.nvim",
    ft = { "toml" },
    -- event = { "BufRead Cargo.toml" },
    event = { "BufReadPre Cargo.toml" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      popup = { border = "rounded" },
      completion = {
        crates = { enabled = true },
      },
    },
  },

  -- outline bleibt gleich
  {
    "stevearc/aerial.nvim",
    ft = { "rust" },
    keys = {
      { "<leader>rua", "<cmd>AerialToggle! right<CR>", desc = "Rust Outline" },
    },
    opts = {
      backends = { "lsp" },
      layout = {
        min_width = 35,
        default_direction = "right",
      },
      attach_mode = "global",
      show_guides = true,
      close_on_select = true,
    },
  },

  -- Neotest (modern + kompatibel mit deinem Setup)
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "rouge8/neotest-rust",
  --   },
  --   config = function()
  --     -- require("neotest").setup({
  --     --   adapters = {
  --     --     require("neotest-rust")({
  --     --       args = { "--all-features", "--nocapture" },
  --     --       dap_adapter = "lldb",
  --     --     }),
  --     --   },
  --     -- })
  --     require("neotest").setup({
  --       adapters = {
  --         require("neotest-rust")({
  --           args = { "--all-features" },
  --           dap_adapter = "codelldb",
  --         }),
  --       },
  --     })
  --   end,
  -- },

{
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rouge8/neotest-rust",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust")({
            args = { "--all-features" },
            dap_adapter = "codelldb",
          }),
        },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.rust = { "rustfmt" }
    end,
  },
}

```

## plugins/cpp.lua

```bash
# find ~ -name ".clang-format"
# rm -r ~/.cache/nvim/tree-sitter-cpp/.clang-format
# rm -r ~/.cache/nvim/tree-sitter-zsh/.clang-format

find ~ -name ".clang-format" -path "*/.cache/nvim/*" -delete

# Erstelle eine globale Konfiguration in deinem Home-Verzeichnis
# echo -e "---\nLanguage: Cpp\nBasedOnStyle: Google\nIndentWidth: 4\nTabWidth: 4\nUseTab: Never\n..." > ~/.clang-format
```

```vim
:lua vim.lsp.buf.format()
```

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/cpp.lua
```

```bash
nano plugins/cpp.lua
```

```bash
code plugins/cpp.lua
```

```lua
-- plugins/cpp.lua

-- return {
--   {
--     "p00f/clangd_extensions.nvim",
--     ft = { "c", "cpp", "objc", "objcpp" },
--     opts = {
--       server = {
--         cmd = {
--           "clangd",
--           "--background-index",
--           "--clang-tidy",
--           "--completion-style=detailed",
--           "--header-insertion=never",
--         },
--       },
--     },
--   },
-- }

-- return {
--   {
--     "p00f/clangd_extensions.nvim",
--     ft = { "c", "cpp", "objc", "objcpp" },
--     opts = {
--       -- Keine eigene clangd Konfiguration hier!
--       -- clangd kommt sauber aus lsp.lua (mason-lspconfig).
--       server = {},
--     },
--   },
-- }

return {
  -- 1. Erweiterte UI für clangd (Inlay Hints, AST-Visualisierung)
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp" },
    opts = {
      ast = {
        -- Zeigt Icons für Typen und Deklarationen im Code (Inlay Hints)
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
    config = function(_, opts)
      require("clangd_extensions").setup(opts)
    end,
  },

  -- 2. Projekt-Management & Build-Automatisierung (CMake)
  {
    "Civitasv/cmake-tools.nvim",
    ft = { "c", "cpp", "objc", "objcpp" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      cmake_build_directory = "build/${variant:buildType}",
      -- WICHTIG: Erstellt automatisch die Index-Datei für dein clangd LSP
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
      cmake_runner = {
        type = "terminal",
      },
      cmake_notifications = {
        runner = { enabled = true, compile_on_run = true },
      },
    },
  },
}

```

## plugins/java.lua

https://github.com/nvim-java/nvim-java -> top, bringrt alles mit, für Java!

```bash
mkdir -p ~/.config/nvim/lang-servers

curl -L \
https://raw.githubusercontent.com/google/styleguide/gh-pages/intellij-java-google-style.xml \
-o ~/.config/nvim/lang-servers/intellij-java-google-style.xml
```

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/java.lua
```

```bash
nano plugins/java.lua
```

```bash
code plugins/java.lua
```

```lua
-- plugins/java.lua

-- return {
--   {
--     "mfussenegger/nvim-jdtls",
--     ft = { "java" },
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     config = function()
--       local jdtls = require("jdtls")
--       local mason_path = vim.fn.stdpath("data") .. "/mason"
--       local jdtls_path = mason_path .. "/packages/jdtls"

--       local jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
--       local config_dir = jdtls_path .. "/config_linux"

--       local config = {
--         cmd = {
--           "java",
--           "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--           "-Dosgi.bundles.defaultStartLevel=4",
--           "-Declipse.product=org.eclipse.jdt.ls.core.product",
--           "-Dlog.protocol=true",
--           "-Dlog.level=ALL",
--           "-Xms1g",
--           "--add-modules=ALL-SYSTEM",
--           "--add-opens", "java.base/java.util=ALL-UNNAMED",
--           "--add-opens", "java.base/java.lang=ALL-UNNAMED",
--           "-jar", jar,
--           "-configuration", config_dir,
--           "-data", vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
--         },
--         root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
--       }

--       jdtls.start_or_attach(config)
--     end,
--   },
-- }

-- Wenn jar leer ist, startet LSP nicht!
-- root_dir kann nil sein
-- jdtls braucht Java 17+ (je nach Version).

-- return {
--   {
--     "mfussenegger/nvim-jdtls",
--     ft = { "java" },
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     config = function()
--       local jdtls = require("jdtls")
--       local mason_path = vim.fn.stdpath("data") .. "/mason"
--       local jdtls_path = mason_path .. "/packages/jdtls"

--       local jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
--       if jar == "" then
--         vim.notify("jdtls jar not found. Install jdtls via Mason.", vim.log.levels.ERROR)
--         return
--       end

--       -- config dir abhängig vom OS
--       local os_config
--       if vim.fn.has("macunix") == 1 then
--         os_config = "config_mac"
--       elseif vim.fn.has("win32") == 1 then
--         os_config = "config_win"
--       else
--         os_config = "config_linux"
--       end

--       local config_dir = jdtls_path .. "/" .. os_config

--       -- root_dir berechnen
--       local root_dir = require("jdtls.setup").find_root({
--         ".git", "mvnw", "gradlew", "pom.xml", "build.gradle"
--       })

--       if not root_dir then
--         root_dir = vim.fn.getcwd()
--       end

--       -- Workspace eindeutig (hash des Pfades)
--       local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.sha256(root_dir)

--       local config = {
--         cmd = {
--           "java",
--           "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--           "-Dosgi.bundles.defaultStartLevel=4",
--           "-Declipse.product=org.eclipse.jdt.ls.core.product",
--           "-Dlog.protocol=true",
--           "-Dlog.level=ALL",
--           "-Xms1g",
--           "--add-modules=ALL-SYSTEM",
--           "--add-opens", "java.base/java.util=ALL-UNNAMED",
--           "--add-opens", "java.base/java.lang=ALL-UNNAMED",
--           "-jar", jar,
--           "-configuration", config_dir,
--           "-data", workspace_dir,
--         },
--         root_dir = root_dir,
--         settings = {
--           java = {
--             eclipse = { downloadSources = true },
--             maven = { downloadSources = true },
--             format = { enabled = true },
--             referencesCodeLens = { enabled = true },
--             implementationsCodeLens = { enabled = true },
--           },
--         },
--       }

--       jdtls.start_or_attach(config)
--     end,
--   },
-- }

-- return {
--   {
--     "L3MON4D3/LuaSnip",
--     opts = function(_, opts)
--       local ls = require("luasnip")
--       local s = ls.snippet
--       local t = ls.text_node
--       local i = ls.insert_node
--       local f = ls.function_node

--       ls.add_snippets("java", {

--         s("mainclass", {
--           t("public class "),
--           f(function()
--             return vim.fn.expand("%:t:r")
--           end),
--           t({ " {", "", "    public static void main(String[] args) {", "        " }),
--           i(0),
--           t({ "", "    }", "}", "" }),
--         }),

--         s("mc", {
--           t("public class "),
--           f(function()
--             return vim.fn.expand("%:t:r")
--           end),
--           t({ " {", "", "    public static void main(String[] args) {", "        " }),
--           i(0),
--           t({ "", "    }", "}", "" }),
--         }),

--         s("mch", {
--           t("public class "),
--           f(function()
--             return vim.fn.expand("%:t:r")
--           end),
--           t({
--             " {",
--             "",
--             "    public static void main(String[] args) {",
--             '        System.out.println("Hello World!");',
--             "        ",
--           }),
--           i(0),
--           t({ "", "    }", "}", "" }),
--         }),

--         s("pri", {
--           t("System.out.print("),
--           i(0),
--           t(");"),
--         }),

--         s("priln", {
--           t("System.out.println("),
--           i(0),
--           t(");"),
--         }),
--       })

--       return opts
--     end,
--   },
--   {
--     "mfussenegger/nvim-jdtls",
--     ft = { "java" },
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     config = function()
--       local jdtls = require("jdtls")

--       -- Pfad zu Mason
--       local mason_path = vim.fn.stdpath("data") .. "/mason"
--       local jdtls_path = mason_path .. "/packages/jdtls"

--       local jar_files = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar", true, true)
--       local jar = jar_files[1]
--       if not jar or jar == "" then
--         vim.notify("JDTLS jar nicht gefunden. Bitte über Mason installieren.", vim.log.levels.ERROR)
--         return
--       end

--       local os_config
--       if vim.fn.has("macunix") == 1 then
--         os_config = "config_mac"
--       elseif vim.fn.has("win32") == 1 then
--         os_config = "config_win"
--       else
--         os_config = "config_linux"
--       end

--       local config_dir = jdtls_path .. "/" .. os_config

--       local root_dir = require("jdtls.setup").find_root({
--         ".git", "mvnw", "gradlew", "pom.xml", "build.gradle"
--       }) or vim.fn.getcwd()

--       local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.sha256(root_dir)

--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
--       if cmp_ok then
--         capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
--       end

--       local on_attach = function(client, bufnr)
--         local bufopts = { noremap = true, silent = true, buffer = bufnr }
--         vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
--         -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
--         vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
--         -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts) --  -- Diese Tastenkombination ist bereits in plugins/keymaps
--       end

--       -- JDTLS Config
--       local config = {
--         cmd = {
--           "java",
--           "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--           "-Dosgi.bundles.defaultStartLevel=4",
--           "-Declipse.product=org.eclipse.jdt.ls.core.product",
--           "-Dlog.protocol=true",
--           "-Dlog.level=ALL",
--           "-Xms1g",
--           "--add-modules=ALL-SYSTEM",
--           "--add-opens", "java.base/java.util=ALL-UNNAMED",
--           "--add-opens", "java.base/java.lang=ALL-UNNAMED",
--           "-jar", jar,
--           "-configuration", config_dir,
--           "-data", workspace_dir,
--         },
--         root_dir = root_dir,
--         capabilities = capabilities,
--         on_attach = on_attach,
--         settings = {
--           java = {
--             eclipse = { downloadSources = true },
--             maven = { downloadSources = true },
--             format = { enabled = true },
--             referencesCodeLens = { enabled = true },
--             implementationsCodeLens = { enabled = true },
--           },
--         },
--       }

--       jdtls.start_or_attach(config)
      
--       jdtls.setup_dap({ hotcodereplace = "auto" })
--       jdtls.setup.add_commands()

--       require("jdtls.dap").setup_dap_main_class_configs()
--     end,
--   },
-- }

-- return {
--   {
--     "mfussenegger/nvim-jdtls",
--     ft = { "java" },
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     config = function()
--       local augroup = vim.api.nvim_create_augroup("JdtlsAutostart", { clear = true })

--       vim.api.nvim_create_autocmd("FileType", {
--         group = augroup,
--         pattern = "java",
--         callback = function()
--           local jdtls = require("jdtls")

--           local mason_path = vim.fn.stdpath("data") .. "/mason"
--           local jdtls_path = mason_path .. "/packages/jdtls"

--           local jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
--           if jar == "" then
--             vim.notify("JDTLS nicht über Mason installiert", vim.log.levels.ERROR)
--             return
--           end

--           local os_config = vim.fn.has("macunix") == 1 and "config_mac"
--             or vim.fn.has("win32") == 1 and "config_win"
--             or "config_linux"

--           local root_dir = require("jdtls.setup").find_root({
--             "build.gradle", "settings.gradle",
--             "pom.xml", "mvnw", "gradlew", ".git",
--           }) or vim.fn.getcwd()

--           local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.sha256(root_dir)

--           local capabilities = vim.lsp.protocol.make_client_capabilities()
--           local ok, cmp = pcall(require, "cmp_nvim_lsp")
--           if ok then
--             capabilities = cmp.default_capabilities(capabilities)
--           end

--           local config = {
--             cmd = {
--               "java",
--               "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--               "-Dosgi.bundles.defaultStartLevel=4",
--               "-Declipse.product=org.eclipse.jdt.ls.core.product",
--               "-Xms1g",
--               "--add-modules=ALL-SYSTEM",
--               "--add-opens", "java.base/java.util=ALL-UNNAMED",
--               "--add-opens", "java.base/java.lang=ALL-UNNAMED",
--               "-jar", jar,
--               "-configuration", jdtls_path .. "/" .. os_config,
--               "-data", workspace_dir,
--             },
--             root_dir = root_dir,
--             capabilities = capabilities,
--             settings = {
--               java = {
--                 eclipse = { downloadSources = true },
--                 maven = { downloadSources = true },
--                 format = { enabled = true },
--               },
--             },
--           }

--           jdtls.start_or_attach(config)
--           jdtls.setup_dap({ hotcodereplace = "auto" })
--           require("jdtls.dap").setup_dap_main_class_configs()
--         end,
--       })
--     end,
--   },
-- }

local function find_style_xml()
  local cwd = vim.fn.getcwd()

  -- mögliche Kandidaten im Projekt
  local candidates = {
    cwd .. "/config/checkstyle/checkstyle.xml",
    cwd .. "/checkstyle.xml",
    cwd .. "/google_checks.xml",
  }

  for _, file in ipairs(candidates) do
    if vim.fn.filereadable(file) == 1 then
      return file
    end
  end

  -- Fallback auf deine globale Datei
  return vim.fn.stdpath("config") .. "/lang-servers/intellij-java-google-style.xml"
end

return {
  -- {
  --   "L3MON4D3/LuaSnip",
  --   version = "v2.*",
  --   build = "make install_jsregexp", -- optional für LSP transformations
  --   event = "InsertEnter",           -- lazy load
  --   config = function()
  --     local ls = require("luasnip")
  --     local s, t, i, f = ls.snippet, ls.text_node, ls.insert_node, ls.function_node

  --     -- Keymaps (optional, aber empfohlen)
  --     vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
  --     vim.keymap.set({"i","s"}, "<C-L>", function() ls.jump(1) end, {silent = true})
  --     vim.keymap.set({"i","s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
  --     vim.keymap.set({"i","s"}, "<C-E>", function()
  --       if ls.choice_active() then ls.change_choice(1) end
  --     end, {silent = true})

  --     -- Autocmd: snippets erst beim richtigen FileType registrieren
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = "java",
  --       callback = function()
  --         ls.add_snippets("java", {
  --           -- public class + main
  --           s("main", {
  --             t("public class "), f(function() return vim.fn.expand("%:t:r") end), t({" {", "", "    public static void main(String[] args) {", "        "}), i(1), t({"", "    }", "}", ""})
  --           }),
  --           -- Hello World
  --           s("mainh", {
  --             t("public class "), f(function() return vim.fn.expand("%:t:r") end), t({" {", "", "    public static void main(String[] args) {", '        System.out.println("Hello World!");', "    }", "}", ""})
  --           }),
  --           -- print
  --           s("pri", {t("System.out.print("), i(1), t(");")}),
  --           -- println
  --           s("priln", {t("System.out.println("), i(1), t(");")}),
  --         })
  --       end
  --     })
  --   end,
  -- },

  {
    -- "mfussenegger/nvim-jdtls",
    -- ft = { "java" },
    -- dependencies = {
    --   "mason-org/mason.nvim",
    --   "mason-org/mason-lspconfig.nvim",
    -- },
    -- config = function()
    --   local jdtls = require("jdtls")

    --   local mason_path = vim.fn.stdpath("data") .. "/mason"
    --   local jdtls_path = mason_path .. "/packages/jdtls"
    --   local jar_files = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar", true, true)
    --   local jar = jar_files[1]
    --   if not jar or jar == "" then
    --     vim.notify("JDTLS jar nicht gefunden. Bitte über Mason installieren.", vim.log.levels.ERROR)
    --     return
    --   end

    --   local os_config
    --   if vim.fn.has("macunix") == 1 then
    --     os_config = "config_mac"
    --   elseif vim.fn.has("win32") == 1 then
    --     os_config = "config_win"
    --   else
    --     os_config = "config_linux"
    --   end

    --   local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }) or vim.fn.getcwd()
    --   local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.sha256(root_dir)

    --   local capabilities = vim.lsp.protocol.make_client_capabilities()
    --   local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    --   if cmp_ok then
    --     capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    --   end

    --   local on_attach = function(client, bufnr)
    --     local bufopts = { noremap = true, silent = true, buffer = bufnr }
    --     vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    --     -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
    --     vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    --     -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
    --   end

    --   jdtls.start_or_attach({
    --     cmd = {
    --       "java",
    --       "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    --       "-Dosgi.bundles.defaultStartLevel=4",
    --       "-Declipse.product=org.eclipse.jdt.ls.core.product",
    --       "-Dlog.protocol=true",
    --       "-Dlog.level=ALL",
    --       "-Xms1g",
    --       "--add-modules=ALL-SYSTEM",
    --       "--add-opens", "java.base/java.util=ALL-UNNAMED",
    --       "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    --       "-jar", jar,
    --       "-configuration", jdtls_path .. "/" .. os_config,
    --       "-data", workspace_dir,
    --     },
    --     root_dir = root_dir,
    --     capabilities = capabilities,
    --     on_attach = on_attach,
    --     settings = {
    --       java = {
    --         eclipse = { downloadSources = true },
    --         maven = { downloadSources = true },
    --         format = { enabled = true },
    --         referencesCodeLens = { enabled = true },
    --         implementationsCodeLens = { enabled = true },
    --       },
    --     },
    --   })
    -- end,

    -- "nvim-java/nvim-java",
    -- ft = { "java" },
    -- dependencies = {
    --   "neovim/nvim-lspconfig",
    --   "mfussenegger/nvim-dap",
    --   "mason-org/mason.nvim",
    -- },
    -- config = function()
    --   require("java").setup()
    --   vim.lsp.enable("jdtls")
    -- end,
    
    "nvim-java/nvim-java",
    ft = { "java" },
    dependencies = {
      "neovim/nvim-lspconfig",
      -- Funktionirt nicht mehr alles in config = function() jetzt!!!
      -- opts = {
      --   servers = {
      --     jdtls = {
      --       settings = {
      --         java = {
      --           eclipse = {
      --             downloadSources = true,
      --           },

      --           configuration = {
      --             updateBuildConfiguration = "interactive",
      --             runtimes = {
      --               -- { name = "JavaSE-1.6", path = "/usr/lib/jvm/java-6-openjdk/" },
      --               -- { name = "JavaSE-1.7", path = "/usr/lib/jvm/java-7-openjdk/" },
      --               -- { name = "JavaSE-1.8", path = "/usr/lib/jvm/java-8-openjdk/" },
      --               -- { name = "JavaSE-9",   path = "/usr/lib/jvm/java-9-openjdk/" },
      --               -- { name = "JavaSE-10",  path = "/usr/lib/jvm/java-10-openjdk/" },
      --               -- { name = "JavaSE-11",  path = "/usr/lib/jvm/java-11-openjdk/" }, -- LTS
      --               -- { name = "JavaSE-12",  path = "/usr/lib/jvm/java-12-openjdk/" },
      --               -- { name = "JavaSE-13",  path = "/usr/lib/jvm/java-13-openjdk/" },
      --               -- { name = "JavaSE-14",  path = "/usr/lib/jvm/java-14-openjdk/" },
      --               -- { name = "JavaSE-15",  path = "/usr/lib/jvm/java-15-openjdk/" },
      --               -- { name = "JavaSE-16",  path = "/usr/lib/jvm/java-16-openjdk/" },
      --               -- { name = "JavaSE-17",  path = "/usr/lib/jvm/java-17-openjdk/" }, -- LTS
      --               -- { name = "JavaSE-18",  path = "/usr/lib/jvm/java-18-openjdk/" },
      --               -- { name = "JavaSE-19",  path = "/usr/lib/jvm/java-19-openjdk/" },
      --               -- { name = "JavaSE-20",  path = "/usr/lib/jvm/java-20-openjdk/" },
      --               { name = "JavaSE-21",  path = "/usr/lib/jvm/java-21-openjdk/" }, -- LTS
      --               -- { name = "JavaSE-22",  path = "/usr/lib/jvm/java-22-openjdk/" },
      --               -- { name = "JavaSE-23",  path = "/usr/lib/jvm/java-23-openjdk/" },
      --               -- { name = "JavaSE-24",  path = "/usr/lib/jvm/java-24-openjdk/" },
      --               -- { name = "JavaSE-25",  path = "/usr/lib/jvm/java-25-openjdk/" },
      --             },
      --           },

      --           maven = {
      --             downloadSources = true,
      --             updateSnapshots = true,
      --           },

      --           implementationsCodeLens = {
      --             enabled = true,
      --           },

      --           referencesCodeLens = {
      --             enabled = true,
      --           },

      --           references = {
      --             includeDecompiledSources = true,
      --           },

      --           -- Du nutzt GoogleStyle + eigenes XML.
      --           -- Das ist gut — aber nur, wenn IntelliJ exakt dasselbe XML nutzt.
      --           -- In IntelliJ IDEA solltest du:
      --           -- Settings → Editor → Code Style → Java → Import Scheme → Import from XML
      --           -- Dasselbe File verwenden wie:
      --           -- ~/.config/nvim/lang-servers/intellij-java-google-style.xml

      --           -- Profi-Level:
      --           -- Deaktiviere in IntelliJ:
      --           -- Optimize imports on the fly
      --           -- Reformat on save
      --           -- Wenn du es in NeoVim schon machst.
      --           -- Sonst bekommst du unnötige Diff-Noise im Team.
      --           format = {
      --             enabled = true,
      --             -- Bei Rroblemen
      --             -- enabled = false,
      --             settings = {
      --               profile = "GoogleStyle",
      --               -- ~/.config/nvim/lang-servers/intellij-java-google-style.xml
      --               url = vim.fn.stdpath("config")
      --                 .. "/lang-servers/intellij-java-google-style.xml",
      --               -- ~/my-xm-slyte/Default.xml
      --               -- url = vim.fn.expand("~/my-xm-slyte/Default.xml"),
      --             },
      --           },

      --           signatureHelp = { enabled = true },

      --           completion = {
      --             favoriteStaticMembers = {
      --               "org.hamcrest.MatcherAssert.assertThat",
      --               "org.hamcrest.Matchers.*",
      --               "org.junit.jupiter.api.Assertions.*",
      --               "org.mockito.Mockito.*",
      --               "java.util.Objects.requireNonNull",
      --               "java.util.Objects.requireNonNullElse",
      --             },

      --             -- importOrder = {
      --             --   "java",
      --             --   "javax",
      --             --   "com",
      --             --   "org",
      --             -- },

      --             importOrder = {
      --               "java",
      --               "javax",
      --               "jakarta",
      --               "org",
      --               "com",
      --             },
                  
      --             -- Extended Completion Settings
      --             guessMethodArguments = true,
      --             -- filteredTypes = {
      --             --   "com.sun.*",
      --             --   "sun.*",
      --             -- },
      --           },

      --           sources = {
      --             organizeImports = {
      --               starThreshold = 9999,
      --               staticStarThreshold = 9999,
      --             },
      --           },

      --           codeGeneration = {
      --             -- useBlocks = true,
      --             -- toString = {
      --             --   template =
      --             --   "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      --             -- },

      --             useBlocks = true,
      --             generateComments = true,
      --             hashCodeEquals = {
      --               useJava7Objects = true,
      --             },
      --             toString = {
      --               template =
      --                 "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      --             },
      --           },

      --           inlayHints = {
      --             parameterNames = { enabled = "all" },
      --           },

      --           -- Gradle explizit konfigurieren (wichtig!)
      --           -- gradle = {
      --           --   enabled = true,
      --           --   -- offlineMode = false,
      --           -- },

      --           gradle = {
      --             enabled = true,
      --             wrapper = {
      --               enabled = true,
      --             },
      --           },

      --           -- Autobuild / Autobuild Watcher
      --           -- Mit: Spring Boot, Gradle Wrapper, Hot Reload Debug Adapter kann das schnell CPU fressen.
      --           autobuild = {
      --             enabled = false,
      --           },

      --           -- Null Analysis Mode (Performance) -> Nur aktivieren wenn wirklich nötig!!!
      --           -- project = {
      --           --   referencedLibraries = {
      --           --     "lib/**/*.jar",
      --           --   },
      --           -- },

      --           -- Import Completion Advanced
      --           import = {
      --             maven = {
      --               enabled = true,
      --             },
      --             gradle = {
      --               enabled = true,
      --             },
      --           },

      --           -- Decompiler Support
      --           -- contentProvider = { preferred = "fernflower" }, -- Der "alte" Standard (wird auch von IntelliJ genutzt).
      --           -- contentProvider = { preferred = "quiltflower" }, -- Besser für modernes Java (21+)
      --           contentProvider = { preferred = "cfr" }, -- Der aktuell stärkste Decompiler für moderne Java-Features.
      --           -- contentProvider = { preferred = "procyon" }, -- Ein sehr präziser Decompiler, der besonders gut mit Lambdas und synthetischen Methoden umgehen kann.

      --           -- Semantic Highlighting (optisch besser)
      --           semanticHighlighting = {
      --             enabled = true,
      --           },

      --           -- Folding / Symbols Advanced: Unser NeoVim nutzt Tree-sitter Folding → dann unnötig.
      --           -- foldingRange = {
      --           --   enabled = true,
      --           -- },

      --           -- Save Actions (extrem praktisch)
      --           -- Achtung: organizeImports beim Speichern kann in Teamprojekten unnötige Änderungen und Merge-Konflikte erzeugen
      --           saveActions = {
      --             organizeImports = true,
      --           },
      --         },
      --       },

      --       -- flags = {
      --       --   allow_incremental_sync = true,
      --       -- },

      --       init_options = {
      --         extendedClientCapabilities = {
      --           resolveAdditionalTextEditsSupport = true,
      --         },
      --       },

      --       -- Wird von nvim-java/nvim-java Zum Teil übernommen
      --       -- init_options = {
      --       --   bundles = {},
      --       -- },
      --     },
      --   },

      --   setup = {
      --     jdtls = function()
      --       require("java").setup({
      --         jdk = {
      --           auto_install = false,
      --         },

      --         -- Achte darauf, dass java_test.enable nicht doppelt Konfigurationen ausführt, sonst gibt es Konflikte beim Debuggen
      --         java_test = {
      --           enable = true,
      --           -- Damit sind Assertions aktiv (wichtig für Unit Tests mit JUnit).
      --           config = {
      --             vmArgs = "-ea",
      --           },
      --         },

      --         java_debug_adapter = {
      --           enable = true,
      --           hotcodereplace = "auto", -- Damit bekommst du echtes IntelliJ-ähnliches Hot Reload Verhalten.
      --         },

      --         -- Spring DevTools NICHT parallel aktivieren, sonst doppelte Reload-Events.
      --         spring_boot_tools = {
      --           enable = true,
      --           version = "latest",
      --         },


      --         -- Stelle sicher, dass du in IntelliJ:
      --         -- Settings → Plugins → Lombok Plugin installiert
      --         -- Annotation Processing aktiviert
      --         -- Sonst hast du unterschiedliche Fehlermeldungen in IDE vs NeoVim.
      --         lombok = {
      --           enable = true,
      --         },

      --         notifications = {
      --           dap = true,
      --         },

      --         -- Bei großen Gradle/Spring Projekten killt sonst Autobuild deine CPU.
      --         flags = {
      --           allow_incremental_sync = true,
      --           debounce_text_changes = 150,
      --         },

      --         -- Bei großen Gradle/Spring Projekten killt sonst Autobuild deine CPU.
      --         settings = {
      --           java = {
      --             maxConcurrentBuilds = 1,
      --           }
      --         },

      --         -- on_attach = function(_, bufnr)
      --         --   local map = function(mode, lhs, rhs)
      --         --     vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
      --         --   end

      --         --   -- map("n", "<leader>ca", vim.lsp.buf.code_action) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
      --         --   -- map("v", "<leader>ca", vim.lsp.buf.code_action) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.

      --         --   map("n", "<leader>oi", function()
      --         --     vim.lsp.buf.code_action({
      --         --       context = { only = { "source.organizeImports" } },
      --         --       apply = true,
      --         --     })
      --         --   end)
      --         -- end,
      --         on_attach = function(_, bufnr)
      --           local function map(mode, lhs, rhs, desc)
      --             vim.keymap.set(mode, lhs, rhs, {
      --               buffer = bufnr,
      --               silent = true,
      --               noremap = true,
      --               desc = desc,
      --             })
      --           end

      --           -- Organize Imports (robust)
      --           map("n", "<leader>oi", function()
      --             local params = vim.lsp.util.make_range_params()
      --             params.context = { only = { "source.organizeImports" } }

      --             local result = vim.lsp.buf_request_sync(
      --               bufnr,
      --               "textDocument/codeAction",
      --               params,
      --               3000
      --             )

      --             if not result then
      --               vim.notify("No organize imports action found", vim.log.levels.WARN)
      --               return
      --             end

      --             for _, res in pairs(result) do
      --               for _, action in pairs(res.result or {}) do
      --                 if action.edit or type(action.command) == "table" then
      --                   if action.edit then
      --                     vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
      --                   end
      --                   if action.command then
      --                     vim.lsp.buf.execute_command(action.command)
      --                   end
      --                   return
      --                 end
      --               end
      --             end

      --             vim.notify("Organize imports not available", vim.log.levels.INFO)
      --           end, "Java Organize Imports")

      --           -- Extract Interface
      --           map("n", "<leader>jei", function()
      --             local uri = vim.uri_from_bufnr(bufnr)

      --             -- Neue Command-ID probieren
      --             local ok = pcall(function()
      --               vim.lsp.buf.execute_command({
      --                 command = "java.edit.extractInterface",
      --                 arguments = { uri },
      --               })
      --             end)

      --             -- Fallback für ältere jdtls Versionen
      --             if not ok then
      --               vim.lsp.buf.execute_command({
      --                 command = "jdtls.extractInterface",
      --                 arguments = { uri },
      --               })
      --             end
      --           end, "Java Extract Interface")

      --           -- Optional: Extract Interface (Visual Range)
      --           map("v", "<leader>jei", function()
      --             vim.lsp.buf.range_code_action({
      --               context = { only = { "refactor.extract.interface" } },
      --             })
      --           end, "Java Extract Interface (Range)")
      --         end,
      --       })
      --     end,
      --   },
      -- },

      "mfussenegger/nvim-dap",
      "mason-org/mason.nvim",
      -- Nur nötig, wenn du die Test-UI direkt in NeoVim haben willst.
      -- "nvim-neotest/neotest",
      -- Ich würde aber eine plugins/neotest.lua schreiben:
      -- return {
      --   -- Nur nötig, wenn du die Test-UI direkt in NeoVim haben willst
      --   {
      --     "nvim-neotest/neotest",
      --     enabled = false, -- auf true setzen, wenn du Tests in NeoVim nutzen willst
      --     dependencies = {
      --       "rcasia/neotest-java",
      --       "nvim-lua/plenary.nvim",
      --     },
      --     config = function()
      --       require("neotest").setup({
      --         adapters = {
      --           require("neotest-java")({}),
      --         },
      --       })
      --     end,
      --   },
      -- }
      -- "rcasia/neotest-java",
      -- "nvim-lua/plenary.nvim", -- notwendig für neotest
    },
    config = function()
      -- require("java").setup() -- Doppeltes require("java").setup() vermeiden Sonst: Debug/Test Bugs, Code-Actions verschwinden manchmal, doppelte LSP-Attachs, wird aber dennoch benötigt!
      -- Setup nvim-java

      -- wir haben noice.lua und brauchen daher keine eigenen Handler mehr für jdtls Notifications
      local handlers = {
        -- ["language/status"] = function(_, _) end,
        ["$/progress"] = function(_, _) end,
      }

      require("java").setup(
        -- {
          -- jdk = {
          --   auto_install = false,
          -- },

          -- Achte darauf, dass java_test.enable nicht doppelt Konfigurationen ausführt, sonst gibt es Konflikte beim Debuggen
          -- java_test = {
          --   enable = true,
          --   -- Damit sind Assertions aktiv (wichtig für Unit Tests mit JUnit).
          --   config = {
          --     vmArgs = "-ea",
          --   },
          -- },

          -- java_debug_adapter = {
          --   enable = true,
          --   hotcodereplace = "auto", -- Damit bekommst du echtes IntelliJ-ähnliches Hot Reload Verhalten.
          -- },

          -- Spring DevTools NICHT parallel aktivieren, sonst doppelte Reload-Events.
          -- spring_boot_tools = {
          --   enable = true,
          --   version = "latest",
          -- },

          -- Stelle sicher, dass du in IntelliJ:
          -- Settings → Plugins → Lombok Plugin installiert
          -- Annotation Processing aktiviert
          -- Sonst hast du unterschiedliche Fehlermeldungen in IDE vs NeoVim.
          -- lombok = {
          --   enable = true,
          -- },

          -- notifications = {
          --   dap = true,
          -- },

          -- Bei großen Gradle/Spring Projekten killt sonst Autobuild deine CPU.
          -- flags = {
          --   allow_incremental_sync = true,
          --   debounce_text_changes = 150,
          -- },

          -- Bei großen Gradle/Spring Projekten killt sonst Autobuild deine CPU.
          -- settings = {
          --   java = {
          --     maxConcurrentBuilds = 1,
          --   }
          -- },

          -- on_attach = function(_, bufnr)
          --   local map = function(mode, lhs, rhs)
          --     vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
          --   end

          --   -- map("n", "<leader>ca", vim.lsp.buf.code_action) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
          --   -- map("v", "<leader>ca", vim.lsp.buf.code_action) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.

          --   map("n", "<leader>oi", function()
          --     vim.lsp.buf.code_action({
          --       context = { only = { "source.organizeImports" } },
          --       apply = true,
          --     })
          --   end)
          -- end,

          -- on_attach = function(_, bufnr)
          --   local function map(mode, lhs, rhs, desc)
          --     vim.keymap.set(mode, lhs, rhs, {
          --       buffer = bufnr,
          --       silent = true,
          --       noremap = true,
          --       desc = desc,
          --     })
          --   end

          --   -- Organize Imports (robust)
          --   map("n", "<leader>oi", function()
          --     local params = vim.lsp.util.make_range_params()
          --     params.context = { only = { "source.organizeImports" } }

          --     local result = vim.lsp.buf_request_sync(
          --       bufnr,
          --       "textDocument/codeAction",
          --       params,
          --       3000
          --     )

          --     if not result then
          --       vim.notify("No organize imports action found", vim.log.levels.WARN)
          --       return
          --     end

          --     for _, res in pairs(result) do
          --       for _, action in pairs(res.result or {}) do
          --         if action.edit or type(action.command) == "table" then
          --           if action.edit then
          --             vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
          --           end
          --           if action.command then
          --             vim.lsp.buf.execute_command(action.command)
          --           end
          --           return
          --         end
          --       end
          --     end

          --     vim.notify("Organize imports not available", vim.log.levels.INFO)
          --   end, "Java Organize Imports")

          --   -- Extract Interface
          --   map("n", "<leader>jei", function()
          --     local uri = vim.uri_from_bufnr(bufnr)

          --     -- Neue Command-ID probieren
          --     local ok = pcall(function()
          --       vim.lsp.buf.execute_command({
          --         command = "java.edit.extractInterface",
          --         arguments = { uri },
          --       })
          --     end)

          --     -- Fallback für ältere jdtls Versionen
          --     if not ok then
          --       vim.lsp.buf.execute_command({
          --         command = "jdtls.extractInterface",
          --         arguments = { uri },
          --       })
          --     end
          --   end, "Java Extract Interface")

          --   -- Optional: Extract Interface (Visual Range)
          --   map("v", "<leader>jei", function()
          --     vim.lsp.buf.range_code_action({
          --       context = { only = { "refactor.extract.interface" } },
          --     })
          --   end, "Java Extract Interface (Range)")
          -- end,
        -- }
      )

      -- require('java').setup({
      --   -- Startup checks
      --   checks = {
      --     nvim_version = true,        -- Check NeoVim version
      --     nvim_jdtls_conflict = true, -- Check for nvim-jdtls conflict
      --   },

      --   -- JDTLS configuration
      --   jdtls = {
      --     version = '1.43.0',
      --   },

      --   -- Extensions
      --   lombok = {
      --     enable = true,
      --     version = '1.18.40',
      --   },

      --   java_test = {
      --     enable = true,
      --     version = '0.40.1',
      --   },

      --   java_debug_adapter = {
      --     enable = true,
      --     version = '0.58.2',
      --   },

      --   spring_boot_tools = {
      --     enable = true,
      --     version = '1.55.1',
      --   },

      --   -- JDK installation
      --   jdk = {
      --     auto_install = true,
      --     version = '17',
      --   },

      --   -- Logging
      --   log = {
      --     use_console = true,
      --     use_file = true,
      --     level = 'info',
      --     log_file = vim.fn.stdpath('state') .. '/nvim-java.log',
      --     max_lines = 1000,
      --     show_location = false,
      --   },
      -- })

      vim.lsp.config('jdtls', {
        handlers = handlers,

        settings = {
          java = {
            -- eclipse = {
            --   downloadSources = true,
            -- },

            configuration = {
              runtimes = {
                -- { name = "JavaSE-1.6", path = "/usr/lib/jvm/java-6-openjdk/", default = true, },
                -- { name = "JavaSE-1.7", path = "/usr/lib/jvm/java-7-openjdk/", default = true, },
                -- { name = "JavaSE-1.8", path = "/usr/lib/jvm/java-8-openjdk/", default = true, },
                -- { name = "JavaSE-9",   path = "/usr/lib/jvm/java-9-openjdk/", default = true, },
                -- { name = "JavaSE-10",  path = "/usr/lib/jvm/java-10-openjdk/", default = true, },
                -- { name = "JavaSE-11",  path = "/usr/lib/jvm/java-11-openjdk/", default = true, }, -- LTS
                -- { name = "JavaSE-12",  path = "/usr/lib/jvm/java-12-openjdk/", default = true, },
                -- { name = "JavaSE-13",  path = "/usr/lib/jvm/java-13-openjdk/", default = true, },
                -- { name = "JavaSE-14",  path = "/usr/lib/jvm/java-14-openjdk/", default = true, },
                -- { name = "JavaSE-15",  path = "/usr/lib/jvm/java-15-openjdk/", default = true, },
                -- { name = "JavaSE-16",  path = "/usr/lib/jvm/java-16-openjdk/", default = true, },
                -- { name = "JavaSE-17",  path = "/usr/lib/jvm/java-17-openjdk/", default = true, }, -- LTS
                -- { name = "JavaSE-18",  path = "/usr/lib/jvm/java-18-openjdk/", default = true, },
                -- { name = "JavaSE-19",  path = "/usr/lib/jvm/java-19-openjdk/", default = true, },
                -- { name = "JavaSE-20",  path = "/usr/lib/jvm/java-20-openjdk/", default = true, },
                { name = "JavaSE-21",  path = "/usr/lib/jvm/java-21-openjdk/", default = true, }, -- LTS
                -- { name = "JavaSE-22",  path = "/usr/lib/jvm/java-22-openjdk/", default = true, },
                -- { name = "JavaSE-23",  path = "/usr/lib/jvm/java-23-openjdk/", default = true, },
                -- { name = "JavaSE-24",  path = "/usr/lib/jvm/java-24-openjdk/", default = true, },
                -- { name = "JavaSE-25",  path = "/usr/lib/jvm/java-25-openjdk/", default = true, },
              },
            },

            -- maven = {
            --   downloadSources = true,
            --   updateSnapshots = true,
            -- },

            -- implementationsCodeLens = {
            --   enabled = true,
            -- },

            -- referencesCodeLens = {
            --   enabled = true,
            -- },

            -- references = {
            --   includeDecompiledSources = true,
            -- },

            -- XML Formatter (Google Style)
            -- Du nutzt GoogleStyle + eigenes XML.
            -- Das ist gut — aber nur, wenn IntelliJ exakt dasselbe XML nutzt.
            -- In IntelliJ IDEA solltest du:
            -- Settings → Editor → Code Style → Java → Import Scheme → Import from XML
            -- Dasselbe File verwenden wie:
            -- ~/.config/nvim/lang-servers/intellij-java-google-style.xml

            -- Profi-Level:
            -- Deaktiviere in IntelliJ:
            -- Optimize imports on the fly
            -- Reformat on save
            -- Wenn du es in NeoVim schon machst.
            -- Sonst bekommst du unnötige Diff-Noise im Team.
            -- format = {
            --   enabled = true,
            --   -- Bei Rroblemen
            --   -- enabled = false,
            --   settings = {
            --     profile = "GoogleStyle",
            --     -- ~/.config/nvim/lang-servers/intellij-java-google-style.xml
            --     url = vim.fn.stdpath("config")
            --       .. "/lang-servers/intellij-java-google-style.xml",

            --     -- Alternative: ~/my-xm-slyte/Default.xml
            --     -- url = vim.fn.expand("~/my-xm-slyte/Default.xml"),
            --   }
            -- },

            format = {
              enabled = true,
              settings = {
                profile = "GoogleStyle",
                url = find_style_xml(),
              }
            },

            -- signatureHelp = { enabled = true },

            -- completion = {
            --   favoriteStaticMembers = {
            --     "org.hamcrest.MatcherAssert.assertThat",
            --     "org.hamcrest.Matchers.*",
            --     "org.junit.jupiter.api.Assertions.*",
            --     "org.mockito.Mockito.*",
            --     "java.util.Objects.requireNonNull",
            --     "java.util.Objects.requireNonNullElse",
            --   },

            --   -- importOrder = {
            --   --   "java",
            --   --   "javax",
            --   --   "com",
            --   --   "org",
            --   -- },

            --   importOrder = {
            --     "java",
            --     "javax",
            --     "jakarta",
            --     "org",
            --     "com",
            --   },
              
            --   -- Extended Completion Settings
            --   guessMethodArguments = true,
            --   -- filteredTypes = {
            --   --   "com.sun.*",
            --   --   "sun.*",
            --   -- },
            -- },

            -- sources = {
            --   organizeImports = {
            --     starThreshold = 9999,
            --     staticStarThreshold = 9999,
            --   },
            -- },

            -- codeGeneration = {
            --   -- useBlocks = true,
            --   -- toString = {
            --   --   template =
            --   --   "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            --   -- },

            --   useBlocks = true,
            --   generateComments = true,
            --   hashCodeEquals = {
            --     useJava7Objects = true,
            --   },
            --   toString = {
            --     template =
            --       "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            --   },
            -- },

            -- inlayHints = {
            --   parameterNames = { enabled = "all" },
            -- },

            -- Gradle explizit konfigurieren (wichtig!)
            -- gradle = {
            --   enabled = true,
            --   -- offlineMode = false,
            -- },

            -- gradle = {
            --   enabled = true,
            --   wrapper = {
            --     enabled = true,
            --   },
            -- },

            -- Autobuild / Autobuild Watcher
            -- Mit: Spring Boot, Gradle Wrapper, Hot Reload Debug Adapter kann das schnell CPU fressen.
            -- autobuild = {
            --   enabled = false,
            -- },

            -- Null Analysis Mode (Performance) -> Nur aktivieren wenn wirklich nötig!!!
            -- project = {
            --   referencedLibraries = {
            --     "lib/**/*.jar",
            --   },
            -- },

            -- Import Completion Advanced
            -- import = {
            --   maven = {
            --     enabled = true,
            --   },
            --   gradle = {
            --     enabled = true,
            --   },
            -- },

            -- Decompiler Support
            -- contentProvider = { preferred = "fernflower" }, -- Der "alte" Standard (wird auch von IntelliJ genutzt).
            -- contentProvider = { preferred = "quiltflower" }, -- Besser für modernes Java (21+)
            contentProvider = { preferred = "cfr" }, -- Der aktuell stärkste Decompiler für moderne Java-Features.
            -- contentProvider = { preferred = "procyon" }, -- Ein sehr präziser Decompiler, der besonders gut mit Lambdas und synthetischen Methoden umgehen kann.

            -- Semantic Highlighting (optisch besser)
            -- semanticHighlighting = {
            --   enabled = true,
            -- },

            -- Folding / Symbols Advanced: Unser NeoVim nutzt Tree-sitter Folding → dann unnötig.
            -- foldingRange = {
            --   enabled = true,
            -- },

            -- Save Actions (extrem praktisch)
            -- Achtung: organizeImports beim Speichern kann in Teamprojekten unnötige Änderungen und Merge-Konflikte erzeugen
            -- saveActions = {
            --   organizeImports = true,
            -- },
          }
        }
      })

      vim.lsp.enable("jdtls") -- Wird von nvim-java intern genutzt
      -- require("lspconfig").jdtls.setup({}) -- Das ist die Standardmethode für LSPs über nvim-lspconfig, aber wenn du nvim-java benutzt -> bleib bei vim.lsp.enable("jdtls")

      -- Automatisches Formatieren beim Speichern -> solte ohne gut gehen!
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   pattern = "*.java",
      --   callback = function()
      --     vim.lsp.buf.format({
      --       async = false,
      --     })
      --   end,
      -- })

      -- vim.diagnostic.config({
      --   virtual_text = false,     -- Entfernt den Text hinter dem Code
      --   underline = true,        -- Fehler werden nur unterstrichen
      --   update_in_insert = false, -- Erst beim Verlassen des Insert-Modes prüfen
      --   severity_sort = true,
      -- })
    end,

    -- Bei Problemen:
    -- :MasonInstall jdtls
    -- :MasonInstall java-debug-adapter
    -- :MasonInstall java-test
    
    -- Bei Problemen mit Inlay Hints:
    -- :edit
    -- :lua vim.lsp.inlay_hint.enable(false)
    -- :lua vim.lsp.inlay_hint.enable(true)
    -- oder einfach 
    -- :lua vim.lsp.inlay_hint.enable(false)
  },
}

```

## plugins/checkstyle.lua

> Leuft nicht mehr, warum auch immer. Aber hier ist die alte Checkstyle-Integration, falls du sie wieder aktivieren möchtest.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/checkstyle.lua
```

```bash
nano plugins/checkstyle.lua
```

```bash
code plugins/checkstyle.lua
```

```lua
-- plugins/checkstyle.lua

-- return {
--   {
--     "mfussenegger/nvim-lint",
--     event = { "BufReadPre", "BufNewFile" },
--     config = function()
--       local lint = require("lint")

--       -- CHECKSTYLE CONFIG FIX
--       lint.linters.checkstyle = {
--         cmd = "checkstyle",
--         stdin = false,
--         args = function()
--           local config = vim.fs.find(
--             { "config/checkstyle/checkstyle.xml", "checkstyle.xml" },
--             {
--               upward = true,
--               path = vim.fn.expand("%:p:h"),
--               stop = vim.loop.os_homedir(),
--             }
--           )

--           return {
--             "-f", "sarif",
--             "-c", (#config > 0 and config[1] or "google_checks.xml"),
--             vim.api.nvim_buf_get_name(0),
--           }
--         end,
--         stream = "stdout",
--         ignore_exitcode = true,
--         parser = require("lint.parser").from_errorformat(
--           "%f:%l:%c: %m",
--           {
--             source = "checkstyle",
--             severity = vim.diagnostic.severity.WARN,
--           }
--         ),
--       }

--       -- FILETYPE ZUWEISUNG
--       lint.linters_by_ft = {
--         java = { "checkstyle" },
--       }

--       -- DIAGNOSTICS (INLINE!)
--       vim.diagnostic.config({
--         virtual_text = {
--           prefix = "●",
--           source = "always",
--         },
--         underline = true,
--         update_in_insert = false,
--         severity_sort = true,
--       })

--       -- AUTOCMD: beim Speichern + beim Öffnen
--       vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
--         group = vim.api.nvim_create_augroup("nvim-lint-java", { clear = true }),
--         callback = function()
--           lint.try_lint()
--         end,
--       })
--     end,
--   },
-- }

```

## plugins/python.lua

Du brauchst die Datei plugins/python.lua nicht, da die lsp/python.lua völlig ausreicht. Trotzdem ermöglicht dir diese Option, Jupyter Notebooks zu öffnen.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/python.lua
```

```bash
nano plugins/python.lua
```

```bash
code plugins/python.lua
```

```lua
-- plugins/python.lua

-- local function get_python_bin()
--   local python_bin = vim.fn.getcwd() .. "/venv/bin/python"
--   local f = io.open(python_bin, "r")
--   if f then
--     f:close()
--     return python_bin -- gibt String zurück
--   end
--   return nil -- nil signalisiert "nicht vorhanden"
-- end

-- local function get_ruff_bin()
--   local ruff_bin = vim.fn.getcwd() .. "/venv/bin/ruff"
--   local f = io.open(ruff_bin, "r")
--   if f then
--     f:close()
--     return ruff_bin
--   end
--   return nil
-- end

-- return {
--   -- Treesitter für Python
--   {
--     "nvim-treesitter/nvim-treesitter",
--     ft = "python",
--     opts = function(_, opts)
--       vim.list_extend(opts.ensure_installed, { "python" })
--     end,
--   },

--   -- LSP: pylsp
--   {
--     "neovim/nvim-lspconfig",
--     ft = "python",
--     opts = function()
--       local python_bin = get_python_bin()
--       if not python_bin then
--         return nil
--       end

--       local ruff_bin = get_ruff_bin()

--       return {
--         servers = {
--           pylsp = {
--             cmd = { python_bin, "-m", "pylsp" },
--             settings = {
--               pylsp = {
--                 plugins = {
--                   pyflakes = { enabled = true },
--                   pycodestyle = { enabled = true },
--                   flake8 = { enabled = true },
--                   black = { enabled = true },
--                   ruff = { enabled = ruff_bin ~= nil, executable = ruff_bin },
--                 },
--               },
--             },
--           },
--         },
--       }
--     end,
--   },

--   -- Formatter
--   {
--     "stevearc/conform.nvim",
--     ft = "python",
--     opts = {
--       formatters_by_ft = {
--         python = { "black" },
--       },
--     },
--   },

--   -- Ruff Linter Integration
--   {
--     "mfussenegger/nvim-lint",
--     ft = "python",
--     opts = {
--       linters_by_ft = {
--         python = {
--           function()
--             local bufname = vim.api.nvim_buf_get_name(0)
--             local ruff_bin = get_ruff_bin()
--             if bufname == "" or not ruff_bin then
--               return nil  -- nil-safe, kein Linter starten
--             end
--             return {
--               cmd = ruff_bin,
--               args = { "--stdin-filename", bufname, "-" },
--               stdin = true,
--             }
--           end,
--         },
--       },
--     },
--   },
-- }

-- local function get_python_bin()
--   local venv = vim.fn.getcwd() .. "/venv/bin/python"
--   if vim.fn.executable(venv) == 1 then
--     return venv
--   end
--   return vim.fn.exepath("python3") or "python"
-- end

-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--     ft = "python",
--     opts = function(_, opts)
--       opts.ensure_installed = opts.ensure_installed or {}
--       vim.list_extend(opts.ensure_installed, { "python" })
--     end,
--   },

--   {
--     "neovim/nvim-lspconfig",
--     ft = "python",
--     opts = function()
--       return {
--         servers = {
--           pyright = {
--             settings = {
--               python = {
--                 pythonPath = get_python_bin(),
--               },
--             },
--             -- on_attach ohne Inlay-Hints
--             on_attach = function(_, _)
--               -- nichts hier
--             end,
--           },
--         },
--       }
--     end,
--   },

--   {
--     "stevearc/conform.nvim",
--     ft = "python",
--     opts = {
--       formatters_by_ft = {
--         python = { "black" },
--       },
--     },
--   },

--   {
--     "mfussenegger/nvim-lint",
--     ft = "python",
--     opts = {
--       linters_by_ft = {
--         python = { "ruff" },
--       },
--     },
--   },
-- }

-- return {
  -- Ruff + Black (stabil via none-ls)
  -- {
  --   "nvimtools/none-ls.nvim",
  --   ft = "python",
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = opts.sources or {}

  --     vim.list_extend(opts.sources, {
  --       nls.builtins.formatting.black,
  --       nls.builtins.diagnostics.ruff,
  --     })
  --   end,
  -- },

  -- Conform für Formatter (Black + isort)
  -- {
  --     "stevearc/conform.nvim",
  --     lazy = false,  -- direkt laden
  --     config = function()
  --         require("conform").setup({
  --             formatters_by_ft = {
  --                 python = { "isort", "black" },  -- Reihenfolge: isort → black
  --             },
  --             format_on_save = {
  --                 timeout_ms = 500,
  --                 lsp_format = "fallback",
  --             },
  --         })
  --     end,
  -- },

  -- -- Null-ls für Linter (Ruff)
  -- {
  --     "jose-elias-alvarez/null-ls.nvim",
  --     ft = "python",
  --     dependencies = { "nvim-lua/plenary.nvim" },
  --     opts = function(_, opts)
  --         local nls = require("null-ls")
  --         opts.sources = opts.sources or {}
  --         vim.list_extend(opts.sources, {
  --             nls.builtins.diagnostics.ruff,  -- Ruff als Linter
  --         })
  --     end,
  -- },

  -- Image Support (Ghostty kompatibel via Kitty Protocol)
  -- {
  --   "3rd/image.nvim",
  --   ft = "python",
  --   opts = {
  --     backend = "kitty",
  --     max_width = 100,
  --     max_height = 20,
  --   },
  -- },

  -- Molten (Jupyter Core)
  -- {
  --   "benlubas/molten-nvim",
  --   version = "^1.0.0",
  --   build = ":UpdateRemotePlugins",
  --   ft = { "python", "ipynb" },
  --   init = function()
  --     -- stabile Defaults
  --     vim.g.molten_auto_open_output = false
  --     vim.g.molten_image_provider = "image.nvim"
  --     vim.g.molten_output_win_max_height = 25
  --     vim.g.molten_wrap_output = true
  --     vim.g.molten_virt_text_output = false
  --   end,

  --   config = function()

  --     -- Sichere Kernel-Initialisierung
  --     local function ensure_kernel()
  --       if not vim.b.molten_initialized then
  --         vim.cmd("MoltenInit")
  --         vim.b.molten_initialized = true
  --       end
  --     end

  --     -- Notebook-Zellen via "# %%"
  --     vim.api.nvim_create_autocmd("FileType", {
  --       -- pattern = "python",
  --       pattern = { "python", "ipynb" },
  --       callback = function()
  --         vim.bo.commentstring = "# %s"
  --       end,
  --     })

  --     -- vim.api.nvim_create_autocmd("FileType", {
  --     --   pattern = { "python", "ipynb" },
  --     --   callback = function()
  --     --     if not vim.b.molten_initialized then
  --     --       vim.cmd("MoltenInit")
  --     --       vim.b.molten_initialized = true
  --     --     end
  --     --   end,
  --     -- })

  --     -- Kernel manuell starten
  --     vim.keymap.set("n", "<leader>mi", ensure_kernel, { desc = "Init Jupyter Kernel" })

  --     -- aktuelle Zeile
  --     vim.keymap.set("n", "<leader>rr", function()
  --       ensure_kernel()
  --       vim.cmd("MoltenEvaluateLine")
  --     end, { desc = "Run Line" })

  --     -- visuelle Auswahl
  --     vim.keymap.set("v", "<leader>rr", function()
  --       ensure_kernel()
  --       vim.cmd("MoltenEvaluateVisual")
  --     end, { desc = "Run Selection" })

  --     -- gesamte Datei
  --     vim.keymap.set("n", "<leader>rf", function()
  --       ensure_kernel()
  --       vim.cmd("normal! ggVG")
  --       vim.cmd("MoltenEvaluateVisual")
  --     end, { desc = "Run File" })

  --     -- nächste Zelle (# %%)
  --     vim.keymap.set("n", "<leader>rc", function()
  --       ensure_kernel()
  --       vim.cmd("MoltenEvaluateOperator")
  --     end, { desc = "Run Cell" })

  --     -- Output Toggle
  --     vim.keymap.set("n", "<leader>ro", ":MoltenShowOutput<CR>", { desc = "Show Output" })
  --     vim.keymap.set("n", "<leader>rh", ":MoltenHideOutput<CR>", { desc = "Hide Output" })
  --   end,
  -- },
-- }

--pip install pynvim jupyter-client ipykernel black ruff
-- Optional:
-- python -m ipykernel install --user

return {
  -- 1. Molten Konfiguration
  {
    "benlubas/molten-nvim",
    ft = { "markdown", "python" },
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    init = function()
      -- WICHTIG: Erlaubt Molten, Markdown-Inhalte im Output-Fenster zu rendern
      vim.g.molten_auto_open_output = true
      vim.g.molten_output_win_max_height = 30
      vim.g.molten_virt_text_output = true
      -- vim.g.molten_virt_text_output = false
      vim.g.molten_use_border_highlights = true
      vim.g.molten_virt_lines_off_by_1 = true
      
      -- Bilder & Stil
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_style = "minimal"
      
      -- Optional: Wenn du oft mit DataFrames arbeitest, hilft dieses Plugin:
      -- Es sorgt dafür, dass HTML/Markdown Tabellen sauberer aussehen.
    end,
  },

  -- 2. Image.nvim (Optimiert für Ghostty/Kitty)
  -- {
  --   "3rd/image.nvim",
  --   opts = {
  --     backend = "kitty", 
  --     max_width = 150,
  --     max_height = 30,
  --     max_height_window_percentage = math.huge,
  --     max_width_window_percentage = math.huge,
  --     window_overlap_clear_enabled = true,
  --     editor_only_render_when_focused = true,
  --     tmux_show_boundary = false,
  --     -- Aktiviert die Integration für Markdown-Dateien selbst
  --     integrations = {
  --       markdown = {
  --         enabled = true,
  --         clear_in_insert_mode = false,
  --         download_remote_images = true,
  --         only_render_image_at_cursor = false,
  --         filetypes = { "markdown", "vimwiki", "quarto" }, -- Quarto für Notebook-Feeling
  --       },
  --     },
  --   },
  -- },

  {
    "3rd/image.nvim",
    cond = function()
      local term = os.getenv("TERM") or ""
      local term_program = os.getenv("TERM_PROGRAM") or ""
      local kitty_protocol = os.getenv("KITTY_WINDOW_ID") -- Kitty setzt diese Variable

      -- Prüft auf echte Kitty-Umgebung oder Ghostty
      if kitty_protocol and kitty_protocol ~= "" then
        return true
      elseif term:find("kitty") or term_program == "Ghostty" then
        return true
      end

      return false
    end,
    opts = {
      backend = "kitty",
      max_width = 100,
      max_height = 20,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      editor_only_render_when_focused = true,
      tmux_show_boundary = false,
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki", "quarto", "latex", "tex" },
        },
      },
    },
  },
  
  -- 3. EMPFEHLUNG: Render-Markdown für schöneres UI
  -- Dies verbessert das Aussehen von Markdown-Blöcken im Editor enorm.
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { "markdown" },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    opts = {
      -- file_types = { "markdown", "quarto", "python" },
      file_types = { "markdown", "quarto" },
          
      code = {
        style = 'full',
        left_pad = 2,
        right_pad = 4,
        border = 'thin',
        highlight = 'RenderMarkdownCode', -- Nutzt Theme-Farben für Hintergründe
      },

      -- extra_border = {
      --   enabled = true,
      -- },
    },
  },

  {
    "GCBallesteros/jupytext.nvim",
    lazy = false,
    -- ft = { "python", "jupyter" },
    opts = {
      -- Hier erzwingen wir das Markdown-Verhalten für Python-Notebooks
      custom_language_formatting = {
        python = {
          extension = "md",
          style = "markdown",
          force_ft = "markdown", -- WICHTIG: Damit vi` funktioniert
          -- force_ft = nil,
          converter = "pylatexenc", -- Oder "mmarkdown" / "none"
        },
      },
    },
    config = function(_, opts)
      require("jupytext").setup(opts)
    end,
  },

  -- {
  --   "jmbuhr/otter.nvim",
  --   ft = { "markdown" },
  --   dependencies = { "neovim/nvim-lspconfig" },
  --   config = function()
  --     local group = vim.api.nvim_create_augroup("OtterSetup", { clear = true })
      
  --     -- Filter für E303 (Too many blank lines)
  --     -- local original_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
  --     -- vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  --     --   local filtered = {}
  --     --   if result and result.diagnostics then
  --     --     for _, d in ipairs(result.diagnostics) do
  --     --       -- Ignoriert E303 und die Nachricht "too many blank lines"
  --     --       if not (d.code == "E303" or d.message:lower():find("too many blank lines")) then
  --     --         table.insert(filtered, d)
  --     --       end
  --     --     end
  --     --     result.diagnostics = filtered
  --     --   end
  --     --   original_handler(err, result, ctx, config)
  --     -- end

  --     -- local original_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
  --     -- vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  --     --   local filtered = {}
  --     --   if result and result.diagnostics then
  --     --     for _, d in ipairs(result.diagnostics) do
  --     --       -- Wir prüfen, ob die Quelle 'pycodestyle' ist (Groß/Kleinschreibung egal)
  --     --       local source = d.source or ""
  --     --       if not source:lower():find("pycodestyle") then
  --     --         table.insert(filtered, d)
  --     --       end
  --     --     end
  --     --     result.diagnostics = filtered
  --     --   end
  --     --   original_handler(err, result, ctx, config)
  --     -- end

  --     -- local function filter_diagnostics(diagnostics)
  --     --   local filtered = {}

  --     --   for _, d in ipairs(diagnostics) do
  --     --     local source = d.source or ""

  --     --     if not source:lower():find("pycodestyle") then
  --     --       table.insert(filtered, d)
  --     --     end
  --     --   end

  --     --   return filtered
  --     -- end

  --     -- if not vim.g._otter_diagnostic_filter then
  --     --   vim.g._otter_diagnostic_filter = true

  --     --   local original = vim.lsp.handlers["textDocument/publishDiagnostics"]

  --     --   vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  --     --     if result and result.diagnostics then
  --     --       local client = vim.lsp.get_client_by_id(ctx.client_id)

  --     --       if client and client.name == "otter-ls" then
  --     --         local filtered = {}

  --     --         for _, d in ipairs(result.diagnostics) do
  --     --           local source = d.source or ""

  --     --           if not source:lower():find("pycodestyle") then
  --     --             table.insert(filtered, d)
  --     --           end
  --     --         end

  --     --         result.diagnostics = filtered
  --     --       end
  --     --     end

  --     --     return original(err, result, ctx, config)
  --     --   end
  --     -- end

  --     local original = vim.lsp.handlers["textDocument/publishDiagnostics"]

  --     vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  --       if result and result.diagnostics then
  --         local client = vim.lsp.get_client_by_id(ctx.client_id)

  --         if client and (client.name == "pyright" or client.name == "ruff_lsp") then
  --           local filtered = {}

  --           for _, d in ipairs(result.diagnostics) do
  --             local source = d.source or ""

  --             -- Beispiel: pycodestyle ignorieren
  --             if not source:lower():find("pycodestyle") then
  --               table.insert(filtered, d)
  --             end
  --           end

  --           result.diagnostics = filtered
  --         end
  --       end

  --       return original(err, result, ctx, config)
  --     end

  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = "markdown",
  --       group = group,
  --       callback = function()
  --         -- require("otter").activate({"python"})
  --         if not vim.b.otter_activated then
  --           require("otter").activate({ "python" })
  --           vim.b.otter_activated = true
  --         end
  --       end,
  --     })
  --   end,
  -- }

  {
    "jmbuhr/otter.nvim",
    ft = { "markdown" },
    dependencies = { "neovim/nvim-lspconfig" },

    config = function()
      local group = vim.api.nvim_create_augroup("OtterSetup", { clear = true })

      -- Sichere Otter Activation
      local function activate_otter()
        if vim.b.otter_activated then
          return
        end

        -- Nur wenn Python Codeblock existiert
        if vim.fn.search("```python", "nw") == 0 then
          return
        end

        local ok, otter = pcall(require, "otter")
        if not ok then
          return
        end

        -- zusätzlicher Schutz (verhindert seltene doppelte Aktivierung)
        vim.schedule(function()
          otter.activate({ "python" })
          vim.b.otter_activated = true
        end)
      end

      -- Markdown öffnen
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        group = group,
        callback = activate_otter,
      })

      -- Bei Buffer Wechsel (z.B. nach Reload)
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        pattern = "*.md",
        group = group,
        callback = activate_otter,
      })

      -- Otter Buffers verstecken
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*.otter.py",
        callback = function()
          vim.bo.buflisted = false
          vim.bo.bufhidden = "hide"
        end,
      })
    end,
  }
}

```

## lsp/python.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim lsp/python.lua
```

```bash
nano lsp/python.lua
```

```bash
code lsp/python.lua
```

```lua
-- lsp/python.lua

-- local M = {}

-- M.setup = function(capabilities, no_diagnostics)
--     local lspconfig = require('lspconfig')

--     -- bessere Completion-Capabilities
--     capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

--     lspconfig.pylsp.setup({
--         capabilities = capabilities,
--         handlers = no_diagnostics,

--         -- handlers = {
--         --   ["textDocument/publishDiagnostics"] = function() end
--         -- }

--         settings = {
--             pylsp = {
--                 plugins = {
--                     -- klassische Linters AUS
--                     pycodestyle = { enabled = false },
--                     pyflakes    = { enabled = false },
--                     pylint      = { enabled = false },
--                     mccabe      = { enabled = false },

--                     -- Completion
--                     rope_completion = { enabled = false },
--                     jedi_completion = { enabled = true },

--                     -- Formatierung
--                     black = {
--                         enabled = true,
--                         line_length = 88,
--                     },
--                     yapf = { enabled = false },

--                     -- ruff im pylsp: lieber AUS
--                     ruff = { enabled = false },
--                 },
--             },
--         },

--         on_attach = function(client, bufnr)
--             -- Diagnostics wirklich abschalten
--             -- client.server_capabilities.diagnosticProvider = false
--             client.server_capabilities.diagnosticProvider = true

--             -- nur pylsp formatiert
--             client.server_capabilities.documentFormattingProvider = true

--             -- Semantic Tokens aus (optional, aber oft angenehmer)
--             client.server_capabilities.semanticTokensProvider = nil

--             local buf_map = function(mode, lhs, rhs, opts)
--                 opts = opts or {}
--                 opts.buffer = bufnr
--                 vim.keymap.set(mode, lhs, rhs, opts)
--             end

--             -- buf_map('n', 'gd', vim.lsp.buf.definition) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
--             buf_map('n', 'K', vim.lsp.buf.hover)
--             buf_map('n', '<leader>rn', vim.lsp.buf.rename)
--             -- buf_map('n', '<leader>ca', vim.lsp.buf.code_action) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
--             buf_map('n', '<leader>f', function()
--                 vim.lsp.buf.format({ async = true })
--             end)

--             buf_map('n', '<leader>oi', function()
--                 vim.lsp.buf.execute_command({
--                     command = 'pylsp.organizeImports',
--                     arguments = { vim.api.nvim_buf_get_name(0) },
--                 })
--             end)
--         end,
--     })
-- end

-- return M

-- local M = {}

-- M.setup = function(capabilities)
--     local lspconfig = require('lspconfig')

--     -- bessere Completion-Capabilities
--     capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

--     lspconfig.pylsp.setup({
--         capabilities = capabilities,

--         settings = {
--             pylsp = {
--                 plugins = {
--                     -- klassische Linters AUS
--                     pycodestyle = { enabled = false },
--                     pyflakes    = { enabled = false },
--                     pylint      = { enabled = false },
--                     mccabe      = { enabled = false },

--                     -- Completion
--                     rope_completion = { enabled = false },
--                     jedi_completion = { enabled = true },

--                     -- Formatierung
--                     -- black = {
--                     --     enabled = true,
--                     --     line_length = 88,
--                     -- },

--                     -- andere Formatierer deaktiviert
--                     yapf = { enabled = false },
--                     ruff = { enabled = false },
--                 },
--             },
--         },

--         on_attach = function(client, bufnr)
--             -- Diagnostics anlassen
--             client.server_capabilities.diagnosticProvider = true

--             -- Formatierung über pylsp (falls verfügbar)
--             client.server_capabilities.documentFormattingProvider = true

--             -- Semantic Tokens deaktivieren (optional)
--             client.server_capabilities.semanticTokensProvider = nil

--             -- Hilfsfunktion für Buffer-Local Keymaps
--             local buf_map = function(mode, lhs, rhs, opts)
--                 opts = opts or {}
--                 opts.buffer = bufnr
--                 vim.keymap.set(mode, lhs, rhs, opts)
--             end

--             -- LSP Keymaps
--             -- buf_map('n', 'gd', vim.lsp.buf.definition) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
--             buf_map('n', 'K', vim.lsp.buf.hover)
--             buf_map('n', '<leader>rn', vim.lsp.buf.rename)
--             -- buf_map('n', '<leader>ca', vim.lsp.buf.code_action) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
--             buf_map('n', '<leader>f', function()
--                 vim.lsp.buf.format({ async = true })
--             end)
--             buf_map('n', '<leader>oi', function()
--                 vim.lsp.buf.execute_command({
--                     command = 'pylsp.organizeImports',
--                     arguments = { vim.api.nvim_buf_get_name(0) },
--                 })
--             end)
--         end,
--     })
-- end

-- return M

-- local M = {}

-- M.setup = function(capabilities)
--     local lspconfig = require('lspconfig')

--     capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

--     lspconfig.pyright.setup({
--         capabilities = capabilities,

--         settings = {
--             python = {
--                 analysis = {
--                     typeCheckingMode = "strict", -- MAXIMUM STRICTNESS
--                     autoSearchPaths = true,
--                     useLibraryCodeForTypes = true,
--                     diagnosticMode = "workspace",

--                     reportMissingImports = true,
--                     reportMissingTypeStubs = false,
--                     reportUnusedVariable = true,
--                     reportUnusedImport = true,
--                     reportOptionalMemberAccess = true,
--                     reportOptionalSubscript = true,
--                     reportGeneralTypeIssues = true,
--                 },
--             },
--         },

--         on_attach = function(client, bufnr)
--             -- pyright macht KEIN formatting
--             client.server_capabilities.documentFormattingProvider = false

--             -- optional cleaner look
--             client.server_capabilities.semanticTokensProvider = nil

--             local buf_map = function(mode, lhs, rhs, opts)
--                 opts = opts or {}
--                 opts.buffer = bufnr
--                 vim.keymap.set(mode, lhs, rhs, opts)
--             end

--             -- Keymaps
--             buf_map('n', 'K', vim.lsp.buf.hover)
--             buf_map('n', '<leader>rn', vim.lsp.buf.rename)
--             buf_map('n', '<leader>ca', vim.lsp.buf.code_action)

--             -- Format (kommt von ruff/null-ls)
--             buf_map('n', '<leader>f', function()
--                 vim.lsp.buf.format({ async = true })
--             end)
--         end,
--     })

--     -- Null-ls / Ruff Setup
--     local null_ls = require("null-ls")
--     null_ls.setup({
--         sources = {
--             null_ls.builtins.diagnostics.ruff,
--             null_ls.builtins.formatting.ruff,
--         },
--         on_attach = function(client, bufnr)
--             if client.supports_method("textDocument/formatting") then
--                 local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
--                 vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
--                 vim.api.nvim_create_autocmd("BufWritePre", {
--                     group = group,
--                     buffer = bufnr,
--                     callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end,
--                 })
--             end
--         end,
--     })
-- end

-- return M

local M = {}

M.setup = function(capabilities)
local lspconfig = require('lspconfig')
local null_ls = require("null-ls")

-- bessere capabilities
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Pyright Setup (MAXIMUM PROFESSIONAL)
lspconfig.pyright.setup({
    capabilities = capabilities,

    -- Diagnostics aus
    handlers = {
      ["$/progress"] = function(_, _) end,
    },

    settings = {
        python = {
            analysis = {
                typeCheckingMode = "strict",
                diagnosticMode = "workspace",

                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,

                -- maximale Strenge
                reportMissingImports = true,
                reportMissingTypeStubs = false,
                reportUnusedVariable = true,
                reportUnusedImport = true,
                reportOptionalMemberAccess = true,
                reportOptionalSubscript = true,
                reportGeneralTypeIssues = true,
                reportPrivateImportUsage = true,
                reportUnnecessaryTypeIgnoreComment = true,
                reportImplicitStringConcatenation = true,
                reportCallInDefaultInitializer = true,
                reportUnboundVariable = true,

                -- Performance
                indexing = true,
            },
        },
    },

    on_attach = function(client, bufnr)
        -- Pyright kein Formatting
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.semanticTokensProvider = nil

        local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
        end

        -- Navigation
        map('n', 'K', vim.lsp.buf.hover)
        map('n', 'gd', vim.lsp.buf.definition)
        map('n', 'gD', vim.lsp.buf.declaration)
        map('n', 'gi', vim.lsp.buf.implementation)
        map('n', 'gr', vim.lsp.buf.references)

        -- Refactor
        map('n', '<leader>rn', vim.lsp.buf.rename)
        map('n', '<leader>ca', vim.lsp.buf.code_action)

        -- Diagnostics
        map('n', '<leader>d', vim.diagnostic.open_float)
        map('n', '[d', vim.diagnostic.goto_prev)
        map('n', ']d', vim.diagnostic.goto_next)

        -- Format
        map('n', '<leader>f', function()
            vim.lsp.buf.format({ async = true })
        end)
    end,
})

-- NULL-LS (LINT + FORMAT + SECURITY)
null_ls.setup({
    sources = {
        -- Ruff (Lint)
        null_ls.builtins.diagnostics.ruff,

        -- Formatting (empfohlen stabiler als ruff-format hier)
        null_ls.builtins.formatting.black.with({
            extra_args = { "--fast" }
        }),

        -- Security
        null_ls.builtins.diagnostics.bandit,

        -- Typing ergänzend
        null_ls.builtins.diagnostics.mypy.with({
            extra_args = { "--strict" }
        }),
    },

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

            vim.api.nvim_create_autocmd("BufWritePre", {
                group = group,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        timeout_ms = 2000,
                    })
                end,
            })
        end
    end,
})

-- Diagnostics UI verbessern
vim.diagnostic.config({
    virtual_text = false, -- cleaner
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,

    float = {
        border = "rounded",
        -- source = "always",
        source = "if_many",
    },
})

end

return M

```

## lsp/lua.lua

<!-- Kommentiere es einfach aus, wenn du es doch brauchen solltest – ich benötige es aktuell nicht.
Vergiss außerdem nicht, das lua-lsp Paket in der plugins/mason.lua auszukommentieren. -->

```bash
cd ~/.config/nvim/lua
```

```bash
vim lsp/lua.lua
```

```bash
nano lsp/lua.lua
```

```bash
code lsp/lua.lua
```

```lua
-- lsp/lua.lua

-- local M = {}

-- M.setup = function(capabilities, no_diagnostics)
--     local lspconfig = require("lspconfig")

--     -- bessere Completion-Capabilities
--     capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

--     lspconfig.lua_ls.setup({
--         capabilities = capabilities,
--         handlers = no_diagnostics,

--         settings = {
--             Lua = {
--                 runtime = {
--                     -- LuaJIT für NeoVim
--                     version = "LuaJIT",
--                     path = vim.split(package.path, ";"),
--                 },
--                 diagnostics = {
--                     globals = { "vim" },  -- NeoVim globale Variablen
--                 },
--                 workspace = {
--                     library = {
--                         [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                         [vim.fn.stdpath("config") .. "/lua"] = true,
--                     },
--                     checkThirdParty = false,
--                 },
--                 telemetry = {
--                     enable = false,
--                 },
--                 format = {
--                     enable = true,
--                 },
--             },
--         },

--         on_attach = function(client, bufnr)
--             -- Diagnostics optional deaktivieren
--             client.server_capabilities.diagnosticProvider = false
--             client.server_capabilities.documentFormattingProvider = true

--             local buf_map = function(mode, lhs, rhs, opts)
--                 opts = opts or {}
--                 opts.buffer = bufnr
--                 vim.keymap.set(mode, lhs, rhs, opts)
--             end

--             -- LSP Keymaps
--             -- buf_map("n", "gd", vim.lsp.buf.definition) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
--             buf_map("n", "K", vim.lsp.buf.hover)
--             buf_map("n", "<leader>rn", vim.lsp.buf.rename)
--             -- buf_map("n", "<leader>ca", vim.lsp.buf.code_action) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
--             buf_map("n", "<leader>f", function()
--                 vim.lsp.buf.format({ async = true })
--             end)
--         end,
--     })
-- end

-- return M

local M = {}

M.setup = function(capabilities)
  local lspconfig = require("lspconfig")

  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  lspconfig.lua_ls.setup({
    capabilities = capabilities,

    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },

        diagnostics = {
          globals = { "vim" },
        },

        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },

        telemetry = {
          enable = false,
        },

        completion = {
          callSnippet = "Replace",
        },
      },
    },

    on_attach = function(client, bufnr)
      -- safer than hard disabling capabilities
      client.server_capabilities.semanticTokensProvider = nil

      local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
      end

      map("n", "K", vim.lsp.buf.hover)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end)
    end,
  })
end

return M

```

## plugins/html.lua

Achtung: Die Datei `plugins/web-dev.lua` bündelt LSP-Performance, Prettier-Formatierung und Auto-Fixes für JS, TS, HTML und JSON an einem Ort. Du brauchst die Dateien plugins/javascript.lua, plugins/typescript.lua, plugins/html.lua, lsp/html.lua und css/lsp.lua dann **nicht** mehr, da sie nur zu Konflikten und Fehlern führen würden.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/html.lua
```

```bash
nano plugins/html.lua
```

```bash
code plugins/html.lua
```

```lua
-- plugins/html.lua

-- Achtung: Die Datei `plugins/web-dev.lua` bündelt LSP-Performance, Prettier-Formatierung und Auto-Fixes für JS, TS, HTML und JSON an einem Ort. Du brauchst die Dateien plugins/javascript.lua, plugins/typescript.lua, plugins/html.lua, lsp/html.lua und css/lsp.lua dann nicht mehr, da sie nur zu Konflikten und Fehlern führen würden.

-- return {
--   {
--     -- Unnötig!!! -> alles in plugins/completion.lua und mehr
--     "L3MON4D3/LuaSnip",
--     opts = function(_, opts)
--       local ls = require("luasnip")
--       local s = ls.snippet
--       local t = ls.text_node
--       local i = ls.insert_node
--       local f = ls.function_node

--       ls.add_snippets("html", {

--         -- ! -> HTML5 Boilerplate
--         s("!", {
--           t({
--             "<!DOCTYPE html>",
--             "<html lang=\"en\">",
--             "<head>",
--             "    <meta charset=\"UTF-8\">",
--             "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
--             "    <title>",
--           }),
--           i(1, "Document"),
--           t({
--             "</title>",
--             "</head>",
--             "<body>",
--             "",
--             }),
--           i(0),
--           t({
--             "",
--             "</body>",
--             "</html>",
--           }),
--         }),

--         -- !! -> Minimal HTML
--         s("!!", {
--           t({
--             "<!DOCTYPE html>",
--             "<html>",
--             "<head>",
--             "    <title>",
--           }),
--           i(1, "Document"),
--           t({
--             "</title>",
--             "</head>",
--             "<body>",
--             }),
--           i(0),
--           t({
--             "",
--             "</body>",
--             "</html>",
--           }),
--         }),

--         -- !!! -> Nur Body
--         s("!!!", {
--           t({
--             "<body>",
--             }),
--           i(0),
--           t({
--             "",
--             "</body>",
--           }),
--         }),

--         -- div
--         s("div", {
--           t("<div>"),
--           i(0),
--           t("</div>"),
--         }),

--         -- span
--         s("span", {
--           t("<span>"),
--           i(0),
--           t("</span>"),
--         }),

--         -- p
--         s("p", {
--           t("<p>"),
--           i(0),
--           t("</p>"),
--         }),

--         -- a
--         s("a", {
--           t("<a href=\""),
--           i(1, "#"),
--           t("\">"),
--           i(0),
--           t("</a>"),
--         }),

--         -- img
--         s("img", {
--           t("<img src=\""),
--           i(1),
--           t("\" alt=\""),
--           i(2),
--           t("\" />"),
--         }),

--         -- link css
--         s("css", {
--           t("<link rel=\"stylesheet\" href=\""),
--           i(0),
--           t("\">"),
--         }),

--         -- script
--         s("js", {
--           t("<script src=\""),
--           i(0),
--           t("\"></script>"),
--         }),

--         -- comment
--         s("com", {
--           t("<!-- "),
--           i(0),
--           t(" -->"),
--         }),
--       })

--       return opts
--     end,
--   },

--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         -- Standard HTML Language Server
--         html = {},
--         -- Emmet LS für extrem schnelles HTML-Schreiben
--         emmet_ls = {
--           filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
--         },
--       },
--     },
--   },

--   {
--     "windwp/nvim-ts-autotag",
--     opts = {
--       opts = {
--         enable_close = true,
--         enable_rename = true,
--         enable_close_on_slash = true,
--       },
--     },
--   },

--   {
--     "barrett-ruth/live-server.nvim",
--     build = "pnpm add -g live-server", -- oder npm install -g live-server
--     cmd = { "LiveServerStart", "LiveServerStop" },
--     config = true,
--   },
-- }

```

## lsp/html.lua

Achtung: Die Datei `plugins/web-dev.lua` bündelt LSP-Performance, Prettier-Formatierung und Auto-Fixes für JS, TS, HTML und JSON an einem Ort. Du brauchst die Dateien plugins/javascript.lua, plugins/typescript.lua, plugins/html.lua, lsp/html.lua und css/lsp.lua dann **nicht** mehr, da sie nur zu Konflikten und Fehlern führen würden.

```bash
cd ~/.config/nvim/lua
```

```bash
vim ls/html.lua
```

```bash
nano lsp/html.lua
```

```bash
code lsp/html.lua
```

```lua
-- lsp/html.lua

-- Achtung: Die Datei `plugins/web-dev.lua` bündelt LSP-Performance, Prettier-Formatierung und Auto-Fixes für JS, TS, HTML und JSON an einem Ort. Du brauchst die Dateien plugins/javascript.lua, plugins/typescript.lua, plugins/html.lua, lsp/html.lua und css/lsp.lua dann nicht mehr, da sie nur zu Konflikten und Fehlern führen würden.

-- local M = {}

-- M.setup = function(capabilities, no_diagnostics)
--     local lspconfig = require("lspconfig")

--     -- bessere Completion-Capabilities
--     capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

--     lspconfig.html.setup({
--         capabilities = capabilities,
--         handlers = no_diagnostics,

--         settings = {
--             html = {
--                 format = {
--                     wrapLineLength = 120,
--                     unformatted = "pre,code,textarea",
--                     contentUnformatted = "pre,code,textarea",
--                     indentInnerHtml = true,
--                 },
--                 hover = {
--                     documentation = true,
--                     references = true,
--                 },
--             },
--         },

--         on_attach = function(client, bufnr)
--             -- Optional: Diagnostics deaktivieren
--             client.server_capabilities.diagnosticProvider = false
--             client.server_capabilities.documentFormattingProvider = true

--             local buf_map = function(mode, lhs, rhs, opts)
--                 opts = opts or {}
--                 opts.buffer = bufnr
--                 vim.keymap.set(mode, lhs, rhs, opts)
--             end

--             -- LSP Keymaps (konsistent)
--             -- buf_map("n", "gd", vim.lsp.buf.definition) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
--             buf_map("n", "K", vim.lsp.buf.hover)
--             buf_map("n", "<leader>rn", vim.lsp.buf.rename)
--             -- buf_map("n", "<leader>ca", vim.lsp.buf.code_action) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
--             buf_map("n", "<leader>f", function()
--                 vim.lsp.buf.format({ async = true })
--             end)
--         end,
--     })
-- end

-- return M

```

## lsp/css.lua

Achtung: Die Datei `plugins/web-dev.lua` bündelt LSP-Performance, Prettier-Formatierung und Auto-Fixes für JS, TS, HTML und JSON an einem Ort. Du brauchst die Dateien plugins/javascript.lua, plugins/typescript.lua, plugins/html.lua, lsp/html.lua und css/lsp.lua dann **nicht** mehr, da sie nur zu Konflikten und Fehlern führen würden.

```bash
cd ~/.config/nvim/lua
```

```bash
vim ls/css.lua
```

```bash
nano lsp/css.lua
```

```bash
code lsp/css.lua
```

```lua
-- lsp/css.lua

-- Achtung: Die Datei `plugins/web-dev.lua` bündelt LSP-Performance, Prettier-Formatierung und Auto-Fixes für JS, TS, HTML und JSON an einem Ort. Du brauchst die Dateien plugins/javascript.lua, plugins/typescript.lua, plugins/html.lua, lsp/html.lua und css/lsp.lua dann nicht mehr, da sie nur zu Konflikten und Fehlern führen würden.

-- local M = {}

-- M.setup = function(capabilities, no_diagnostics)
--     local lspconfig = require("lspconfig")

--     -- bessere Completion-Capabilities
--     capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

--     lspconfig.cssls.setup({
--         capabilities = capabilities,
--         handlers = no_diagnostics,

--         settings = {
--             css = {
--                 validate = true,
--                 lint = {
--                     unknownProperties = "warning", -- Warnung für unbekannte Properties
--                 },
--                 format = {
--                     enable = true,
--                 },
--             },
--             scss = {
--                 validate = true,
--                 lint = {
--                     unknownProperties = "warning",
--                 },
--                 format = {
--                     enable = true,
--                 },
--             },
--             less = {
--                 validate = true,
--                 lint = {
--                     unknownProperties = "warning",
--                 },
--                 format = {
--                     enable = true,
--                 },
--             },
--         },

--         on_attach = function(client, bufnr)
--             -- Optional: Diagnostics deaktivieren
--             client.server_capabilities.diagnosticProvider = false
--             client.server_capabilities.documentFormattingProvider = true

--             local buf_map = function(mode, lhs, rhs, opts)
--                 opts = opts or {}
--                 opts.buffer = bufnr
--                 vim.keymap.set(mode, lhs, rhs, opts)
--             end

--             -- Konsistente LSP Keymaps
--             -- buf_map("n", "gd", vim.lsp.buf.definition) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
--             buf_map("n", "K", vim.lsp.buf.hover)
--             buf_map("n", "<leader>rn", vim.lsp.buf.rename)
--             -- buf_map("n", "<leader>ca", vim.lsp.buf.code_action) -- Diese Tastenkombination ist bereits in plugins/keymaps definiert.
--             buf_map("n", "<leader>f", function()
--                 vim.lsp.buf.format({ async = true })
--             end)
--         end,
--     })
-- end

-- return M

```

## plugins/javascript.lua

Achtung: Die Datei `plugins/web-dev.lua` bündelt LSP-Performance, Prettier-Formatierung und Auto-Fixes für JS, TS, HTML und JSON an einem Ort. Du brauchst die Dateien plugins/javascript.lua, plugins/typescript.lua, plugins/html.lua, lsp/html.lua und css/lsp.lua dann **nicht** mehr, da sie nur zu Konflikten und Fehlern führen würden.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/javascript.lua
````

```bash
nano plugins/javascript.lua
```

```bash
code plugins/javascript.lua
```

```lua
-- plugins/javascript.lua

-- Achtung: Die Datei `plugins/web-dev.lua` bündelt LSP-Performance, Prettier-Formatierung und Auto-Fixes für JS, TS, HTML und JSON an einem Ort. Du brauchst die Dateien plugins/javascript.lua, plugins/typescript.lua, plugins/html.lua, lsp/html.lua und css/lsp.lua dann nicht mehr, da sie nur zu Konflikten und Fehlern führen würden.

-- return {
--   -- 1. Formatierung via Conform (Prettier)
--   {
--     "stevearc/conform.nvim",
--     opts = {
--       formatters_by_ft = {
--         -- Nutzt Prettier für alle Web-Dateien
--         javascript = { "prettier" },
--         javascriptreact = { "prettier" },
--         typescript = { "prettier" },
--         typescriptreact = { "prettier" },
--         json = { "prettier" },
--         html = { "prettier" },
--       },
--     },
--   },

--   -- 2. Eslint Konfiguration (Modernes LazyVim-Format)
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         eslint = {
--           settings = {
--             workingDirectory = { mode = "location" },
--           },
--         },
--       },
--       setup = {
--         -- Automatisches Fixen beim Speichern via ESLint
--         eslint = function()
--           vim.api.nvim_create_autocmd("BufWritePre", {
--             callback = function(event)
--               if require("lspconfig.util").get_active_client_by_name(event.buf, "eslint") then
--                 vim.cmd("EslintFixAll")
--               end
--             end,
--           })
--         end,
--       },
--     },
--   },

--   -- 3. Autotags für TSX/JSX (wie in HTML)
--   {
--     "windwp/nvim-ts-autotag",
--     opts = {},
--   },
-- }

```

## plugins/typescript.lua

Achtung: Die Datei `plugins/web-dev.lua` bündelt LSP-Performance, Prettier-Formatierung und Auto-Fixes für JS, TS, HTML und JSON an einem Ort. Du brauchst die Dateien plugins/javascript.lua, plugins/typescript.lua, plugins/html.lua, lsp/html.lua und css/lsp.lua dann **nicht** mehr, da sie nur zu Konflikten und Fehlern führen würden.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/typescript.lua
```

```bash
nano plugins/typescript.lua
```

```bash
code plugins/typescript.lua
```

```lua
-- plugins/typescript.lua

-- Achtung: Die Datei `plugins/web-dev.lua` bündelt LSP-Performance, Prettier-Formatierung und Auto-Fixes für JS, TS, HTML und JSON an einem Ort. Du brauchst die Dateien plugins/javascript.lua, plugins/typescript.lua, plugins/html.lua, lsp/html.lua und css/lsp.lua dann nicht mehr, da sie nur zu Konflikten und Fehlern führen würden.

-- return {
--   -- 1. LSP: Deaktiviere Standard und aktiviere typescript-tools & eslint
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         -- Deaktiviert die LazyVim Standards, damit sie sich nicht beißen
--         vtsls = { enabled = false },
--         tsserver = { enabled = false },
--         -- Aktiviert ESLint
--         eslint = {
--           settings = {
--             workingDirectory = { mode = "location" },
--           },
--         },
--       },
--       setup = {
--         -- Automatisches Fixen von ESLint-Fehlern beim Speichern
--         eslint = function()
--           vim.api.nvim_create_autocmd("BufWritePre", {
--             callback = function(event)
--               if require("lspconfig.util").get_active_client_by_name(event.buf, "eslint") then
--                 vim.cmd("EslintFixAll")
--               end
--             end,
--           })
--         end,
--       },
--     },
--   },

--   -- 2. Das Haupt-Plugin für TypeScript/JavaScript Performance
--   {
--     "pmizio/typescript-tools.nvim",
--     dependencies = { 
--       "nvim-lua/plenary.nvim", 
--       "neovim/nvim-lspconfig" 
--     },
--     opts = {
--       settings = {
--         expose_as_code_action = "all",
--         complete_function_calls = true,
--       },
--     },
--   },

--   -- 3. Formatierung (Prettier) für alle Web-Dateien
--   {
--     "stevearc/conform.nvim",
--     opts = {
--       formatters_by_ft = {
--         javascript = { "prettier" },
--         javascriptreact = { "prettier" },
--         typescript = { "prettier" },
--         typescriptreact = { "prettier" },
--         json = { "prettier" },
--         html = { "prettier" },
--       },
--     },
--   },

--   -- 4. Automatische Tags für HTML/JSX/TSX
--   {
--     "windwp/nvim-ts-autotag",
--     opts = {},
--   },
-- }

```

## plugins/web-dev.lua

Die Datei `plugins/web-dev.lua` bündelt LSP-Performance, Prettier-Formatierung und Auto-Fixes für JS, TS, HTML und JSON an einem Ort. Du brauchst die Dateien plugins/javascript.lua, plugins/typescript.lua, plugins/html.lua, lsp/html.lua und css/lsp.lua dann nicht mehr, da sie nur zu Konflikten und Fehlern führen würden.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/web-dev.lua
```

```bash
nano plugins/web-dev.lua
```

```bash
code plugins/web-dev.lua
```

```lua
-- plugins/web-dev.lua

return {
  {
    "neovim/nvim-lspconfig",
    -- ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "xml", "fxml" },
    ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "xml" },
    opts = {
      servers = {
        -- Deaktiviere doppelte/standard Server, wir verwenden hier andere Tools
        vtsls = { enabled = false },
        tsserver = { enabled = false },

        html = {},

        cssls = {
          settings = {
            css = {
              lint = {
                vendorPrefix = "ignore", -- Ignoriert die "-fx-" Warnungen
                duplicateProperties = "ignore",
                -- unknownProperties = "ignore", -- Wichtig für JavaFX-spezifische Befehle
              },
            },
          },
        },

        -- XML & FXML Support
        lemminx = {
          -- filetypes = { "xml", "fxml" },
          filetypes = { "xml" },
        },

        eslint = {
          settings = { 
            workingDirectory = { mode = "location" },
          },
          -- settings = { workingDirectory = { mode = "auto" } },
        },
      },

      setup = {
        eslint = function()
          -- Fixe ESLint-Fehler bei Save, nur wenn ESLint aktiv ist
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(args)
              for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = args.buf })) do
                if client.name == "eslint" then
                  vim.cmd("EslintFixAll")
                  return
                end
              end
            end,
          })
        end,
      },
    },

    -- config = function()
    --   local group = vim.api.nvim_create_augroup("eslint_fix", { clear = true })

    --   vim.api.nvim_create_autocmd("BufWritePre", {
    --     group = group,
    --     callback = function(args)
    --       for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
    --         if client.name == "eslint" then
    --           vim.lsp.buf.code_action({
    --             context = { only = { "source.fixAll.eslint" } },
    --             apply = true,
    --           })
    --           return
    --         end
    --       end
    --     end,
    --   })
    -- end,
  },

  {
    "pmizio/typescript-tools.nvim",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      settings = {
        expose_as_code_action = "all",
        complete_function_calls = true,
      },
    },
  },

  {
    "stevearc/conform.nvim",
    -- ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "xml", "fxml" },
    ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "xml" },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        xml = { "xmlformat" },
        -- fxml = { "xmlformat" },
      },
      -- optional: automatische Formatierung auf Save
      -- format_on_save = {
      --   timeout_ms = 500,
      --   lsp_format = "fallback",
      -- },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact", "typescriptreact" },
    opts = {},
  },  
  
  {
    "mfussenegger/nvim-lint",
    ft = { "html" },
    opts = {
      linters_by_ft = {
        html = { "htmlhint" },
      },
    },
  },
}

```

## plugins/asm.lua

```bash
# 1. Sicherstellen, dass das Config-Verzeichnis existiert
mkdir -p ~/.config/asm-lsp/

# 2. Die globale Konfigurationsdatei schreiben
cat <<EOF > ~/.config/asm-lsp/.asm-lsp.toml
version = "0.10.0"

[default_config]
assembler = "gas"
instruction_set = "x86-64"

[default_config.opts]
compiler = "as"
diagnostics = true
default_diagnostics = true

# --- OPTIONALE KONFIGURATION (MASM/UASM) ---
# Falls du MASM nutzen willst:
# Obere Zeilen mit # auskommentieren und hier die # entfernen:
# [default_config]
# assembler = "nasm"
# instruction_set = "x86-64"
# [default_config.opts]
# compiler = "nasm"
# complie_flags_txt = "-f elf64"
# diagnostics = true
# default_diagnostics = true
EOF

echo "Globale Konfiguration unter ~/.config/asm-lsp/.asm-lsp.toml wurde erstellt."
```

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/asm.lua
```

```bash
nano plugins/asm.lua
```

```bash
code plugins/asm.lua
```

```lua
-- plugins/asm.lua

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         -- Hier wird der asm-lsp konfiguriert
--         asm_lsp = {
--           filetypes = { "asm", "s", "S" },
--           -- Falls du NASM nutzt, kannst du hier spezifische Optionen setzen
--           root_dir = function(fname)
--             local util = require("lspconfig.util")
--             return util.root_pattern(".git", ".asm-lsp.yaml")(fname) or util.path.dirname(fname)
--           end,
--         },
--       },
--     },
--   },
-- }

return {
  {
    "neovim/nvim-lspconfig",
    ft = { "asm", "s", "S" },
    opts = {
      servers = {
        asm_lsp = {}, -- Standard-Setup reicht völlig aus
      },
    },
  },
}

```

## plugins/go.lua

Kommentiere es einfach aus, wenn du es doch brauchen solltest – ich benötige es aktuell nicht.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/go.lua
```

```bash
nano plugins/go.lua
```

```bash
code plugins/go.lua
```

```lua
-- plugins/go.lua

-- return {
--   {
--     "ray-x/go.nvim",
--     dependencies = {
--       "ray-x/guihua.lua",
--       "neovim/nvim-lspconfig",
--       "nvim-treesitter/nvim-treesitter",
--     },
--
--     event = { "CmdlineEnter" },
--     ft = { "go", "gomod" },
--
--     build = function()
--       require("go.install").update_all_sync()
--     end,
--
--     opts = function(_, opts)
--       require("go").setup(opts)
--
--       local format_sync_grp =
--         vim.api.nvim_create_augroup("GoFormat", { clear = true })
--
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         pattern = "*.go",
--         group = format_sync_grp,
--         callback = function()
--           require("go.format").goimports()
--         end,
--       })
--
--       return {
--         -- lsp_keymaps = false,
--         -- weitere Optionen hier
--       }
--     end,
--   },
-- }

```

## plugins/zig.lua

Kommentiere es einfach aus, wenn du es doch brauchen solltest – ich benötige es aktuell nicht.
Vergiss außerdem nicht, das zls Paket in der plugins/mason.lua auszukommentieren.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/zig.lua
```

```bash
nano plugins/zig.lua
```

```bash
code plugins/zig.lua
```

```lua
-- plugins/zig.lua

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     ft = { "zig" },
--
--     opts = function(_, opts)
--       local lspconfig = require("lspconfig")
--       local util = require("lspconfig.util")
--
--       lspconfig.zls.setup({
--         cmd = { "zls" }, -- zls muss installiert sein
--         filetypes = { "zig" },
--
--         root_dir = util.root_pattern("build.zig", ".git"),
--
--         capabilities = opts.capabilities,
--
--         on_attach = function(_, bufnr)
--           local function buf_map(mode, lhs, rhs)
--             vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
--           end
--
--           -- Standard LSP-Keymaps
--           buf_map("n", "K", vim.lsp.buf.hover)
--           buf_map("n", "<leader>rn", vim.lsp.buf.rename)
--           -- buf_map("n", "<leader>ca", vim.lsp.buf.code_action)
--           buf_map("n", "<leader>f", function()
--             vim.lsp.buf.format({ async = true })
--           end)
--         end,
--       })
--     end,
--   },
-- }

```

## plugins/db.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/db.lua
```

```bash
nano plugins/db.lua
```

```bash
code plugins/db.lua
```

```lua
-- plugins/db.lua

-- return {
--   {
--     "kndndrj/nvim-dbee",
--     dependencies = { "MunifTanjim/nui.nvim" },

--     cmd = { "Dbee", "DbeeToggle", "DbeeOpen" },

--     build = function()
--       pcall(function()
--         require("dbee").install()
--       end)
--     end,

--     opts = function()
--       local ok, sources = pcall(require, "dbee.sources")
--       if not ok then return {} end

--       return {
--         sources = {
--           sources.EnvSource:new("DBEE_CONNECTIONS"),

--           sources.MemorySource:new({
--             {
--               name = "MySQL Docker",
--               type = "mysql",
--               -- Format: user:password@tcp(127.0.0.1:3306)/database
--               url = "root:rootpassword@tcp(127.0.0.1:3306)/test_db",
--             },

--             {
--               name = "Postgres Local",
--               type = "postgres",
--               url = "postgres://postgres:postgres@localhost:5432/test_db?sslmode=disable",
--             },
            
--             {
--               name = "MariaDB Local",
--               type = "mysql", -- MariaDB nutzt den mysql Treiber
--               url = "root:rootpassword@tcp(127.0.0.1:3306)/test_db",
--             },
--           }),

--           sources.FileSource:new(
--             vim.fn.stdpath("cache") .. "/dbee/persistence.json"
--           ),
--         },
--       }
--     end,

--     config = function(_, opts)
--       require("dbee").setup(opts)
--     end,

--     keys = {
--       { "<leader>Dt", function() require("dbee").toggle() end, desc = "DBee: Toggle UI" },
--     },
--   },
-- }

-- return {
--   {
--     "kndndrj/nvim-dbee",
--     dependencies = { 
--       "MunifTanjim/nui.nvim" 
--     },
--     cmd = { "Dbee", "DbeeToggle", "DbeeOpen" },

--     -- build = function()
--     --   pcall(function()
--     --     require("dbee").install()
--     --   end)
--     -- end,

--     build = "make install", 

--     -- opts = {
--     --   sources = {
--     --     require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
--     --   },
--     -- },

--     opts = {},

--     config = function(_, opts)
--       require("dbee").setup(opts)
--     end,

--     keys = {
--       { "<leader>Dt", function() require("dbee").toggle() end, desc = "DBee: Toggle UI" },
--     },
--   },
-- }

return {
  {
    "kndndrj/nvim-dbee",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = { "Dbee", "DbeeToggle", "DbeeOpen" },
    build = function()
      -- Nutzt die interne Installationsroutine des Plugins
      require("dbee").install()
    end,
    config = function()
      local dbee = require("dbee")
      local sources = require("dbee.sources")

      dbee.setup({
        sources = {
          -- Sicher: Secrets kommen aus der Umgebungsvariable
          sources.EnvSource:new("DBEE_CONNECTIONS"),
          -- Praktisch für temporäre Verbindungen im UI
          sources.MemorySource:new(),
        },
      })
    end,
    keys = {
      -- Lazy-loading: Plugin lädt erst beim Drücken des Hotkeys
      { "<leader>Dt", function() require("dbee").toggle() end, desc = "DBee: Toggle UI" },
    },
  },
}

```

## plugins/bash.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/bash.lua
```

```bash
nano plugins/bash.lua
```

```bash
code plugins/bash.lua
```

```lua
-- plugins/bash.lua

return {
  {
    "neovim/nvim-lspconfig",
    ft = { "sh", "bash", "zsh" },
    opts = {
      servers = {
        bashls = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    ft = { "sh", "bash", "zsh" },
    optional = true,
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
      },
    },
  },
}

```

## plugins/matlab.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/matlab.lua
```

```bash
nano plugins/matlab.lua
```

```bash
code plugins/matlab.lua
```

```lua
-- plugins/matlab.lua

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        matlab_ls = {
          settings = {
            MATLAB = {
              installPath = "/usr/local/MATLAB/R2025b",
              indexWorkspace = true,
              telemetry = false,
              matlabConnectionTiming = "onStart", -- WICHTIG: Startet Engine nur wenn nötig
            },
          },
          -- Wir sagen Neovim, dass dieser Server KEIN Formatting kann,
          -- um den automatischen Timeout-Error zu verhindern.
          on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false

            -- Lokale LSP-Navi (überschreibt Global nur hier im Buffer!)
            local bopts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bopts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, bopts)
          end,
        },
      })
    end,
    init = function()
      local group = vim.api.nvim_create_augroup("MatlabFix", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "matlab",
        callback = function(args)
          vim.opt_local.shiftwidth = 4
          vim.opt_local.tabstop = 4
          vim.opt_local.expandtab = true

          -- LSP Keymap nur für Doc/Hover
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })

          -- MANUELLES FORMATIEREN (Vim-Native statt LSP)
          -- Das hier erzeugt NIEMALS einen LSP-Timeout!
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = group,
            buffer = args.buf,
            callback = function()
              local view = vim.fn.winsaveview()
              vim.cmd("silent! normal! gg=G")
              vim.fn.winrestview(view)
            end,
          })
        end,
      })
    end,
  },
}

```

## plugins/programmierprojekt.lua

Diese Konfiguration ist ausschließlich für meine persönlichen Bedürfnisse angepasst. Sie stellt sicher, dass beim Speichern von Dateien keinerlei automatische Änderungen am Code-Style vorgenommen werden. 

Zudem werden sämtliche zusätzlichen Formatierungswerkzeuge (Formatter, Linter) aus Mason und anderen Plugins unterdrückt oder entfernt, damit der ursprüngliche Text exakt so erhalten bleibt, wie ich ihn geschrieben habe.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/programmierprojekt.lua
```

```bash
nano plugins/programmierprojekt.lua
```

```bash
code plugins/programmierprojekt.lua
```

```lua
-- plugins/programmierprojekt.lua

-- return {
--   {
--     "stevearc/conform.nvim",
--     priority = 100, -- Hohe Priorität, damit es andere Configs überschreibt
--     opts = function(_, opts)
--       opts.format_on_save = false
--       opts.formatters_by_ft = {} -- Löscht alle Zuweisungen (Prettier, xmlformat etc.)
--     end,
--   },

--   {
--     "neovim/nvim-lspconfig",
--     priority = 100,
--     opts = function(_, opts)
--       opts.autoformat = false -- Schaltet das Standard-Autoformat von LazyVim aus
      
--       -- Dieser Block entzieht JEDEM LSP-Server das Recht zu formatieren
--       opts.setup = {
--         ["*"] = function(client)
--           if client then
--             client.server_capabilities.documentFormattingProvider = false
--             client.server_capabilities.documentRangeFormattingProvider = false
--           end
--         end,
--       }
--     end,
--   },

--   {
--     "neovim/nvim-lspconfig",
--     config = function()
--       -- Wir erstellen eine Funktion, die beim Start von Neovim alle 
--       -- eventuellen "Format-beim-Speichern" Autocmds blockiert.
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         pattern = "*",
--         callback = function()
--           -- Hier passiert absichtlich NICHTS. 
--           -- Das verhindert, dass Plugins wie ESLint oder Prettier 
--           -- ungefragt den Code verschieben.
--         end,
--       })
--     end,
--   },
-- }

```

## plugins/dap.lua

Hier wird nur der Debugger (DAP) für C, C++ und Rust konfiguriert. Der Java-Debugger funktioniert bereits ohne zusätzliche Einrichtung. Für Python, JavaScript, TypeScript etc. brauche ich vorerst keinen Debugger – generell verwende ich Debugger sowieso nicht so oft. Wenn man dringend einen benötigt, kann man den Code schnell in PyCharm, IntelliJ, CLion, VS Code oder Eclipse debuggen.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/dap.lua
```

```bash
nano plugins/dap.lua
```

```bash
code plugins/dap.lua
```

```lua
-- plugins/dap.lua

-- return {
--   {
--     "mfussenegger/nvim-dap",
--     dependencies = {
--       {
--         "rcarriga/nvim-dap-ui",
--         dependencies = {
--           "nvim-neotest/nvim-nio",
--         },
--       },
--       "jay-babu/mason-nvim-dap.nvim",
--     },
--     config = function()
--       local dap = require("dap")
--       local dapui = require("dapui")

--       local mason_path = vim.fn.stdpath("data") .. "/mason"
--       local codelldb_path =
--         mason_path .. "/packages/codelldb/extension/adapter/codelldb"

--       require("mason-nvim-dap").setup({
--         ensure_installed = { "codelldb" },
--       })

--       dapui.setup()

--       dap.listeners.after.event_initialized["dapui"] = function()
--         dapui.open()
--       end
--       dap.listeners.before.event_terminated["dapui"] = function()
--         dapui.close()
--       end
--       dap.listeners.before.event_exited["dapui"] = function()
--         dapui.close()
--       end

--       dap.adapters.codelldb = {
--         type = "server",
--         port = "${port}",
--         executable = {
--           command = codelldb_path,
--           args = { "--port", "${port}" },
--         },
--       }

--       dap.configurations.rust = {
--         {
--           name = "Debug",
--           type = "codelldb",
--           request = "launch",
--           program = function()
--             return vim.fn.input(
--               "Path to executable: ",
--               vim.fn.getcwd() .. "/target/debug/",
--               "file"
--             )
--           end,
--           cwd = "${workspaceFolder}",
--           stopOnEntry = false,
--           args = {},
--         },
--       }

--       dap.configurations.cpp = {
--         {
--           name = "Debug",
--           type = "codelldb",
--           request = "launch",
--           program = function()
--             return vim.fn.input(
--               "Path to executable: ",
--               vim.fn.getcwd() .. "/build/",
--               "file"
--             )
--           end,
--           cwd = "${workspaceFolder}",
--           stopOnEntry = false,
--           args = {},
--         },
--       }

--       dap.configurations.c = dap.configurations.cpp
--     end,
--    },
-- }

-- return {
--   {
--     "mfussenegger/nvim-dap",
--     dependencies = {
--       {
--         "rcarriga/nvim-dap-ui",
--         dependencies = {
--           "nvim-neotest/nvim-nio",
--         },
--       },
--       "jay-babu/mason-nvim-dap.nvim",
--       "mfussenegger/nvim-dap-python",
--     },
--     config = function()
--       local dap = require("dap")
--       local dapui = require("dapui")

--       local mason_path = vim.fn.stdpath("data") .. "/mason"
--       local codelldb_path =
--         mason_path .. "/packages/codelldb/extension/adapter/codelldb"

--       -- require("mason-nvim-dap").setup({
--       --   ensure_installed = { "codelldb" , "python"},
--       -- })
      
--       require("mason-nvim-dap").setup({
--         ensure_installed = { "codelldb"},
--       })

--       dapui.setup()

--       dap.listeners.after.event_initialized["dapui"] = function()
--         dapui.open()
--       end
--       dap.listeners.before.event_terminated["dapui"] = function()
--         dapui.close()
--       end
--       dap.listeners.before.event_exited["dapui"] = function()
--         dapui.close()
--       end

--       dap.adapters.codelldb = {
--         type = "server",
--         port = "${port}",
--         executable = {
--           command = codelldb_path,
--           args = { "--port", "${port}" },
--         },
--       }

--       dap.configurations.rust = {
--         {
--           name = "Debug",
--           type = "codelldb",
--           request = "launch",
--           program = function()
--             return vim.fn.input(
--               "Path to executable: ",
--               vim.fn.getcwd() .. "/target/debug/",
--               "file"
--             )
--           end,
--           cwd = "${workspaceFolder}",
--           stopOnEntry = false,
--           args = {},
--         },
--       }

--       dap.configurations.cpp = {
--         {
--           name = "Debug",
--           type = "codelldb",
--           request = "launch",
--           program = function()
--             return vim.fn.input(
--               "Path to executable: ",
--               vim.fn.getcwd() .. "/build/",
--               "file"
--             )
--           end,
--           cwd = "${workspaceFolder}",
--           stopOnEntry = false,
--           args = {},
--         },
--       }

--       dap.configurations.c = dap.configurations.cpp

--       -- https://github.com/nvim-java/nvim-java ersetzt das!
--       -- dap.adapters.java = function(callback)
--       --   callback({
--       --     type = "server",
--       --     host = "127.0.0.1",
--       --     port = 5005,  -- Standardport für jdtls Debug
--       --   })
--       -- end

--       -- dap.configurations.java = {
--       --   {
--       --     type = "java",
--       --     request = "launch",
--       --     name = "Debug Current File",
--       --     mainClass = "${file}", 
--       --     projectName = "MeinProjekt",
--       --     cwd = vim.fn.getcwd(),
--       --     console = "integratedTerminal",
--       --   },
--       -- }

--       -- local function get_python_bin()
--       --   local python = vim.fn.getcwd() .. "/venv/bin/python"
--       --   if vim.fn.executable(python) == 1 then
--       --     return python
--       --   end
--       --   return vim.fn.exepath("python3")
--       -- end

--       -- require("dap-python").setup(get_python_bin())

--       -- local function get_python_bin()
--       --   local venv = vim.fn.getcwd() .. "/venv/bin/python"
--       --   if vim.fn.executable(venv) == 1 then
--       --     return venv
--       --   end
--       --   return vim.fn.exepath("python3")
--       -- end

--       -- require("dap-python").setup(get_python_bin())
--       -- dap.lua (Python-relevant Teil)
--     end,
--   },

--   -- {
--   --   "Weissle/persistent-breakpoints.nvim",
--   --   config = function()
--   --     require("persistent-breakpoints").setup({
--   --       save_dir = vim.fn.stdpath("data") .. "/breakpoints",
--   --       load_breakpoints_event = { "BufReadPost" },
--   --     })
--   --   end,
--   -- },
-- }

-- local function get_python_bin()
--   local venv = vim.fn.getcwd() .. "/venv/bin/python"
--   if vim.fn.executable(venv) == 1 then
--     return venv
--   end

--   -- Mason debugpy Pfad
--   local mason_debugpy = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
--   if vim.fn.executable(mason_debugpy) == 1 then
--     return mason_debugpy
--   end

--   return vim.fn.exepath("python3")
-- end

-- return {
--   {
--     "mfussenegger/nvim-dap",
--     cmd = { "DapContinue", "DapToggleBreakpoint", "DapUI" },
--     dependencies = {
--       {
--         "rcarriga/nvim-dap-ui",
--         dependencies = {
--           "nvim-neotest/nvim-nio",
--         },
--       },
--       "jay-babu/mason-nvim-dap.nvim",
--       "mfussenegger/nvim-dap-python",
--     },
--     config = function()
--       local dap = require("dap")
--       local dapui = require("dapui")

--       local mason_path = vim.fn.stdpath("data") .. "/mason"
--       local codelldb_path =
--         mason_path .. "/packages/codelldb/extension/adapter/codelldb"

--       require("mason-nvim-dap").setup({
--         ensure_installed = { "codelldb" , "python"},
--       })
      
--       -- require("mason-nvim-dap").setup({
--       --   ensure_installed = { "codelldb"},
--       -- })

--       -- Mason Debug Adapter
--       -- require("mason-nvim-dap").setup({
--       --   ensure_installed = {
--       --     "codelldb",
--       --     "python", -- debugpy
--       --   },
--       -- })

--       dapui.setup()

--       dap.listeners.after.event_initialized["dapui"] = function()
--         dapui.open()
--       end
--       dap.listeners.before.event_terminated["dapui"] = function()
--         dapui.close()
--       end
--       dap.listeners.before.event_exited["dapui"] = function()
--         dapui.close()
--       end

--       dap.adapters.codelldb = {
--         type = "server",
--         port = "${port}",
--         executable = {
--           command = codelldb_path,
--           args = { "--port", "${port}" },
--         },
--       }

--       -- dap.configurations.rust = {
--       --   {
--       --     name = "Debug",
--       --     type = "codelldb",
--       --     request = "launch",
--       --     program = function()
--       --       return vim.fn.input(
--       --         "Path to executable: ",
--       --         vim.fn.getcwd() .. "/target/debug/",
--       --         "file"
--       --       )
--       --     end,
--       --     cwd = "${workspaceFolder}",
--       --     stopOnEntry = false,
--       --     args = {},
--       --   },
--       -- }

--       dap.configurations.rust = {
--         {
--           name = "Debug Rust",
--           type = "codelldb",
--           request = "launch",
--           program = function()
--             local cwd = vim.fn.getcwd()
--             local crate = vim.fn.fnamemodify(cwd, ":t")
--             return cwd .. "/target/debug/" .. crate
--           end,
--           cwd = "${workspaceFolder}",
--           stopOnEntry = false,
--           args = {},
--         },
--       }

--       dap.configurations.cpp = {
--         {
--           name = "Debug",
--           type = "codelldb",
--           request = "launch",
--           program = function()
--             return vim.fn.input(
--               "Path to executable: ",
--               vim.fn.getcwd() .. "/build/",
--               "file"
--             )
--           end,
--           cwd = "${workspaceFolder}",
--           stopOnEntry = false,
--           args = {},
--         },
--       }

--       dap.configurations.c = dap.configurations.cpp

--       -- https://github.com/nvim-java/nvim-java ersetzt das!
--       -- dap.adapters.java = function(callback)
--       --   callback({
--       --     type = "server",
--       --     host = "127.0.0.1",
--       --     port = 5005,  -- Standardport für jdtls Debug
--       --   })
--       -- end

--       -- dap.configurations.java = {
--       --   {
--       --     type = "java",
--       --     request = "launch",
--       --     name = "Debug Current File",
--       --     mainClass = "${file}", 
--       --     projectName = "MeinProjekt",
--       --     cwd = vim.fn.getcwd(),
--       --     console = "integratedTerminal",
--       --   },
--       -- }

--       -- local function get_python_bin()
--       --   local python = vim.fn.getcwd() .. "/venv/bin/python"
--       --   if vim.fn.executable(python) == 1 then
--       --     return python
--       --   end
--       --   return vim.fn.exepath("python3")
--       -- end

--       -- require("dap-python").setup(get_python_bin())

--       -- local function get_python_bin()
--       --   local venv = vim.fn.getcwd() .. "/venv/bin/python"
--       --   if vim.fn.executable(venv) == 1 then
--       --     return venv
--       --   end
--       --   return vim.fn.exepath("python3")
--       -- end

--       -- require("dap-python").setup(get_python_bin())
--       -- dap.lua (Python-relevant Teil)

--       -- Python
--       -- local ok, dap_python = pcall(require, "dap-python")
--       -- if ok then
--       --   dap_python.setup(get_python_bin())   -- verwendet Mason debugpy
--       --   dap_python.test_runner = "pytest"
--       -- else
--       --   vim.notify("dap-python konnte nicht geladen werden", vim.log.levels.WARN)
--       -- end

--       local ok, dap_python = pcall(require, "dap-python")
--       if ok then
--           -- Pfad zum Mason-Debugger (hier liegt das installierte debugpy)
--           local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
          
--           -- Prüfen, ob wir in einem lokalen Projekt-venv sind (optionaler Bonus)
--           local venv = vim.fn.getcwd() .. "/.venv/bin/python"
          
--           if vim.fn.executable(venv) == 1 then
--               -- Wenn Projekt-Venv da ist, nutze das (debugpy muss dort AUCH installiert sein)
--               dap_python.setup(venv)
--           else
--               -- Sonst nutze immer den globalen Mason-Debugger (sicherste Methode)
--               dap_python.setup(mason_path)
--           end

--           dap_python.test_runner = "pytest"
--       else
--           vim.notify("dap-python konnte nicht geladen werden", vim.log.levels.WARN)
--       end
--     end,
--   },

--   -- {
--   --   "Weissle/persistent-breakpoints.nvim",
--   --   config = function()
--   --     require("persistent-breakpoints").setup({
--   --       save_dir = vim.fn.stdpath("data") .. "/breakpoints",
--   --       load_breakpoints_event = { "BufReadPost" },
--   --     })
--   --   end,
--   -- },
-- }

return {
  {
    "mfussenegger/nvim-dap",
    cmd = { "DapContinue", "DapToggleBreakpoint", "DapUI" },

    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
      },
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
      "Weissle/persistent-breakpoints.nvim",

      -- OPTIONAL (safe geladen)
      "nvim-telescope/telescope.nvim",
      "nvim-telescope/telescope-dap.nvim",
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- MASON (ROBUST)
      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb", "python" },
        automatic_installation = true,
      })

      -- UI (STABIL + LESBAR)
      dapui.setup({
        expand_lines = true,
        render = {
          max_type_length = 80,
          max_value_lines = 20,
        },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.35 },
              { id = "stacks", size = 0.20 },
              { id = "breakpoints", size = 0.15 },
              { id = "watches", size = 0.30 },
            },
            size = 50,
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 12,
            position = "bottom",
          },
        },
      })

      -- WRAP FIX (SEHR WICHTIG)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "dapui_*" },
        callback = function()
          vim.wo.wrap = true
          vim.wo.linebreak = true
          vim.wo.breakindent = true
        end,
      })

      -- INLINE VALUES
      require("nvim-dap-virtual-text").setup({
        highlight_changed_variables = true,
        show_stop_reason = true,
      })

      -- BREAKPOINTS
      require("persistent-breakpoints").setup({
        load_breakpoints_event = { "BufReadPost" },
      })

      -- AUTO UI
      dap.listeners.after.event_initialized["dapui"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui"] = function()
        dapui.close()
      end

      -- CODELLDB (ULTRA STABLE)
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb",
          args = { "--port", "${port}" },
        },
        enrich_config = function(config, on_config)
          config.initCommands = {
            "settings set target.x86-disassembly-flavor intel",
            'settings set frame-format "{frame.pc} {function.name}\\n"',
          }
          on_config(config)
        end,
      }

      -- RUST (BEST PRACTICE)
      local function get_rust_binary()
        -- versuche cargo metadata (beste methode)
        local cwd = vim.fn.getcwd()
        local handle = io.popen("cargo metadata --format-version 1 --no-deps 2>/dev/null")
        if handle then
          local result = handle:read("*a")
          handle:close()

          local ok, json = pcall(vim.fn.json_decode, result)
          if ok and json and json.packages then
            local name = json.packages[1].name
            return cwd .. "/target/debug/" .. name
          end
        end

        -- fallback
        local crate = vim.fn.fnamemodify(cwd, ":t")
        return cwd .. "/target/debug/" .. crate
      end

      dap.configurations.rust = {
        {
          name = "Debug Rust (cargo)",
          type = "codelldb",
          request = "launch",
          program = get_rust_binary,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = function()
            return vim.split(vim.fn.input("Args: "), " ")
          end,
        },
      }

      -- C / C++
      -- dap.configurations.cpp = {
      --   {
      --     name = "Debug binary",
      --     type = "codelldb",
      --     request = "launch",
      --     program = function()
      --       return vim.fn.input("Binary: ", vim.fn.getcwd() .. "/", "file")
      --     end,
      --     cwd = "${workspaceFolder}",
      --     stopOnEntry = false,
      --   },
      -- }
      -- dap.configurations.c = dap.configurations.cpp

      local function get_cpp_binary()
        local cwd = vim.fn.getcwd()

        local candidates = {
          cwd .. "/build/app",
          cwd .. "/build/main",
          cwd .. "/a.out",
        }

        for _, path in ipairs(candidates) do
          if vim.fn.filereadable(path) == 1 then
            return path
          end
        end

        -- fallback → user input
        return vim.fn.input("Binary: ", cwd .. "/", "file")
      end

      dap.configurations.cpp = {
        {
          name = "Debug (auto)",
          type = "codelldb",
          request = "launch",
          program = get_cpp_binary,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp

      -- PYTHON (ROBUST)
      -- local function get_python()
      --   local cwd = vim.fn.getcwd()
      --   local venvs = {
      --     cwd .. "/.venv/bin/python",
      --     cwd .. "/venv/bin/python",
      --   }

      --   for _, v in ipairs(venvs) do
      --     if vim.fn.executable(v) == 1 then
      --       return v
      --     end
      --   end

      --   return "python3"
      -- end

      -- require("dap-python").setup(get_python())

      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"

      require("dap-python").setup(mason_path)

      -- TELESCOPE (SAFE LOAD!)
      local ok_telescope, telescope = pcall(require, "telescope")
      if ok_telescope then
        pcall(telescope.load_extension, "dap") -- KEIN CRASH MEHR
      end

      -- KEYMAPS (STABIL)
      local map = vim.keymap.set

      -- map("n", "<F5>", dap.continue)
      -- map("n", "<F10>", dap.step_over)
      -- map("n", "<F11>", dap.step_into)
      -- map("n", "<F12>", dap.step_out)

      -- map("n", "<leader>b", dap.toggle_breakpoint)
      -- map("n", "<leader>dr", dap.repl.open)

      map("n", "<leader>ds", function()
        pcall(function()
          require("telescope").extensions.dap.frames()
        end)
      end)

      -- SIGNS
      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DiagnosticError",
      })

      vim.fn.sign_define("DapStopped", {
        text = "▶",
        texthl = "DiagnosticWarn",
      })
    end,
  },
}

```

## config/autocmds.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim config/autocmds.lua
```

```bash
nano config/autocmds.lua
```

```bash
code config/autocmds.lua
```

```lua
-- config/autocmds.lua

-- Rust: format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.rs",
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.rs",
--   callback = function()
--     vim.lsp.buf.format({
--       async = false,
--       filter = function(client)
--         return client.name == "rust_analyzer"
--       end,
--     })
--   end,
-- })

-- Rust format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.rs",
--   callback = function()
--     vim.lsp.buf.format({
--       async = false,
--       filter = function(client)
--         return client.name == "rust_analyzer"
--       end,
--     })
--   end,
-- })

-- -- Always end file with newline
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function()
--     local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
--     if #lines == 0 or lines[#lines] ~= "" then
--       vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "markdown", "text", "rust", "c", "cpp", "java", "lua", "latex" },
--   callback = function()
--     vim.opt_local.spell = true
--     vim.opt_local.spelllang = { "en_us" }
--   end,
-- })

local augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

local opts = { noremap = true, silent = true }

function _G.run_in_term(cmd)
  vim.cmd("split | terminal " .. cmd)
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("WslLineEndings", { clear = true }),
  pattern = "*",
  callback = function()
    local path = vim.fn.expand("%:p")
    if path:find("^/mnt/") then
      vim.opt_local.fileformat = "dos"
    else
      vim.opt_local.fileformat = "unix"
    end
  end,
})

-- Formatierung beim Speichern:
-- 'async = true' sorgt dafür, dass die LSP-Formatierung **nicht den Editor blockiert**.
-- Der Rust Analyzer formatiert die Datei im Hintergrund, während du weiterarbeiten kannst.
-- Filter stellt sicher, dass nur 'rust_analyzer' die Formatierung übernimmt.
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = augroup,
--   pattern = "*.rs",
--   callback = function()
--     vim.lsp.buf.format({
--       async = true,
--       filter = function(client)
--         return client.name == "rust_analyzer"
--       end,
--     })
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "text", "latex" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "rust_analyzer" then
      vim.lsp.codelens.refresh()
    end
  end,
})

vim.api.nvim_create_autocmd(
  { "BufEnter", "BufWritePost", "InsertLeave" },
  {
    group = augroup,
    pattern = "*.rs",
    callback = function()
      pcall(vim.lsp.codelens.refresh)
    end,
  }
)

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.fxml",
  callback = function()
    vim.bo.filetype = "xml"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "rust",
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set("n", "<leader>rid", function() 
      run_in_term("code .") 
    end, { desc = "Open Project in VS Code", silent = true, buffer = true } )
    vim.keymap.set("n", "<leader>rir", function() 
      run_in_term("rustrover .") 
    end, { desc = "Open Project in RustRover", silent = true, buffer = true })

    -- vim.keymap.set("n", "<leader>rra", ":split | terminal cargo build && cargo run<CR>", opts) 
    -- vim.keymap.set("n", "<leader>rrr", ":split | terminal cargo run<CR>", opts) 
    -- vim.keymap.set("n", "<leader>rrb", ":split | terminal cargo build<CR>", opts) 
    -- vim.keymap.set("n", "<leader>rrt", ":split | terminal cargo test<CR>", opts) 
    -- vim.keymap.set("n", "<leader>rrc", ":edit Cargo.toml<CR>", opts)

    vim.keymap.set("n", "<leader>rcr",
      ":split | terminal rustc % -o %:t:r && ./%:t:r<CR>",
      { desc = "Rustc Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rco",
      ":split | terminal rustc % -O -o %:t:r && ./%:t:r<CR>",
      { desc = "Rustc Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcd",
      ":split | terminal rustc % -g -o %:t:r && ./%:t:r<CR>",
      { desc = "Rustc Debug Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcn",
      ":split | terminal rustc % -C target-cpu=native -o %:t:r && ./%:t:r<CR>",
      { desc = "Rustc Native Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcl",
      ":split | terminal rustc % -C lto -o %:t:r && ./%:t:r<CR>",
      { desc = "Rustc LTO Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcs",
      ":split | terminal rustc % -C strip=symbols -o %:t:r && ./%:t:r<CR>",
      { desc = "Rustc Strip Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcp",
      ":split | terminal rustc % -C panic=abort -o %:t:r && ./%:t:r<CR>",
      { desc = "Rustc Panic Abort Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rci",
      ":split | terminal rustc % -C incremental=target/ -o %:t:r && ./%:t:r<CR>",
      { desc = "Rustc Incremental Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcc",
      ":split | terminal rustc % -C codegen-units=1 -o %:t:r && ./%:t:r<CR>",
      { desc = "Rustc Incremental Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rce",
      ":split | terminal rustc % --edition=2021 -o %:t:r && ./%:t:r<CR>",
      { desc = "Rustc Edition 2021 Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcw",
      ":split | terminal rustc % -D warnings -o %:t:r && ./%:t:r<CR>",
      { desc = "Rustc Deny Warnings Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rca",
      ":split | terminal rustc % --emit=asm<CR>",
      { desc = "Rustc Emit ASM (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcll",
      ":split | terminal rustc % --emit=llvm-ir<CR>",
      { desc = "Rustc Emit LLVM-IR (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcoj",
      ":split | terminal rustc % --emit=obj<CR>",
      { desc = "Rustc Emit Object (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rchk",
      ":split | terminal rustc % --emit=metadata<CR>",
      { desc = "Rustc Emit Metadata (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rct",
      ":split | terminal rustc % --target x86_64-unknown-linux-gnu -o %:t:r<CR>",
      { desc = "Rustc Target Linux Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rclib",
      ":split | terminal rustc % --crate-type=staticlib<CR>",
      { desc = "Rustc Emit Static Library (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcdy",
      ":split | terminal rustc % --crate-type=dylib<CR>",
      { desc = "Rustc Emit Dynamic Library (Split)", silent = true, buffer = true }
    )

    -- Cargo command im Split-Terminal ausführen
    local function my_cargo(cmd)
      vim.cmd("split | terminal cargo " .. cmd)
    end

    -- Run / Build Basics
    vim.keymap.set("n", "<leader>rrr", function() my_cargo("run") end, { desc = "Cargo Run (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrb", function() my_cargo("build") end, { desc = "Cargo Build (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rra", function() my_cargo("build && cargo run") end, { desc = "Cargo Build & Run (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrt", function() my_cargo("test") end, { desc = "Cargo Build & Run (Split)", silent = true, buffer = true })

    vim.keymap.set("n", "<leader>rrAar", function()
      local cmd = table.concat({
        "cargo fmt --all -- --check",
        "cargo check --all-targets --all-features",
        "cargo clippy --all-targets --all-features -- -D warnings",
        "cargo test --all-features",
        "cargo audit",
        "cargo deny check",
      }, " && ")

      vim.cmd("split | terminal bash -c " .. vim.fn.shellescape(cmd))
    end, {
      desc = "Rust Full CI Pipeline (Ultimate)",
      silent = true,
      buffer = true,
    })

    vim.keymap.set("n", "<leader>rrAaa", function()
      local cmd = table.concat({
        -- Format & Style
        "cargo fmt --all -- --check",

        -- Static Checks
        "cargo check --all-targets --all-features",
        "cargo clippy --all-targets --all-features -- -D warnings -W clippy::pedantic -W clippy::nursery",

        -- Tests
        "cargo test --all-features --all-targets",

        -- UB / Unsafe Checks (best effort)
        "cargo +nightly miri test",

        -- Dependency Security
        "cargo audit",
        "cargo deny check",

        -- Outdated Dependencies (optional aber sinnvoll)
        "cargo outdated || true",

      }, " && ")

      vim.cmd("split | terminal bash -c " .. vim.fn.shellescape(cmd))
    end, {
      desc = "Rust Ultimate Safety Pipeline",
      silent = true,
      buffer = true,
    })

    -- Release Mode
    vim.keymap.set("n", "<leader>rrR", function() my_cargo("run --release") end, { desc = "Cargo Run Release (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrBR", function() my_cargo("build --release") end, { desc = "Cargo Build Release (Split)", silent = true, buffer = true })

    -- Professional Cargo Terminal Runner (Safe)
    local cargo = {
      buf = nil,
      win = nil,
      job = nil,
    }

    -- Terminal Management
    local function is_job_running()
      return cargo.job and vim.fn.jobwait({ cargo.job }, 0)[1] == -1
    end

    local function reset_state()
      cargo.buf = nil
      cargo.win = nil
      cargo.job = nil
    end

    local function open_terminal(height)
      height = height or 20

      vim.cmd("botright " .. height .. "split")
      vim.cmd("terminal")

      cargo.win = vim.api.nvim_get_current_win()
      cargo.buf = vim.api.nvim_get_current_buf()
    end

    local function close_terminal()
      if cargo.win and vim.api.nvim_win_is_valid(cargo.win) then
        vim.api.nvim_win_close(cargo.win, true)
      end
      reset_state()
    end

    -- Core Runner
    local function run_cargo_command(cmd, title)
      if is_job_running() then
        vim.notify("Cargo process already running.", vim.log.levels.WARN)
        return
      end

      -- open_terminal(20)
      cargo.buf = vim.api.nvim_create_buf(false, true) -- scratch buffer
      vim.api.nvim_open_win(cargo.buf, true, {
        relative = "editor",
        width = vim.o.columns,
        height = 20,
        row = vim.o.lines - 20,
        col = 0,
        style = "minimal",
        border = { "─", "─", "─", " ", " ", " ", " ", " " }, 
      })
      vim.api.nvim_buf_set_name(cargo.buf, "Cargo :: " .. title)

      cargo.job = vim.fn.termopen(cmd, {
        on_exit = function(_, code)
          vim.schedule(function()
            local status = code == 0 and "SUCCESS" or "FAILURE"
            if cargo.buf and vim.api.nvim_buf_is_valid(cargo.buf) then
              vim.api.nvim_buf_set_option(cargo.buf, "modifiable", true)
              vim.api.nvim_buf_set_lines(cargo.buf, -1, -1, false, {
                "",
                "===================================================",
                "Cargo Command  : " .. title,
                "Exit Code      : " .. code,
                "Status         : " .. status,
                "Finished At    : " .. os.date("%Y-%m-%d %H:%M:%S"),
                "===================================================",
                "",
              })
              vim.api.nvim_buf_set_option(cargo.buf, "modifiable", false)  -- lock it again
            end
            reset_state()
          end)
        end,
      })
    end

    -- Cargo Test
    local function cargo_test(args)
      local cmd = {
        "env",
        "RUST_BACKTRACE=1",
        "cargo",
        "test",
        "--all-targets",
        "--color=always",
        "--",
        "--show-output",
      }

      for _, a in ipairs(args or {}) do
        table.insert(cmd, a)
      end

      run_cargo_command(cmd, "cargo test")
    end

    -- Keymaps
    vim.keymap.set("n", "<leader>rret", function()
      cargo_test({})
    end, { desc = "Cargo Test (Workspace) - experimental", silent = true, buffer = true })

    vim.keymap.set("n", "<leader>rreT", function()
      cargo_test({ "--nocapture" })
    end, { desc = "Cargo Test No Capture - experimental", silent = true, buffer = true })

    vim.keymap.set("n", "<leader>rref", function()
      local testname = vim.fn.expand("<cword>")
      cargo_test({ testname, "--nocapture" })
    end, { desc = "Cargo Test Current - experimental", silent = true, buffer = true })

    vim.keymap.set("n", "<leader>tnef", function()
      local file = vim.fn.expand("%:t:r")
      cargo_test({ "--test", file, "--nocapture" })
    end, { desc = "Cargo Test File - experimental", silent = true, buffer = true })

    vim.keymap.set("n", "<leader>rrntr", function()
      require("neotest").run.run()
    end, { desc = "Run Nearest Test" })

    vim.keymap.set("n", "<leader>rrntf", function()
      require("neotest").run.run(vim.fn.expand("%"))
    end, { desc = "Run File Tests" })

    vim.keymap.set("n", "<leader>rrnts", function()
      require("neotest").summary.toggle()
    end, { desc = "Test Summary" })

    vim.keymap.set("n", "<leader>rrnto", function()
      require("neotest").output.open({ enter = true })
    end, { desc = "Test Output" })

    vim.keymap.set("n", "<leader>rrntx", function()
      require("neotest").run.stop()
    end, { desc = "Stop Tests" })

    -- Stop Running Job
    vim.keymap.set("n", "<leader>tnx", function()
      if is_job_running() then
        vim.fn.jobstop(cargo.job)
        vim.notify("Cargo process stopped.", vim.log.levels.INFO)
        reset_state()
      else
        vim.notify("No running Cargo process.", vim.log.levels.INFO)
      end
    end, { desc = "Cargo Stop", buffer = true })

    -- Quickfix Navigation
    vim.keymap.set("n", "<leader>tnp", "<cmd>cwindow<CR>",
      { desc = "Quickfix Toggle", buffer = true })

    vim.keymap.set("n", "]t", "<cmd>cnext<CR>", { buffer = true })
    vim.keymap.set("n", "[t", "<cmd>cprev<CR>", { buffer = true })

    -- Standard Audit
    vim.keymap.set("n", "<leader>rrAr", function() my_cargo("audit") end, { desc = "Cargo Audit", silent = true, buffer = true })

    -- Versucht Sicherheitslücken direkt zu beheben (aktualisiert Cargo.toml/lock)
    vim.keymap.set("n", "<leader>rrAf", function() my_cargo("audit fix") end, { desc = "Cargo Audit Fix", silent = true, buffer = true })

    -- Zeigt auch Warnungen für bereits veraltete (yanked) Crates an
    vim.keymap.set("n", "<leader>rrAy", function() my_cargo("audit --yanked") end, { desc = "Cargo Audit (Yanked)", silent = true, buffer = true })

    -- Ignoriert die Datenbank-Aktualisierung (schneller, wenn man gerade erst geupdatet hat)
    vim.keymap.set("n", "<leader>rrAn", function() my_cargo("audit -n") end, { desc = "Cargo Audit (No-Fetch)", silent = true, buffer = true })

    -- Bonus: Cargo Deny (falls installiert, prüft auch Lizenzen und Dubletten)
    vim.keymap.set("n", "<leader>rrAd", function() my_cargo("deny check") end, { desc = "Cargo Deny Check", silent = true, buffer = true })

    vim.keymap.set("n", "<leader>rrff", function()
      my_cargo("flamegraph")
    end, { desc = "Cargo Flamegraph", silent = true, buffer = true })

    vim.keymap.set("n", "<leader>rrfr", function()
      vim.fn.jobstart({
        "samply",
        "record",
        "cargo",
        "run",
        "--release"
      }, {
        detach = true,
      })
    end, { desc = "Rust Profile (samply)", silent = true, buffer = true })

    vim.keymap.set("n", "<leader>rrfr", function()
      vim.cmd("write")
      vim.fn.jobstart({ "cargo", "build", "--release" }, {
        on_exit = function(_, code)
          if code == 0 then
            vim.fn.jobstart({
              "samply", "record", "cargo", "run", "--release"
            }, { detach = true })
          end
        end,
      })
    end, { desc = "Build + Profile", buffer = true })

    -- Hilfsfunktion um den Projektnamen (Binärdatei) zu finden
    local function get_project_name()
      local toml = vim.fn.findfile("Cargo.toml", ".;")
      if toml ~= "" then
        for line in io.lines(toml) do
          local name = line:match('^name%s*=%s*"(.-)"')
          if name then return name end
        end
      end
      return nil
    end

    -- Der neue Befehl für Binaries
    vim.keymap.set("n", "<leader>rrAb", function()
      local name = get_project_name()
      if name then
        -- Prüft die Debug-Binary auf Sicherheitslücken
        my_cargo("audit bin target/debug/" .. name)
      else
        print("Cargo.toml nicht gefunden!")
      end
    end, { desc = "Cargo Audit Binary (Debug)", silent = true, buffer = true })

    -- Optional: Audit für die Release-Binary (optimiert)
    vim.keymap.set("n", "<leader>rrAB", function()
      local name = get_project_name()
      if name then
        my_cargo("audit bin target/release/" .. name)
      else
        print("Cargo.toml nicht gefunden!")
      end
    end, { desc = "Cargo Audit Binary (Release)", silent = true, buffer = true })

    -- Benchmarks & Performance
    vim.keymap.set("n", "<leader>rrBB", function() my_cargo("bench") end, { desc = "Cargo Bench (Split)", silent = true, buffer = true }) -- Alle Benchmarks ausführen

    -- Benchmark-Vergleiche (Erfordert installiertes critcmp)
    -- vim.keymap.set("n", "<leader>rrcc", function()
    --   -- Führt critcmp für die zwei Standard-Baselines aus
    --   vim.cmd("split | term critcmp main feature")
    -- end, opts)

    -- Nextest (falls installiert – deutlich schneller)
    vim.keymap.set("n", "<leader>rrn", function()
      my_cargo("nextest run")
    end, { desc = "Cargo Nextest Run (Split)", silent = true, buffer = true })

    -- Quality / Professional Dev Tools
    vim.keymap.set("n", "<leader>rrc", function() my_cargo("check") end, { desc = "Cargo Check (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrl", function() my_cargo("clippy") end, { desc = "Cargo Clippy (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrFs", function() my_cargo("fmt") end, { desc = "Cargo Format (Split)", silent = true, buffer = true })

    -- Cleanup / Docs / Benchmarks
    vim.keymap.set("n", "<leader>rrx", function() my_cargo("clean") end, { desc = "Cargo Clean (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrd", function() my_cargo("doc --open") end, { desc = "Cargo Doc Open (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrBM", function() my_cargo("bench") end, { desc = "Cargo Bench (Split)", silent = true, buffer = true })

    -- Cargo Files schnell öffnen
    vim.keymap.set("n", "<leader>rrCc", ":edit Cargo.toml<CR>", { desc = "Edit Cargo.toml (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrLl", ":edit Cargo.lock<CR>", { desc = "Edit Cargo.lock (Split)", silent = true, buffer = true })

    vim.keymap.set("n", "<leader>rrw", function()
      my_cargo('watch -x "check"')
    end, { desc = "Cargo Watch Check", buffer = true })

    vim.keymap.set("n", "<leader>rrWw", function()
      my_cargo('watch -x "test"')
    end, { desc = "Cargo Watch Test", buffer = true })

    vim.keymap.set("n", "<leader>rrAA", function()
      local args = vim.fn.input("Args: ")
      my_cargo("run -- " .. args)
    end, { desc = "Cargo Run with Args", buffer = true })

    vim.keymap.set("n", "<leader>rrAD", function()
      local dep = vim.fn.input("Add crate: ")
      my_cargo("add " .. dep)
    end, { desc = "Cargo Add", buffer = true })

    vim.keymap.set("n", "<leader>rrRD", function()
      local dep = vim.fn.input("Remove crate: ")
      my_cargo("remove " .. dep)
    end, { desc = "Cargo Remove", buffer = true })

    vim.keymap.set("n", "<leader>rrATt", function()
      my_cargo("tree")
    end, { desc = "Cargo Tree", buffer = true })

    vim.keymap.set("n", "<leader>rrATT", function()
      my_cargo("tree -d")
    end, { desc = "Cargo Tree", buffer = true })

    vim.keymap.set("n", "<leader>rrFf", function()
      local feat = vim.fn.input("Features: ")
      my_cargo("run --features " .. feat)
    end, { desc = "Cargo Run Features", buffer = true })

    vim.keymap.set("n", "<leader>rrm", function()
      my_cargo("expand")
    end, { desc = "Cargo Expand", buffer = true })

    vim.keymap.set("n", "<leader>rrAs", function()
      my_cargo("asm")
    end, { desc = "Cargo ASM", buffer = true })

    vim.keymap.set("n", "<leader>rrBl", function()
      my_cargo("bloat --release")
    end, { desc = "Cargo Bloat", buffer = true })

    vim.keymap.set("n", "<leader>rrFx", function()
      my_cargo("fix --allow-dirty --allow-staged")
    end, { desc = "Cargo Fix", buffer = true })

    vim.keymap.set("n", "<leader>rrAcf", function()
      my_cargo("check --lib")
    end, { desc = "Cargo Check (Fast)", buffer = true })

    vim.keymap.set("n", "<leader>rrLog", function()
      vim.cmd("split | terminal RUST_LOG=debug cargo run")
    end, { desc = "Run with Logging", buffer = true })

    vim.keymap.set("n", "<leader>rrWs", function()
      my_cargo("build --workspace")
    end, { desc = "Workspace Build", buffer = true })

    vim.keymap.set("n", "<leader>rrCl", function()
      my_cargo("clippy --fix --allow-dirty")
    end, { desc = "Clippy Fix", buffer = true })

    -- Die Klassiker (Run & Stop)
    -- vim.keymap.set("n", "<leader>tnr", function() require("neotest").run.run() end, { desc = "Test Run (Nearest)", buffer = true })
    -- vim.keymap.set("n", "<leader>tnf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test Run (File)", buffer = true })
    -- vim.keymap.set("n", "<leader>tnx", function() require("neotest").run.stop() end, { desc = "Test Stop", buffer = true })

    -- Die UI / Übersicht (Dein Favorit)
    -- vim.keymap.set("n", "<leader>tns", function() require("neotest").summary.toggle() end, { desc = "Test Summary Toggle" })
    -- vim.keymap.set("n", "<leader>tno", function() require("neotest").output.open({ enter = true }) end, { desc = "Test Output (Popup)" })
    -- vim.keymap.set("n", "<leader>tnp", function() require("neotest").output_panel.toggle() end, { desc = "Test Panel (Log unten)" })

    -- Navigation (Schnell zwischen Fehlern springen)
    -- vim.keymap.set("n", "[t", function() require("neotest").jump.prev({ status = "failed" }) end, { desc = "Jump to Prev Failed Test" })
    -- vim.keymap.set("n", "]t", function() require("neotest").jump.next({ status = "failed" }) end, { desc = "Jump to Next Failed Test" })

    -- Watch Mode (Automatisch testen beim Speichern)
    -- (Erfordert nvim-neotest/neotest-watch, falls du das willst)
    -- vim.keymap.set("n", "<leader>tnw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, { desc = "Test Watch Toggle" })

    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end, opts)

    vim.keymap.set("n", "<F9>", function()
      require("dap").toggle_breakpoint()
    end, opts)

    vim.keymap.set("n", "<F10>", function()
      require("dap").step_over()
    end, opts)

    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into()
    end, opts)

    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out()
    end, opts)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "java",
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }

    local function map_if_free(mode, lhs, rhs)
      if vim.fn.mapcheck(lhs, mode) == "" then
        vim.keymap.set(mode, lhs, rhs, opts)
      end
    end

    vim.keymap.set("n", "<leader>rid", function() 
      run_in_term("code .") 
    end, { desc = "Open Project in VS Code", silent = true, buffer = true } )
    vim.keymap.set("n", "<leader>rir", function() 
      run_in_term("idea .") 
    end, { desc = "Open Project in Intellij", silent = true, buffer = true })

    -- Achtung: Diese Mappings sind für einfache Java-Dateien gedacht!
    -- Nicht in Gradle-, Maven- oder komplexen Projekten verwenden!

    vim.keymap.set("n", "<leader>rcr",
      ":split | terminal javac % && java -cp %:p:h %:t:r<CR>",
      { desc = "Java Compile & Run (Split)", silent = true, buffer = true } 
    )

    vim.keymap.set("n", "<leader>rcc",
      ":split | terminal javac %<CR>",
      { desc = "Java Compile (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcd",
      ":split | terminal javac -g % && java -cp %:p:h %:t:r<CR>",
      { desc = "Java Debug Compile & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rco",
      ":split | terminal javac -d . % && java -cp %:p:h %:t:r<CR>",
      { desc = "Java Compile to Directory & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcl",
      ":split | terminal javac -Xlint % && java -cp %:p:h %:t:r<CR>",
      { desc = "Java Compile Xlint & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcw",
      ":split | terminal javac -Werror % && java -cp %:p:h %:t:r<CR>",
      { desc = "Java Compile Werror & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcp",
      ":split | terminal javac -classpath . % && java -classpath . %:t:r<CR>",
      { desc = "Java Classpath Compile & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcs",
      ":split | terminal javac -sourcepath . % && java -cp %:p:h %:t:r<CR>",
      { desc = "Java Sourcepath Compile & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcv",
      ":split | terminal javac -verbose %<CR>",
      { desc = "Java Verbose Compile (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rci",
      ":split | terminal javac -implicit:none %<CR>",
      { desc = "Java No-Implicit Compile (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rct",
      ":split | terminal javac --release 17 % && java -cp %:p:h %:t:r<CR>",
      { desc = "Java Release 17 Compile & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rra", ":split | terminal sh -c './gradlew build && ./gradlew run'<CR>", { desc = "Gradle Build & Run (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrpo", ':split | terminal sh -c \'./gradlew run --args="client 0.0.0.0:1234"\'<CR>', { 
      desc = "Gradle: Run Client", 
      silent = true 
    })
    vim.keymap.set("n", "<leader>rrr", ":split | terminal ./gradlew run<CR>", { desc = "Gradle Run (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrb", ":split | terminal ./gradlew build<CR>", { desc = "Gradle Build (Split)", silent = true, buffer = true })

    -- Ganzen Testlauf starten
    vim.keymap.set("n", "<leader>rrtt", ":split | terminal ./gradlew test<CR>", { desc = "Gradle Test (Split)", silent = true, buffer = true })

    -- Nur aktuelle Testklasse
    map_if_free("n", "<leader>rrtc", function()
      local file = vim.fn.expand("%:t:r")
      vim.cmd("split | terminal ./gradlew test --tests " .. file)
    end, { desc = "Gradle Test Specific (Split)", silent = true, buffer = true })

    -- Testmethode unter Cursor (JUnit naming assumed)
    map_if_free("n", "<leader>rrtm", function()
      local method = vim.fn.expand("<cword>")
      vim.cmd("split | terminal ./gradlew test --tests '*." .. method .. "'")
    end, { desc = "Gradle Test Method (Split)", silent = true, buffer = true })

    -- Tests mit Debug Infos
    map_if_free("n", "<leader>rrtd", function()
      vim.cmd("split | terminal ./gradlew test --info")
    end, { desc = "Gradle Test Info (Split)", silent = true, buffer = true })

    -- Continuous Test Mode (sehr nice)
    map_if_free("n", "<leader>rrtw", function()
      vim.cmd("split | terminal ./gradlew test --continuous")
    end, { desc = "Gradle Test Continuous (Split)", silent = true, buffer = true })

    -- Test Report öffnen
    map_if_free("n", "<leader>rrtr", function()
      -- Bestimmt das Tool: wslview für WSL, sonst xdg-open
      local cmd = vim.env.WSL_DISTRO_NAME ~= nil and "wslview" or "xdg-open"
      local file = "./app/build/reports/tests/test/index.html"

      if vim.fn.filereadable(file) == 1 then
        vim.fn.jobstart({ cmd, file }, { detach = true })
      else
        vim.notify("Report not found: " .. file, vim.log.levels.WARN)
      end
    end, { desc = "Gradle View Test Report", silent = true, buffer = true })

    -- Nur fehlgeschlagene Tests rerun
    map_if_free("n", "<leader>rrtf", function()
      vim.cmd("split | terminal ./gradlew test --rerun-tasks")
    end, { desc = "Gradle Test Rerun Tasks (Split)", silent = true, buffer = true })

    vim.keymap.set("n", "<leader>rrg", ":edit build.gradle<CR>", { desc = "Edit build.gradle (Split)", silent = true, buffer = true })
    
    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end, opts)

    vim.keymap.set("n", "<F9>", function()
      require("dap").toggle_breakpoint()
    end, opts)

    vim.keymap.set("n", "<F10>", function()
      require("dap").step_over()
    end, opts)

    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into()
    end, opts)

    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out()
    end, opts)

    -- Java Runner (Main Classes)
    map_if_free("n", "<leader>jrr", "<cmd>JavaRunnerRunMain<CR>", { desc = "Java Run Main (Command)", silent = true, buffer = true })
    map_if_free("n", "<leader>jrs", "<cmd>JavaRunnerStopMain<CR>", { desc = "Java Stop Main (Command)", silent = true, buffer = true })
    map_if_free("n", "<leader>jrl", "<cmd>JavaRunnerToggleLogs<CR>", { desc = "Java Toggle Logs (Command)", silent = true, buffer = true })

    -- Java Tests (ohne Debug, CLI-like Komfort)
    map_if_free("n", "<leader>jtc", "<cmd>JavaTestRunCurrentClass<CR>", { desc = "Java Run Current Class (Command)", silent = true, buffer = true })
    map_if_free("n", "<leader>jtm", "<cmd>JavaTestRunCurrentMethod<CR>", { desc = "Java Run Current Method (Command)", silent = true, buffer = true })
    map_if_free("n", "<leader>jta", "<cmd>JavaTestRunAllTests<CR>", { desc = "Java Run All Tests (Command)", silent = true, buffer = true })
    map_if_free("n", "<leader>jtr", "<cmd>JavaTestViewLastReport<CR>", { desc = "Java View Last Report (Command)", silent = true, buffer = true })

    -- Refactoring (sehr IDE-mäßig)
    map_if_free("n", "<leader>jrv", "<cmd>JavaRefactorExtractVariable<CR>", { desc = "Java Extract Variable (Command)", silent = true, buffer = true })
    map_if_free("n", "<leader>jrm", "<cmd>JavaRefactorExtractMethod<CR>", { desc = "Java Extract Method (Command)", silent = true, buffer = true })
    map_if_free("n", "<leader>jrc", "<cmd>JavaRefactorExtractConstant<CR>", { desc = "Java Extract Constant (Command)", silent = true, buffer = true })
    map_if_free("n", "<leader>jrf", "<cmd>JavaRefactorExtractField<CR>", { desc = "Java Extract Field (Command)", silent = true, buffer = true })

    -- Settings / Runtime
    map_if_free("n", "<leader>jrsr", "<cmd>JavaSettingsChangeRuntime<CR>", { desc = "Java Change Runtime (Command)", silent = true, buffer = true })
    map_if_free("n", "<leader>jrp", "<cmd>JavaProfile<CR>", { desc = "Java Profile (Command)", silent = true, buffer = true })

    -- Neotest (nur für neotest-java)
    -- local function get_neotest()
    --   if not package.loaded["neotest"] then
    --     require("lazy").load({
    --       plugins = { "nvim-neotest/neotest", "rcasia/neotest-java" },
    --     })
    --   end
    --   return require("neotest")
    -- end

    -- -- Aktuellen Test ausführen
    -- map_if_free("n", "<leader>nt", function()
    --   get_neotest().run.run()
    -- end, { desc = "Neotest Run Current Test", buffer = true })

    -- -- Alle Tests der Datei
    -- map_if_free("n", "<leader>nT", function()
    --   get_neotest().run.run(vim.fn.expand("%"))
    -- end, { desc = "Neotest Run File", buffer = true })

    -- -- Letzten Test erneut ausführen
    -- map_if_free("n", "<leader>nl", function()
    --   get_neotest().run.run_last()
    -- end, { desc = "Neotest Run Last", buffer = true })

    -- -- Test-Übersicht öffnen
    -- map_if_free("n", "<leader>no", function()
    --   get_neotest().summary.toggle()
    -- end, { desc = "Neotest Toggle Summary", buffer = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "c", "cpp" },
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set("n", "<leader>rid", function() 
      run_in_term("code .") 
    end, { desc = "Open Project in VS Code", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rir", function() 
      run_in_term("clion .") 
    end, { desc = "Open Project in Clion", silent = true, buffer = true })

    -- .../app
    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end, opts)

    vim.keymap.set("n", "<F9>", function()
      require("dap").toggle_breakpoint()
    end, opts)

    vim.keymap.set("n", "<F10>", function()
      require("dap").step_over()
    end, opts)

    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into()
    end, opts)

    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out()
    end, opts)

    -- vim.keymap.set(
    --   "n",
    --   "<leader>rra",
    --   ":split | terminal sh -c 'cmake -S . -B build && cmake --build build && ./build/app'<CR>",
    --   opts
    -- )

    -- vim.keymap.set(
    --   "n",
    --   "<leader>rrr",
    --   ":split | terminal ./build/app<CR>",
    --   opts
    -- )

    -- vim.keymap.set(
    --   "n",
    --   "<leader>rrb",
    --   ":split | terminal cmake --build build<CR>",
    --   opts
    -- )

    -- vim.keymap.set(
    --   "n",
    --   "<leader>rrt",
    --   ":split | terminal sh -c 'cd build && ctest'<CR>",
    --   opts
    -- )

    -- vim.keymap.set(
    --   "n",
    --   "<leader>rrg",
    --   ":edit CMakeLists.txt<CR>",
    --   opts
    -- )

    -- Terminal-Split mit Shell-Command
    local function run(cmd)
      vim.cmd("split | terminal " .. cmd)
    end

    -- Configure + Build + Run (Full Pipeline)
    vim.keymap.set("n", "<leader>rra", function()
      run("sh -c 'cmake -S . -B build && cmake --build build && ./build/app'")
    end, { desc = "CMake Build & Run (Split)", silent = true, buffer = true })

    -- Run only
    vim.keymap.set("n", "<leader>rrr", function()
      run("./build/app")
    end, { desc = "C/C++ Run Binary (Split)", silent = true, buffer = true })

    -- Build only
    vim.keymap.set("n", "<leader>rrb", function()
      run("cmake --build build")
    end, { desc = "CMake Build (Split)", silent = true, buffer = true })

    -- Configure only (sehr wichtig bei neuen Flags)
    vim.keymap.set("n", "<leader>rrc", function()
      run("cmake -S . -B build")
    end, { desc = "CMake Configure (Split)", silent = true, buffer = true })

    -- Debug / Release Builds
    vim.keymap.set("n", "<leader>rrd", function()
      run("cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug")
    end, { desc = "CMake Configure Debug (Split)", silent = true, buffer = true })

    vim.keymap.set("n", "<leader>rrR", function()
      run("cmake -S . -B build -DCMAKE_BUILD_TYPE=Release")
    end, { desc = "CMake Configure Release (Split)", silent = true, buffer = true })

    -- Tests
    vim.keymap.set("n", "<leader>rrt", function()
      run("sh -c 'cd build && ctest'")
    end, { desc = "CMake Run Tests (Split)", silent = true, buffer = true })

    -- Verbose Tests (sehr hilfreich)
    vim.keymap.set("n", "<leader>rrT", function()
      run("sh -c 'cd build && ctest --output-on-failure'")
    end, { desc = "CMake Run Tests Output-on-Failure (Split)", silent = true, buffer = true })

    -- Einzelnen Test ausführen (Name unter Cursor)
    vim.keymap.set("n", "<leader>rrf", function()
      local test = vim.fn.expand("<cword>")
      run("sh -c 'cd build && ctest -R " .. test .. "'")
    end, { desc = "CMake Run Specific Test (Split)", silent = true, buffer = true })

    -- Clean Build
    vim.keymap.set("n", "<leader>rrx", function()
      run("rm -rf build")
    end, { desc = "CMake Clean Build Directory (Split)", silent = true, buffer = true })

    -- Reconfigure komplett
    vim.keymap.set("n", "<leader>rrA", function()
      run("rm -rf build && cmake -S . -B build")
    end, { desc = "CMake Reconfigure Clean (Split)", silent = true, buffer = true })

    -- Format Code (wenn clang-format vorhanden)
    vim.keymap.set("n", "<leader>rrF", function()
      run("clang-format -i $(find . -name '*.[ch]pp' -o -name '*.c' -o -name '*.h')")
    end, { desc = "Clang-Format All Files (Split)", silent = true, buffer = true })

    -- Static Analysis optional
    vim.keymap.set("n", "<leader>rrl", function()
      run("clang-tidy $(find . -name '*.cpp')")
    end, { desc = "Clang-Tidy Analyze (Split)", silent = true, buffer = true })

    -- Wichtige Files schnell öffnen
    vim.keymap.set("n", "<leader>rrg", ":edit CMakeLists.txt<CR>", { desc = "Edit CMakeLists.txt (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrC", ":edit build/CMakeCache.txt<CR>", { desc = "Edit CMakeCache.txt (Split)", silent = true, buffer = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "python",
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }

    -- Projekt öffnen
    vim.keymap.set("n", "<leader>rid", function() run_in_term("code .") end, { desc = "Open Project in VS Code", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rir", function() run_in_term("pycharm .") end, { desc = "Open Project in PyCharm", silent = true, buffer = true })

    -- Python Run & Testing
    vim.keymap.set("n", "<leader>rra", ":split | terminal python3 %<CR>", { desc = "Python Run (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrt", ":split | terminal pytest<CR>", { desc = "Pytest Run (Split)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rrv", ":split | terminal python3 -m venv .venv<CR>", { desc = "Python Create Venv (Split)", silent = true, buffer = true })
    
    -- Linting & Formatting
    vim.keymap.set("n", "<leader>rlf", ":!black %<CR>", { desc = "Format with Black", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rll", ":!flake8 %<CR>", { desc = "Lint with Flake8", silent = true, buffer = true })

    -- Tests
    vim.keymap.set("n", "<leader>rrrT", ":split | terminal pytest %<CR>", { desc = "Run current file tests", silent = true, buffer = true })

    -- DAP Debugging
    vim.keymap.set("n", "<F5>", function() require("dap").continue() end, opts)
    vim.keymap.set("n", "<F9>", function() require("dap").toggle_breakpoint() end, opts)
    vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, opts)
    vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, opts)
    vim.keymap.set("n", "<F12>", function() require("dap").step_out() end, opts)

    -- Virtuelle Umgebung aktivieren/deaktivieren
    vim.keymap.set("n", "<leader>rav", ":split | terminal source .venv/bin/activate<CR>", { desc = "Activate Venv", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rdv", ":split | terminal deactivate<CR>", { desc = "Deactivate Venv", silent = true, buffer = true })

    -- Jupyter / IPython
    vim.keymap.set("n", "<leader>rij", ":split | terminal jupyter console --kernel python3<CR>", { desc = "Open Jupyter Console", silent = true, buffer = true })

    -- Docstrings / TODOs
    vim.keymap.set("n", "<leader>rtd", ":lua require('neogen').generate()<CR>", { desc = "Generate Docstring (Neogen)", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>rtf", ":TodoTelescope<CR>", { desc = "Find TODOs", silent = true, buffer = true })
    vim.keymap.set("n", "<leader>te", "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>", { desc = "Show All Python Errors" })
    vim.keymap.set("n", "<leader>rrbd", "<cmd>!bandit -r %<CR>", { desc = "Run Bandit Security Scan" })   
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  -- "markdown" ist hier entscheidend, da jupytext .ipynb in .md umwandelt!
  pattern = { "python", "markdown", "quarto" }, 
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set("n", "<leader>onb", function()
        -- Speichert die aktuelle Datei, damit Änderungen übernommen werden
        vim.cmd("silent write")
        
        -- Holt den Dateinamen der aktuellen Datei
        local file = vim.fn.expand("%:p")
        
        -- Führt jupytext aus, um die Datei zu synchronisieren und öffnet sie in jupyter
        -- Benötigt 'jupyter-notebook' oder 'jupyter-lab' im PATH
        local cmd = string.format("jupyter notebook '%s' &", file)
        
        vim.fn.jobstart(cmd, { detach = true })
        print("Opening Jupyter Notebook...")
    end, { desc = "Jupyter: Open in Browser", buffer = true })

    -- 1. Initialisierung (Der erste Schritt im Notebook)
    vim.keymap.set("n", "<leader>rmi", ":MoltenInit<CR>", { desc = "Molten: Init Kernel", buffer = true })
    
    -- 2. Ausführen (Wie Shift+Enter in Jupyter)
    -- 'e' für Evaluate: Funktioniert mit Motions (z.B. <leader>eip für den ganzen Block)
    vim.keymap.set("n", "<leader>rre", ":MoltenEvaluateOperator<CR>", { desc = "Molten: Run Block", silent = true })
    -- Für mich
    -- vim.keymap.set("n", "<leader>rra", ":MoltenEvaluateOperator<CR>", { desc = "Molten: Run Block", buffer = true })
    -- Auswahl im Visual Mode ausführen
    vim.keymap.set("v", "<leader>rre", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "Molten: Run Selection", buffer = true })
    -- Nur die aktuelle Zeile feuern
    vim.keymap.set("n", "<leader>rrrl", ":MoltenEvaluateLine<CR>", { desc = "Molten: Run Line", buffer = true })

    -- 3. Readme-Style Management (Output Fenster)
    -- Zeigt den Output (z.B. den Mandelbrot Plot) wieder an
    vim.keymap.set("n", "<leader>rros", ":MoltenShowOutput<CR>", { desc = "Molten: Show Output", buffer = true })
    -- Versteckt den Output, um das Readme sauber zu lesen
    vim.keymap.set("n", "<leader>rroh", ":MoltenHideOutput<CR>", { desc = "Molten: Hide Output", buffer = true })
    -- Löscht die Zelle/den Output komplett
    vim.keymap.set("n", "<leader>rrrd", ":MoltenDelete<CR>", { desc = "Molten: Delete Cell", buffer = true })

    -- 4. Navigation (Schnell zwischen Code-Blöcken springen)
    -- Sucht nach dem nächsten Markdown-Codeblock
    vim.keymap.set("n", "]c", "/^```<CR>:noh<CR>", { desc = "Next Code Block", buffer = true, silent = true })
    vim.keymap.set("n", "[c", "?^```<CR>:noh<CR>", { desc = "Prev Code Block", buffer = true, silent = true })
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup,
--   pattern = "c",
--   callback = function()
--     vim.keymap.set("n", "<leader>rid", function() 
--       run_in_term("code .") 
--     end, opts) -- VS Code
--     vim.keymap.set("n", "<leader>rir", function() 
--       run_in_term("eclipse") 
--     end, opts) -- Eclipse
--     vim.keymap.set("n", "<leader>rrb", function() 
--       run_in_term("gcc % -o %:r") 
--     end, opts)
--     vim.keymap.set("n", "<leader>rrr", function() 
--       run_in_term("./%:r") 
--     end, opts)
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "c",
  callback = function()
    -- local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set("n", "<leader>rcr",
      ":split | terminal gcc % -o %:r && ./%:r<CR>",
      { desc = "GCC Compile & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rco",
      ":split | terminal gcc % -O2 -o %:r && ./%:r<CR>",
      { desc = "GCC Optimized Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcd",
      ":split | terminal gcc % -g -o %:r && ./%:r<CR>",
      { desc = "GCC Debug Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcw",
      ":split | terminal gcc % -Wall -Wextra -o %:r && ./%:r<CR>",
      { desc = "GCC Warnings Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcs",
      ":split | terminal gcc % -std=c11 -o %:r && ./%:r<CR>",
      { desc = "GCC Compile & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rcc",
      ":split | terminal gcc -c %<CR>",
      { desc = "GCC Compile Only (Split)", silent = true, buffer = true }
    )
  end,
})


vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "cpp",
  callback = function()
    -- local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set("n", "<leader>rpr",
      ":split | terminal g++ % -o %:r && ./%:r<CR>",
      { desc = "G++ Compile & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpo",
      ":split | terminal g++ % -O2 -o %:r && ./%:r<CR>",
      { desc = "G++ O2 Compile & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpd",
      ":split | terminal g++ % -g -o %:r && ./%:r<CR>",
      { desc = "G++ Debug Compile & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpw",
      ":split | terminal g++ % -Wall -Wextra -o %:r && ./%:r<CR>",
      { desc = "G++ Warnings Compile & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rps",
      ":split | terminal g++ % -std=c++20 -o %:r && ./%:r<CR>",
      { desc = "G++ C++20 Compile & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpc",
      ":split | terminal g++ -c %<CR>",
      { desc = "G++ Compile Only (Split)", silent = true, buffer = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "go",
  callback = function()
    -- local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set("n", "<leader>rpr",
      ":split | terminal go run %<CR>",
      { desc = "Go Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpb",
      ":split | terminal go build -o %:r % && ./%:r<CR>",
      { desc = "Go Build & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpt",
      ":split | terminal go test %<CR>",
      { desc = "Go Test Current File (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpl",
      ":split | terminal golangci-lint run %<CR>",
      { desc = "Go Lint Current File (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpc",
      ":split | terminal go build -c %<CR>",
      { desc = "Go Compile Only (Split)", silent = true, buffer = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "zig",
  callback = function()
    -- local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set("n", "<leader>rpr",
      ":split | terminal zig run %<CR>",
      { desc = "Zig Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpb",
      ":split | terminal zig build-exe % -O ReleaseSafe -femit-bin=%:r && ./%:r<CR>",
      { desc = "Zig Build & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpd",
      ":split | terminal zig build-exe % -O Debug -femit-bin=%:r && ./%:r<CR>",
      { desc = "Zig Debug Build & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpo",
      ":split | terminal zig build-exe % -O ReleaseFast -femit-bin=%:r && ./%:r<CR>",
      { desc = "Zig Optimized Build & Run (Split)", silent = true, buffer = true }
    )

    vim.keymap.set("n", "<leader>rpc",
      ":split | terminal zig build-exe % -femit-bin=%:r<CR>",
      { desc = "Zig Compile Only (Split)", silent = true, buffer = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html" },
  callback = function()
    local opts = { silent = true, buffer = true }

    -- Browser Preview (Öffnet die aktuelle Datei im Standard-Browser)
    vim.keymap.set("n", "<leader>rph", "<cmd>Open<CR>", 
          { desc = "HTML: Open in Browser", buffer = true }
    )

    -- HTML Linting manuell im Terminal triggern (HTMLHint)
    vim.keymap.set("n", "<leader>rpl",
      ":split | terminal htmlhint %<CR>",
      { desc = "HTML: Lint with HTMLHint (Split)", silent = true, buffer = true }
    )

    -- Schnell-Validierung mit Tidy (falls installiert)
    vim.keymap.set("n", "<leader>rpt",
      ":split | terminal tidy -errors -quiet %<CR>",
      { desc = "HTML: Check with Tidy", silent = true, buffer = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "javascript", "typescript" },
  callback = function()
    -- local opts = { noremap = true, silent = true, buffer = true }

    -- JavaScript / TypeScript direkt ausführen
    vim.keymap.set("n", "<leader>rpr",
      ":split | terminal node %<CR>",
      { desc = "Node Run (Split)", silent = true, buffer = true }
    )

    -- TypeScript vorher kompilieren und dann ausführen
    vim.keymap.set("n", "<leader>rpt",
      ":split | terminal tsc % && node %:r.js<CR>",
      { desc = "TS Compile & Run (Split)", silent = true, buffer = true }
    )

    -- Linting
    vim.keymap.set("n", "<leader>rpl",
      ":split | terminal eslint %<CR>",
      { desc = "Lint Current JS/TS File (Split)", silent = true, buffer = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "lua",
  callback = function()
    -- local opts = { noremap = true, silent = true, buffer = true }

    -- Lua Datei direkt ausführen
    vim.keymap.set("n", "<leader>rpr",
      ":split | terminal lua %<CR>",
      { desc = "Lua Run (Split)", silent = true, buffer = true }
    )

    -- LuaJIT benutzen (optional, schneller)
    vim.keymap.set("n", "<leader>rpj",
      ":split | terminal luajit %<CR>",
      { desc = "LuaJIT Run (Split)", silent = true, buffer = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "asm", "s", "S" },
  callback = function()
    -- local opts = { noremap = true, silent = true, buffer = true }

    -- Standard: Assemblieren, Linken & Ausführen
    vim.keymap.set("n", "<leader>rar",
      ":split | terminal nasm -f elf64 % -o %:r.o && ld %:r.o -o %:r && %:p:r<CR>",
      { desc = "NASM Run (ELF64)", silent = true, buffer = true }
    )

    -- Für mich
    vim.keymap.set("n", "<leader>rra",
      ":split | terminal nasm -f elf64 % -o %:r.o && ld %:r.o -o %:r && %:p:r<CR>",
      { desc = "NASM Run (ELF64)", silent = true, buffer = true }
    )

    -- Debug: Mit Debug-Symbolen für GDB assemblieren
    vim.keymap.set("n", "<leader>rad",
      ":split | terminal nasm -f elf64 -g -F dwarf % -o %:r.o && ld %:r.o -o %:r<CR>",
      { desc = "NASM Build with Debug Symbols", silent = true, buffer = true }
    )

    -- Nur Assemblieren (Object File erstellen)
    vim.keymap.set("n", "<leader>rac",
      ":split | terminal nasm -f elf64 % -o %:r.o<CR>",
      { desc = "NASM Compile Only", silent = true, buffer = true }
    )

    -- Listing File generieren
    vim.keymap.set("n", "<leader>ral",
      ":split | terminal nasm -f elf64 % -l %:r.lst<CR>",
      { desc = "NASM Generate Listing File", silent = true, buffer = true }
    )

    -- GAS: Assemblieren, Linken & Ausführen
    vim.keymap.set("n", "<leader>gar",
      ":split | terminal as % -o %:r.o && ld %:r.o -o %:r && %:p:r<CR>",
      { desc = "GAS Run (AT&T)", silent = true, buffer = true }
    )

    -- GAS Debug: Mit Debug-Symbolen für GDB
    vim.keymap.set("n", "<leader>gad",
      ":split | terminal as -g % -o %:r.o && ld %:r.o -o %:r<CR>",
      { desc = "GAS Build Debug", silent = true, buffer = true }
    )

    -- GAS: Nur Assemblieren
    vim.keymap.set("n", "<leader>gac",
      ":split | terminal as % -o %:r.o<CR>",
      { desc = "GAS Compile Only", silent = true, buffer = true }
    )

    -- Cleanup
    vim.keymap.set("n", "<leader>rax",
      function()
        local bin = vim.fn.expand("%:p:r")
        os.remove(bin .. ".o")
        os.remove(bin)
        print("Cleaned up: " .. vim.fn.expand("%:t:r"))
      end,
      { desc = "NASM Cleanup Files", silent = true, buffer = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("MatlabConfig", { clear = true }),
  pattern = { "matlab" },
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }
    local matlab_path = "/usr/local/MATLAB/R2025b/bin/matlab"

    -- Optimierte Run-Funktion mit startinsert
    local function run_cmd(cmd)
      vim.cmd("split | terminal " .. cmd)
      -- Verhindert E21 Fehler und erlaubt sofortiges Strg+C
      vim.cmd("startinsert")
    end

    -- <leader>rra: Datei ausführen (Bleibt offen für Plots)
    vim.keymap.set("n", "<leader>rra", function()
      local file_path = vim.fn.expand("%:p")
      run_cmd(matlab_path .. " -nosplash -nodesktop -r \"clc; run('" .. file_path .. "')\"")
    end, { desc = "MATLAB Run (Stay open for Plots)", silent = true, buffer = true })

    -- <leader>rrr: Interaktive Konsole
    vim.keymap.set("n", "<leader>rrr", function()
      run_cmd(matlab_path .. " -nosplash -nodesktop -r \"clc;\"")
    end, { desc = "Open MATLAB Console", silent = true, buffer = true })

    -- F5: Schnell-Ausführung
    vim.keymap.set("n", "<F5>", function()
      local file_path = vim.fn.expand("%:p")
      run_cmd(matlab_path .. " -nosplash -nodesktop -r \"run('" .. file_path .. "')\"")
    end, opts)

    -- BONUS: <leader>rrk zum schnellen "Killen" des Terminals/Plots
    vim.keymap.set("n", "<leader>rrk", function()
      vim.cmd("bwipeout!")
    end, { desc = "Kill MATLAB / Close Plot", silent = true, buffer = true })
  end,
})

```


## plugins/image_toggle.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/image_toggle.lua
```

```bash
nano plugins/image_toggle.lua
```

```bash
code plugins/image_toggle.lua
```

```lua
-- plugins/image_toggle.lua

-- -- Pfad zur JSON-Datei
-- local json_file = vim.fn.expand("~/.config/nvim/image_toggle_status.json")

-- -- Initialisiere die JSON-Datei, falls sie nicht existiert
-- if vim.fn.filereadable(json_file) == 0 then
--   vim.fn.writefile({ vim.fn.json_encode({ display = true }) }, json_file)
-- end

-- -- Status aus JSON lesen
-- local function read_status()
--   local ok, data = pcall(vim.fn.json_decode, table.concat(vim.fn.readfile(json_file), "\n"))
--   if ok and data and data.display ~= nil then
--     return data.display
--   end
--   return false
-- end

-- local image_status = read_status()

-- -- Plugin Konfiguration
-- return {
--   "3rd/image.nvim",
--   cond = image_status, -- Plugin nur laden, wenn display = true
--   opts = {
--     backend = "kitty",
--     max_width = 90,
--     max_height = 20,
--     max_width_window_percentage = math.huge,
--     max_height_window_percentage = math.huge,
--     editor_only_render_when_focused = false,
--     integrations = {
--       markdown = {
--         enabled = true,
--         clear_in_insert_mode = false,
--         download_remote_images = true,
--         only_render_image_at_cursor = false,
--         filetypes = { "markdown", "vimwiki", "quarto", "latex", "tex" },
--       },
--     },
--   },
--   config = function(_, opts)
--     local ok, image = pcall(require, "image")
--     if not ok then
--       return
--     end

--     image.setup(opts)
--     vim.g.image_display = image_status

--     local function safe_render()
--       if image.render_at_cursor then
--         image.render_at_cursor()
--       elseif image.render_file then
--         image.render_file(vim.api.nvim_buf_get_name(0))
--       elseif image.render then
--         image.render()
--       end
--     end

--     local function save_status(value)
--       vim.fn.writefile({ vim.fn.json_encode({ display = value }) }, json_file)
--     end

--     vim.g.image_on = function()
--       vim.g.image_display = true
--       if opts.integrations and opts.integrations.markdown then
--         opts.integrations.markdown.enabled = true
--       end
--       safe_render()
--       save_status(true)
--       print("ImageON")
--     end

--     vim.g.image_off = function()
--       vim.g.image_display = false
--       if opts.integrations and opts.integrations.markdown then
--         opts.integrations.markdown.enabled = false
--       end
--       image.clear()
--       save_status(false)
--       print("ImageOFF")
--     end

--     vim.g.image_toggle = function()
--       if vim.g.image_display then
--         vim.g.image_off()
--       else
--         vim.g.image_on()
--       end
--     end
--   end,
-- }

```

## plugins/mason.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/mason.lua
```

```bash
nano plugins/mason.lua
```

```bash
code plugins/mason.lua
```

```bash
rm ~/.cargo/bin/rust-analyzer
```

```lua
-- plugins/mason.lua

return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "tree-sitter-cli",
        "mmdc",

        -- Rust:
        "rust-analyzer",
        -- "rustfmt",

        -- C++: 
        "clangd",
        "codelldb",

        -- Auto completion:
        "ltex-ls",

        -- Assembly:
        "asm-lsp",

        -- Java:
        -- "jdtls", -- https://github.com/nvim-java/nvim-java installirt das automatisch
        -- "java-debug-adapter", -- https://github.com/nvim-java/nvim-java installirt das automatisch
        -- "java-test", -- https://github.com/nvim-java/nvim-java installirt das automatisch
        -- "vscode-java-test",
        -- "kotlin_language_server",
        -- "checkstyle",

        -- Python:
        "pyright", 
        -- "python-lsp-server", -- früber "pylsp",
        -- "pylsp-mypy" -- optional, für Typ-Prüfung
        -- "python-lsp-black",
        -- "black",
        "ruff",
        "debugpy",
        -- "mypy",

        -- HTML:
        "html-lsp",
        "htmlhint",

        -- XML / FXML:
        "lemminx",
        "xmlformatter",

        -- CSS:
        "css-lsp",

        -- Lua:
        -- "lua_ls",
        "lua-language-server",
        "stylua",

        -- JavaScript:
        "typescript-language-server",
        -- "eslint-lsp",
        "prettier",
        -- "eslint_d",
        -- "js-debug-adapter",

        -- Zig:
        -- "zls",

        -- C#
				-- "omnisharp",

        -- Bash
				"bash-language-server",
        "shellcheck",
        "shfmt",

        -- Julia
				-- "julials",

				-- Clojure
				-- "clojure_lsp",

        -- Nim
				-- "nim_langserver",

				-- JSON
				-- "jsonls",

				-- YAML
				-- "yamlls",

        -- MATLAB
        "matlab-language-server",
      },
    },
  },
  -- {
  --   "tpope/vim-fugitive",
  --   cmd = { "Git", "G" },
  -- },
}

```

## plugins/theme.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/theme.lua
```

```bash
nano plugins/theme.lua
```

```bash
code plugins/theme.lua
```

```lua
-- plugins/theme.lua

-- GitHub Theme

-- return {
--   {
--     "projekt0n/github-nvim-theme",
--     name = "github-theme",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("github-theme").setup({})
--       vim.cmd("colorscheme github_dark_dimmed")
--     end
--   },
-- }

-- return {
--   {
--     "projekt0n/github-nvim-theme",
--     name = "github-theme",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("github-theme").setup({
--         options = {
--           transparent = true,
--         },
--       })

--       -- Hier einfach die Variante ändern:
--       -- github_dark, github_dark_dimmed, github_dark_default
--       -- github_light, github_light_high_contrast, github_light_default
--       vim.cmd("colorscheme github_dark_dimmed")

--       -- local groups = {
--       --   "Normal",
--       --   "NormalNC",
--       --   "NormalFloat",
--       --   "FloatBorder",
--       --   "SignColumn",
--       --   "EndOfBuffer",
--       --   "LineNr",
--       --   "CursorLineNr",
--       --   "VertSplit",
--       --   "WinSeparator",
--       -- }

--       local groups = {
--         "Normal",
--         "NormalNC",
--         "NormalFloat",
--         "FloatBorder",
--         "SignColumn",
--         "EndOfBuffer",
--         "LineNr",
--         "CursorLineNr",
--         "VertSplit",
--         "WinSeparator",
--         "TabLine",
--         "TabLineSel",
--         "TabLineFill",
--         "StatusLine",
--         "StatusLineNC",
--         "WinBar",
--         "WinBarNC",
--       }

--       for _, group in ipairs(groups) do
--         vim.api.nvim_set_hl(0, group, { bg = "none" })
--       end
--     end,
--   },
-- }

-- Nightfox

-- return {
--   {
--     "EdenEast/nightfox.nvim",
--     name = "nightfox",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("nightfox").setup({
--         options = {
--           transparent = false,
--           terminal_colors = true,
--         },
--       })
--       vim.cmd("colorscheme carbonfox")
--     end
--   },
-- }

-- return {
--   {
--     "EdenEast/nightfox.nvim",
--     name = "nightfox",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("nightfox").setup({
--         options = {
--           transparent = true,
--           terminal_colors = true,
--         },
--       })

--       -- Hier einfach die Variante ändern: carbonfox, duskfox, nordfox, terafox, dayfox
--       vim.cmd("colorscheme carbonfox")

--       -- local groups = {
--       --   "Normal",
--       --   "NormalNC",
--       --   "NormalFloat",
--       --   "FloatBorder",
--       --   "SignColumn",
--       --   "EndOfBuffer",
--       --   "LineNr",
--       --   "CursorLineNr",
--       --   "VertSplit",
--       --   "WinSeparator",
--       -- }

--       local groups = {
--         "Normal",
--         "NormalNC",
--         "NormalFloat",
--         "FloatBorder",
--         "SignColumn",
--         "EndOfBuffer",
--         "LineNr",
--         "CursorLineNr",
--         "VertSplit",
--         "WinSeparator",
--         "TabLine",
--         "TabLineSel",
--         "TabLineFill",
--         "StatusLine",
--         "StatusLineNC",
--         "WinBar",
--         "WinBarNC",
--       }

--       for _, group in ipairs(groups) do
--         vim.api.nvim_set_hl(0, group, { bg = "none" })
--       end
--     end,
--   },
-- }

-- Tokyo Night

-- return {
--   {
--     "folke/tokyonight.nvim",
--     name = "tokyonight",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("tokyonight").setup({
--         style = "night", -- storm / moon / night / day möglich
--         transparent = true,
--         terminal_colors = true,
--       })

--       vim.cmd("colorscheme tokyonight")

--       -- local groups = {
--       --   "Normal",
--       --   "NormalNC",
--       --   "NormalFloat",
--       --   "FloatBorder",
--       --   "SignColumn",
--       --   "EndOfBuffer",
--       --   "LineNr",
--       --   "CursorLineNr",
--       --   "VertSplit",
--       --   "WinSeparator",
--       -- }

--       local groups = {
--         "Normal",
--         "NormalNC",
--         "NormalFloat",
--         "FloatBorder",
--         "SignColumn",
--         "EndOfBuffer",
--         "LineNr",
--         "CursorLineNr",
--         "VertSplit",
--         "WinSeparator",
--         "TabLine",
--         "TabLineSel",
--         "TabLineFill",
--         "StatusLine",
--         "StatusLineNC",
--         "WinBar",
--         "WinBarNC",
--       }

--       for _, group in ipairs(groups) do
--         vim.api.nvim_set_hl(0, group, { bg = "none" })
--       end
--     end,
--   },
-- }

-- Catppuccin

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte / frappe / macchiato / mocha
        transparent_background = true,
        term_colors = true,
        -- integrations = {
        --   snacks = true,
        --   lsp_trouble = true,
        --   mason = true,
        --   which_key = true,
        --   -- weitere Plugins bei Bedarf hier auf true setzen
        -- },
      })

      vim.cmd("colorscheme catppuccin")

      -- local colors = require("catppuccin.palettes").get_palette("mocha")

      -- local groups = {
      --   "Normal",
      --   "NormalNC",
      --   "NormalFloat",
      --   "FloatBorder",
      --   "SignColumn",
      --   "EndOfBuffer",
      --   "LineNr",
      --   "CursorLineNr",
      --   "VertSplit",
      --   "WinSeparator",
      -- }

      local groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "SignColumn",
        "EndOfBuffer",
        "LineNr",
        "CursorLineNr",
        "VertSplit",
        "WinSeparator",
        "TabLine",
        "TabLineSel",
        "TabLineFill",
        "StatusLine",
        "StatusLineNC",
        "WinBar",
        "WinBarNC",
      }

      -- for _, group in ipairs(groups) do
      --   vim.api.nvim_set_hl(0, group, { bg = "none" })
      -- end

      for _, group in ipairs(groups) do
        -- Der Trick: Wir holen das existierende Highlight (mit Farbe!)
        local old_hl = vim.api.nvim_get_hl(0, { name = group })
        -- Wir ändern NUR den Hintergrund, behalten aber das FG (Vordergrund)
        vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", old_hl, { bg = "none" }))
      end

      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fab387", bold = true, bg = "none" })
      -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.mauve, bold = true, bg = "none" })
      -- vim.api.nvim_set_hl(0, "LineNr", { fg = colors.surface0, bg = "none" })
      -- vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.surface0}) 

      -- Terminal Background beim Start ändern
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          io.write("\27]11;#1e1e2e\7")
        end,
      })

      -- Beim Beenden zurück zu schwarz
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          io.write("\27]11;#000000\7")
        end,
      })

    end,
  },
}

-- Kanagawa

-- return {
--   {
--     "rebelot/kanagawa.nvim",
--     name = "kanagawa",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("kanagawa").setup({
--         compile = true,
--         undercurl = true,
--         commentStyle = { italic = true },
--         functionStyle = {},
--         keywordStyle = { italic = true },
--         statementStyle = { bold = true },
--         typeStyle = {},
--         transparent = true, -- transparent background
--         terminalColors = true,
--       })

--       vim.cmd("colorscheme kanagawa")

--       -- local groups = {
--       --   "Normal",
--       --   "NormalNC",
--       --   "NormalFloat",
--       --   "FloatBorder",
--       --   "SignColumn",
--       --   "EndOfBuffer",
--       --   "LineNr",
--       --   "CursorLineNr",
--       --   "VertSplit",
--       --   "WinSeparator",
--       -- }

--       local groups = {
--         "Normal",
--         "NormalNC",
--         "NormalFloat",
--         "FloatBorder",
--         "SignColumn",
--         "EndOfBuffer",
--         "LineNr",
--         "CursorLineNr",
--         "VertSplit",
--         "WinSeparator",
--         "TabLine",
--         "TabLineSel",
--         "TabLineFill",
--         "StatusLine",
--         "StatusLineNC",
--         "WinBar",
--         "WinBarNC",
--       }

--       for _, group in ipairs(groups) do
--         vim.api.nvim_set_hl(0, group, { bg = "none" })
--       end
--     end,
--   },
-- }

-- Gruvbox Material

-- return {
--   {
--     "sainnhe/gruvbox-material",
--     name = "gruvbox-material",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.g.gruvbox_material_background = "soft" -- soft / medium / hard
--       vim.g.gruvbox_material_foreground = "material" 
--       vim.g.gruvbox_material_enable_italic = 1
--       vim.g.gruvbox_material_transparent_background = 1 -- transparent background
--       vim.g.gruvbox_material_enable_bold = 1

--       vim.cmd("colorscheme gruvbox-material")

--       -- local groups = {
--       --   "Normal",
--       --   "NormalNC",
--       --   "NormalFloat",
--       --   "FloatBorder",
--       --   "SignColumn",
--       --   "EndOfBuffer",
--       --   "LineNr",
--       --   "CursorLineNr",
--       --   "VertSplit",
--       --   "WinSeparator",
--       -- }

--       local groups = {
--         "Normal",
--         "NormalNC",
--         "NormalFloat",
--         "FloatBorder",
--         "SignColumn",
--         "EndOfBuffer",
--         "LineNr",
--         "CursorLineNr",
--         "VertSplit",
--         "WinSeparator",
--         "TabLine",
--         "TabLineSel",
--         "TabLineFill",
--         "StatusLine",
--         "StatusLineNC",
--         "WinBar",
--         "WinBarNC",
--       }

--       for _, group in ipairs(groups) do
--         vim.api.nvim_set_hl(0, group, { bg = "none" })
--       end
--     end,
--   },
-- }

-- Everforest

-- return {
--   {
--     "sainnhe/everforest",
--     name = "everforest",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.g.everforest_background = "hard"   -- soft / medium / hard
--       vim.g.everforest_enable_italic = 1
--       vim.g.everforest_enable_bold = 1
--       vim.g.everforest_transparent_background = 1 -- transparent

--       vim.cmd("colorscheme everforest")

--       -- local groups = {
--       --   "Normal",
--       --   "NormalNC",
--       --   "NormalFloat",
--       --   "FloatBorder",
--       --   "SignColumn",
--       --   "EndOfBuffer",
--       --   "LineNr",
--       --   "CursorLineNr",
--       --   "VertSplit",
--       --   "WinSeparator",
--       -- }

--       local groups = {
--         "Normal",
--         "NormalNC",
--         "NormalFloat",
--         "FloatBorder",
--         "SignColumn",
--         "EndOfBuffer",
--         "LineNr",
--         "CursorLineNr",
--         "VertSplit",
--         "WinSeparator",
--         "TabLine",
--         "TabLineSel",
--         "TabLineFill",
--         "StatusLine",
--         "StatusLineNC",
--         "WinBar",
--         "WinBarNC",
--       }

--       for _, group in ipairs(groups) do
--         vim.api.nvim_set_hl(0, group, { bg = "none" })
--       end
--     end,
--   },
-- }

-- Rose-Pine

-- return {
--   {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("rose-pine").setup({
--         variant = "moon",          -- moon / dawn / main
--         dark_variant = "moon",     -- optional, für dunkle Mode
--         transparent = true,        -- transparent background
--         disable_background = true, -- extra Sicherheit für Transparenz
--         highlight_groups = {},     -- kann für Plugin-Anpassungen genutzt werden
--       })

--       vim.cmd("colorscheme rose-pine")

--       -- local groups = {
--       --   "Normal",
--       --   "NormalNC",
--       --   "NormalFloat",
--       --   "FloatBorder",
--       --   "SignColumn",
--       --   "EndOfBuffer",
--       --   "LineNr",
--       --   "CursorLineNr",
--       --   "VertSplit",
--       --   "WinSeparator",
--       -- }

--       local groups = {
--         "Normal",
--         "NormalNC",
--         "NormalFloat",
--         "FloatBorder",
--         "SignColumn",
--         "EndOfBuffer",
--         "LineNr",
--         "CursorLineNr",
--         "VertSplit",
--         "WinSeparator",
--         "TabLine",
--         "TabLineSel",
--         "TabLineFill",
--         "StatusLine",
--         "StatusLineNC",
--         "WinBar",
--         "WinBarNC",
--       }

--       for _, group in ipairs(groups) do
--         vim.api.nvim_set_hl(0, group, { bg = "none" })
--       end
--     end,
--   },
-- }

-- Cyberdream

-- return {
--   {
--     "scottmckendry/cyberdream.nvim",
--     name = "cyberdream",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("cyberdream").setup({
--         transparent = true,         -- transparent background
--         terminal_colors = true,     -- Terminalfarben aktivieren
--         italic_comments = true,     -- optional, wenn du italics willst
--         borderless_telescope = true,-- optional für borderloses Telescope
--       })

--       vim.cmd("colorscheme cyberdream")

--       -- local groups = {
--       --   "Normal",
--       --   "NormalNC",
--       --   "NormalFloat",
--       --   "FloatBorder",
--       --   "SignColumn",
--       --   "EndOfBuffer",
--       --   "LineNr",
--       --   "CursorLineNr",
--       --   "VertSplit",
--       --   "WinSeparator",
--       -- }

--       local groups = {
--         "Normal",
--         "NormalNC",
--         "NormalFloat",
--         "FloatBorder",
--         "SignColumn",
--         "EndOfBuffer",
--         "LineNr",
--         "CursorLineNr",
--         "VertSplit",
--         "WinSeparator",
--         "TabLine",
--         "TabLineSel",
--         "TabLineFill",
--         "StatusLine",
--         "StatusLineNC",
--         "WinBar",
--         "WinBarNC",
--       }

--       for _, group in ipairs(groups) do
--         vim.api.nvim_set_hl(0, group, { bg = "none" })
--       end
--     end,
--   },
-- }

```

## plugins/latex.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/latex.lua
```

```bash
nano plugins/latex.lua
```

```bash
code plugins/latex.lua
```

```lua
-- plugins/latex.lua

return {
  {
    "lervag/vimtex",
    ft = { "tex" },

    init = function()
      -- Compiler (TeX Live Standard)
      vim.g.vimtex_compiler_method = "latexmk"

      -- PDF Viewer (Linux Empfehlung)
      vim.g.vimtex_view_method = "zathura"

      -- Quickfix nicht automatisch aufspringen lassen
      vim.g.vimtex_quickfix_mode = 0

      -- Conceal deaktivieren (bessere Lesbarkeit)
      vim.g.tex_conceal = ""
      vim.g.vimtex_syntax_conceal_disable = 1
    end,
  },
}

```

## plugins/ui.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/ui.lua
```

```bash
nano plugins/ui.lua
```

```bash
code plugins/ui.lua
```

```lua
-- plugins/ui.lua

return {
  {
    -- cmd = "Telescope", -- lädt erst bei Telescope-Befehl
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "folke/trouble.nvim",
    -- cmd = { "TroubleToggle", "Trouble" }, -- nur wenn du Trouble-Befehl benutzt
    opts = {},
  },

  {
    "nvim-tree/nvim-tree.lua",
    -- cmd = { "NvimTreeToggle", "NvimTreeFindFile" }, -- nur bei diesen Befehlen laden
    opts = {
      view = { width = 30 },
      renderer = { group_empty = true },
    },
  },

  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- wird schon in plugins/git.lua geladen
  -- {
  --   "tpope/vim-fugitive",
  --   cmd = { "Git", "G" },
  -- },

  {
    "akinsho/bufferline.nvim",
    version = "v5.0.0",
    -- Aktualisiertes Repository
    dependencies = { "nvim-mini/mini.icons" },
    opts = {
      options = {
        -- Nutze mini.icons für die Darstellung
        get_element_icon = function(opts)
          local icon, hl = require("mini.icons").get("file", opts.path)
          return icon, hl
        end,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        show_buffer_close_icons = true,
        show_close_icon = false,
      },
    },
  },

  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      local hipatterns = require("mini.hipatterns")

      -- local function rgb_group(_, match)
      --   local r, g, b = match:match("rgb%((%d+),%s*(%d+),%s*(%d+)%)")
      --   if not r then return end

      --   local hex = string.format(
      --     "#%02x%02x%02x",
      --     tonumber(r),
      --     tonumber(g),
      --     tonumber(b)
      --   )

      --   return hipatterns.compute_hex_color_group(hex, "bg")
      -- end

      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
          
          -- rgb_color = {
          --   pattern = "rgb%(%d+,%s*%d+,%s*%d+%)",
          --   group = rgb_group,
          -- },
        },
      })
    end,
  },

  -- {
  -- "folke/snacks.nvim",
  --   opts = {
  --     terminal = {
  --       enabled = true,  -- Snacks Terminal aktivieren
  --     },
  --     image = { 
  --       enabled = true,
  --       -- markdown = {
  --       --   mermaid = false,
  --       -- },
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>tt",
  --       function() require("snacks").terminal() end, -- Terminal aufrufen
  --       desc = "Terminal",
  --     },
  --   },
  -- },

  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        enabled = true,
      },
      -- image = {
      --   -- Aktiviert Bilder, wenn wir in Kitty-Terminal sind
      --   enabled = (function()
      --     local term = os.getenv("TERM") or ""
      --     local term_program = os.getenv("TERM_PROGRAM") or ""
      --     local kitty_window = os.getenv("KITTY_WINDOW_ID") or ""

      --     -- Bilder aktivieren, wenn:
      --     -- 1. TERM enthält "kitty"
      --     -- 2. oder KITTY_WINDOW_ID gesetzt ist (echtes Kitty)
      --     -- 3. oder TERM_PROGRAM Ghostty ist (optional)
      --     return term:find("kitty") ~= nil or kitty_window ~= "" or term_program == "Ghostty"
      --   end)(),
      -- },
    },
    keys = {
      {
        "<leader>tt",
        function()
          require("snacks").terminal()
        end,
        desc = "Terminal",
      },
    },
  },

  -- Mason UI umranden
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded", -- macht Mason schick
      },
    },
  },

  -- Optional: Which-Key (die Tasten-Vorschau) ebenfalls umranden
  -- {
  --   "folke/which-key.nvim",
  --   opts = {
  --     win = { border = "rounded" },
  --   },
  -- },
}

```

## plugins/treesitter.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/treesitter.lua
```

```bash
nano plugins/treesitter.lua
```

```bash
code plugins/treesitter.lua
```

```lua
-- plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        -- Programmiersprachen
        "c", "cpp", "rust", "java", "kotlin", "lua", "python", "go", "zig", "ron",
        "javascript", "typescript", "tsx", "sql", "ruby", "php", "perl", "asm",
        "matlab",
        -- Konfiguration (Korrekturen!)
        "dockerfile", "terraform", "nginx", "tmux", "ssh_config", "diff",
        "toml", "yaml", "json", "json5", "jsonc", "ini", "xml", "csv",
        -- Build & Shell (Korrekturen!)
        "make", "groovy", "cmake", "bash", "fish", "zsh", "powershell",
        -- "sh",
        -- System & Desktop-Envs (Ghostty-kompatibel)
        "hyprlang", "rasi", "kdl",
        -- "waybar",
        -- Dokumentation & Git
        "markdown", "markdown_inline", "rst", "latex", "bibtex", "vim", "vimdoc",
        "query", "regex", "git_config", "gitignore", "git_rebase", "gitcommit",
        -- Web
        "html", "css", "scss", "graphql", "http",
      },
      highlight = { enable = true },
      --  indent = { enable = true },
      -- auto_install = true,
    },
  },
}

```

## plugins/treesitter-context.lua


```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/treesitter-context.lua
```

```bash
nano plugins/treesitter-context.lua
```

```bash
code plugins/treesitter-context.lua
```

```lua
-- plugins/treesitter-context.lua

return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "LazyFile",
  config = function()
    require("treesitter-context").setup({
      enable = true,
      
      -- Maximale Anzahl an Zeilen, die angezeigt werden (0 = unbegrenzt)
      -- Wir setzen max_lines auf 5, sodass genug Kontext (einschließlich Klassenname) immer sichtbar ist
      max_lines = 6,  -- Zeigt mindestens 5 Zeilen, darunter auch die Klasse und Methode
      
      -- 'topline' sorgt für stabilere Anzeige des Kontexts (ähnlich zu VS Code/IntelliJ)
      -- Teste alternativ 'cursor' für andere Positionierung, falls die Anzeige stabiler sein soll
      mode = 'cursor',  -- 'cursor' bietet möglicherweise eine stabilere Anzeige

      -- Zeilennummern aktivieren
      line_numbers = true,
      
      -- Zeigt nur die erste Zeile der Methode, um zu verhindern, dass der Kontext zu groß wird
      multiline_threshold = 1,
      
      -- Der Klassennamen soll immer angezeigt werden. 
      -- Der 'outer'-Scope sorgt dafür, dass der äußere Kontext (Klasse) immer sichtbar bleibt.
      trim_scope = 'outer',  -- Das sorgt dafür, dass die Klasse immer sichtbar bleibt, auch bei kleineren Scrolls
      
      -- Der Trenner zwischen den Kontextzeilen bleibt "─", um den visuellen Trennstrich anzuzeigen.
      separator = "─",  
      
      -- zindex sorgt dafür, dass der Kontext immer über anderen Inhalten liegt, z.B. Code
      zindex = 20,  
    })

    -- Optik: Markierung anstelle eines weißen Strichs
    -- vim.api.nvim_set_hl(0, "TreesitterContext", { link = "CursorLine" })  -- Die Kontextmarkierung erhält die CursorLine-Hervorhebung
    -- vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = false })  -- Entfernt Unterstreichungen für den unteren Kontext

    -- Zusätzliche optische Anpassungen für den Hintergrund
    -- vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#2e3440" })  -- Dunkelgrauer Hintergrund für den oberen Kontext
    -- vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = "#3b4252" })  -- Etwas dunklerer Hintergrund für den unteren Kontext
    vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = "#2e3440" })
  end,
}

```

## plugins/markdown.lua

Nach der Instalation:

```bash
cd /home/jk/.local/share/nvim/lazy/markdown-preview.nvim
git checkout -- app/yarn.lock   
```

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/markdown.lua
```

```bash
nano plugins/markdown.lua
```

```bash
code plugins/markdown.lua
```

```lua
-- plugins/markdown.lua

return {
  -- Bei Problmen einfach nachhelfen mit: :call mkdp#util#install()
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_refresh_slow = 1
      vim.g.mkdp_theme = "dark"
    end,
  },

  -- Markdown Syntax + Verbesserungen
  {
    "preservim/vim-markdown",
    ft = { "markdown" },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_toc_autofit = 1
    end,
  },

  -- Inhaltsverzeichnis Generator
  {
    "mzlogin/vim-markdown-toc",
    ft = { "markdown" },
  },

  -- Tabellen Editing
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    config = function()
      vim.g.table_mode_corner = "|"
    end,
  },
}

-- :TableModeToggle
-- :TableModeRealign
-- :GenTocGFM
-- :UpdateToc

-- Mehr noch in python.lua -> "MeanderingProgrammer/render-markdown.nvim",

```

## plugins/ltex.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/ltex.lua
```

```bash
nano plugins/ltex.lua
```

```bash
code plugins/ltex.lua
```

```lua
-- plugins/ltex.lua

return {
  {
    "neovim/nvim-lspconfig",
    ft = { "tex", "markdown", "text", "gitcommit" },
    opts = {
      servers = {
        ltex = {
          settings = {
            ltex = {
              language = "auto",
              additionalRules = {
                enablePickyRules = true,
              },
              checkFrequency = "save",

              -- diagnosticSeverity = "information",

              -- completionEnabled = false,

              -- Beide Wörterbücher aktiv:
              dictionary = {
                ["en-US"] = {},
                ["de-DE"] = {},
              },
              -- dictionary = {
              --   ["en-US"] = { "Neovim", "LazyVim" },
              --   ["de-DE"] = { "Neovim", "LazyVim" },
              -- },

              -- latex = {
              --   commands = {
              --     ["\\cite"] = "dummy",
              --     ["\\ref"] = "dummy",
              --   },
              -- },
            },
          },
          filetypes = {
            "tex",
            "markdown",
            "text",
            "gitcommit",
          },
        },
      },
    },
  },
}

-- Sprache wechseln (on the fly):
-- :LtexSwitchLanguage de-DE
-- :LtexSwitchLanguage en-US

```

## plugins/notify.lua

Die Datei plugins/notify.lua überschreibt NeoVims vim.notify, um bestimmte Meldungen wie „reload Cargo workspace“ zu unterdrücken, während alle anderen Benachrichtigungen normal angezeigt oder sicher über einen Fallback ausgegeben werden. -> **Weniger nervige Meldungen**.

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/notify.lua
```

```bash
nano plugins/notify.lua
```

```bash
code plugins/notify.lua
```

```lua
-- plugins/notify.lua

-- local old_notify = vim.notify

-- vim.notify = function(msg, log_level, opts)
--   local text = nil

--   if type(msg) == "string" then
--     text = msg
--   elseif type(msg) == "table" and type(msg.msg) == "string" then
--     text = msg.msg
--   end

--   if text and text:lower():match("reload.*cargo workspace") then
--     return
--   end

--   if old_notify then
--     pcall(old_notify, msg, log_level, opts)
--   else
--     if type(msg) == "string" then
--       vim.api.nvim_echo({ { msg } }, true, {})
--     end
--   end
-- end

```

## plugins/git.lua

Ubuntu 25.10+ !!!

```bash
sudo apt install lazygit
```

or 

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
mkdir -p ~/.config/lazygit/
touch ~/.config/lazygit/config.yml
cat <<EOF > ~/.config/lazygit/config.yml
git:
  paging:
    colorArg: always
    pager: delta --dark --paging=never --line-numbers
os:
  editCommand: "nvim"
EOF
```

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/git.lua
```

```bash
nano plugins/git.lua
```

```bash
code plugins/git.lua
```

```lua
-- plugins/git.lua

-- return {
--   {
--     "lewis6991/gitsigns.nvim",
--     opts = {},
--   },
-- }

-- return {
--   {
--     "lewis6991/gitsigns.nvim",
--     event = "BufReadPre",
--     opts = {
--       -- Git signs immer aktiv
--       signcolumn = true,
--       numhl = true,
--       linehl = true,
--       word_diff = true,

--       -- Inline blame wie GitLens
--       current_line_blame = true,
--       current_line_blame_opts = {
--         delay = 300,
--         virt_text_pos = "eol",
--         ignore_whitespace = false,
--       },

--       current_line_blame_formatter =
--         "<author>, <author_time:%Y-%m-%d> • <summary>",

--       -- Performance / UX
--       watch_gitdir = { interval = 1000 },
--       update_debounce = 100,

--       -- Preview Fenster schöner
--       preview_config = {
--         border = "rounded",
--       },
--     },
--   },
-- }

return {
  -- GITSIGNS (GitLens Inline Blame + Signs)
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signcolumn = true,
      numhl = true,
      -- linehl = true,
      linehl = false,
      -- word_diff = true,
      word_diff = false,

      -- Inline blame automatisch aktiv
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 250,
        virt_text_pos = "eol",
        ignore_whitespace = false,
      },

      current_line_blame_formatter =
        -- " <author>, <author_time:%Y-%m-%d> • <summary>",
        -- " <author>, <author_time:%Y-%m-%d %H:%M> • <summary>",
        "    <author> (<abbrev_sha>), <author_time:%Y-%m-%d %H:%M> • <summary>",
      -- "    <author> <abbrev_sha> • <author_time:%Y-%m-%d %H:%M> • <summary>",

      watch_gitdir = { interval = 1000 },
      update_debounce = 100,

      preview_config = {
        border = "rounded",
        style = "minimal",
      },

      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
    },
  },

  -- DIFFVIEW (GitLens Diff UI Ersatz)
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
    },
    opts = {
      enhanced_diff_hl = true,
      use_icons = true,
      show_help_hints = true,
    },
  },

  -- FUGITIVE (Power Git Commands)
  {
    "tpope/vim-fugitive",
    cmd = {
      "Git",
      "G",
    },
  },

  -- LAZYGIT via snacks.nvim
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      lazygit = {
        enabled = true,
        configure = true,
        win = {
          width = 0,
          height = 0,
        },

        config = {
          os = {
            editCommand = "nvim", 
            editCommandTemplate = "nvim --server {{server}} --remote-send '<C-\\><C-n>:e {{filename}}<CR>'",
          },

          git = {
            paging = {
              colorArg = "always",
              -- 'syntax-theme="none"' sorgt dafür, dass Grün/Rot deinem Theme entsprechen
              pager = [[delta --paging=never --line-numbers --hunk-header-decoration-style="blue box" --hunk-header-style="file line-number syntax" --syntax-theme="none"]],
            },
          },

          gui = {
            sideBySideView = true,
          },
        },
      },
    },

    keys = {
      { "<leader>gg", function() Snacks.lazygit() end, desc = "LazyGit" },
    },
  },
}

-- :Gitsigns toggle_current_line_blame
-- :Gitsigns toggle_signs
-- :Gitsigns toggle_numhl
-- :Gitsigns toggle_linehl
-- :Gitsigns toggle_word_diff

```

## plugins/alpha.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/alpha.lua
```

```bash
nano plugins/alpha.lua
```

```bash
code plugins/alpha.lua
```

```lua
-- plugins/alpha.lua

-- Alte Desktop Version von https://www.lazyvim.org/plugins
-- return {
--   "nvimdev/dashboard-nvim",
--   lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
--   opts = function()
--     local logo = [[
--         ██████╗       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗         Z
--         ██╔══██╗      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     Z    
--         ██████╔╝█████╗██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  z       
--         ██╔═══╝ ╚════╝██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║z         
--         ██║           ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║          
--         ╚═╝           ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝          
--     ]]

--     logo = string.rep("\n", 8) .. logo .. "\n\n"

--     local opts = {
--       theme = "doom",
--       hide = {
--         -- this is taken care of by lualine
--         -- enabling this messes up the actual laststatus setting after loading a file
--         statusline = false,
--       },
--       config = {
--         header = vim.split(logo, "\n"),
--         -- stylua: ignore
--         center = {
--           { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
--           { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
--           { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
--           { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
--           { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
--           { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
--           { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
--           { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
--           { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
--         },
--         footer = function()
--           local stats = require("lazy").stats()
--           local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
--           return { "⚡ NeoVim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
--         end,
--       },
--     }

--     for _, button in ipairs(opts.config.center) do
--       button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
--       button.key_format = "  %s"
--     end

--     -- open dashboard after closing lazy
--     if vim.o.filetype == "lazy" then
--       vim.api.nvim_create_autocmd("WinClosed", {
--         pattern = tostring(vim.api.nvim_get_current_win()),
--         once = true,
--         callback = function()
--           vim.schedule(function()
--             vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
--           end)
--         end,
--       })
--     end

--     return opts
--   end,
-- }


-- Neovim Version
local v = vim.version()
local nvim_version = string.format("NeoVim v%d.%d.%d", v.major, v.minor, v.patch)

-- LazyVim Version (best effort)
-- LazyVim Version (best effort)
local lazy_version = (function()
  -- 1. Versuch: Die offizielle LazyVim Config nutzen (wie dein Terminal-Check)
  local ok_lv, lv_config = pcall(require, "lazyvim.config")
  if ok_lv and lv_config.version then
    return "LazyVim " .. lv_config.version
  end

  -- 2. Fallback: Direkt über lazy.nvim Metadaten (für Commit-Infos)
  local ok_lazy, Config = pcall(require, "lazy.core.config")
  if ok_lazy and Config.plugins and Config.plugins["LazyVim"] then
    local p = Config.plugins["LazyVim"]
    local version = p.version or p.tag or "stable"
    local commit = type(p.commit) == "string" and (" (" .. p.commit:sub(1, 7) .. ")") or ""
    return "LazyVim " .. version .. commit
  end

  return "LazyVim"
end)()

-- OS + Linux Distribution + Version
local os_info = (function()
  local file = io.open("/etc/os-release", "r")
  if not file then
    return "Linux (unknown distro)"
  end

  local data = file:read("*a")
  file:close()

  local pretty = data:match('PRETTY_NAME="(.-)"')

  if pretty then
    -- optional: " (Noble Numbat)" entfernen
    pretty = pretty:gsub("%s*%b()", "")

    return pretty
  end

  return "Linux"
end)()

-- ASCII art found in:
-- https://github.com/MaximilianLloyd/ascii.nvim/
-- Also appears in:
-- https://github.com/doomemacs/doomemacs (MIT)
-- Original author unknown.
-- local header = [[
-- =================     ===============     ===============   ========  ========
-- \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
-- ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
-- || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
-- ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
-- || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
-- ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
-- || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
-- ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
-- ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
-- ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
-- ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
-- ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
-- ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
-- ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
-- ||.=='    _-'                                                     `' |  /==.||
-- =='    _-'                                                            \/   `==
-- \   _-'                    N E O V I M - J U L I A N                   `-_   /
--  `''                                                                      ``'

-- __NVIM__ / __LAZY__ / JKNV 3.6.9 / __OS__]]

-- local header = [[
--         ██████╗       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗         Z
--         ██╔══██╗      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     Z    
--         ██████╔╝█████╗██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  z       
--         ██╔═══╝ ╚════╝██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║z         
--         ██║           ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║          
--         ╚═╝           ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝          
-- 
-- N E O V I M - J U L I A N

-- __NVIM__ / __LAZY__ / JKNV 3.6.9 / __OS__]]

-- ASCII art found in:
-- https://github.com/MaximilianLloyd/ascii.nvim/
-- Original author unknown.
local header = [[
                                                                    
       ████ ██████           █████      ██                    
      ███████████             █████                            
      █████████ ███████████████████ ███   ███████████  
     █████████  ███    █████████████ █████ ██████████████  
    █████████ ██████████ █████████ █████ █████ ████ █████  
  ███████████ ███    ███ █████████ █████ █████ ████ █████ 
 ██████  █████████████████████ ████ █████ █████ ████ ██████

N E O V I M - J U L I A N

__NVIM__ / __LAZY__ / JKNV 3.6.9 / __OS__]]

header = header:gsub("__NVIM__", nvim_version):gsub("__LAZY__", lazy_version):gsub("__OS__", os_info)


return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        -- Von: https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },

        -- Von: https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
        -- sections = {
        --   { section = "header" },
        --   { section = "keys", gap = 1, padding = 2},
        --   { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2},
        --   { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
        --   { section = "startup" },
        -- },

        -- Von: https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
        -- sections = {
        --   { section = "header" },
        --   {
        --     pane = 2,
        --     section = "terminal",
        --     cmd = "colorscript -e square",
        --     height = 5,
        --     padding = 1,
        --   },
        --   { section = "keys", gap = 1, padding = 1 },
        --   { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        --   { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        --   {
        --     pane = 2,
        --     icon = " ",
        --     title = "Git Status",
        --     section = "terminal",
        --     enabled = function()
        --       return Snacks.git.get_root() ~= nil
        --     end,
        --     cmd = "git status --short --branch --renames",
        --     height = 5,
        --     padding = 1,
        --     ttl = 5 * 60,
        --     indent = 3,
        --   },
        --   { section = "startup" },
        -- },

        -- Von: https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
        -- sections = {
        --   {
        --     section = "terminal",
        --     cmd = "chafa ~/.config/wall.png --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
        --     height = 17,
        --     padding = 1,
        --   },
        --   {
        --     pane = 2,
        --     { section = "keys", gap = 1, padding = 1 },
        --     { section = "startup" },
        --   },
        -- },

        -- Von: https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
        -- sections = {
        --   { section = "header" },
        --   { section = "keys", gap = 1, padding = 1 },
        --   { section = "startup" },
        -- },

        -- Von: https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
        -- sections = {
        --   { section = "header" },
        --   {
        --     pane = 2,
        --     section = "terminal",
        --     cmd = "colorscript -e square",
        --     height = 5,
        --     padding = 1,
        --   },
        --   { section = "keys", gap = 1, padding = 1 },
        --   {
        --     pane = 2,
        --     icon = " ",
        --     desc = "Browse Repo",
        --     padding = 1,
        --     key = "b",
        --     action = function()
        --       Snacks.gitbrowse()
        --     end,
        --   },
        --   function()
        --     local in_git = Snacks.git.get_root() ~= nil
        --     local cmds = {
        --       {
        --         title = "Notifications",
        --         cmd = "gh notify -s -a -n5",
        --         action = function()
        --           vim.ui.open("https://github.com/notifications")
        --         end,
        --         key = "n",
        --         icon = " ",
        --         height = 5,
        --         enabled = true,
        --       },
        --       {
        --         title = "Open Issues",
        --         cmd = "gh issue list -L 3",
        --         key = "i",
        --         action = function()
        --           vim.fn.jobstart("gh issue list --web", { detach = true })
        --         end,
        --         icon = " ",
        --         height = 7,
        --       },
        --       {
        --         icon = " ",
        --         title = "Open PRs",
        --         cmd = "gh pr list -L 3",
        --         key = "P",
        --         action = function()
        --           vim.fn.jobstart("gh pr list --web", { detach = true })
        --         end,
        --         height = 7,
        --       },
        --       {
        --         icon = " ",
        --         title = "Git Status",
        --         cmd = "git --no-pager diff --stat -B -M -C",
        --         height = 10,
        --       },
        --     }
        --     return vim.tbl_map(function(cmd)
        --       return vim.tbl_extend("force", {
        --         pane = 2,
        --         section = "terminal",
        --         enabled = in_git,
        --         padding = 1,
        --         ttl = 5 * 60,
        --         indent = 3,
        --       }, cmd)
        --     end, cmds)
        --   end,
        --   { section = "startup" },
        -- },

        -- Von: https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
        -- sections = {
        --   { section = "header" },
        --   { section = "keys", gap = 1, padding = 1 },
        --   { section = "startup" },
        --   {
        --     section = "terminal",
        --     cmd = "pokemon-colorscripts -r --no-title; sleep .1",
        --     random = 10,
        --     pane = 2,
        --     indent = 4,
        --     height = 30,
        --   },
        -- },

        -- Von: https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
        -- formats = {
        --   key = function(item)
        --     return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        --   end,
        -- },

        -- Von: https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
        -- sections = {
        --   { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
        --   { title = "MRU", padding = 1 },
        --   { section = "recent_files", limit = 8, padding = 1 },
        --   { title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
        --   { section = "recent_files", cwd = true, limit = 8, padding = 1 },
        --   { title = "Sessions", padding = 1 },
        --   { section = "projects", padding = 1 },
        --   { title = "Bookmarks", padding = 1 },
        --   { section = "keys" },
        -- },

        preset = {
          -- ASCII art found in:
          -- https://github.com/MaximilianLloyd/ascii.nvim/
          -- Also appears in:
          -- https://github.com/doomemacs/doomemacs (MIT)
          -- Original author unknown.
--           [[
-- =================     ===============     ===============   ========  ========
-- \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
-- ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
-- || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
-- ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
-- || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
-- ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
-- || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
-- ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
-- ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
-- ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
-- ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
-- ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
-- ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
-- ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
-- ||.=='    _-'                                                     `' |  /==.||
-- =='    _-'                                                            \/   `==
-- \   _-'                    N E O V I M - J U L I A N                   `-_   /
--  `''                                                                      ``'
--           ]],

          -- ASCII art found in:
          -- https://github.com/MaximilianLloyd/ascii.nvim/
          -- Original author unknown.

--           [[
--                                                                     
--        ████ ██████           █████      ██                    
--       ███████████             █████                            
--       █████████ ███████████████████ ███   ███████████  
--      █████████  ███    █████████████ █████ ██████████████  
--     █████████ ██████████ █████████ █████ █████ ████ █████  
--   ███████████ ███    ███ █████████ █████ █████ ████ █████ 
--  ██████  █████████████████████ ████ █████ █████ ████ ██████

-- N E O V I M - J U L I A N]],

          header = header,

          -- ASCII art found in:
          -- https://github.com/MaximilianLloyd/ascii.nvim/
          -- Original author unknown.
--           [[
--             :h-                                  Nhy`               
--            -mh.                           h.    `Ndho               
--            hmh+                          oNm.   oNdhh               
--           `Nmhd`                        /NNmd  /NNhhd               
--           -NNhhy                      `hMNmmm`+NNdhhh               
--           .NNmhhs              ```....`..-:/./mNdhhh+               
--            mNNdhhh-     `.-::///+++////++//:--.`-/sd`               
--            oNNNdhhdo..://++//++++++/+++//++///++/-.`                
--       y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       
--  .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        
--  h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         
--  hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        
--  /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       
--   oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      
--    /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     
--      /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    
--        .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    
--        -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   
--        /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   
--        //+++//++++++////+++///::--                 .::::-------::   
--        :/++++///////////++++//////.                -:/:----::../-   
--        -/++++//++///+//////////////               .::::---:::-.+`   
--        `////////////////////////////:.            --::-----...-/    
--         -///://////////////////////::::-..      :-:-:-..-::.`.+`    
--          :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   
--            ::::://::://::::::::::::::----------..-:....`.../- -+oo/ 
--             -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``
--            s-`::--:::------:////----:---.-:::...-.....`./:          
--           yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           
--          oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              
--         :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                
--                         .-:mNdhh:.......--::::-`                    
--                            yNh/..------..`                          
-- 
-- N E O V I M - J U L I A N
--                                                                     
--           ]],

--           [[
--         ██████╗       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗         Z
--         ██╔══██╗      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     Z    
--         ██████╔╝█████╗██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  z       
--         ██╔═══╝ ╚════╝██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║z         
--         ██║           ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║          
--         ╚═╝           ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝          
-- 
-- N E O V I M - J U L I A N
-- 
--           ]],

--           [[
-- 
--           _____                    _____                   _______                   _____                    _____                    _____          
--          /\    \                  /\    \                 /::\    \                 /\    \                  /\    \                  /\    \         
--         /::\____\                /::\    \               /::::\    \               /::\____\                /::\    \                /::\____\        
--        /::::|   |               /::::\    \             /::::::\    \             /:::/    /                \:::\    \              /::::|   |        
--       /:::::|   |              /::::::\    \           /::::::::\    \           /:::/    /                  \:::\    \            /:::::|   |        
--      /::::::|   |             /:::/\:::\    \         /:::/~~\:::\    \         /:::/    /                    \:::\    \          /::::::|   |        
--     /:::/|::|   |            /:::/__\:::\    \       /:::/    \:::\    \       /:::/____/                      \:::\    \        /:::/|::|   |        
--    /:::/ |::|   |           /::::\   \:::\    \     /:::/    / \:::\    \      |::|    |                       /::::\    \      /:::/ |::|   |        
--   /:::/  |::|   | _____    /::::::\   \:::\    \   /:::/____/   \:::\____\     |::|    |     _____    ____    /::::::\    \    /:::/  |::|___|______  
--  /:::/   |::|   |/\    \  /:::/\:::\   \:::\    \ |:::|    |     |:::|    |    |::|    |    /\    \  /\   \  /:::/\:::\    \  /:::/   |::::::::\    \ 
-- /:: /    |::|   /::\____\/:::/__\:::\   \:::\____\|:::|____|     |:::|    |    |::|    |   /::\____\/::\   \/:::/  \:::\____\/:::/    |:::::::::\____\
-- \::/    /|::|  /:::/    /\:::\   \:::\   \::/    / \:::\    \   /:::/    /     |::|    |  /:::/    /\:::\  /:::/    \::/    /\::/    / ~~~~~/:::/    /
--  \/____/ |::| /:::/    /  \:::\   \:::\   \/____/   \:::\    \ /:::/    /      |::|    | /:::/    /  \:::\/:::/    / \/____/  \/____/      /:::/    / 
--          |::|/:::/    /    \:::\   \:::\    \        \:::\    /:::/    /       |::|____|/:::/    /    \::::::/    /                       /:::/    /  
--          |::::::/    /      \:::\   \:::\____\        \:::\__/:::/    /        |:::::::::::/    /      \::::/____/                       /:::/    /   
--          |:::::/    /        \:::\   \::/    /         \::::::::/    /         \::::::::::/____/        \:::\    \                      /:::/    /    
--          |::::/    /          \:::\   \/____/           \::::::/    /           ~~~~~~~~~~               \:::\    \                    /:::/    /     
--          /:::/    /            \:::\    \                \::::/    /                                      \:::\    \                  /:::/    /      
--         /:::/    /              \:::\____\                \::/____/                                        \:::\____\                /:::/    /       
--         \::/    /                \::/    /                 ~~                                               \::/    /                \::/    /        
--          \/____/                  \/____/                                                                    \/____/                  \/____/         
-- 
-- N E O V I M - J U L I A N
-- 
--           ]],

--           [[
-- 
--  /$$   /$$ /$$$$$$$$  /$$$$$$  /$$    /$$ /$$$$$$ /$$      /$$
-- | $$$ | $$| $$_____/ /$$__  $$| $$   | $$|_  $$_/| $$$    /$$$
-- | $$$$| $$| $$      | $$  \ $$| $$   | $$  | $$  | $$$$  /$$$$
-- | $$ $$ $$| $$$$$   | $$  | $$|  $$ / $$/  | $$  | $$ $$/$$ $$
-- | $$  $$$$| $$__/   | $$  | $$ \  $$ $$/   | $$  | $$  $$$| $$
-- | $$\  $$$| $$      | $$  | $$  \  $$$/    | $$  | $$\  $ | $$
-- | $$ \  $$| $$$$$$$$|  $$$$$$/   \  $/    /$$$$$$| $$ \/  | $$
-- |__/  \__/|________/ \______/     \_/    |______/|__/     |__/
--                                                            
-- N E O V I M - J U L I A N
-- 
--           ]],

--           [[
-- 
--   _   _ ______ ______      _______ __  __ 
--  | \ | |  ____/ __ \ \    / /_   _|  \/  |
--  |  \| | |__ | |  | \ \  / /  | | | \  / |
--  | . ` |  __|| |  | |\ \/ /   | | | |\/| |
--  | |\  | |___| |__| | \  /   _| |_| |  | |
--  |_| \_|______\____/   \/   |_____|_|  |_|
--                                        
-- N E O V I M - J U L I A N
-- 
--           ]],

--           [[
-- 
--  .-----------------. .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
-- | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
-- | | ____  _____  | || |  _________   | || |     ____     | || | ____   ____  | || |     _____    | || | ____    ____ | |
-- | ||_   \|_   _| | || | |_   ___  |  | || |   .'    `.   | || ||_  _| |_  _| | || |    |_   _|   | || ||_   \  /   _|| |
-- | |  |   \ | |   | || |   | |_  \_|  | || |  /  .--.  \  | || |  \ \   / /   | || |      | |     | || |  |   \/   |  | |
-- | |  | |\ \| |   | || |   |  _|  _   | || |  | |    | |  | || |   \ \ / /    | || |      | |     | || |  | |\  /| |  | |
-- | | _| |_\   |_  | || |  _| |___/ |  | || |  \  `--'  /  | || |    \ ' /     | || |     _| |_    | || | _| |_\/_| |_ | |
-- | ||_____|\____| | || | |_________|  | || |   `.____.'   | || |     \_/      | || |    |_____|   | || ||_____||_____|| |
-- | |              | || |              | || |              | || |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
-- 
-- N E O V I M - J U L I A N
-- 
--           ]],

--           [[
-- 
--                           ,                                                                   
--       ,       ,      ,    )\          ,    ,          ,    ,        ,       ,          ,      
--      /(       )\    /( |‾‾‾‾‾|\      /(    )\        /(    )\      /(      /(          )\     
--    |‾‾‾‾|   |‾‾‾|\|‾‾‾‾|     | \  /|‾‾‾‾||‾‾‾‾|\   /|‾‾‾||‾‾‾|\  |‾‾‾‾| /|‾‾‾‾|      |‾‾‾‾|\  
--    |    |\ /|   |||    \‾‾‾‾‾\ | / |    ||    | \ / |   ||   | \ |    || |    |      |    | \ 
--    |‾‾‾‾||/‾‾‾‾‾\||‾‾‾‾ ,     \|| /‾‾‾‾‾/\‾‾‾‾\ || / ‾‾‾/\‾‾‾ \ ||‾‾‾‾||/‾‾‾‾/       |‾‾‾‾|  \
--    |    |/ /|    ||     /‾‾‾‾|/ |/     /  \    \||/    /  \    \||    ||     |       |    |  |
--    |      / |    ||     \‾‾‾\|  |     |    |    ||    |    |    ||    ||     |  /|‾|\ \    \ |
--    |     /  |    ||     /--,/‾|\|     |    |    ||    |    |    ||    | \     \/ /‾\ \ \    \|
--   /|    /  /     ||     '‾‾‾‾‾\| \     \  /    / |    |    |    ||    |  \     \/   \ \/     |
--  //    /| /     / |     /     /   \     \/    /  |    |    |    ||    |   \          \/     / 
-- |/    / |/     /   ‾‾‾|/     /     ‾‾‾‾|/    /   |    |    |    ||    |    |      /\       /  
--  ‾‾‾‾‾   ‾‾‾‾‾‾        ‾‾‾‾‾‾           ‾‾‾‾‾     ‾‾‾‾      ‾‾‾‾  ‾‾‾‾      ‾‾‾‾‾‾  ‾‾‾‾‾‾‾   
-- 
-- N E O V I M - J U L I A N
-- 
--           ]],

--           [[
-- 
--  ________   _______   ________  ___      ___ ___  _____ ______      
-- |\   ___  \|\  ___ \ |\   __  \|\  \    /  /|\  \|\   _ \  _   \    
-- \ \  \\ \  \ \   __/|\ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \   
--  \ \  \\ \  \ \  \_|/_\ \  \\\  \ \  \/  / / \ \  \ \  \\|__| \  \  
--   \ \  \\ \  \ \  \_|\ \ \  \\\  \ \    / /   \ \  \ \  \    \ \  \ 
--    \ \__\\ \__\ \_______\ \_______\ \__/ /     \ \__\ \__\    \ \__\
--     \|__| \|__|\|_______|\|_______|\|__|/       \|__|\|__|     \|__|
-- 
-- N E O V I M - J U L I A N
-- 
--           ]],

--           [[
-- 
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
-- 
-- N E O V I M - J U L I A N
-- 
--           ]],

--           [[
-- 
--  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
--  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
-- ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
-- ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ 
-- ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
-- ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
-- ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
--    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   
--          ░    ░  ░    ░ ░        ░   ░         ░   
--                                 ░                  
-- 
-- N E O V I M - J U L I A N
-- 
--           ]],

--           [[
-- 
-- ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄  
-- ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄
-- ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███
-- ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███
-- ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███
-- ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███
-- ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███
--  ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀ 
-- 
-- N E O V I M - J U L I A N
-- 
--           ]],

--           [[
-- 
--  ██████   █████ ██████████    ███████    █████   █████ █████ ██████   ██████
-- ░░██████ ░░███ ░░███░░░░░█  ███░░░░░███ ░░███   ░░███ ░░███ ░░██████ ██████ 
--  ░███░███ ░███  ░███  █ ░  ███     ░░███ ░███    ░███  ░███  ░███░█████░███ 
--  ░███░░███░███  ░██████   ░███      ░███ ░███    ░███  ░███  ░███░░███ ░███ 
--  ░███ ░░██████  ░███░░█   ░███      ░███ ░░███   ███   ░███  ░███ ░░░  ░███ 
--  ░███  ░░█████  ░███ ░   █░░███     ███   ░░░█████░    ░███  ░███      ░███ 
--  █████  ░░█████ ██████████ ░░░███████░      ░░███      █████ █████     █████
-- ░░░░░    ░░░░░ ░░░░░░░░░░    ░░░░░░░         ░░░      ░░░░░ ░░░░░     ░░░░░ 
-- 
-- N E O V I M - J U L I A N
-- 
--           ]],

--           header = [[

--     ....      ..                   ...     ...                                                    .                        
--   +^""888h. ~"888h              .=*8888n.."%888:                                                 @88>                      
--  8X.  ?8888X  8888f            X    ?8888f '8888                     u.        ...     ..        %8P      ..    .     :    
-- '888x  8888X  8888~            88x. '8888X  8888>       .u     ...ue888b    :~""888h.:^"888:      .     .888: x888  x888.  
-- '88888 8888X   "88x:          '8888k 8888X  '"*8h.   ud8888.   888R Y888r  8X   `8888X  8888>   .@88u  ~`8888~'888X`?888f` 
--  `8888 8888X  X88x.            "8888 X888X .xH8    :888'8888.  888R I888> X888n. 8888X  ?888>  ''888E`   X888  888X '888>  
--    `*` 8888X '88888X             `8" X888!:888X    d888 '88%"  888R I888> '88888 8888X   ?**h.   888E    X888  888X '888>  
--   ~`...8888X  "88888            =~`  X888 X888X    8888.+"     888R I888>   `*88 8888~ x88x.     888E    X888  888X '888>  
--    x8888888X.   `%8" 88888888    :h. X8*` !888X    8888L      u8888cJ888   ..<"  88*`  88888X    888E    X888  888X '888>  
--   '%"*8888888h.   "  88888888   X888xX"   '8888..: '8888c. .+  "*888*P"       ..XC.    `*8888k   888&   "*88%""*88" '888!` 
--   ~    888888888!`            :~`888f     '*888*"   "88888%      'Y"        :888888H.    `%88>   R888"    `~    "    `"`   
--        X888^"""                   ""        `"`       "YP'                 <  `"888888:    X"     ""                       
--        `88f                                                                      %888888x.-`                               
--         88                                                                         ""**""                                  
--         ""                                                                                                                 

-- N E O V I M - J U L I A N
                                                                     
--           ]],

--           header = [[

--      ...     ...                                                    .                        
--   .=*8888n.."%888:                                                 @88>                      
--  X    ?8888f '8888                     u.        ...     ..        %8P      ..    .     :    
--  88x. '8888X  8888>       .u     ...ue888b    :~""888h.:^"888:      .     .888: x888  x888.  
-- '8888k 8888X  '"*8h.   ud8888.   888R Y888r  8X   `8888X  8888>   .@88u  ~`8888~'888X`?888f` 
--  "8888 X888X .xH8    :888'8888.  888R I888> X888n. 8888X  ?888>  ''888E`   X888  888X '888>  
--    `8" X888!:888X    d888 '88%"  888R I888> '88888 8888X   ?**h.   888E    X888  888X '888>  
--   =~`  X888 X888X    8888.+"     888R I888>   `*88 8888~ x88x.     888E    X888  888X '888>  
--    :h. X8*` !888X    8888L      u8888cJ888   ..<"  88*`  88888X    888E    X888  888X '888>  
--   X888xX"   '8888..: '8888c. .+  "*888*P"       ..XC.    `*8888k   888&   "*88%""*88" '888!` 
-- :~`888f     '*888*"   "88888%      'Y"        :888888H.    `%88>   R888"    `~    "    `"`   
--     ""        `"`       "YP'                 <  `"888888:    X"     ""                       
--                                                    %888888x.-`                               
--                                                      ""**""                                  

-- N E O V I M - J U L I A N
                                                                     
--           ]],

--           header = [[

--  ...=-. .   ..=...                                                              
-- ..===--..   ..===.....                                       ...                
-- =====---.   ..+++++...                                       .==                
-- ===+======....+++++... .=..####.  .-#*##.  .:#%##..+##    +##.##..##*####.#####.
-- +++++======...+++++... .=:     #..#......:.#     .#.###  .##. ##..##. .-##. .###
-- +++++..=====:.+++++... .=:     # +:.......=-     .#:.##-.##.  ##..##.  .##   *##
-- +++++...======*++++... .=:     # .#      ..%     .#.. ####..  ##..##.  .##   *##
-- +++++.   =====+****...  =:     #  .#=..=#  .#:..=#.   .##:   .##..##.  .##.  *##
-- +++++.   ..===+++**...                                                          
-- ..***.   ...=++++...                                                            
--    .*.      .-+.                                                                

-- N E O V I M - J U L I A N
                                                                     
--           ]],

--           header = [[
     
     
--        ▄▌             █
--     ,▓████▄           ███▄
--   ,████████▒          █████▄
--  ████████████         ███████▄
-- ▐█████████████▄       ████████H
-- ▐██████████████▌      ████████H
-- ▐████████████████▄    ████████H
-- ▐███████▒▀████████▌   ████████H
-- ▐███████▒░`█████████▄ ████████H
-- ▐███████▒  `▀████████▌███████▌H
-- ▐███████▒    ╙███████████████▌H
-- ║███████▒     `▀█████████████▌H
-- ▐███████▒       ╙█████████████H
--  ╙██████▒        `██████████▀Ñ`
--   `╙████▒         `╠██████▒Ñ╨`
--     `╨▀█▒           `███▒Ñ`
--        ╙╨            `╨╨`

-- N E O V I M - J U L I A N
                                                                     
--           ]],

          -- footer = {
          --   "",
          --   " github.com",
          -- },

          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            -- { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "y", desc = "Lazy Health", action = ":Lazy health" },
            { icon = " ", key = "h", desc = "System Health Check", action = ":checkhealth" },
            { icon = " ", key = "m", desc = "Mason", action = ":Mason" },
            -- { icon = " ", key = "i", desc = "LspInfo", action = ":LspInfo" },
            {
              icon = " ",
              key = "b",
              desc = "17jk789/my-vs-code-setting",
              action = function()
                local url = "https://github.com/17jk789/my-vs-code-setting/blob/main/README-neovim-config-Ubuntu.md"
                local cmd

                if vim.fn.has("mac") == 1 then
                  cmd = { "open", url }
                elseif vim.env.WSL_DISTRO_NAME ~= nil then
                  -- Speziell für WSL: Nutzt den Windows-Standardbrowser
                  cmd = { "wslview", url }
                elseif vim.fn.has("unix") == 1 then
                  cmd = { "xdg-open", url }
                end

                if cmd then
                  vim.fn.jobstart(cmd, { detach = true })
                else
                  vim.notify("No suitable command found to open the URL.", vim.log.levels.ERROR)
                end
              end
            },
            -- {
            --   icon = " ",
            --   key = "k",
            --   desc = "LazyVim Keymaps",
            --   action = function()
            --     local url = "https://www.lazyvim.org/keymaps"
            --     local cmd
            --     if vim.fn.has("mac") == 1 then
            --       cmd = {"open", url}
            --     elseif vim.fn.has("unix") == 1 then
            --       cmd = {"xdg-open", url}
            --     elseif vim.fn.has("win32") == 1 then
            --       cmd = {"cmd", "/c", "start", "", url}
            --     end
            --     if cmd then
            --       vim.fn.jobstart(cmd, {detach = true})
            --     end
            --   end
            -- },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}

```

## plugins/fzf.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/fzf.lua
```

```bash
nano plugins/fzf.lua
```

```bash
code plugins/fzf.lua
```

```lua
-- plugins/fzf.lua

return {
  { import = "lazyvim.plugins.extras.editor.fzf" },

  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      local fzf = require("fzf-lua")
      
      opts.winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
          layout = "flex",        -- Wechselt automatisch zw. horizontal/vertikal
          flip_threshold = 120,   -- Ab 120 Spalten wird auf horizontal gewechselt
        },
      }

      opts.keymap = {
        fzf = {
          -- Schnelleres Scrollen in der Vorschau
          ["ctrl-d"] = "preview-page-down",
          ["ctrl-u"] = "preview-page-up",
          -- Alles auswählen und in die Quickfix-Liste werfen
          ["ctrl-q"] = "select-all+accept",
        },
      }

      opts.files = {
        formatter = "path.filename_first", -- Zeigt "fzf.lua  ~/config/..." statt Pfad zuerst
        fd_opts = "--color=never --type f --hidden --follow --exclude .git",
      }

      -- Bildvorschau aktivieren, wird aber von snacks.nvim übernommen: image = { enabled = true }, -> nur bei Problem aktiviren
      -- opts.previewers = {
      --   builtin = {
      --     extensions = {
      --       ["png"] = { "chafa" }, -- Erfordert 'chafa' auf deinem Ubuntu
      --       ["jpg"] = { "chafa" },
      --       ["jpeg"] = { "chafa" },
      --       ["gif"] = { "chafa" },
      --     },
      --     ueberzug_scaler = "kitty", -- Ghostty nutzt das Kitty-Protokoll
      --   },
      -- }

      return opts
    end,
  },
}

```

## config/lazyvim.lua

Es gab: completion.cmp.enable is now deperecated, the nvim-cmp source will be romoved soon. Use the in-process la...

Sollte aber in plugins/completion.lua gefixt worden sein!

```bash
cd ~/.config/nvim/lua
```

```bash
vim config/lazyvim.lua
```

```bash
nano config/lazyvim.lua
```

```bash
code config/lazyvim.lua
```

Lösung:

```lua
-- config/lazyvim.lua

-- return {
--   -- disable lazyvim's builtin cmp
--   { "hrsh7th/nvim-cmp", enabled = false },
-- }

```

## plugins/snacks.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/snacks.lua
```

```bash
nano plugins/snacks.lua
```

```bash
code plugins/snacks.lua
```

```lua
-- plugins/snacks.lua

-- return {
--   "folke/snacks.nvim",
--   opts = {
--     explorer = {
--       replace_netrw = true,
--     },

--     picker = {
--       sources = {
--         explorer = {
--           hidden = true,
--           ignored = true,
--           layout = {
--             layout = {
--               position = "right",
--             },
--           },
--         },
--       },
--     },
--   },
-- }

return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
    },

    picker = {
      sources = {
        -- Explorer
        explorer = {
          hidden = true,
          ignored = true,
          layout = {
            layout = {
              position = "right",
              -- size = 15, -- Höhe in Zeilen
            },
          },
        },

        -- Git Status
        git_status = {
          layout = {
            layout = {
              -- position = "right",
              -- size = 8,
            },
          },
        },
      },
    },
  },
}

```

## config/lazy.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim config/lazy.lua
```

```bash
nano config/lazy.lua
```

```bash
code config/lazy.lua
```

```lua
-- plugins/lazy.lua

-- Diese Datei ist der "Chef" deiner Konfiguration
require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  defaults = { lazy = false },
  -- HIER MUSS ES REIN:
  ui = {
    border = "rounded",
  },
})

```

## config/copilot.lua

<!-- ```bash
git clone --depth=1 https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
``` -->

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/copilot.lua
```

```bash
nano plugins/copilot.lua
```

```bash
code plugins/copilot.lua
```

```lua
-- plugins/copilot.lua

-- {
--   "github/copilot.vim",
--   event = "InsertEnter",
--   config = function()
--     vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
--   end,
-- }

-- keine Tab überschreibung
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true

-- optional: standardmäßig AUS (sicherer)
-- vim.g.copilot_enabled = false -- optional: standardmäßig AUS
-- vim.cmd("Copilot disable")

-- Keymaps
-- vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
-- vim.keymap.set("i", "<C-l>", "<Plug>(copilot-next)")
-- vim.keymap.set("i", "<C-h>", "<Plug>(copilot-previous)")
-- vim.keymap.set("i", "<C-e>", "<Plug>(copilot-dismiss)")

-- return {
--   {
--     "github/copilot.vim",
--     event = "InsertEnter",
--     config = function()
--       vim.g.copilot_no_tab_map = true
--       vim.g.copilot_assume_mapped = true
--       vim.g.copilot_enabled = false
--     end,
--   },
-- }

return {
  {
    "github/copilot.vim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Grundeinstellungen
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_enabled = true

      -- Copilot beim Öffnen aktivieren
      vim.cmd("Copilot enable")

      -- Accept
      -- vim.keymap.set("i", "<C-J>", function()
      --   return vim.fn["copilot#Accept"]("")
      -- end, { expr = true, silent = true })

      -- Navigation
      vim.keymap.set("i", "<C-l>", "<Plug>(copilot-next)", { silent = true })
      vim.keymap.set("i", "<C-h>", "<Plug>(copilot-previous)", { silent = true })
      vim.keymap.set("i", "<C-e>", "<Plug>(copilot-dismiss)", { silent = true })

      -- Toggle
      -- vim.keymap.set("n", "<leader>ai", function()
      --   vim.g.copilot_enabled = not vim.g.copilot_enabled
      --   vim.cmd(vim.g.copilot_enabled and "Copilot enable" or "Copilot disable")
      --   print(vim.g.copilot_enabled and "Copilot ON" or "Copilot OFF")
      -- end, { desc = "Toggle Copilot" })
      vim.keymap.set("n", "<leader>ai", function()
        -- Aktuellen Zustand prüfen via :Copilot status (indirekt)
        local output = vim.fn.systemlist("Copilot status")
        local enabled = not vim.tbl_contains(output, "Disabled globally by :Copilot disable")

        if enabled then
          vim.cmd("Copilot disable")
          print("Copilot OFF")
        else
          vim.cmd("Copilot enable")
          print("Copilot ON")
        end
      end, { desc = "Toggle Copilot" })
    end,
  },
}

```

<!-- Update Copilot:

Einfach:

```bash
cd ~/.config/nvim/pack/github/start/copilot.vim
git pull
```

Manchmal klappt git pull nicht sauber → dann:

```bash
rm -rf ~/.config/nvim/pack/github/start/copilot.vim

git clone --depth=1 https://github.com/github/copilot.vim.git \
~/.config/nvim/pack/github/start/copilot.vim
``` -->

## config/avante.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/avante.lua
```

```bash
nano plugins/avante.lua
```

```bash
code plugins/avante.lua
```

```lua
-- plugins/avante.lua

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    provider = "copilot", -- Nutzt bestehendes Setup
    auto_suggestions_provider = "copilot",
    behaviour = {
      auto_suggestions = false, -- Konfliktvermeidung mit blink.cmp
      minimal_diff = true,
    },
  },
  build = "make", -- Windows-Nutzer: "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "zbirenbaum/copilot.lua", -- Bestehende Integration
    {
      "HakonHarnes/img-clip.nvim",
      opts = { default = { embed_image_as_base64 = false, prompt_for_file_name = false, drag_and_drop = { insert_mode = true }, use_absolute_path = true } },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
  },
}

```

## config/noice.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/noice.lua
```

```bash
nano plugins/noice.lua
```

```bash
code plugins/noice.lua
```

```lua
-- plugins/noice.lua

return {
  "folke/noice.nvim",
  event = "VeryLazy",

  opts = function()
    vim.g.noice_pyjava_filter = true

    return {
      routes = {
        {
          filter = {
            any = {
              { event = "msg_show" },
              { event = "lsp", kind = "progress" },
              { event = "notify" },
            },
            cond = function()
              if not vim.g.noice_pyjava_filter then
                return false
              end

              local ft = vim.bo.filetype
              return ft == "python" or ft == "java"
            end,
          },
          opts = { skip = true },
        },
      },

      lsp = {
        progress = {
          enabled = true,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },

      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    }
  end,

  keys = {
    {
      "<leader>un",
      function()
        vim.g.noice_pyjava_filter = not vim.g.noice_pyjava_filter

        if vim.g.noice_pyjava_filter then
          vim.notify("Noice: Python/Java Filter ON")
        else
          vim.notify("Noice: Python/Java Filter OFF")
        end
      end,
      desc = "Toggle Noice Python/Java Filter",
    },
  },
}

```

## config/lualine.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/lualine.lua
```

```bash
nano plugins/lualine.lua
```

```bash
code plugins/lualine.lua
```

```lua
-- plugins/lualine.lua

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local function battery()
      local handle = io.popen("acpi -b 2>/dev/null | grep -o '[0-9]\\+%' | head -n1 | tr -d '%'")
      if handle then
        local result = handle:read("*a")
        handle:close()
        result = string.gsub(result, "%D", "") -- Nur Zahlen extrahieren
        if tonumber(result) then
          local charge = tonumber(result)
          local icon = " "
          if charge < 20 then
            icon = " "
          elseif charge < 40 then
            icon = " "
          elseif charge < 60 then
            icon = " "
          elseif charge < 80 then
            icon = " "
          end
          return icon .. charge .. "%%"
        end
      end
      return " N/A"
    end

    -- LSP
    local function lsp_server()
      local clients = vim.lsp.get_clients({ bufnr = 0 })

      if not clients or vim.tbl_isempty(clients) then
        return "  None"
        -- return "  None"
      end

      local names = {}

      for _, client in ipairs(clients) do
        if client.name and client.name ~= "null-ls" then
          local name = client.name

          -- kürzen auf max 8 Zeichen
          if #name > 8 then
            name = name:sub(1, 9) .. "…"
          end

          names[#names + 1] = name
        end
      end

      if #names == 0 then
        return "  None"
        -- return "  None"
      end

      return "  " .. table.concat(names, ", ")
      -- return "  " .. table.concat(names, ", ")
    end

    -- Anzahl geladener Plugins (LazyVim / lazy.nvim)
    local plugin_cache = nil

    -- wird genau einmal nach Lazy-Load gesetzt
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyDone",
      callback = function()
        local ok, lazy = pcall(require, "lazy")
        if not ok then
          return
        end

        local stats = lazy.stats()
        plugin_cache = (stats and stats.loaded) or 0
      end,
    })

    local function plugins_loaded()
      -- Fallback, falls Lazy noch nicht fertig ist
      if plugin_cache == nil then
        local ok, lazy = pcall(require, "lazy")
        if not ok then
          -- return "  0"
          return " 󰗼 0"
        end

        local stats = lazy.stats()
        -- return "  " .. ((stats and stats.loaded) or 0)
        return " 󰗼 " .. ((stats and stats.loaded) or 0)
      end

      -- return "  " .. plugin_cache
      return " 󰗼 " .. plugin_cache
    end

    -- Kodierung (UTF-8 etc.)
    local function encoding()
      local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
      -- return " " .. enc:upper()
      return " " .. enc:upper()
      -- return enc:upper()
    end

    local function file_format()
      local fmt = vim.bo.fileformat:upper()
      local icon = fmt == "UNIX" and "LF" or "CRLF"
      return " " .. icon .. " "
    end

    -- Füge Komponenten mit Trennern hinzu
    -- local x = opts.sections.lualine_x
    -- table.insert(x, 1, { battery, separator = { right = "" } })
    -- table.insert(x, 2, { lsp_server, separator = { right = "" } })
    -- table.insert(x, 3, { encoding, separator = { right = "" } })
    -- table.insert(x, 1, { battery })
    -- table.insert(x, 2, { lsp_server })
    -- table.insert(x, 3, { encoding })

    -- Stelle sicher, dass theme auf catppuccin steht
    opts.options = vim.tbl_extend("keep", opts.options or {}, {
      theme = "catppuccin",
    })

    -- Prüfen, ob ein Akku-Verzeichnis existiert (funktioniert unter Linux/macOS)
    local has_battery = vim.fn.isdirectory("/sys/class/power_supply/BAT0") == 1 
                    or vim.fn.isdirectory("/sys/class/power_supply/BAT1") == 1

    -- Füge Komponenten OHNE feste Farben hinzu
    if has_battery then
      table.insert(opts.sections.lualine_z, 1, {
        battery,
        separator = { left = "", right = "" },
      })
    end

    table.insert(opts.sections.lualine_y, 1, {
      lsp_server,
      separator = { left = "", right = "" },
    })

    table.insert(opts.sections.lualine_y, 2, {
      plugins_loaded,
      separator = { left = "", right = "" },
    })

    table.insert(opts.sections.lualine_y, 3, {
      encoding,
      separator = { left = "", right = "" },
    })

    table.insert(opts.sections.lualine_y, 4, {
      file_format,
      separator = { left = "", right = "" },
    })
  end,
}


```

or

```lua
-- soon
```

## config/discord.lua

```bash
cd ~/.config/nvim/lua
```

```bash
vim plugins/discord.lua
```

```bash
nano plugins/discord.lua
```

```bash
code plugins/discord.lua
```

```lua
-- plugins/discord.lua

return {
  "andweeb/presence.nvim",
  event = "VeryLazy", -- Wichtig: Lädt das Plugin erst, wenn alles bereit ist
  config = function()
    require("presence").setup({
      auto_update = true,
      editing_text = "Editing %s",
      file_explorer_text = "Browsing %s",
      show_time = true,
      -- Hier kannst du nichts am Pfad ändern, presence.nvim sucht automatisch.
    })
  end,
}

```

or

```lua
-- plugins/discord.lua

return {
  'vyfor/cord.nvim',
  build = ':Cord update',
  opts = {
    display = {
      theme = 'atom', -- Aktiviert das Atom Material Design
    },
    timer = {
      reset_on_change = false, -- Timer läuft beim Dateiwechsel einfach weiter
    },
  },
}

```

