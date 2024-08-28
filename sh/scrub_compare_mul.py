#!/usr/bin/env python
# compare 2 files which have filename and hashsum entries
# file format is "filename:hashsum" in each line
# file contents must be already sorted by alphabet

import os, sys
import getopt
DEBUG = False

def parse_options():
    global DEBUG, fileA, fileB
    try:
        long_options = ['left', 'right']
        opts, plain_args = getopt.getopt(sys.argv[1:], "l:r:", long_options)
        for key, val in opts:
            if key in ("-r", "--right"):
                # print('right', key, val)
                fileB = val
                serv = val
            elif key in ("-l", "--left"):
                # print("left")
                fileA = val
            elif key == "--debug":
                DEBUG = True
            else:
                print('extra key/val given! ', key, val)
        if plain_args:
            # Argument not prefixed with key goes here
            # file = plain_args[0]
            pass
    except getopt.GetoptError:
        print("Usage: python scrub_compare.py -l one_log -r other_log")
        sys.exit(3)
    if not fileA or not fileB:
        print("Usage: python scrub_compare.py -l one_log -r other_log")
        sys.exit(3)


def get_entry(fd):
    line = fd.readline()
    if not line:
        return None
    spl = line.split(":",2)
    if len(spl) <2 or len(spl) >3:
        errpanic("bad line"+line)
    return [spl[0].strip("./"),spl[1]]

def get_entries(fd):
    ent = get_entries.prev.get(fd, None)
    if not ent:
        ent = get_entry(fd)
        if not ent:
            return []
    key = ent[0]
    values = []
    while (ent and ent[0] == key):
        if ent:
            values.append(ent[1].strip('\n'))
        ent = get_entry(fd)
    get_entries.prev[fd] = ent
    # self.prev = ent
    values = sorted(set(values))
    return key,values
get_entries.prev = dict()

    
def errpanic(str):
    print("panik!", str)
    exit(1)

def summary():
    global listOnlyA, listOnlyB, listDifer, listUniq, okayCnt, listExtraA, listExtraB
    print("Okay", okayCnt)
    print("Only Left", len(listOnlyA))
    print("Only Right", len(listOnlyB))
    print("Extra Left", len(listExtraA))
    print("Extra Right", len(listExtraB))
    print("Differ", len(listDifer))
    # global fileA, fileB
    outfile = open("compare_summary_", 'w', encoding="utf-8")
    # for name in listOnlyA:
    #     outfile.write("onlyL:"+name+"\n")
    # for name in listOnlyB:
    #     outfile.write("onlyR:"+name+"\n")
    for ent in listDifer:
        outfile.write("difer:"+ent+"\n")
    for ent in listUniq:
        outfile.write(ent+"\n")
    outfile.close()
    exit(0)

if __name__ == '__main__':
    fileA = ""
    fileB = ""
    listEqual = []
    listDifer = []
    listUniq = []
    listOnlyA = []
    listOnlyB = []
    listExtraA = []
    listExtraB = []
    okayCnt = 0

    parse_options()
    # fileA="/tmp/scrub_tmplnmonetALblinktorrents_ready--mus"
    # fileB="/tmp/scrub_homeplasmiklnmoblinkrecov" 

    fdA = open(fileA, 'r', encoding="utf-8")
    fdB = open(fileB, 'r', encoding="utf-8")
    
    # heapA = []
    # heapB = []
    eofA = eofB = False
    stayA = stayB = False
    # for lineA in fdA:

    bunchA = get_entries(fdA)
    bunchB = get_entries(fdB)
    if not bunchA or not bunchB:
        errpanic("cant begin")
    # print(pairA)
    keyA,valuesA = bunchA
    keyB,valuesB = bunchB

    for i in range(1000000):
        strA = ""
        strB = ""
        if keyA:
            strA = keyA + ":" + ".".join([str(e) for e in valuesA])
        if keyB:
            strB = keyB + ":" + ".".join([str(e) for e in valuesB])
        if (i%10000==0):
            # if eofA:
            #     print("inc ", i, "eof left")
            # elif eofB:
            #     print("inc ", i, "eof right")
            # else:
            #     print("inc ",i, pairA[0], "vs", pairB[0])
            print ("stayA", stayA, "stayB", stayB)
            print (1, strA)
            print (2, strB)
        if not keyA and not keyB:
            print("Complete  at inc ",i)
            summary()
        elif not keyA:
            eofA = True
            listOnlyB.append(strB)
        elif not keyB:
            eofB = True
            listOnlyA.append(strA)
        if keyA and keyB:
            if keyA == keyB:
                if set(valuesA) == set(valuesB):
                    okayCnt +=1
                    stayA = False
                    stayB = False
                else:
                    if set(valuesA) <= set(valuesB):
                        listExtraA.append(keyA)
                        listUniq.append("extraL:"+keyA)
                    elif set(valuesB) <= set(valuesA):
                        listExtraB.append(keyB)
                        listUniq.append("extraR:"+keyB)
                    else:
                        listDifer.append(keyA)
            else:
                if keyA > keyB:
                    listOnlyB.append(keyB)
                    listUniq.append("onlyR:"+keyB)
                    stayA = True
                    stayB = False
                elif keyA < keyB:
                    listOnlyA.append(keyA)
                    listUniq.append("onlyL:"+keyA)
                    stayB = True
                    stayA = False
        # else:
        #     errpanic("on inc"+str(i))
        if eofA:
            stayB = False
        if eofB:
            stayA = False
        if not eofA and not stayA:
            keyA,valuesA = get_entries(fdA) or [None, None]
        if not eofB and not stayB:
            keyB,valuesB = get_entries(fdB) or [None, None]

    fdA.close()
    fdB.close()

