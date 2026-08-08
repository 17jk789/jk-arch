# ============================================================
#
# Fish configuration
#
# Arch Linux
# C++23 development
# C++ software security research
# Reverse engineering
# Debugging
# Defensive security analysis
# Authorized pentesting
#
# Toolchain:
#   GCC
#   Clang / LLVM
#   GDB / Pwndbg
#   LLDB / CodeLLDB
#   CMake
#   Valgrind
#   ASan / UBSan
#   strace / ltrace
#   binutils
#
# ============================================================


# ============================================================
# Environment
# ============================================================

set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx PAGER less
set -gx MANPAGER 'less -R'

fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin

# LLVM tools

if test -d /usr/lib/llvm/bin
    fish_add_path /usr/lib/llvm/bin
end


# ============================================================
# Fish
# ============================================================

set -g fish_greeting ""


# ============================================================
# Basic aliases
# ============================================================

alias v nvim
alias vi nvim

alias ll 'ls -lah'
alias la 'ls -la'
alias l 'ls -lah'

alias c clear
alias cls clear

alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'

alias q exit


# ============================================================
# Git
# ============================================================

alias gs 'git status'
alias ga 'git add'
alias gc 'git commit'
alias gp 'git push'
alias gl 'git log --oneline --graph --decorate --all'


# ============================================================
# CMake
# ============================================================

alias cm cmake


function cb
    if not test -d build
        echo "No build directory found."
        return 1
    end

    cmake --build build --parallel
end


function cbr
    if test -d build
        rm -rf build
    end

    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_CXX_STANDARD=23 \
        -DCMAKE_CXX_STANDARD_REQUIRED=ON \
        -DCMAKE_CXX_EXTENSIONS=OFF \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

    if test $status -ne 0
        return 1
    end

    cmake --build build --parallel
end


function cdebug
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_CXX_STANDARD=23 \
        -DCMAKE_CXX_STANDARD_REQUIRED=ON \
        -DCMAKE_CXX_EXTENSIONS=OFF \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

    if test $status -ne 0
        return 1
    end

    cmake --build build --parallel
end


function crelease
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_STANDARD=23 \
        -DCMAKE_CXX_STANDARD_REQUIRED=ON \
        -DCMAKE_CXX_EXTENSIONS=OFF \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

    if test $status -ne 0
        return 1
    end

    cmake --build build --parallel
end


# ============================================================
# GCC C++23 debug
# ============================================================

function gxx-debug
    if test (count $argv) -eq 0
        echo "Usage: gxx-debug <source.cpp> [-o output]"
        return 1
    end

    g++ \
        -std=c++23 \
        -Wall \
        -Wextra \
        -Wpedantic \
        -Wconversion \
        -Wsign-conversion \
        -Wshadow \
        -Wformat=2 \
        -Wundef \
        -Wnon-virtual-dtor \
        -Wold-style-cast \
        -Woverloaded-virtual \
        -Wnull-dereference \
        -Wdouble-promotion \
        -Wmisleading-indentation \
        -O0 \
        -g3 \
        -fno-omit-frame-pointer \
        $argv
end


# ============================================================
# Clang C++23 debug
# ============================================================

function clangxx-debug
    if test (count $argv) -eq 0
        echo "Usage: clangxx-debug <source.cpp> [-o output]"
        return 1
    end

    clang++ \
        -std=c++23 \
        -Wall \
        -Wextra \
        -Wpedantic \
        -Wconversion \
        -Wsign-conversion \
        -Wshadow \
        -Wformat=2 \
        -Wundef \
        -Wnon-virtual-dtor \
        -Wold-style-cast \
        -Woverloaded-virtual \
        -Wnull-dereference \
        -Wdouble-promotion \
        -Wmisleading-indentation \
        -O0 \
        -g3 \
        -fno-omit-frame-pointer \
        $argv
end


# ============================================================
# GCC C++23 hardened build
#
# Production-oriented defensive build.
# ============================================================

function gxx-hardened
    if test (count $argv) -eq 0
        echo "Usage: gxx-hardened <source.cpp> [-o output]"
        return 1
    end

    g++ \
        -std=c++23 \
        -O2 \
        -D_FORTIFY_SOURCE=3 \
        -fstack-protector-strong \
        -fPIE \
        -Wall \
        -Wextra \
        -Wpedantic \
        -Wformat=2 \
        -Wconversion \
        -Wsign-conversion \
        -Wshadow \
        -Werror=format-security \
        $argv \
        -pie \
        -Wl,-z,relro \
        -Wl,-z,now \
        -Wl,-z,noexecstack
