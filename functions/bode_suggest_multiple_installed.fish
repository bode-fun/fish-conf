function bode_suggest_multiple_installed
    set all_installed 0
    for command in $argv
        bode_suggest_installed $command
        set all_installed $status
    end
    
    return $all_installed
end
