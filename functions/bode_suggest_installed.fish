function bode_suggest_installed
    set program_cmd $argv[1]
    set program_name $argv[2]

    if ! bode_is_installed $program_cmd
        echo "Command '$program_cmd' not found. Please install it."
        if [ "$program_name" != "" ]
            echo "It gets installed with $program_name."
        end
        return 1
    end
    return 0
end
