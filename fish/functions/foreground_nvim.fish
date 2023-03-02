function foreground_nvim
    if jobs | grep -q "stopped.*nvim"
        set pid (jobs | grep "stopped.*nvim" | head -n 1 | awk '{print $2}')
        fg $pid
    else
        nvim $argv
    end
end
