# Guard to make sure this file is only executed
# on Darwin systems
if test (bode_os_discovery) != Darwin
    return
end

# =============================================================================
#
# Environment variables
#

# Always use the latest version of swift
set -Ux TOOLCHAINS swift

# Choose which JDK to use
# set -Ux JAVA_HOME $HOMEBREW_PREFIX/opt/openjdk@17

# Set GRADLE_HOME because some tools need it
# set -Ux GRADLE_HOME ...


# =============================================================================
#
# Program initialization and configuration
#



# =============================================================================
#
# Theming
#



# =============================================================================
#
# Path
#

# Python's bin provided by Apple
fish_add_path $HOME/Library/Python/3.9/bin

# Rancher Desktop, a Docker Desktop alternative
fish_add_path $HOME/.rd/bin

# =============================================================================
#
# Interactive
#

if status --is-interactive
    # Commands to run in interactive sessions can go here

    # =========================================================================
    #
    # Program initializations and configuration
    #

    

    # Load ssh keys into the ssh-agent
    ssh-add --apple-load-keychain -q

    # =========================================================================
    #
    # Aliases
    #

    # Delete files safely
    # https://github.com/bode-fun/Dustman
    alias trash Dustman

    # Add ssh keys but use the keychain
    alias ssh-add "ssh-add --apple-use-keychain"
end

# =============================================================================
#
# Login
#

if status --is-login

end

# =============================================================================
#
# Exit
#

function bode_on_exit_darwin --on-event fish_exit

end
