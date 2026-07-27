function gdb
    if test "$argv[1]" = -gef
        command gdb -ex "source /usr/share/gef/gef.py" $argv[2..-1]
    else if test "$argv[1]" = -pwndbg
        command gdb -ex "source /usr/share/pwndbg/gdbinit.py" $argv[2..-1]
    else
        command gdb $argv
    end
end