end


# ============================================================
# Clang C++23 hardened build
# ============================================================

function clangxx-hardened
    if test (count $argv) -eq 0
        echo "Usage: clangxx-hardened <source.cpp> [-o output]"
        return 1
    end

    clang++ \
        -std=c++23 \
        -O2 \
        -D_FORTIFY_SOURCE=3 \
        -fstack-protector-strong \
        -fPIE \
        -Wall \
        -Wextra \
        -Wpedantic \
        -Wformat=2 \
        -Wconversion \
        -Wsign-conversion \
        -Wshadow \
        -Werror=format-security \
        $argv \
        -pie \
        -Wl,-z,relro \
        -Wl,-z,now \
        -Wl,-z,noexecstack
end


# ============================================================
# Debuggers
#
# GDB:
#   Pwndbg should be configured globally.
#
# LLDB:
#   Used directly or through CodeLLDB.
# ============================================================

alias gdb-debug gdb
alias lldb-debug lldb
alias pwngdb gdb
alias codelldb-debug codelldb


function gd
    if test (count $argv) -eq 0
        echo "Usage: gd <program> [arguments...]"
        return 1
    end

    gdb --args $argv
end


function pgdb
    if test (count $argv) -eq 0
        echo "Usage: pgdb <program> [arguments...]"
        return 1
    end

    gdb --args $argv
end


function ld
    if test (count $argv) -eq 0
        echo "Usage: ld <program> [arguments...]"
        return 1
    end

    lldb -- $argv
end


function cld
    if test (count $argv) -eq 0
        echo "Usage: cld <program> [arguments...]"
        return 1
    end

    codelldb $argv
end


function gapp
    if not test -x ./build/app
        echo "build/app not found."
        return 1
    end

    gdb ./build/app
end


function lapp
    if not test -x ./build/app
        echo "build/app not found."
        return 1
    end

    lldb ./build/app
end


function capp
    if not test -x ./build/app
        echo "build/app not found."
        return 1
    end

    codelldb ./build/app
end


function runapp
    if test -x ./build/app
        ./build/app $argv
        return $status
    end

    if test -x ./app
        ./app $argv
        return $status
    end

    echo "No build/app or ./app found."
    return 1
end


# ============================================================
# C++ debug information
# ============================================================

function debug-info
    if test (count $argv) -eq 0
        set target ./build/app
    else
        set target $argv[1]
    end

    if not test -e "$target"
        echo "File not found: $target"
        return 1
    end

    echo "=== FILE ==="
    file "$target"

    echo ""
    echo "=== DEBUG SECTIONS ==="

    if command -q readelf
        readelf -S "$target" 2>/dev/null \
            | grep -E '\.debug_|\.zdebug_'
    end

    echo ""
    echo "=== SYMBOLS ==="

    if command -q nm
        nm -C "$target" 2>/dev/null | head -100
    end
end


# ============================================================
# ELF analysis
# ============================================================

function elf-info
    if test (count $argv) -eq 0
        echo "Usage: elf-info <binary>"
        return 1
    end

    set target $argv[1]

    if not test -e "$target"
        echo "File not found: $target"
        return 1
    end

    echo "=== FILE ==="
    file "$target"

    echo ""
    echo "=== ELF HEADER ==="
    readelf -h "$target"

    echo ""
    echo "=== PROGRAM HEADERS ==="
    readelf -l "$target"

    echo ""
    echo "=== SECTIONS ==="
    readelf -S "$target"

    echo ""
    echo "=== DYNAMIC INFORMATION ==="
    readelf -d "$target" 2>/dev/null

    echo ""
    echo "=== SYMBOLS ==="
    nm -C "$target" 2>/dev/null | head -100
end


# ============================================================
# Security properties
# ============================================================

function checksec
    if test (count $argv) -eq 0
        set target ./build/app
    else
        set target $argv[1]
    end

    if not test -e "$target"
        echo "File not found: $target"
        return 1
    end

    if command -q checksec
        command checksec --file="$target"
        return $status
    end

    echo "checksec is not installed."
    echo ""
    echo "Manual inspection:"
    echo "  readelf -h $target"
    echo "  readelf -l $target"
    echo "  readelf -d $target"
end


# ============================================================
# C++ symbols / strings
# ============================================================

