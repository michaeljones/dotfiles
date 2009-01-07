#!/bin/env python 

"""
Reads lines from the standard in and
prints the list out without duplicates
"""

import sys

def main( args ):

    files = set()
    
    for line in sys.stdin:

        line = line.strip()

        files.add( line )

    files = list( files )
    files.sort()

    if not args:

        padding = str( len( files ) )
        padding = len( padding )

        for i, entry in enumerate( files ):

            print entry

    else:

        for i, entry in enumerate( files ):

            if int( args[0] ) == i:

                os.system( "/u/bin/mpj/gvim.py --server " + entry )


if __name__ == "__main__":
    main( sys.argv[1:] )


