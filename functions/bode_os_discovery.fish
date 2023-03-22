function bode_os_discovery
    set os_name (uname -s)
    set os_type $os_name
    if test "$os_name" = Linux && test -n WSL_DISTRO_NAME
        set os_type WSL
    end
    echo $os_type
end