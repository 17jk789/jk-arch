function disas
    objdump -drwC -M intel --visualize-jumps=color $argv[1]
end

function disassrc
    objdump -drwCS -M intel --visualize-jumps=color $argv[1]
end
