#! /bin/sh
# Refreshes the filepermissions in the ssh folder
bode_fix_ssh_permissions() {
    if [ -d "$HOME/.ssh" ]; then
        chmod 700 "$HOME/.ssh"
        chmod 600 "$HOME/.ssh"/*
        
        if [ "$(\find $HOME/.ssh/ -type f \( -name "*.pub" \) | wc -l)" -gt 0 ]; then
            chmod 644 "$HOME/.ssh"/*.pub
        fi

        if [ -f "$HOME/.ssh/authorized_keys" ]; then
            chmod 644 "$HOME/.ssh/authorized_keys"
        fi
        
        if [ -f "$HOME/.ssh/allowed_signers" ]; then
            chmod 644 "$HOME/.ssh/allowed_signers"
        fi
    fi
}