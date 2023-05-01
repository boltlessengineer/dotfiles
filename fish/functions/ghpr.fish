# credit to https://github.com/helix-editor/helix/discussions/5883
function ghpr
    GH_FORCE_TTY=100% gh pr list --limit 300 | \
        fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window 'down,70%' --header-lines 3 | \
        awk '{print $1}' | \
        xargs gh pr checkout
end
