# ============================================================
#
# Fish configuration — C++ Security Research
#
# Arch Linux
# C++23
# G++ / Clang++
# clangd
# CMake
# GDB / Pwndbg
# LLDB / CodeLLDB
# ELF / DWARF analysis
# ASan / UBSan / MSan / TSan
# Valgrind
# Static analysis
#
# Intended for C++ development, debugging and authorized
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
    echo "Fish configuration reloaded."
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

function cpp-config
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


function cpp-build
    if not test -d build
        echo "No build directory."
        echo "Run: cpp-config"
        return 1
    end

    cmake --build build --parallel
end


function cpp-rebuild
    if test -d build
        rm -rf build
    end

    cpp-config
    or return 1

    cpp-build
end


function cpp-clean
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


function cpp-test
    if not test -d build
        echo "No build directory."
        echo "Run: cpp-config"
        return 1
    end

    ctest --test-dir build --output-on-failure
end


function cpp-check
    cpp-build
    or return 1

    cpp-test
    or return 1

    if command -q clangxx-tidy
        cmake --build build --target analyze-clangxx-tidy
        or return 1
    end

    if command -q cppcheck
        cmake --build build --target analyze-cppcheck
        or return 1
    end

    echo "Security/quality checks completed."
end


function cpp-debug
    cpp-config
    or return 1

    cpp-build
end


# ============================================================
# DIRECT G++ C++23 DEBUG BUILD
#
# Usage:
#   gxx-debug source.cpp -o app
# ============================================================

function gxx-debug
    if test (count $argv) -eq 0
        echo "Usage: gxx-debug <source.cpp> [-o output]"
        return 1
    end

    g++ \
        -std=c++23 \
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
        -Wcast-align \
        -Wcast-qual \
        -Woverloaded-virtual \
        -Wnon-virtual-dtor \
        -Wold-style-cast \
        -Wnull-dereference \
        $argv
end


# ============================================================
# DIRECT CLANG++ C++23 DEBUG BUILD
# ============================================================

function clangxx-debug
    if test (count $argv) -eq 0
        echo "Usage: clangxx-debug <source.cpp> [-o output]"
        return 1
    end

    clang++ \
        -std=c++23 \
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
        -Wcast-align \
        -Wcast-qual \
        -Woverloaded-virtual \
        -Wnon-virtual-dtor \
        -Wold-style-cast \
        -Wnull-dereference \
        $argv
end


# ============================================================
# G++ STATIC ANALYSIS
# ============================================================

function gxx-analyze
    if test (count $argv) -eq 0
        echo "Usage: gxx-analyze <source.cpp> [arguments...]"
        return 1
    end

    g++ \
        -std=c++23 \
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


