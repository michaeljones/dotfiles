# From https://github.com/fish-shell/fish-shell/wiki/Bash-Style-History-Substitution-%28%21%21-and-%21%24%29

function bind_bang
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end



fzf_key_bindings
function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
    bind \cj history-search-forward
    bind \ck history-search-backward
    ### fzf ###
    set -q FZF_LEGACY_KEYBINDINGS
    or set -l FZF_LEGACY_KEYBINDINGS 1
    if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
        bind \ct '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \cx '__fzf_find_and_execute'
        bind \ec '__fzf_cd'
        bind \eC '__fzf_cd_with_hidden'
        if bind -M insert >/dev/null ^/dev/null
            bind -M insert \ct '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \cx '__fzf_find_and_execute'
            bind -M insert \ec '__fzf_cd'
            bind -M insert \eC '__fzf_cd_with_hidden'
        end
    else
        bind \cf '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \ex '__fzf_find_and_execute'
        bind \eo '__fzf_cd'
        bind \eO '__fzf_cd_with_hidden'
        if bind -M insert >/dev/null ^/dev/null
            bind -M insert \cf '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \ex '__fzf_find_and_execute'
            bind -M insert \eo '__fzf_cd'
            bind -M insert \eO '__fzf_cd_with_hidden'
        end
    end
    ### fzf ###
end
