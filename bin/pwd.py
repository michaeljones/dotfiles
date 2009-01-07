#!/usr/bin/env python

import sys
import re
import os


def main():
    path = sys.stdin.read()

    breakdown = path.strip().split(os.sep)

    # FIXME: Replace is regular expressions
    if "branches" in breakdown:
        index = breakdown.index("branches")
        if "gcc" in breakdown:
            print ":".join((breakdown[index+1], "gcc"))
            return
        try:
            print breakdown[index+1]
        except IndexError:
            print breakdown[index]
        return

    if "trunk" in breakdown:
        index = breakdown.index("trunk")
        if "gcc" in breakdown:
            print "trunk:gcc" 
            return
        print breakdown[index]
        return

    print breakdown[-1]


if __name__ == "__main__":
    main()

