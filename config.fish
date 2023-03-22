# Shared configuration for all operating systems
# The os-dependent configurations are stored under their respective names
# in the conf.d directory

if status is-interactive
    # Commands to run in interactive sessions can go here
    # These commands are run after the os-specific configuration
end

function bode_on_exit_common --on-event fish_exit

end