function cpp-symbols
    if test (count $argv) -eq 0
        echo "Usage: cpp-symbols <binary>"
        return 1
    end

    nm -C "$argv[1]" 2>/dev/null
end


function strings-find
    if test (count $argv) -lt 2
        echo "Usage: strings-find <binary> <pattern>"
        return 1
    end

    strings -a "$argv[1]" \
        | grep -i -- "$argv[2]"
end


# ============================================================
# Object dump / disassembly
# ============================================================

function disasm
    if test (count $argv) -eq 0
        echo "Usage: disasm <binary>"
        return 1
    end

    objdump \
        -d \
        -M intel \
        "$argv[1]"
end


function disasm-main
    if test (count $argv) -eq 0
        echo "Usage: disasm-main <binary>"
        return 1
    end

    objdump \
        -d \
        -M intel \
        "$argv[1]" \
        | sed -n '/<main>:/,/^$/p'
end


function disasm-symbol
    if test (count $argv) -lt 2
        echo "Usage: disasm-symbol <binary> <symbol>"
        return 1
    end

    objdump \
        -d \
        -M intel \
        "$argv[1]" \
        | grep -A 40 -B 2 "<$argv[2]>"
end


# ============================================================
# C++ source search
# ============================================================

function cppgrep
    if test (count $argv) -eq 0
        echo "Usage: cppgrep <pattern>"
        return 1
    end

    grep -RIn \
        --exclude-dir=.git \
        --exclude-dir=build \
        --exclude-dir=build-asan \
        --exclude-dir=build-ubsan \
        --include='*.cpp' \
        --include='*.cc' \
        --include='*.cxx' \
        --include='*.hpp' \
        --include='*.hh' \
        --include='*.h' \
        -- "$argv[1]" .
end


function security-todo
    grep -RIn \
        --exclude-dir=.git \
        --exclude-dir=build \
        --exclude-dir=build-asan \
        --exclude-dir=build-ubsan \
        -E 'TODO|FIXME|SECURITY|BUG|XXX|HACK' .
end


# ============================================================
# Valgrind
# ============================================================

function memcheck
    if test (count $argv) -eq 0
        if test -x ./build/app
            valgrind \
                --leak-check=full \
                --show-leak-kinds=all \
                --track-origins=yes \
                ./build/app

            return $status
        end

        echo "Usage: memcheck <program> [arguments...]"
        return 1
    end

    valgrind \
        --leak-check=full \
        --show-leak-kinds=all \
        --track-origins=yes \
        $argv
end


# ============================================================
# AddressSanitizer + UndefinedBehaviorSanitizer
# ============================================================

function asan-build
    cmake -S . -B build-asan \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_CXX_STANDARD=23 \
        -DCMAKE_CXX_STANDARD_REQUIRED=ON \
        -DCMAKE_CXX_EXTENSIONS=OFF \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_CXX_FLAGS_DEBUG="-O0 -g3 -fsanitize=address,undefined -fno-omit-frame-pointer" \
        -DCMAKE_EXE_LINKER_FLAGS_DEBUG="-fsanitize=address,undefined"

    if test $status -ne 0
        return 1
    end

    cmake --build build-asan --parallel
end


function ubsan-build
    cmake -S . -B build-ubsan \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_CXX_STANDARD=23 \
        -DCMAKE_CXX_STANDARD_REQUIRED=ON \
        -DCMAKE_CXX_EXTENSIONS=OFF \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_CXX_FLAGS_DEBUG="-O0 -g3 -fsanitize=undefined -fno-omit-frame-pointer" \
        -DCMAKE_EXE_LINKER_FLAGS_DEBUG="-fsanitize=undefined"

    if test $status -ne 0
        return 1
    end

    cmake --build build-ubsan --parallel
end


function asan-only-build
    cmake -S . -B build-asan \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_CXX_STANDARD=23 \
        -DCMAKE_CXX_STANDARD_REQUIRED=ON \
        -DCMAKE_CXX_EXTENSIONS=OFF \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_CXX_FLAGS_DEBUG="-O0 -g3 -fsanitize=address -fno-omit-frame-pointer" \
        -DCMAKE_EXE_LINKER_FLAGS_DEBUG="-fsanitize=address"

    if test $status -ne 0
        return 1
    end

    cmake --build build-asan --parallel
end


# ============================================================
# Sanitizer execution
# ============================================================

function asan-run
    if not test -x ./build-asan/app
        echo "build-asan/app not found."
        echo "Run: asan-build"
        return 1
    end

    ./build-asan/app $argv
