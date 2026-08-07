function jtime --description "Nutzt die Fish-eigene Zeitmessung oder GNU time mit -full"
    if test "$argv[1]" = -full
        /usr/bin/time $argv[2..-1] --color=always
    else
        time $argv
    end
end
