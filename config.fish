# Shared configuration for all operating systems
# The os-dependent configurations are stored under their respective names
# in the conf.d directory

# =============================================================================
#
# Environment variables
#

# XDG Base Directory Specification
# Only for convenience, because I don't know Darwin well enough
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_STATE_HOME $HOME/.local/state
set -Ux XDG_CACHE_HOME $HOME/.cache

# A directory for things like sockets, named pipes, etc.
# From the XDG Base Directory Specification:
# "It MUST be created when the user first logs in
# and if the user fully logs out the directory MUST be removed."
# TODO: Find out if there is something like this in Darwin
set -Ux XDG_RUNTIME_DIR $HOME/.local/run
if not test -d $XDG_RUNTIME_DIR
    mkdir -p $XDG_RUNTIME_DIR
    chmod 700 $XDG_RUNTIME_DIR
end

# Possible directories which are not specified by the XDG Base Directory Specification
# set -Ux XDG_DESKTOP_DIR $HOME/Desktop
# set -Ux XDG_DOCUMENTS_DIR $HOME/Documents
# set -Ux XDG_DOWNLOAD_DIR $HOME/Downloads
# set -Ux XDG_MUSIC_DIR $HOME/Music
# set -Ux XDG_PICTURES_DIR $HOME/Pictures
# set -Ux XDG_PROJECTS_DIR $HOME/Projects
# set -Ux XDG_VIDEOS_DIR $HOME/Videos

# For git signing with gpg
set -Ux GPG_TTY (tty)

# Use nvim as the default editor
set -Ux EDITOR nvim
set -Ux VISUAL nvim

# =============================================================================
#
# Program initialization
#



# =============================================================================
#
# Theming
#

set -Ux BAT_THEME Catppuccin-macchiato
set -Ux FZF_DEFAULT_OPTS " \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

# =============================================================================
#
# Path
#

# INFO: If you do not use the fish binary provided by brew, you will need to
#       uncomment the following lines to get completions to work

# if test -d (brew --prefix)"/share/fish/completions"
#     set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
# end

# if test -d (brew --prefix)"/share/fish/vendor_completions.d"
#     set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
# end

# END

# User specific executables according to the XDG Base Directory Specification
fish_add_path $HOME/.local/bin

# Folder for SDKs and golang updates
fish_add_path $HOME/sdk

# Go executables
fish_add_path $HOME/go/bin

# Rust executables
fish_add_path $HOME/.cargo/bin

# PHP executables
fish_add_path $HOME/.config/composer/vendor/bin

# Deno executables
fish_add_path $HOME/.deno/bin

# =============================================================================
#
# Interactive
#

if status is-interactive
    # Commands to run in interactive sessions can go here
    # These commands are run after the os-specific configuration

    # =========================================================================
    #
    # Program initializations and configuration
    #

    # Fix filepermissions for ssh
    bode_fix_ssh_permissions

    # Prompt
    # starship init fish | source

    # Smart cd with history
    zoxide init fish | source

    # Loading local environment variables from .envrc
    # direnv hook fish | source

    # Force pip to use virtualenvs to prevent polluting the system
    # TODO: I just put this here. Find out if this breaks anything
    alias pip "pip --require-virtualenv"
    alias pip3 "pip3 --require-virtualenv"
    alias pip3.9 "pip3.9 --require-virtualenv"
    alias pip3.10 "pip3.10 --require-virtualenv"
    alias pip3.11 "pip3.11 --require-virtualenv"

    # =========================================================================
    #
    # Aliases
    #

    alias ls "exa --icons --group-directories-first"
    alias ll "ls -lgh --git"
    alias la "ll -a"
    alias lg "la --git-ignore"
    alias ld "la -D"

    alias vi nvim
    alias vim nvim

    if test $TERM = xterm-kitty
        alias ssh "kitty +kitten ssh"
    end
end

# =============================================================================
#
# Exit
#

function bode_on_exit_common --on-event fish_exit
    # TODO: Uncomment, but idk if I really should set the runtime dir
    # Remove the XDG_RUNTIME_DIR when the user closes the shell
    # if test -d $XDG_RUNTIME_DIR
    #     rm -rf $XDG_RUNTIME_DIR/*
    # end
end
