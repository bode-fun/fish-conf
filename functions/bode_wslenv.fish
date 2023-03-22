function bode_wslenv
    if test (bode_os_discovery == "WSL")
        /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command "echo \$env:$1" | tr -d '\r'
        return $status
    else
        return 1
    end
end