end


function ubsan-run
    if not test -x ./build-ubsan/app
        echo "build-ubsan/app not found."
        echo "Run: ubsan-build"
        return 1
    end

    ./build-ubsan/app $argv
end


# ============================================================
# System-call tracing
# ============================================================

function trace
    if test (count $argv) -eq 0
        echo "Usage: trace <program> [arguments...]"
        return 1
    end

    strace \
        -f \
        -s 256 \
        $argv
end


# ============================================================
# Library-call tracing
# ============================================================

function ltrace-app
    if test (count $argv) -eq 0
        echo "Usage: ltrace-app <program> [arguments...]"
        return 1
    end

    ltrace $argv
end


# ============================================================
# Linux process inspection
# ============================================================

function maps
    if test (count $argv) -eq 0
        echo "Usage: maps <pid>"
        return 1
    end

    if not test -r "/proc/$argv[1]/maps"
        echo "Cannot read process maps."
        return 1
    end

    cat "/proc/$argv[1]/maps"
end


function fds
    if test (count $argv) -eq 0
        echo "Usage: fds <pid>"
        return 1
    end

    if not test -d "/proc/$argv[1]/fd"
        echo "Process not found or inaccessible."
        return 1
    end

    ls -lah "/proc/$argv[1]/fd"
end


function pstatus
    if test (count $argv) -eq 0
        echo "Usage: pstatus <pid>"
        return 1
    end

    if not test -r "/proc/$argv[1]/status"
        echo "Process not found or inaccessible."
        return 1
    end

    cat "/proc/$argv[1]/status"
end


# ============================================================
# Network inspection
# ============================================================

function listening
    if command -q ss
        ss -lntup
    else
        echo "ss not found."
        return 1
    end
end


# ============================================================
# C++23 project generator
# ============================================================

function create-cpp-pro --argument-names action name
    if test "$action" != "new"; or test -z "$name"
        echo "Usage: create-cpp-pro new <project-name>"
        return 1
    end

    set PROJECT_DIR (pwd)/$name

    if test -e "$PROJECT_DIR"
        echo "Error: $PROJECT_DIR already exists."
        return 1
    end

    mkdir -p \
        "$PROJECT_DIR/src" \
        "$PROJECT_DIR/include" \
        "$PROJECT_DIR/tests" \
        "$PROJECT_DIR/build"

    if test $status -ne 0
        return 1
    end

    cd "$PROJECT_DIR"
    or return 1


    # --------------------------------------------------------
    # main.cpp
    # --------------------------------------------------------

    cat > src/main.cpp <<'EOF'
#include <cstdlib>
#include <iostream>
#include <memory>
#include <string>

int main()
{
    std::string name = "C++23";

    std::cout << "Hello from " << name << '\n';

    auto value = std::make_unique<int>(23);

    std::cout << "Allocated value: " << *value << '\n';

    return EXIT_SUCCESS;
}
EOF


    # --------------------------------------------------------
    # CMakeLists.txt
    # --------------------------------------------------------

    cat > CMakeLists.txt <<'EOF'
cmake_minimum_required(VERSION 3.20)