function cpp-analyze
    if not test -d build
        cpp-config
        or return 1
    end

    echo "=== G++ analyzer ==="
    gxx-analyze src/*.cpp
    or return 1

    echo "=== Clang++ analyzer ==="
    clangxx-analyze src/*.cpp
    or return 1

    if command -q clangxx-tidy
        echo "=== clangxx-tidy ==="
        cmake --build build --target analyze-clangxx-tidy
    end

    if command -q cppcheck
        echo "=== cppcheck ==="
        cmake --build build --target analyze-cppcheck
    end

    if command -q flawfinder
        echo "=== flawfinder ==="
        cmake --build build --target analyze-flawfinder
    end
end


# ============================================================
# CLANG++ STATIC ANALYSIS
# ============================================================

function clangxx-analyze
    if test (count $argv) -eq 0
        echo "Usage: clangxx-analyze <source.cpp> [arguments...]"
        return 1
    end

    clang++ \
        --analyze \
        -std=c++23 \
        -Wall \
        -Wextra \
        -Wpedantic \
        -Wconversion \
        -Wshadow \
        -Wformat=2 \
        $argv
end


# ============================================================
# HARDENED G++ BUILD
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
# HARDENED CLANG++ BUILD
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
# 
# But I alreade create a nocther cuntion gdb wich is 
# more powerful and can be used to launch gdb with arguments.
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


function gdb-info
    if not command -q gdb
        echo "GDB: missing"
        return 1
    end

    gdb --version | head -1

    if test -f ~/.gdbinit
        echo "GDB init: ~/.gdbinit"
    end

    gdb -q -ex 'python import sys; print(sys.version)' -ex quit
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

    set -l target $argv[1]

    if not test -e "$target"
        echo "File not found: $target"
        return 1
    end

    if not command -q readelf
        echo "readelf not found."
        return 1
    end

    echo "============================================================"
    echo "BASIC & SECURITY PROPERTIES"
    echo "============================================================"

    echo ""
    echo "File type:"
    file "$target"

    # ========================================================
    # NX / GNU_STACK
    # ========================================================

    echo ""
    echo -n "NX / Executable Stack: "

    set -l stack_line (readelf -W -l "$target" 2>/dev/null | grep 'GNU_STACK')

    if test (count $stack_line) -eq 0
        echo "UNKNOWN (No GNU_STACK segment found)"
    else
        set -l stack_flags (string split -n ' ' -- $stack_line | tail -1)

        if string match -q '*X*' -- "$stack_flags"
            echo "DISABLED (Stack is executable!)"
        else
            echo "ENABLED (Stack is non-executable)"
        end
    end

    # ========================================================
    # RELRO
    # ========================================================

    echo -n "RELRO: "

    set -l relro (readelf -W -l "$target" 2>/dev/null | grep 'GNU_RELRO')

    if test (count $relro) -eq 0
        echo "No RELRO"
    else
        set -l bind_now (readelf -W -d "$target" 2>/dev/null | grep -E 'BIND_NOW|FLAGS.*NOW')

        if test (count $bind_now) -gt 0
            echo "Full RELRO"
        else
            echo "Partial RELRO"
        end
    end

    # ========================================================
    # STACK CANARY
    # ========================================================

    echo -n "Stack Canary: "

    if readelf -Ws "$target" 2>/dev/null | grep -q '__stack_chk_fail'
        echo "ENABLED (__stack_chk_fail found)"
    else
        echo "DISABLED / Not detected"
    end

    # ========================================================
    # FORTIFY SOURCE
    # ========================================================

    echo -n "Fortify Source: "

    if readelf -Ws "$target" 2>/dev/null | grep -q -E '_chk(@|$)'
        echo "ENABLED (Fortified functions found)"
    else
        echo "DISABLED / Not detected"
    end

    # ========================================================
    # RPATH / RUNPATH
    # ========================================================

    echo -n "RPATH / RUNPATH: "

    set -l paths (readelf -W -d "$target" 2>/dev/null \
        | grep -E 'RPATH|RUNPATH' \
        | sed -E 's/.*\[(.*)\].*/\1/')

    if test (count $paths) -gt 0
        string join ', ' $paths
    else
        echo "None"
    end

    # ========================================================
    # GNU PROPERTIES
    # ========================================================

    echo ""
    echo "============================================================"
    echo "GNU PROPERTIES (.note.gnu.property)"
    echo "============================================================"

    set -l gnu_properties (readelf -n "$target" 2>/dev/null \
        | grep -A 8 -E 'GNU_PROPERTY|GNU properties')

    if test (count $gnu_properties) -gt 0
        printf '%s\n' $gnu_properties
    else
        echo "No GNU properties found."
        echo "Examples: IBT / SHSTK"
    end

    # ========================================================
    # DYNAMIC SYMBOLS
    # ========================================================

    echo ""
    echo "============================================================"
    echo "DYNAMIC SYMBOLS (dynsym)"
    echo "============================================================"

    set -l dynsyms (readelf --dyn-syms -W "$target" 2>/dev/null | head -150)

    if test (count $dynsyms) -gt 0
        printf '%s\n' $dynsyms
    else
        echo "No dynamic symbols."
    end

    # ========================================================
    # RELOCATIONS
    # ========================================================

    echo ""
    echo "============================================================"
    echo "RELOCATIONS"
    echo "============================================================"

    set -l relocations (readelf -r -W "$target" 2>/dev/null | head -150)

    if test (count $relocations) -gt 0
        printf '%s\n' $relocations
    else
        echo "No relocations."
    end

    # ========================================================
    # ELF HEADER
    # ========================================================

    echo ""
    echo "============================================================"
    echo "STANDARD ELF HEADER"
    echo "============================================================"

    readelf -W -h "$target"

    # ========================================================
    # PROGRAM HEADERS
    # ========================================================

    echo ""
    echo "============================================================"
    echo "PROGRAM HEADERS"
    echo "============================================================"

    readelf -W -l "$target"

    # ========================================================
    # SECTIONS
    # ========================================================

    echo ""
    echo "============================================================"
    echo "SECTIONS"
    echo "============================================================"

    readelf -W -S "$target"

    # ========================================================
    # DYNAMIC INFORMATION
    # ========================================================

    echo ""
    echo "============================================================"
    echo "DYNAMIC INFORMATION"
    echo "============================================================"

    readelf -W -d "$target" 2>/dev/null
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

    echo "=== checksec ==="

    if command -q checksec
        checksec --file="$target"
    else
        echo "checksec not installed."
    end

    echo ""
    echo "=== ELF ==="
    readelf -W -h "$target"

    echo ""
    echo "=== Program Headers ==="
    readelf -W -l "$target"

    echo ""
    echo "=== Dynamic ==="
    readelf -W -d "$target"
end


function elf-rpath
    if test (count $argv) -eq 0
        echo "Usage: elf-rpath <binary>"
        return 1
    end

    readelf -W -d "$argv[1]" \
        | grep -E 'RPATH|RUNPATH'
end


function elf-needed
    if test (count $argv) -eq 0
        echo "Usage: elf-needed <binary>"
        return 1
    end

    readelf -W -d "$argv[1]" \
        | grep 'NEEDED'
end


function elf-relocs
    if test (count $argv) -eq 0
        echo "Usage: elf-relocs <binary>"
        return 1
    end

    readelf -W --relocs "$argv[1]"
end


function symgrep
    if test (count $argv) -lt 2
        echo "Usage: symgrep <binary> <pattern>"
        return 1
    end

    nm -anC "$argv[1]" \
        | grep -Ei -- "$argv[2]"
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
            | sed -n '/<'"$argv[2]"'>:/,/^$/p'
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
        --include='*.cpp' \
        --include='*.cc' \
        --include='*.cxx' \
        --include='*.hpp' \
        --include='*.hh' \
        --include='*.hxx' \
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
        --include='*.cpp' \
        --include='*.cc' \
        --include='*.cxx' \
        --include='*.hpp' \
        --include='*.hh' \
        --include='*.hxx' \
        -E 'TODO|FIXME|SECURITY|BUG|XXX|HACK|unsafe|overflow|underflow' \
        .
