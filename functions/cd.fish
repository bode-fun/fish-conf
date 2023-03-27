function cd --wraps "cd" -d "Change directory and list contents"
    z $argv
    ls
end