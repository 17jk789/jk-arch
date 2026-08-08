```fish
# ============================================================
#
# Fish configuration — C Security Research
#
# Arch Linux
# C23
# GCC / Clang
# clangd
# CMake
# GDB / Pwndbg
# LLDB / CodeLLDB
# ELF / DWARF analysis
# ASan / UBSan / MSan / TSan
# Valgrind
# Static analysis
#
# Intended for C development, debugging and authorized
# defensive/security research.
#
# ============================================================


# ============================================================
# ENVIRONMENT
# ============================================================

set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx PAGER less
set -gx MANPAGER 'less -R'

# User binaries
fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin

# LLVM tools
if test -d /usr/lib/llvm/bin
    fish_add_path /usr/lib/llvm/bin
end

# Optional LLVM tools installed elsewhere
if test -d /usr/lib/llvm
    set -gx LLVM_DIR /usr/lib/llvm
end


# ============================================================
# FISH
# ============================================================

set -g fish_greeting ""

function reload
    source ~/.config/fish/config.fish
end


# ============================================================
# BASIC SHELL
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
# GIT
# ============================================================

alias gs 'git status'
alias ga 'git add'
alias gc 'git commit'
alias gp 'git push'
alias gl 'git log --oneline --graph --decorate --all'


# ============================================================
# CMAKE
# ============================================================

alias cm cmake

function c-config
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

    if test $status -ne 0
        return 1
    end

    # Make clangd database available at project root.
    if test -e build/compile_commands.json
        if test -L compile_commands.json
            rm compile_commands.json
        else if test -e compile_commands.json
            rm compile_commands.json
        end

        ln -s build/compile_commands.json compile_commands.json
    end
end


function c-build
    if not test -d build
        echo "No build directory."
        echo "Run: c-config"
        return 1
    end

    cmake --build build --parallel
end


function c-rebuild
    if test -d build
        rm -rf build
    end

    c-config
    or return 1

    c-build
end


function c-clean
    if test -d build
        rm -rf build
    end

    if test -d build-asan
        rm -rf build-asan
    end

    if test -d build-ubsan
        rm -rf build-ubsan
    end

    if test -d build-msan
        rm -rf build-msan
    end

    if test -d build-tsan
        rm -rf build-tsan
    end

    if test -d build-release
        rm -rf build-release
    end

    if test -L compile_commands.json
        rm compile_commands.json
    end

    echo "C build directories cleaned."
end


function c-debug
    c-config
    or return 1

    c-build
end


# ============================================================
# DIRECT GCC C23 DEBUG BUILD
#
# Usage:
#   gcc-debug source.c -o app
# ============================================================

function gcc-debug
    if test (count $argv) -eq 0
        echo "Usage: gcc-debug <source.c> [-o output]"
        return 1
    end

    gcc \
        -std=c23 \
        -O0 \
        -g3 \
        -fno-omit-frame-pointer \
        -Wall \
        -Wextra \
        -Wpedantic \
        -Wconversion \
        -Wsign-conversion \
        -Wshadow \
        -Wformat=2 \
        -Wundef \
        -Wstrict-prototypes \
        -Wmissing-prototypes \
        -Wold-style-definition \
        -Wnull-dereference \
        $argv
end


# ============================================================
# DIRECT CLANG C23 DEBUG BUILD
# ============================================================

function clang-debug
    if test (count $argv) -eq 0
        echo "Usage: clang-debug <source.c> [-o output]"
        return 1
    end

    clang \
        -std=c23 \
        -O0 \
        -g3 \
        -fno-omit-frame-pointer \
        -Wall \
        -Wextra \
        -Wpedantic \
        -Wconversion \
        -Wsign-conversion \
        -Wshadow \
        -Wformat=2 \
        -Wundef \
        -Wstrict-prototypes \
        -Wmissing-prototypes \
        -Wold-style-definition \
        -Wnull-dereference \
        $argv
end


# ============================================================
# GCC STATIC ANALYSIS
# ============================================================

function gcc-analyze
    if test (count $argv) -eq 0
        echo "Usage: gcc-analyze <source.c> [arguments...]"
        return 1
    end

    gcc \
        -std=c23 \
        -O0 \
        -Wall \
        -Wextra \
        -Wpedantic \
        -Wconversion \
        -Wsign-conversion \
        -Wshadow \
        -Wformat=2 \
        -fanalyzer \
        $argv
end


# ============================================================
# CLANG STATIC ANALYSIS
# ============================================================

function clang-analyze
    if test (count $argv) -eq 0
        echo "Usage: clang-analyze <source.c> [arguments...]"
        return 1
    end

    clang \
        --analyze \
        -std=c23 \
        -Wall \
        -Wextra \
        -Wpedantic \
        -Wconversion \
        -Wshadow \
        -Wformat=2 \
        $argv
end


# ============================================================
# HARDENED GCC BUILD
#
# Production-oriented defensive build.
# ============================================================

function gcc-hardened
    if test (count $argv) -eq 0
        echo "Usage: gcc-hardened <source.c> [-o output]"
        return 1
    end

    gcc \
        -std=c23 \
        -O2 \
        -D_FORTIFY_SOURCE=3 \
        -fstack-protector-strong \
        -fstack-clash-protection \
        -fPIE \
        -Wall \
        -Wextra \
        -Wpedantic \
        -Wconversion \
        -Wsign-conversion \
        -Wshadow \
        -Wformat=2 \
        -Werror=format-security \
        $argv \
        -pie \
        -Wl,-z,relro \
        -Wl,-z,now \
        -Wl,-z,noexecstack
end


# ============================================================
# HARDENED CLANG BUILD
# ============================================================

function clang-hardened
    if test (count $argv) -eq 0
        echo "Usage: clang-hardened <source.c> [-o output]"
        return 1
    end

    clang \
        -std=c23 \
        -O2 \
        -D_FORTIFY_SOURCE=3 \
        -fstack-protector-strong \
        -fstack-clash-protection \
        -fPIE \
        -Wall \
        -Wextra \
        -Wpedantic \
        -Wconversion \
        -Wsign-conversion \
        -Wshadow \
        -Wformat=2 \
        -Werror=format-security \
        $argv \
        -pie \
        -Wl,-z,relro \
        -Wl,-z,now \
        -Wl,-z,noexecstack
end


# ============================================================
# GDB / PWNDGB
#
# If Pwndbg is configured through GDB startup files,
# simply launching gdb will use it automatically.
# ============================================================

alias gdb-debug gdb
alias gdb-pwndbg gdb

function gd
    if test (count $argv) -eq 0
        echo "Usage: gd <program> [arguments...]"
        return 1
    end

    gdb --args $argv
end


function gapp
    set target ./build/app

    if test (count $argv) -ge 1
        set target $argv[1]
    end

    if not test -x "$target"
        echo "Executable not found: $target"
        return 1
    end

    gdb "$target"
end


function gapp-args
    if test (count $argv) -eq 0
        echo "Usage: gapp-args <program> [arguments...]"
        return 1
    end

    set target $argv[1]
    set args $argv[2..-1]

    if not test -x "$target"
        echo "Executable not found: $target"
        return 1
    end

    gdb --args "$target" $args
end


# ============================================================
# LLDB / CODELLDB
# ============================================================

alias lldb-debug lldb

function ld
    if test (count $argv) -eq 0
        echo "Usage: ld <program> [arguments...]"
        return 1
    end

    lldb -- $argv
end


function lapp
    set target ./build/app

    if test (count $argv) -ge 1
        set target $argv[1]
    end

    if not test -x "$target"
        echo "Executable not found: $target"
        return 1
    end

    lldb "$target"
end


function codelldb-check
    if command -q codelldb
        echo "CodeLLDB: available"
        command -v codelldb
    else
        echo "CodeLLDB: not found"
        echo "CodeLLDB is normally provided through the VS Code extension."
    end
end


# ============================================================
# RUN C PROGRAM
# ============================================================

function runapp
    set target ""

    if test -x ./build/app
        set target ./build/app
    else if test -x ./app
        set target ./app
    else
        echo "No ./build/app or ./app found."
        return 1
    end

    "$target" $argv
end


# ============================================================
# DEBUG INFORMATION / DWARF
# ============================================================

function debug-info
    set target ./build/app

    if test (count $argv) -ge 1
        set target $argv[1]
    end

    if not test -e "$target"
        echo "File not found: $target"
        return 1
    end

    echo "============================================================"
    echo "FILE"
    echo "============================================================"
    file "$target"

    echo ""
    echo "============================================================"
    echo "DEBUG SECTIONS"
    echo "============================================================"

    if command -q readelf
        readelf -S "$target" 2>/dev/null \
            | grep -E '\.debug_|\.zdebug_|\.eh_frame'
    end

    echo ""
    echo "============================================================"
    echo "DWARF INFO"
    echo "============================================================"

    if command -q readelf
        readelf --debug-dump=info "$target" 2>/dev/null | head -100
    end

    echo ""
    echo "============================================================"
    echo "SYMBOLS"
    echo "============================================================"

    nm -C "$target" 2>/dev/null | head -100
end


# ============================================================
# ELF INFORMATION
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

    echo "============================================================"
    echo "FILE"
    echo "============================================================"
    file "$target"

    echo ""
    echo "============================================================"
    echo "ELF HEADER"
    echo "============================================================"
    readelf -h "$target"

    echo ""
    echo "============================================================"
    echo "PROGRAM HEADERS"
    echo "============================================================"
    readelf -l "$target"

    echo ""
    echo "============================================================"
    echo "SECTIONS"
    echo "============================================================"
    readelf -S "$target"

    echo ""
    echo "============================================================"
    echo "DYNAMIC INFORMATION"
    echo "============================================================"
    readelf -d "$target" 2>/dev/null

    echo ""
    echo "============================================================"
    echo "SYMBOLS"
    echo "============================================================"
    nm -C "$target" 2>/dev/null | head -150
end


# ============================================================
# SECURITY PROPERTIES
# ============================================================

function sec
    set target ./build/app

    if test (count $argv) -ge 1
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
    echo "Manual ELF inspection:"
    echo "  readelf -h $target"
    echo "  readelf -l $target"
    echo "  readelf -d $target"
end


# ============================================================
# STRINGS
# ============================================================

function strings-find
    if test (count $argv) -lt 2
        echo "Usage: strings-find <binary> <pattern>"
        return 1
    end

    strings -a "$argv[1]" \
        | grep -i -- "$argv[2]"
end


# ============================================================
# DISASSEMBLY
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
        | sed -n "/<$argv[2]>:/,/^$/p"
end


# ============================================================
# SOURCE SEARCH
# ============================================================

function cgrep
    if test (count $argv) -eq 0
        echo "Usage: cgrep <pattern>"
        return 1
    end

    grep -RIn \
        --exclude-dir=.git \
        --exclude-dir=build \
        --exclude-dir=build-asan \
        --exclude-dir=build-ubsan \
        --exclude-dir=build-msan \
        --exclude-dir=build-tsan \
        --exclude-dir=build-release \
        --include='*.c' \
        --include='*.h' \
        -- "$argv[1]" .
end


function security-todo
    grep -RIn \
        --exclude-dir=.git \
        --exclude-dir=build \
        --exclude-dir=build-asan \
        --exclude-dir=build-ubsan \
        --exclude-dir=build-msan \
        --exclude-dir=build-tsan \
        --exclude-dir=build-release \
        --include='*.c' \
        --include='*.h' \
        -E 'TODO|FIXME|SECURITY|BUG|XXX|HACK|unsafe|overflow|underflow' .
end


# ============================================================
# ADDRESSSANITIZER + UBSAN
# ============================================================

function asan-build
    cmake -S . -B build-asan \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_C_FLAGS_DEBUG="-O0 -g3 -fsanitize=address,undefined -fno-omit-frame-pointer" \
        -DCMAKE_EXE_LINKER_FLAGS_DEBUG="-fsanitize=address,undefined"

    if test $status -ne 0
        return 1
    end

    cmake --build build-asan --parallel
end


function asan-run
    if not test -x ./build-asan/app
        echo "build-asan/app not found."
        echo "Run: asan-build"
        return 1
    end

    env \
        ASAN_OPTIONS=detect_leaks=1:abort_on_error=1:strict_string_checks=1 \
        UBSAN_OPTIONS=print_stacktrace=1:halt_on_error=1 \
        ./build-asan/app $argv
end


# ============================================================
# UBSAN ONLY
# ============================================================

function ubsan-build
    cmake -S . -B build-ubsan \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_C_FLAGS_DEBUG="-O0 -g3 -fsanitize=undefined -fno-omit-frame-pointer" \
        -DCMAKE_EXE_LINKER_FLAGS_DEBUG="-fsanitize=undefined"

    if test $status -ne 0
        return 1
    end

    cmake --build build-ubsan --parallel
end


function ubsan-run
    if not test -x ./build-ubsan/app
        echo "build-ubsan/app not found."
        echo "Run: ubsan-build"
        return 1
    end

    env \
        UBSAN_OPTIONS=print_stacktrace=1:halt_on_error=1 \
        ./build-ubsan/app $argv
end


# ============================================================
# MEMORYSANITIZER
#
# Clang only.
#
# Useful for uninitialized-memory analysis.
# ============================================================

function msan-build
    if not command -q clang
        echo "clang not found."
        return 1
    end

    cmake -S . -B build-msan \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_C_FLAGS_DEBUG="-O1 -g3 -fsanitize=memory -fno-omit-frame-pointer" \
        -DCMAKE_EXE_LINKER_FLAGS_DEBUG="-fsanitize=memory"

    if test $status -ne 0
        return 1
    end

    cmake --build build-msan --parallel
end


function msan-run
    if not test -x ./build-msan/app
        echo "build-msan/app not found."
        echo "Run: msan-build"
        return 1
    end

    ./build-msan/app $argv
end


# ============================================================
# THREADSANITIZER
# ============================================================

function tsan-build
    cmake -S . -B build-tsan \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_C_FLAGS_DEBUG="-O1 -g3 -fsanitize=thread -fno-omit-frame-pointer" \
        -DCMAKE_EXE_LINKER_FLAGS_DEBUG="-fsanitize=thread"

    if test $status -ne 0
        return 1
    end

    cmake --build build-tsan --parallel
end


function tsan-run
    if not test -x ./build-tsan/app
        echo "build-tsan/app not found."
        echo "Run: tsan-build"
        return 1
    end

    ./build-tsan/app $argv
end


# ============================================================
# VALGRIND
# ============================================================

function memcheck
    if test (count $argv) -eq 0
        if test -x ./build/app
            valgrind \
                --leak-check=full \
                --show-leak-kinds=all \
                --track-origins=yes \
                --num-callers=30 \
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
        --num-callers=30 \
        $argv
end


function massif
    if test (count $argv) -eq 0
        echo "Usage: massif <program> [arguments...]"
        return 1
    end

    valgrind \
        --tool=massif \
        $argv
end


# ============================================================
# SYSTEM CALL TRACING
# ============================================================

function trace
    if test (count $argv) -eq 0
        echo "Usage: trace <program> [arguments...]"
        return 1
    end

    strace \
        -f \
        -s 256 \
        -yy \
        $argv
end


# ============================================================
# LIBRARY CALL TRACING
# ============================================================

function ltrace-app
    if test (count $argv) -eq 0
        echo "Usage: ltrace-app <program> [arguments...]"
        return 1
    end

    ltrace \
        -f \
        $argv
end


# ============================================================
# PROCESS INSPECTION
# ============================================================

function maps
    if test (count $argv) -eq 0
        echo "Usage: maps <pid>"
        return 1
    end

    set pid $argv[1]

    if not test -r "/proc/$pid/maps"
        echo "Cannot read process maps."
        return 1
    end

    cat "/proc/$pid/maps"
end


function fds
    if test (count $argv) -eq 0
        echo "Usage: fds <pid>"
        return 1
    end

    set pid $argv[1]

    if not test -d "/proc/$pid/fd"
        echo "Process not found or inaccessible."
        return 1
    end

    ls -lah "/proc/$pid/fd"
end


function pstatus
    if test (count $argv) -eq 0
        echo "Usage: pstatus <pid>"
        return 1
    end

    set pid $argv[1]

    if not test -r "/proc/$pid/status"
        echo "Process not found or inaccessible."
        return 1
    end

    cat "/proc/$pid/status"
end


# ============================================================
# C COMPILER / TOOLCHAIN INFORMATION
# ============================================================

function c-toolchain
    echo "============================================================"
    echo "C TOOLCHAIN"
    echo "============================================================"

    if command -q gcc
        echo ""
        echo "GCC:"
        gcc --version | head -1
    else
        echo "GCC: missing"
    end

    if command -q clang
        echo ""
        echo "Clang:"
        clang --version | head -1
    else
        echo "Clang: missing"
    end

    if command -q clangd
        echo ""
        echo "clangd:"
        clangd --version | head -1
    else
        echo "clangd: missing"
    end

    if command -q cmake
        echo ""
        echo "CMake:"
        cmake --version | head -1
    else
        echo "CMake: missing"
    end

    if command -q gdb
        echo ""
        echo "GDB:"
        gdb --version | head -1
    else
        echo "GDB: missing"
    end

    if command -q lldb
        echo ""
        echo "LLDB:"
        lldb --version | head -1
    else
        echo "LLDB: missing"
    end

    if command -q checksec
        echo ""
        echo "checksec: available"
    else
        echo ""
        echo "checksec: missing"
    end

    if command -q valgrind
        echo "Valgrind: available"
    else
        echo "Valgrind: missing"
    end

    if command -q strace
        echo "strace: available"
    else
        echo "strace: missing"
    end

    if command -q ltrace
        echo "ltrace: available"
    else
        echo "ltrace: missing"
    end
end


# ============================================================
# CMAKE TOOLCHAIN INFO
# ============================================================

function c-info
    echo "============================================================"
    echo "C PROJECT"
    echo "============================================================"

    if test -f compile_commands.json
        echo "compile_commands.json : available"
    else
        echo "compile_commands.json : missing"
    end

    if test -d build
        echo "build                 : available"
    else
        echo "build                 : missing"
    end

    if test -x ./build/app
        echo "build/app             : executable"
    else
        echo "build/app             : missing"
    end

    echo ""
    echo "Useful commands:"
    echo ""
    echo "  c-config"
    echo "  c-build"
    echo "  c-rebuild"
    echo "  c-clean"
    echo ""
    echo "  gcc-debug"
    echo "  clang-debug"
    echo "  gcc-analyze"
    echo "  clang-analyze"
    echo ""
    echo "  gapp"
    echo "  gapp-args"
    echo "  lapp"
    echo "  ld"
    echo ""
    echo "  sec"
    echo "  elf-info"
    echo "  debug-info"
    echo "  disasm"
    echo "  disasm-main"
    echo ""
    echo "  asan-build / asan-run"
    echo "  ubsan-build / ubsan-run"
    echo "  msan-build / msan-run"
    echo "  tsan-build / tsan-run"
    echo ""
    echo "  memcheck"
    echo "  massif"
    echo "  trace"
    echo "  ltrace-app"
end


# ============================================================
# TOOL AVAILABILITY
# ============================================================

function security-tools
    set tools \
        gcc \
        clang \
        clangd \
        clang-format \
        clang-tidy \
        cmake \
        gdb \
        lldb \
        readelf \
        objdump \
        nm \
        strings \
        addr2line \
        c++filt \
        strace \
        ltrace \
        valgrind \
        git \
        nvim

    echo "============================================================"
    echo "C SECURITY / DEBUG TOOLCHAIN"
    echo "============================================================"

    for tool in $tools
        if command -q $tool
            printf "%-16s %s\n" "$tool" "available"
        else
            printf "%-16s %s\n" "$tool" "MISSING"
        end
    end

    echo ""

    if command -q checksec
        printf "%-16s %s\n" "checksec" "available"
    else
        printf "%-16s %s\n" "checksec" "MISSING"
    end

    if command -q codelldb
        printf "%-16s %s\n" "codelldb" "available"
    else
        printf "%-16s %s\n" "codelldb" "not CLI-installed"
    end
end


# ============================================================
# C PROJECT GENERATOR
# ============================================================

function create-c
    if test (count $argv) -ne 1
        echo "Usage: create-c <project-name>"
        return 1
    end

    set name $argv[1]
    set project_dir (pwd)/$name

    if test -e "$project_dir"
        echo "Already exists: $project_dir"
        return 1
    end

    mkdir -p \
        "$project_dir/src" \
        "$project_dir/include" \
        "$project_dir/tests"

    or return 1

    cd "$project_dir"
    or return 1

    cat > CMakeLists.txt <<'EOF'
cmake_minimum_required(VERSION 3.20)

project(CProject
    VERSION 1.0
    LANGUAGES C
)

set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(app
    src/main.c
)

target_include_directories(app
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_compile_options(app
    PRIVATE
        -Wall
        -Wextra
        -Wpedantic
        -Wconversion
        -Wsign-conversion
        -Wshadow
        -Wformat=2
        -Wundef
        -Wstrict-prototypes
        -Wmissing-prototypes
        -Wold-style-definition
)
EOF

    cat > src/main.c <<'EOF'
#include <stdio.h>

int main(void)
{
    puts("Hello, C23.");
    return 0;
}
EOF

    cat > .clang-format <<'EOF'
BasedOnStyle: LLVM
IndentWidth: 4
TabWidth: 4
UseTab: Never
ColumnLimit: 100
EOF

    cat > .gitignore <<'EOF'
build/
build-asan/
build-ubsan/
build-msan/
build-tsan/
build-release/
compile_commands.json

.vscode/
.idea/

*.o
*.a
*.so
*.out

core
core.*
vgcore.*
massif.out.*

compile_commands.json
EOF

    echo ""
    echo "C project created:"
    echo "  $project_dir"
    echo ""

    c-config
    or return 1

    c-build
end


# ============================================================
# OPTIONAL FORMAT / LINT HELPERS
# ============================================================

function cformat
    if test (count $argv) -eq 0
        echo "Usage: cformat <file.c> [file.h ...]"
        return 1
    end

    clang-format -i $argv
end


function cformat-check
    if test (count $argv) -eq 0
        echo "Usage: cformat-check <file.c> [file.h ...]"
        return 1
    end

    clang-format --dry-run --Werror $argv
end


function ctidy
    if not test -f compile_commands.json
        echo "compile_commands.json not found."
        echo "Run: c-config"
        return 1
    end

    clang-tidy $argv
end


# ============================================================
# END
# ============================================================
```
