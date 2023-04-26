bode_suggest_installed socket "command npm install -g @socketsecurity/cli"

function npm --wraps npm --description "Socket's save npm wrapper"
    socket-npm $argv
end

function npx --wraps npx --description "Socket's save npx wrapper"
    socket-npx $argv
end
