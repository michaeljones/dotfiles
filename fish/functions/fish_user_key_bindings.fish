# From https://github.com/fish-shell/fish-shell/wiki/Bash-Style-History-Substitution-%28%21%21-and-%21%24%29

function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
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


function fish_user_key_bindings
  bind ! bind_bang
  bind '$' bind_dollar
  bind \cj history-search-forward
  bind \ck history-search-backward
end
