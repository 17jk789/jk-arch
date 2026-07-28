function gdb
    set args $argv

    set use_pwndbg 0
    set use_gef 0
    set use_all 0
    set use_cat 0

    if contains -- -pwndbg $args
        set use_pwndbg 1
        set args (string match -rv -- '-pwndbg' $args)
    end

    if contains -- -gef $args
        set use_gef 1
        set args (string match -rv -- '-gef' $args)
    end

    if contains -- -all $args
        set use_all 1
        set args (string match -rv -- '-all' $args)
    end

    if contains -- -cat $args
        set use_cat 1
        set args (string match -rv -- '-cat' $args)
    end

    if test $use_gef -eq 1; and test $use_pwndbg -eq 1
        echo "Error: choose either -gef or -pwndbg"
        return 1
    end

    if test $use_cat -eq 1; and test $use_pwndbg -eq 0
        echo "-cat requires -pwndbg"
        return 1
    end

    # GEF
    if test $use_gef -eq 1
        if test $use_all -eq 1
            command gdb \
                -iex "source /usr/share/gef/gef.py" \
                -iex "gef config context.layout 'legend regs code args source memory stack threads trace extra dereference'" \
                -iex "gef config context.nb_lines_code 25" \
                -iex "gef config context.nb_lines_stack 25" \
                -iex "gef config context.grow_stack_down True" \
                -iex "gef config context.enable True" \
                -iex "gef config context.clear_screen False" \
                -iex "set disassembly-flavor intel" \
                -iex "set pagination off" \
                -iex "set breakpoint pending on" \
                -iex "set print pretty on" \
                -iex "set print asm-demangle on" \
                -iex "set follow-fork-mode child" \
                -iex "set detach-on-fork off" \
                -iex "set disassemble-next-line on" \
                -iex "set confirm off" \
                $args
        else
            command gdb \
                -iex "source /usr/share/gef/gef.py" \
                $args
        end

        # Pwndbg
    else if test $use_pwndbg -eq 1
        if test $use_all -eq 1
            command gdb \
                -iex "source /usr/share/pwndbg/gdbinit.py" \
                -iex "set disassembly-flavor intel" \
                -iex "set pagination off" \
                -iex "set print pretty on" \
                -iex "set print asm-demangle on" \
                -iex "set breakpoint pending on" \
                -iex "set follow-fork-mode child" \
                -iex "set detach-on-fork off" \
                -iex "set disassemble-next-line on" \
                -iex "set history save on" \
                -iex "set confirm off" \
                -iex "set context-stack-lines 30" \
                -iex "set context-code-lines 25" \
                -iex "set context-clear-screen off" \
                $args

        else if test $use_cat -eq 1
            command gdb \
                -iex "source /usr/share/pwndbg/gdbinit.py" \
                -iex "set syntax-highlight-style catppuccin_mocha" \
                $args
        else
            command gdb \
                -iex "source /usr/share/pwndbg/gdbinit.py" \
                $args
        end

    else
        command gdb $args
    end
end
