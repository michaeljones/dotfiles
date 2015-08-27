function fish_prompt --description 'Write out the prompt'
   printf '%s[%s%s%s@%s%s%s~%s%s%s:%s%s%s]$%s ' \
       (set_color --bold FFF) \
       (set_color f0c674) (whoami) \
       (set_color FFF) \
       (set_color f0c674) (hostname|cut -d . -f 1) \
       (set_color FFF) \
       (set_color f0c674) (date "+%k:%M") \
       (set_color FFF) \
	   (set_color $fish_color_cwd) (prompt_pwd) \
       (set_color FFF) \
       (set_color normal)
end
