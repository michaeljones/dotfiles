#!/usr/bin/env python

import sys
import os

# Remove current directory from path if it is there
# as this can lead to problems opening files in python packages
try:
    sys.path.remove(os.getcwd())
except ValueError:
    pass

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
    ignore = "~ .o .pdb .so .a .pyc .bks .bake -bin .png .cc.d".split()

    flags = ""
    line_number = ""

    # If there is only one argument then process it for
    # a line number, adding the necessary flag to the command call
    if len(args) == 1:

        if args[0].count(":"):
            file_, line = args[0].split(":")

            args = [file_]
            line_number += " +" + line + " "


    # Process all the args which should be file names
    for entry in args:

        # Create an array with the file name
        matches = [entry]

        # If the file name has no "." in it, then we check to see if it exists
        # if it doesn't then check to see if we get a glob match for file.* and
        # open them instead
        if not entry.count("."):
            if not os.path.exists( entry ):
                results = glob.glob( "%s.*" % entry )
                if results:
                    matches = results

        # If the file name ends in "." then run a glob to
        # pick up all the possibilities
        elif entry.endswith("."):
            matches = glob.glob(entry + "*")

        # Go through all the possible files
        for file_ in matches:
            include = True
            # Only include if it isn't on the ignore list
            for ending in ignore:
                if file_.endswith(ending):
                    include = False
            if include:
                files.append(file_)

    files.sort()

    # Get the current desktop number we're on
    command = "qdbus org.kde.kwin /KWin currentDesktop"
    desktop = commands.getoutput(command)

    # g alias provides --server and gg doesn't so use MPJGVIM1 for g and MPJGVIM2 for gg
    name = "MPJGVIMDESKTOP2-%s" % desktop
    if opt.server:
        name = "MPJGVIMDESKTOP1-%s" % desktop

    # Configure command line options
    command = "gvim --serverlist"
    serverlist = commands.getoutput(command)

    # Check if the server we're after is running. If so join it with remote
    # silent otherwise leave it out so that we become the server
    if name in serverlist:
        flags += " --remote-silent"

    os.putenv( "GCC_NO_HIGHLIGHT", "1" )
    os.putenv( "MPJ_SKIP_TCSH", "1" )

    local_geometry = os.environ[ "MPJ_LOCAL_VIM_GEOMETRY" ]

    # Run the command
    command = "gvim --servername %s -geom %s %s %s %s" % ( name, local_geometry, flags, line_number, " ".join(files) )
    os.system(command)


if __name__ == "__main__":
    main(sys.argv[1:])

