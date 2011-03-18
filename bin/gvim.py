#!/usr/bin/env python

import sys
import os
import commands
import glob
import optparse


def main(argv):

    # Configure parser
    parser = optparse.OptionParser()
    parser.add_option("-s", "--server", action="store_true", default=False, dest="server", help="Run gvim with --remote-silent flag")

    # Parse options
    opt, args = parser.parse_args(argv)

    if not args:
        return

    files = []

    # Setup file types to ignore
    ignore = "~ .o .pdb .so .a .pyc .bks .bake".split()

    flags = ""
    line_number = ""

    # If there is only one argument then process it for
    # a line number, adding the necessary flag to the command call
    if len(args) == 1:

        if args[0].count(":"):
            file, line = args[0].split(":")

            args = [file]
            line_number += " +" + line + " "


    # Process all the args which should be file names
    for file in args:

        # Create an array with the file name
        matches = [file]

        # If the file name ends in "." then run a glob to
        # pick up all the possibilities
        if file.endswith("."):
            matches = glob.glob(file + "*")

        
        # Go through all the possible files
        for file in matches:
            include = True
            # Only include if it isn't on the ignore list
            for ending in ignore:
                if file.endswith(ending):
                    include = False
            if include:
                files.append(file)

    files.sort()

    # Configure command line options
    if opt.server:
        command = "gvim --serverlist"
        serverlist = commands.getoutput(command)

        if serverlist:
            flags += " --remote-silent "
            line_number = ""

    # Run the command
    command = "gvim -geom 180x60+100+10 " + flags + " ".join(files) + line_number
    os.system(command)


if __name__ == "__main__":
    main(sys.argv[1:])

