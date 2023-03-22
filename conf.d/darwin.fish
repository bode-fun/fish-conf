# Guard to make sure this file is only executed
# on Darwin systems
if test (bode_os_discovery) != Darwin
    return
end

#####################
#   Common Config    #
#####################

set -Ux GPG_TTY (tty)

#####################
#    Interactive    #
#####################

if status --is-interactive
    # Initializing starship
    starship init fish | source

    # Activate command-not-found handler
    set HB_CNF_HANDLER (brew --repository)"/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
    if test -f $HB_CNF_HANDLER
        source $HB_CNF_HANDLER
    end

    # eval (ssh-agent -c | sed 's/^echo/#echo/')
end

#####################
#       Login       #
#####################

if status --is-login

end

#####################
#       Exit        #
#####################

function bode_on_exit_darwin --on-event fish_exit
end
