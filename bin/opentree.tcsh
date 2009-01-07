#!/bin/tcsh -f

set dir = "."

if ( "$#argv" == "1" ) then
	set dir = $argv[1]
endif

find $dir -type f | grep -v -E '\.git|^.$|~$' | sort | xargs gvim.py

