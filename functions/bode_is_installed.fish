function bode_is_installed
    command -v $argv[1] >/dev/null 2>&1
    return (test $status -eq 0)
end
