function disas
    objdump -drwCS -M intel --visualize-jumps=color $argv[1]
end