project(CPPProject
    VERSION 1.0
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type")

add_executable(app
    src/main.cpp
)

target_include_directories(app
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_compile_options(app
    PRIVATE
        $<$<CONFIG:Debug>:-O0>
        $<$<CONFIG:Debug>:-g3>
        $<$<CONFIG:Debug>:-fno-omit-frame-pointer>
        $<$<CONFIG:Debug>:-Wall>
        $<$<CONFIG:Debug>:-Wextra>
        $<$<CONFIG:Debug>:-Wpedantic>
        $<$<CONFIG:Debug>:-Wconversion>
        $<$<CONFIG:Debug>:-Wsign-conversion>
        $<$<CONFIG:Debug>:-Wshadow>
        $<$<CONFIG:Debug>:-Wformat=2>
        $<$<CONFIG:Debug>:-Wnon-virtual-dtor>
        $<$<CONFIG:Debug>:-Wold-style-cast>
        $<$<CONFIG:Debug>:-Woverloaded-virtual>
        $<$<CONFIG:Debug>:-Wnull-dereference>
        $<$<CONFIG:Debug>:-Wdouble-promotion>
        $<$<CONFIG:Debug>:-Wmisleading-indentation>
)

target_compile_definitions(app
    PRIVATE
        $<$<CONFIG:Debug>:_GLIBCXX_ASSERTIONS>
)

include(GNUInstallDirs)
EOF


    # --------------------------------------------------------
    # Git ignore
    # --------------------------------------------------------

    cat > .gitignore <<'EOF'
build/
build-asan/
build-ubsan/
compile_commands.json
.vscode/
.idea/
*.o
*.out
core
core.*
*vgcore.*
massif.out.*
EOF


    # --------------------------------------------------------
    # Clang format
    # --------------------------------------------------------

    cat > .clang-format <<'EOF'
BasedOnStyle: LLVM
IndentWidth: 4
TabWidth: 4
UseTab: Never
ColumnLimit: 100
BreakBeforeBraces: Allman
EOF


    # --------------------------------------------------------
    # Configure
    # --------------------------------------------------------

    echo "Configuring CMake..."

    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_CXX_STANDARD=23 \
        -DCMAKE_CXX_STANDARD_REQUIRED=ON \
        -DCMAKE_CXX_EXTENSIONS=OFF \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

    if test $status -ne 0
        echo "CMake configuration failed."
        return 1
    end


    # --------------------------------------------------------
    # Build
    # --------------------------------------------------------

    echo "Building C++23 project..."

    cmake --build build --parallel

    if test $status -ne 0
        echo "Build failed."
        return 1
    end


    # --------------------------------------------------------
    # clangd compilation database
    # --------------------------------------------------------

    if test -e compile_commands.json
        rm compile_commands.json
    end

    ln -s build/compile_commands.json compile_commands.json


    # --------------------------------------------------------
    # Verify source
    # --------------------------------------------------------

    echo ""
    echo "Source:"
    file src/main.cpp


    # --------------------------------------------------------
    # Verify binary
    # --------------------------------------------------------

    echo ""
    echo "Binary:"
    file build/app

    echo ""
    echo "C++ ABI:"
    c++filt _ZSt4cout 2>/dev/null


    echo ""
    echo "Debug sections:"

    readelf -S build/app 2>/dev/null \
        | grep -E '\.debug_|\.zdebug_' \
        | head -20


    # --------------------------------------------------------
    # Summary
    # --------------------------------------------------------

    echo ""
    echo "============================================"
    echo "C++23 project created"
    echo "============================================"
    echo ""
    echo "Project:"
    echo "  $PROJECT_DIR"
    echo ""
    echo "Source:"
    echo "  $PROJECT_DIR/src/main.cpp"
    echo ""
    echo "Binary:"
    echo "  $PROJECT_DIR/build/app"
    echo ""
    echo "Debuggers:"
    echo "  gapp"
    echo "  lapp"
    echo "  capp"
    echo ""
    echo "Security analysis:"
    echo "  checksec ./build/app"
    echo "  elf-info ./build/app"
    echo "  debug-info ./build/app"
    echo "  cpp-symbols ./build/app"
    echo ""
    echo "Disassembly:"
    echo "  disasm ./build/app"
    echo "  disasm-main ./build/app"
    echo ""
    echo "Memory analysis:"
    echo "  memcheck ./build/app"
    echo "  asan-build"
    echo "  ubsan-build"
    echo ""
    echo "Tracing:"
    echo "  trace ./build/app"
    echo "  ltrace-app ./build/app"
    echo ""
    echo "============================================"
end


# ============================================================
# Tool availability
# ============================================================

function security-tools
    set tools \
        g++ \
        gcc \
        clang++ \
        clang \
        clangd \
        cmake \
        gdb \
        lldb \
        codelldb \
        readelf \
        objdump \
        nm \
        c++filt \
        strings \
        strace \
        ltrace \
        valgrind \
        git \
        nvim

    for tool in $tools
        if command -q $tool
            printf "%-12s %s\n" "$tool" "available"
        else
            printf "%-12s %s\n" "$tool" "missing"
        end
    end

    echo ""

    if command -q checksec
        printf "%-12s %s\n" "checksec" "available"
    else
        printf "%-12s %s\n" "checksec" "missing"
    end

    echo ""

    if command -q gdb
        echo "GDB:"
        gdb --version | head -1
    end

    if command -q clang++
        echo "Clang:"
        clang++ --version | head -1
    end

    if command -q g++
        echo "GCC:"
        g++ --version | head -1
    end
end


# ============================================================
# Configuration reload
# ============================================================

function reload
    source ~/.config/fish/config.fish
end
