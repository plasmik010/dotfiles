#!/usr/bin/env python

import os, sys
import getopt
import enum

class Globs:
    def __init__(self):
        self.DEBUG:bool = False
        self.val = 0
        self.input = ""
        self.output = ""
        # self.tablo = Tablo()
        self.tablo: Tablo

reg = Globs()
# reg:Globs

def main():
    # print("hi")
    reg.tablo = Tablo()
    parse_options()
    fdIn = open(reg.input, 'r', encoding="utf-8")
    fdOut = open(reg.output, 'r', encoding="utf-8")
    i=0
    while (i<90000):
        par = get_parag(fdIn)
        if par is None: # end of file
            break
        parse_parag(par)
        if i%900 == 0:
            pass
            # print("file# {}\n{}".format(i, par))
        i += 1
    print(i, "check reports parsed from log")
    fdIn.close()
    print("okay cnt is ", reg.tablo.ctr[checkStatus.okay].get())
    reg.tablo.outline()
    reg.tablo.relog(4)
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
    res = None
    line = ""
    text_found = False
    line = fd.readline()
    lineempty = line==("" or "\n" or "\n\r")
    while (not (text_found and lineempty)):
        if len(line) == 0:
            # print("eof")
            return res
        res = (res or "") + line
        line = fd.readline()
        lineempty = line==("" or "\n" or "\n\r")
        text_found = text_found or (not lineempty)
    return res

class checkStatus(enum.Enum):
    okay = {
        "tag": "Okay",
        "alert": 0,
        "need_desc": False,
    }
    bad_tags = {
        "tag": "Multiple ID3v2 tags encountered",
        "alert": 0,
        "need_desc": False,
    }
    unsupported = {
        "tag": "Unsupported format or corrupted file",
        "alert": 3,
        "need_desc": False,
    }
    not_found = {
        "tag": "Object not found",
        "alert": 2,
        "need_desc": False,
    }
    warn_length = {
        "tag": "Reported length is inaccurate",
        "alert": 1,
        "need_desc": True,
    }
    eception = {
        "tag": "Unknown exception",
        "alert": 3,
        "need_desc": False,
    }
    stream_err = {
        "tag": "MPEG stream error",
        "alert": 4,
        "need_desc": False,
    }
    corr_flac = {
        "tag": "Corrupted FLAC stream",
        "alert": 4,
        "need_desc": False,
    }
    hashsum = {
        "tag": "MD5 mismatch",
        "alert": 5,
        "need_desc": False,
    }
    length_mismatch = {
        "tag": "frames, decoded only",
        "alert": 1,
        "need_desc": True,
    }
    incomplete = {
        "tag": "File appears to be incomplete",
        "alert": 4,
        "need_desc": False,
    }

class statusCounter:
    status:checkStatus
    count:int = 0
    def inc(self):
        self.count += 1
    def get(self):
        return self.count

class Tablo:
    ctr = dict()
    mapper = dict()
    def __init__(self):
        for status in checkStatus:
            self.ctr[status] = statusCounter()
            self.mapper[status] = []
    def add_filepath(self, status: checkStatus, path:str, errtext=None):
        self.ctr[status].inc()
        self.mapper[status].append((path, errtext))
    def outline(self):
        print("log outline:\n")
        for status in checkStatus:
            print("{}:".format(status.name))
            print("count = {}".format(self.ctr[status].get()))
    def relog(self, level):
        print("log remix:")
        for status in checkStatus:
            print("\n\nstatus  {}".format(status.name))
            if status.value["alert"] >= level:
                for entry in self.mapper[status]:
                    print("file: {}".format(entry[0]))
                    if status.value["need_desc"]:
                        print("details: {}".format(entry[1]))


def parse_parag(par):
    okay = False
    warning = 100
    countError = 0
    line = ""
    filename = ""
    known_problems_found = 0
    nova_problems_found = 0

    for line in par.splitlines():
        if not filename and "Item: " in line:
            # print("found filename ", line)
            filename = line.replace("Item: ", "").strip().split('"')[1]
            # filename = line.replace("Item: ", "").strip()
        if line == "No problems found.":
            status = checkStatus.okay
            reg.tablo.add_filepath(status, filename, None)
        else:
            for status in checkStatus:
                if status.value["tag"] in line:
                    known_problems_found += 1
                    if status.value["need_desc"]:
                        desc = line
                    else:
                        desc = None
                    reg.tablo.add_filepath(status, filename, desc)
            if 0==known_problems_found and "Error: " in line:
                print("new error", line)
                nova_problems_found += 1

if __name__ == '__main__': main()

