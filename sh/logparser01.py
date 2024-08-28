#!/usr/bin/env python

import os, sys
import getopt

class Globs:
    def __init__(self):
        self.DEBUG:bool = False
        self.val = 0
        self.input = ""
        self.output = ""

reg = Globs()

def main():
    print("hi")
    parse_options()
    fdIn = open(reg.input, 'r', encoding="utf-8")
    fdOut = open(reg.output, 'r', encoding="utf-8")
    for i in range(11444):
        par = get_parag(fdIn)
        problem = parse_parag(par)
        # print(i,par)
    fdIn.close()
    fdOut.close()

def parse_options():
    # global DEBUG, fileA, fileB
    try:
        long_options = ['infile', 'outfile']
        opts, plain_args = getopt.getopt(sys.argv[1:], "i:o:", long_options)
        for key, val in opts:
            if key in ("-i", "--infile"):
                reg.input = val
            elif key in ("-o", "--outfile"):
                reg.output = val
            elif key == "--debug":
                reg.DEBUG = True
            else:
                print('extra key/val given! ', key, val)
        if plain_args:
            # Argument not prefixed with key goes here
            # file = plain_args[0]
            pass
    except getopt.GetoptError:
        show_usage_exit()
    if not reg.input or not reg.output:
        show_usage_exit()

def show_usage_exit():
    print("Usage: python " + sys.argv[0] + " -i name.log -o report.txt")
    sys.exit(3)


def get_parag(fd):
    res = ""
    line = ""
    text_found = False
    line = fd.readline()
    lineempty = line==("" or "\n" or "\n\r")
    while (line is not None and not (text_found and lineempty)):
        # print ("eating", line)
        res += line
        line = fd.readline()
        lineempty = line==("" or "\n" or "\n\r")
        text_found = text_found or (not lineempty)
    return res

def parse_parag(par):
    okay = False
    warning = 100
    error = 0
    line = ""
    for line in par.splitlines():
        if line == "No problems found.":
            okay = True
        elif "Warning: Multiple ID3v2 tags encountered" in line :
            warning = 1
        # elif "Warning: Reported length is innacurate" in line :
        elif "Warning: Reported length is inaccurate" in line :
            warning = 2
        elif "Error: " in line:
            error +=1
    if not okay and (warning>5 or error>0):
        print(par)
    return 1-okay
        

if __name__ == '__main__': main()