end


# ============================================================
# ADDRESSSANITIZER + UBSAN
# ============================================================

function asan-build
    cmake -S . -B build-asan \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_CXX_FLAGS_DEBUG="-O0 -g3 -fsanitize=address,undefined -fno-omit-frame-pointer" \
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
        -DCMAKE_CXX_FLAGS_DEBUG="-O0 -g3 -fsanitize=undefined -fno-omit-frame-pointer" \
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
# Clang++ only.
#
# Useful for uninitialized-memory analysis.
# ============================================================

function msan-build
    if not command -q clang++
        echo "clang++ not found."
        return 1
    end

    cmake -S . -B build-msan \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_CXX_FLAGS_DEBUG="-O1 -g3 -fsanitize=memory -fno-omit-frame-pointer" \
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
        -DCMAKE_CXX_FLAGS_DEBUG="-O1 -g3 -fsanitize=thread -fno-omit-frame-pointer" \
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
        -yy \
        -s 512 \
        -o trace.log \
        $argv

    echo "Trace written to trace.log"
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
# C++ COMPILER / TOOLCHAIN INFORMATION
# ============================================================

function cpp-toolchain
    echo "============================================================"
    echo "C++ TOOLCHAIN"
    echo "============================================================"

    if command -q g++
        echo ""
        echo "G++:"
        g++ --version | head -1
    else
        echo "G++: missing"
    end

    if command -q clang++
        echo ""
        echo "Clang++:"
        clang++ --version | head -1
    else
        echo "Clang++: missing"
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

function cpp-info
    echo "============================================================"
    echo "C++ PROJECT"
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
    echo "  cpp-config"
    echo "  cpp-build"
    echo "  cpp-rebuild"
    echo "  cpp-clean"
    echo ""
    echo "  gxx-debug"
    echo "  clangxx-debug"
    echo "  gxx-analyze"
    echo "  clangxx-analyze"
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


function target-info
    set target ./build/app

    if test (count $argv) -ge 1
        set target $argv[1]
    end

    if not test -e "$target"
        echo "File not found: $target"
        return 1
    end

    echo "=== File ==="
    file "$target"

    echo ""
    echo "=== Architecture ==="
    readelf -W -h "$target" \
        | grep -E 'Class:|Data:|Machine:|Type:|Entry point'

    echo ""
    echo "=== Security ==="

    if command -q checksec
        checksec --file="$target"
    end

    echo ""
    echo "=== Dependencies ==="
    readelf -W -d "$target" \
        | grep 'NEEDED'
end


# ============================================================
# TOOL AVAILABILITY
# ============================================================

function security-tools
    set tools \
        g++ \
        clang++ \
        clangd \
        clang-format \
        clang-tidy \
        cppcheck \
        flawfinder \
        cmake \
        ninja \
        gdb \
        lldb \
        readelf \
        llvm-readelf \
        objdump \
        llvm-objdump \
        nm \
        llvm-nm \
        strings \
        llvm-strings \
        addr2line \
        llvm-addr2line \
        c++filt \
        llvm-symbolizer \
        strace \
        ltrace \
        valgrind \
        git \
        nvim

    echo "============================================================"
    echo "C++ SECURITY / DEBUG TOOLCHAIN"
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


function addr
    if test (count $argv) -lt 2
        echo "Usage: addr <binary> <address>"
        return 1
    end

    addr2line \
        -e "$argv[1]" \
        -f \
        -C \
        "$argv[2]"
end

# ============================================================
# C++ PROJECT GENERATOR
# ============================================================

function __cpro_scaffold --argument-names name full_scan
    set -l project_dir (pwd)/$name

    if test -e "$project_dir"
        echo "Already exists: $project_dir"
        return 1
    end

    mkdir -p \
        "$project_dir/src" \
        "$project_dir/include" \
        "$project_dir/tests" \
        "$project_dir/fuzz" \
        "$project_dir/scripts"
    or return 1

    cd "$project_dir"
    or return 1

    # ========================================================
    # CMakeLists.txt
    # ========================================================

    set -l cmake_content \
        'cmake_minimum_required(VERSION 3.22)' \
        '' \
        'project(Cpp23SecurityResearch VERSION 0.1.0 LANGUAGES CXX)' \
        '' \
        'set(CMAKE_CXX_STANDARD 23)' \
        'set(CMAKE_CXX_STANDARD_REQUIRED ON)' \
        'set(CMAKE_CXX_EXTENSIONS OFF)' \
        'set(CMAKE_EXPORT_COMPILE_COMMANDS ON)' \
        '' \
        'if(NOT CMAKE_BUILD_TYPE)' \
        '    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)' \
        'endif()' \
        '' \
        'option(ENABLE_ASAN "Enable AddressSanitizer" ON)' \
        'option(ENABLE_UBSAN "Enable UndefinedBehaviorSanitizer" ON)' \
        'option(ENABLE_MSAN "Enable MemorySanitizer (Clang only)" OFF)' \
        'option(ENABLE_TSAN "Enable ThreadSanitizer" OFF)' \
        'option(ENABLE_HARDENING "Enable hardening flags" ON)' \
        'option(ENABLE_WERROR "Treat warnings as errors" OFF)' \
        'option(ENABLE_LTO "Enable link time optimization" OFF)' \
        '' \
        'set(PROJECT_WARNINGS' \
        '    -Wall' \
        '    -Wextra' \
        '    -Wpedantic' \
        '    -Wconversion' \
        '    -Wsign-conversion' \
        '    -Wshadow' \
        '    -Wformat=2' \
        '    -Wundef' \
        '    -Wcast-align' \
        '    -Wcast-qual' \
        '    -Woverloaded-virtual' \
        '    -Wnon-virtual-dtor' \
        '    -Wold-style-cast' \
        '    -Wdouble-promotion' \
        '    -Wformat-security' \
        '    -Wnull-dereference' \
        '    -Wextra-semi' \
        ')' \
        '' \
        'if(ENABLE_WERROR)' \
        '    list(APPEND PROJECT_WARNINGS -Werror)' \
        'endif()' \
        '' \
        'set(PROJECT_HARDENING)' \
        'if(ENABLE_HARDENING)' \
        '    list(APPEND PROJECT_HARDENING' \
        '        -O2' \
        '        -fstack-protector-strong' \
        '        -D_FORTIFY_SOURCE=3' \
        '        -fno-omit-frame-pointer' \
        '    )' \
        '    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")' \
        '        list(APPEND PROJECT_HARDENING -fPIE)' \
        '        add_link_options(-pie -Wl,-z,relro,-z,now -Wl,-z,noexecstack)' \
        '    endif()' \
        'endif()' \
        '' \
        'set(PROJECT_SANITIZERS)' \
        'if(CMAKE_BUILD_TYPE STREQUAL "Debug")' \
        '    if(ENABLE_ASAN)' \
        '        list(APPEND PROJECT_SANITIZERS -fsanitize=address)' \
        '    endif()' \
        '    if(ENABLE_UBSAN)' \
        '        list(APPEND PROJECT_SANITIZERS -fsanitize=undefined)' \
        '    endif()' \
        '    if(ENABLE_TSAN)' \
        '        list(APPEND PROJECT_SANITIZERS -fsanitize=thread)' \
        '    endif()' \
        '    if(ENABLE_MSAN AND CMAKE_CXX_COMPILER_ID STREQUAL "Clang")' \
        '        list(APPEND PROJECT_SANITIZERS -fsanitize=memory)' \
        '    endif()' \
        'endif()' \
        '' \
        'if(ENABLE_LTO)' \
        '    include(CheckIPOSupported)' \
        '    check_ipo_supported(RESULT ipo_ok OUTPUT ipo_msg)' \
        '    if(ipo_ok)' \
        '        set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)' \
        '    else()' \
        '        message(WARNING "LTO not supported: ${ipo_msg}")' \
        '    endif()' \
        'endif()' \
        '' \
        '# Main application' \
        'add_executable(app' \
        '    src/main.cpp' \
        '    src/target.cpp' \
        ')' \
        'target_compile_features(app PRIVATE cxx_std_23)' \
        'target_include_directories(app PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)' \
        'target_compile_options(app PRIVATE ${PROJECT_WARNINGS} ${PROJECT_HARDENING} ${PROJECT_SANITIZERS})' \
        'target_link_options(app PRIVATE ${PROJECT_SANITIZERS})' \
        '' \
        '# Fuzz target' \
        'add_executable(fuzz_target' \
        '    fuzz/fuzz_target.cpp' \
        '    src/target.cpp' \
        ')' \
        'target_compile_features(fuzz_target PRIVATE cxx_std_23)' \
        'target_include_directories(fuzz_target PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)' \
        'target_compile_options(fuzz_target PRIVATE ${PROJECT_WARNINGS} ${PROJECT_HARDENING} ${PROJECT_SANITIZERS})' \
        'target_link_options(fuzz_target PRIVATE ${PROJECT_SANITIZERS})' \
        '' \
        '# Unit tests' \
        'enable_testing()' \
        'add_executable(unit_tests' \
        '    tests/test_target.cpp' \
        '    src/target.cpp' \
        ')' \
        'target_compile_features(unit_tests PRIVATE cxx_std_23)' \
        'target_include_directories(unit_tests PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)' \
        'target_compile_options(unit_tests PRIVATE ${PROJECT_WARNINGS} ${PROJECT_HARDENING} ${PROJECT_SANITIZERS})' \
        'target_link_options(unit_tests PRIVATE ${PROJECT_SANITIZERS})' \
        'add_test(NAME test_target COMMAND unit_tests)' \
        '' \
        '# clang-tidy' \
        'find_program(CLANG_TIDY_EXE NAMES clang-tidy)' \
        'if(CLANG_TIDY_EXE)' \
        '    add_custom_target(analyze-clang-tidy' \
        '        COMMAND ${CLANG_TIDY_EXE}' \
        '        -p ${CMAKE_BINARY_DIR}' \
        '        src/main.cpp src/target.cpp tests/test_target.cpp fuzz/fuzz_target.cpp' \
        '        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}' \
        '        COMMENT "Running clang-tidy"' \
        '    )' \
        'else()' \
        '    add_custom_target(analyze-clang-tidy' \
        '        COMMAND ${CMAKE_COMMAND} -E echo "clang-tidy not found; skipping"' \
        '    )' \
        'endif()' \
        '' \
        '# cppcheck' \
        'find_program(CPPCHECK_EXE NAMES cppcheck)' \
        'if(CPPCHECK_EXE)' \
        '    add_custom_target(analyze-cppcheck' \
        '        COMMAND ${CPPCHECK_EXE}' \
        '        --enable=all' \
        '        --inconclusive' \
        '        --std=c++23' \
        '        --error-exitcode=1' \
        '        --quiet' \
        '        --inline-suppr' \
        '        -I include src tests fuzz' \
        '        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}' \
        '        COMMENT "Running cppcheck"' \
        '    )' \
        'else()' \
        '    add_custom_target(analyze-cppcheck' \
        '        COMMAND ${CMAKE_COMMAND} -E echo "cppcheck not found; skipping"' \
        '    )' \
        'endif()' \
        '' \
        '# flawfinder' \
        'find_program(FLAWFINDER_EXE NAMES flawfinder)' \
        'if(FLAWFINDER_EXE)' \
        '    add_custom_target(analyze-flawfinder' \
        '        COMMAND ${FLAWFINDER_EXE}' \
        '        --quiet' \
        '        --dataonly' \
        '        src include tests fuzz' \
        '        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}' \
        '        COMMENT "Running flawfinder"' \
        '    )' \
        'else()' \
        '    add_custom_target(analyze-flawfinder' \
        '        COMMAND ${CMAKE_COMMAND} -E echo "flawfinder not found; skipping"' \
        '    )' \
        'endif()' \
        '' \
        '# ELF inspection' \
        'find_program(READELF_EXE NAMES readelf llvm-readelf)' \
        'if(READELF_EXE)' \
        '    add_custom_target(sec-elf' \
        '        COMMAND ${READELF_EXE} -W -h -l -S -s app' \
        '        DEPENDS app' \
        '        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}' \
        '        COMMENT "Inspect ELF headers, segments, sections and symbols"' \
        '    )' \
        'else()' \
        '    add_custom_target(sec-elf' \
        '        COMMAND ${CMAKE_COMMAND} -E echo "readelf not found; skipping"' \
        '    )' \
        'endif()' \
        '' \
        '# Disassembly' \
        'find_program(OBJDUMP_EXE NAMES objdump llvm-objdump)' \
        'if(OBJDUMP_EXE)' \
        '    add_custom_target(sec-disasm' \
        '        COMMAND ${OBJDUMP_EXE} -d -M intel app' \
        '        DEPENDS app' \
        '        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}' \
        '        COMMENT "Disassemble app"' \
        '    )' \
        'else()' \
        '    add_custom_target(sec-disasm' \
        '        COMMAND ${CMAKE_COMMAND} -E echo "objdump not found; skipping"' \
        '    )' \
        'endif()' \
        '' \
        '# Symbols' \
        'find_program(NM_EXE NAMES nm llvm-nm)' \
        'if(NM_EXE)' \
        '    add_custom_target(sec-symbols' \
        '        COMMAND ${NM_EXE} -an app' \
        '        DEPENDS app' \
        '        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}' \
        '        COMMENT "Dump symbol table"' \
        '    )' \
        'else()' \
        '    add_custom_target(sec-symbols' \
        '        COMMAND ${CMAKE_COMMAND} -E echo "nm not found; skipping"' \
        '    )' \
        'endif()' \
        '' \
        '# Printable strings' \
        'find_program(STRINGS_EXE NAMES strings llvm-strings)' \
        'if(STRINGS_EXE)' \
        '    add_custom_target(sec-strings' \
        '        COMMAND ${STRINGS_EXE} -a app' \
        '        DEPENDS app' \
        '        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}' \
        '        COMMENT "Extract printable strings"' \
        '    )' \
        'else()' \
        '    add_custom_target(sec-strings' \
        '        COMMAND ${CMAKE_COMMAND} -E echo "strings not found; skipping"' \
        '    )' \
        'endif()' \
        '' \
        '# checksec' \
        'find_program(CHECKSEC_EXE NAMES checksec checksec.sh)' \
        'if(CHECKSEC_EXE)' \
        '    add_custom_target(sec-checksec' \
        '        COMMAND ${CHECKSEC_EXE} --file=app' \
        '        DEPENDS app' \
        '        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}' \
        '        COMMENT "Check ELF hardening properties"' \
        '    )' \
        'else()' \
        '    add_custom_target(sec-checksec' \
        '        COMMAND ${CMAKE_COMMAND} -E echo "checksec not found; skipping"' \
        '    )' \
        'endif()' \
        '' \
        '# Combined security inspection' \
        'add_custom_target(sec-all)' \
        'add_dependencies(sec-all sec-elf sec-disasm sec-symbols sec-strings sec-checksec)' \
        '' \
        '# Combined static analysis' \
        'add_custom_target(analyze-all)' \
        'add_dependencies(analyze-all analyze-clang-tidy analyze-cppcheck analyze-flawfinder)'

    printf '%s\n' $cmake_content > CMakeLists.txt

    # ========================================================
    # include/target.hpp
    # ========================================================

    set -l target_h_content \
        '#pragma once' \
        '' \
        '#include <cstddef>' \
        '#include <string_view>' \
        '' \
        'std::size_t bounded_strlen(std::string_view text, std::size_t max_len);' \
        'bool parse_port(std::string_view input, int &out_port);'

    printf '%s\n' $target_h_content > include/target.hpp

    # ========================================================
    # src/target.cpp
    # ========================================================

    set -l target_cpp_content \
        '#include "target.hpp"' \
        '' \
        '#include <charconv>' \
        '#include <cstddef>' \
        '#include <string_view>' \
        '#include <system_error>' \
        '' \
        'std::size_t bounded_strlen(std::string_view text, std::size_t max_len)' \
        '{' \
        '    return text.size() < max_len ? text.size() : max_len;' \
        '}' \
        '' \
        'bool parse_port(std::string_view input, int &out_port)' \
        '{' \
        '    int value = 0;' \
        '    const char *begin = input.data();' \
        '    const char *end = begin + input.size();' \
        '    auto [ptr, ec] = std::from_chars(begin, end, value);' \
        '' \
        '    if (input.empty() || ec != std::errc{} || ptr != end || value < 1 || value > 65535)' \
        '    {' \
        '        return false;' \
        '    }' \
        '' \
        '    out_port = value;' \
        '    return true;' \
        '}'

    printf '%s\n' $target_cpp_content > src/target.cpp

    # ========================================================
    # src/main.cpp
    # ========================================================

    set -l main_cpp_content \
        '#include "target.hpp"' \
        '' \
        '#include <iostream>' \
        '' \
        'int main()' \
        '{' \
        '    int port = 0;' \
        '' \
        '    if (!parse_port("8080", port))' \
        '    {' \
        '        std::cerr << "parse_port failed\n";' \
        '        return 1;' \
        '    }' \
        '' \
        '    std::cout << "C++23 security research scaffold: port=" << port << '\''\n'\'';' \
        '    return 0;' \
        '}'

    printf '%s\n' $main_cpp_content > src/main.cpp

    # ========================================================
    # tests/test_target.cpp
    # ========================================================

    set -l test_content \
        '#include "target.hpp"' \
        '' \
        '#include <cassert>' \
        '' \
        'static void test_bounded_strlen(void)' \
        '{' \
        '    assert(bounded_strlen("hello", 10) == 5);' \
        '    assert(bounded_strlen("hello", 3) == 3);' \
        '    assert(bounded_strlen({}, 10) == 0);' \
        '}' \
        '' \
        'static void test_parse_port(void)' \
        '{' \
        '    int port = 0;' \
        '' \
        '    assert(parse_port("80", port));' \
        '    assert(port == 80);' \
        '' \
        '    assert(parse_port("65535", port));' \
        '    assert(port == 65535);' \
        '' \
        '    assert(!parse_port("0", port));' \
        '    assert(!parse_port("65536", port));' \
        '    assert(!parse_port("abc", port));' \
        '    assert(!parse_port({}, port));' \
        '}' \
        '' \
        'int main()' \
        '{' \
        '    test_bounded_strlen();' \
        '    test_parse_port();' \
        '    return 0;' \
        '}'

    printf '%s\n' $test_content > tests/test_target.cpp


    # ========================================================
    # .clangd
    # ========================================================

    set -l clangd_content \
        'CompileFlags:' \
        '  CompilationDatabase: build' \
        '' \
        'Diagnostics:' \
        '  UnusedIncludes: Strict' \
        '' \
        'Index:' \
        '  Background: Build'

    printf '%s\n' $clangd_content > .clangd


    # ========================================================
    # fuzz/fuzz_target.cpp
    # ========================================================

    set -l fuzz_content \
        '#include "target.hpp"' \
        '' \
        '#include <array>' \
        '#include <cstddef>' \
        '#include <cstdint>' \
        '#include <cstdio>' \
        '#include <cstdlib>' \
        '#include <string_view>' \
        '' \
        'extern "C" int LLVMFuzzerTestOneInput(const std::uint8_t *data, std::size_t size);' \
        'extern "C" int LLVMFuzzerTestOneInput(const std::uint8_t *data, std::size_t size)' \
        '{' \
        '    int out = 0;' \
        '    std::array<char, 64> buf{};' \
        '    std::size_t i = 0;' \
        '' \
        '    if (data == nullptr || size == 0)' \
        '    {' \
        '        return 0;' \
        '    }' \
        '' \
        '    for (i = 0; i < size && i < buf.size() - 1; ++i)' \
        '    {' \
        '        buf[i] = (char)data[i];' \
        '    }' \
        '' \
        '    buf[i] = '\''\0'\'';' \
        '' \
        '    auto text = std::string_view(buf.data(), i);' \
        '    (void)bounded_strlen(text, buf.size());' \
        '    (void)parse_port(text, out);' \
        '' \
        '    return 0;' \
        '}'

    set fuzz_content $fuzz_content \
        '' \
        'int main()' \
        '{' \
        '    std::array<std::uint8_t, 64> buf{};' \
        '    std::size_t n = 0;' \
        '' \
        '    while ((n = std::fread(buf.data(), 1, buf.size(), stdin)) > 0)' \
        '    {' \
        '        (void)LLVMFuzzerTestOneInput(buf, n);' \
        '    }' \
        '' \
        '    if (std::ferror(stdin))' \
        '    {' \
        '        return EXIT_FAILURE;' \
        '    }' \
        '' \
        '    return EXIT_SUCCESS;' \
        '}'

    printf '%s\n' $fuzz_content > fuzz/fuzz_target.cpp

    # ========================================================
    # .clang-format
    # ========================================================

    set -l clang_format_content \
        'BasedOnStyle: LLVM' \
        'IndentWidth: 4' \
        'TabWidth: 4' \
        'UseTab: Never' \
        'ColumnLimit: 100' \
        'BreakBeforeBraces: Allman'

    printf '%s\n' $clang_format_content > .clang-format

    # ========================================================
    # .clang-tidy
    # ========================================================

    set -l clang_tidy_content \
        'Checks: >-' \
        '  -*,' \
        '  bugprone-*,' \
        '  cert-*,' \
        '  clang-analyzer-*,' \
        '  concurrency-*,' \
        '  cppcoreguidelines-*,' \
        '  modernize-*,' \
        '  performance-*,' \
        '  portability-*,' \
        '  readability-*' \
        'WarningsAsErrors: '\'''\''' \
        'HeaderFilterRegex: '\''include/.*'\''' \
        'FormatStyle: file'

    printf '%s\n' $clang_tidy_content > .clang-tidy

    # ========================================================
    # .gitignore
    # ========================================================

    set -l gitignore_content \
        'build/' \
        'build-asan/' \
        'build-ubsan/' \
        'build-msan/' \
        'build-tsan/' \
        'build-release/' \
        'compile_commands.json' \
        '' \
        '.vscode/' \
        '.idea/' \
        '' \
        '*.o' \
        '*.a' \
        '*.so' \
        '*.out' \
        '' \
        'core' \
        'core.*' \
        'vgcore.*' \
        'massif.out.*'

    printf '%s\n' $gitignore_content > .gitignore

    # ========================================================
    # CMakePresets.json
    # ========================================================

    set -l presets_content \
        '{' \
        '  "version": 6,' \
        '  "cmakeMinimumRequired": {' \
        '    "major": 3,' \
        '    "minor": 22,' \
        '    "patch": 0' \
        '  },' \
        '  "configurePresets": [' \
        '    {' \
        '      "name": "debug",' \
        '      "generator": "Ninja",' \
        '      "binaryDir": "${sourceDir}/build",' \
        '      "cacheVariables": {' \
        '        "CMAKE_BUILD_TYPE": "Debug",' \
        '        "CMAKE_EXPORT_COMPILE_COMMANDS": "ON"' \
        '      }' \
        '    },' \
        '    {' \
        '      "name": "asan-ubsan",' \
        '      "inherits": "debug",' \
        '      "binaryDir": "${sourceDir}/build-asan",' \
        '      "cacheVariables": {' \
        '        "ENABLE_ASAN": "ON",' \
        '        "ENABLE_UBSAN": "ON",' \
        '        "ENABLE_TSAN": "OFF",' \
        '        "ENABLE_MSAN": "OFF"' \
        '      }' \
        '    },' \
        '    {' \
        '      "name": "tsan",' \
        '      "inherits": "debug",' \
        '      "binaryDir": "${sourceDir}/build-tsan",' \
        '      "cacheVariables": {' \
        '        "ENABLE_ASAN": "OFF",' \
        '        "ENABLE_UBSAN": "OFF",' \
        '        "ENABLE_TSAN": "ON",' \
        '        "ENABLE_MSAN": "OFF"' \
        '      }' \
        '    },' \
        '    {' \
        '      "name": "msan-clang",' \
        '      "inherits": "debug",' \
        '      "binaryDir": "${sourceDir}/build-msan",' \
        '      "cacheVariables": {' \
        '        "CMAKE_CXX_COMPILER": "clang++",' \
        '        "ENABLE_ASAN": "OFF",' \
        '        "ENABLE_UBSAN": "OFF",' \
        '        "ENABLE_TSAN": "OFF",' \
        '        "ENABLE_MSAN": "ON"' \
        '      }' \
        '    },' \
        '    {' \
        '      "name": "release-hardened",' \
        '      "inherits": "debug",' \
        '      "binaryDir": "${sourceDir}/build-release",' \
        '      "cacheVariables": {' \
        '        "CMAKE_BUILD_TYPE": "Release",' \
        '        "ENABLE_ASAN": "OFF",' \
        '        "ENABLE_UBSAN": "OFF",' \
        '        "ENABLE_TSAN": "OFF",' \
        '        "ENABLE_MSAN": "OFF",' \
        '        "ENABLE_LTO": "ON",' \
        '        "ENABLE_HARDENING": "ON"' \
        '      }' \
        '    }' \
        '  ],' \
        '  "buildPresets": [' \
        '    { "name": "debug", "configurePreset": "debug" },' \
        '    { "name": "asan-ubsan", "configurePreset": "asan-ubsan" },' \
        '    { "name": "tsan", "configurePreset": "tsan" },' \
        '    { "name": "msan-clang", "configurePreset": "msan-clang" },' \
        '    { "name": "release-hardened", "configurePreset": "release-hardened" }' \
        '  ],' \
        '  "testPresets": [' \
        '    { "name": "debug", "configurePreset": "debug", "output": { "outputOnFailure": true } },' \
        '    { "name": "asan-ubsan", "configurePreset": "asan-ubsan", "output": { "outputOnFailure": true } },' \
        '    { "name": "tsan", "configurePreset": "tsan", "output": { "outputOnFailure": true } },' \
        '    { "name": "msan-clang", "configurePreset": "msan-clang", "output": { "outputOnFailure": true } },' \
        '    { "name": "release-hardened", "configurePreset": "release-hardened", "output": { "outputOnFailure": true } }' \
        '  ]' \
        '}'

    printf '%s\n' $presets_content > CMakePresets.json

    # ========================================================
    # README.md
    # ========================================================

    set -l readme_content \
        '# C++23 Security Research Project' \
        '' \
        '## Tooling' \
        '' \
        '- C++23 + CMake' \
        '- G++ / Clang++' \
        '- clangd / clang-format / clang-tidy' \
        '- GDB / LLDB' \
        '- ELF/DWARF inspection (readelf, objdump, nm, strings)' \
        '- ASan, UBSan, optional MSan/TSan' \
        '- Valgrind' \
        '- cppcheck / flawfinder (if installed)' \
        '' \
        '## Build' \
        '' \
        '```bash' \
        'cmake --preset debug' \
        'cmake --build --preset debug' \
        'ctest --preset debug' \
        '```' \
        '' \
        '### Classic CMake' \
        '' \
        '```bash' \
        'cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug' \
        'cmake --build build -j' \
        'ctest --test-dir build --output-on-failure' \
        '```' \
        '' \
        '## Static Analysis' \
        '' \
        '```bash' \
        'cmake --build build --target analyze-all' \
        '```' \
        '' \
        '## ELF Analysis' \
        '' \
        '```bash' \
        'cmake --build build --target sec-all' \
        'readelf -W -a build/app' \
        'objdump -d -M intel build/app' \
        '```'

    printf '%s\n' $readme_content > README.md

    # ========================================================
    # Bootstrap
    # ========================================================

    echo ""
    echo "C++23 security research project created:"
    echo "  $project_dir"
    echo ""
    echo "Running bootstrap: configure + build + test"
    echo ""

    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    or begin
        echo "Bootstrap failed at configure step."
        return 1
    end

    cmake --build build -j
    or begin
        echo "Bootstrap failed at build step."
        return 1
    end

    ctest --test-dir build --output-on-failure
    or begin
        echo "Bootstrap failed at test step."
        return 1
    end

    if test -e build/compile_commands.json
        if test -L compile_commands.json
            rm compile_commands.json
        else if test -e compile_commands.json
            rm compile_commands.json
        end

        ln -s build/compile_commands.json compile_commands.json
    end

    echo ""
    echo "Bootstrap complete."
    echo ""
    echo "Optional analysis targets:"
    echo "  cmake --build build --target analyze-clang-tidy"
    echo "  cmake --build build --target analyze-cppcheck"
    echo "  cmake --build build --target analyze-flawfinder"
    echo "  cmake --build build --target sec-elf"
    echo "  cmake --build build --target sec-disasm"
    echo "  cmake --build build --target sec-symbols"
    echo "  cmake --build build --target sec-strings"
    echo "  cmake --build build --target sec-checksec"
    echo "  cmake --build build --target sec-all"

    if test "$full_scan" = "1"
        echo ""
        echo "Running full scan: analyze-all + sec-all"
        echo ""

        cmake --build build --target analyze-all
        or begin
            echo "Full scan failed at analyze-all target."
            return 1
        end

        cmake --build build --target sec-all
        or begin
            echo "Full scan failed at sec-all target."
            return 1
        end
    end

    echo ""
    echo "Project ready: $project_dir"
    return 0
end


# ============================================================
# PUBLIC COMMAND
# Usage:
#   create-cpp-pro new NAME
#   create-cpp-pro new NAME 1
# ============================================================

function create-cpp-pro --argument-names command name full_scan
    switch "$command"
        case new
            if test -z "$name"
                echo "Usage: create-cpp-pro new NAME [full_scan]"
                echo ""
                echo "Examples:"
                echo "  create-cpp-pro new testnew"
                echo "  create-cpp-pro new testnew 1"
                return 2
            end

            if test "$full_scan" = "1"
                __cpro_scaffold "$name" 1
            else
                __cpro_scaffold "$name" 0
            end

        case '*'
            echo "Usage: create-cpp-pro new NAME [full_scan]"
            return 2
    end
end

# function create-cpp-pro
#     if test (count $argv) -lt 2
#         echo "Usage: create-cpp-pro new <project-name> [--full-scan]"
#         return 1
#     end

#     set -l action $argv[1]

#     switch $action
#         case new
#             if test (count $argv) -lt 2
#                 echo "Usage: create-cpp-pro new <project-name> [--full-scan]"
#                 return 1
#             end

#             set -l full_scan 0
#             if test (count $argv) -gt 2
#                 for opt in $argv[3..-1]
#                     switch $opt
#                         case --full-scan
#                             set full_scan 1
#                         case '*'
#                             echo "Unknown option: $opt"
#                             echo "Usage: create-cpp-pro new <project-name> [--full-scan]"
#                             return 1
#                     end
#                 end
#             end

#             __cpro_scaffold $argv[2] $full_scan
#             return $status
#         case '*'
#             echo "Unknown action: $action"
#             echo "Usage: create-cpp-pro new <project-name> [--full-scan]"
#             return 1
#     end
# end


function create-cpp
    if test (count $argv) -ne 1
        echo "Usage: create-cpp <project-name>"
        return 1
    end

    create-cpp-pro new $argv[1]
end


# ============================================================
# OPTIONAL FORMAT / LINT HELPERS
# ============================================================

function cppformat
    if test (count $argv) -eq 0
        echo "Usage: cppformat <file.cpp> [file.hpp ...]"
        return 1
    end

    clang-format -i $argv
end


function cppformat-check
    if test (count $argv) -eq 0
        echo "Usage: cppformat-check <file.cpp> [file.hpp ...]"
        return 1
    end

    clang-format --dry-run --Werror $argv
end


function cpptidy
    if not test -f compile_commands.json
        echo "compile_commands.json not found."
        echo "Run: cpp-config"
        return 1
    end

    clang-tidy $argv
end


# ============================================================
# END
# ============================================================
