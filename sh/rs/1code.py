
bytearray.fromhex("aa bb cc 01 02 03")

# Run the other script
import subprocess
subprocess.run(["python", "other.py"])

# This will run the other.py script as a separate process
with open("C:\scripts\other.py") as f:
    exec(f.read())

# read file ignore BOM
    bytes = min(32, os.path.getsize(slovarname))
    raw = open(slovarname, 'rb').read(bytes)
    print(raw)
    if raw.startswith(codecs.BOM_UTF8):
        encoding = 'utf-8-sig'
        print(1111)
    else:
        # encoding = 'utf-8'
        result = charset.detect(raw)
        encoding = result['encoding']
    slovar = open(slovarname, 'r', encoding=encoding)
    
import sys,getopt
opts, args = getopt.getopt(sys.argv[1:], 'f:d:s:', ['debug','full'])
for opt, arg in opts:
    if opt == "-f":
        filenames.append(arg)
    if opt == "-d":
        dirnames.append(arg)
    if opt == '-s':
        slovarname = arg
    if opt == "--debug":
        DEBUG = True
    if opt == "--full":
        full = True

def round_up(arg):
    if arg > round(arg):
        return round(arg) + 1
    else:
        return round(arg)

s = "stuff\nmore\nverbose\ncmon"
s = '\n'.join( s.split('\n')[i] for i in [0,2,3] )


netmask = get_ipv4_netmask_from_nic(if_name, ip_candi) or DEFAULT_NETMASK
cidr = ipaddress.IPv4Network('0.0.0.0/' + netmask).prefixlen


def printBA(ba,cr=16):
    # print()
    for i in range(0,len(ba),cr):
        line = ba[i:i+cr]
        strHex = line.hex()
        strHexPret = ""
        for i in range(len(strHex)//2):
            if i>0 and i%4 == 0:
                strHexPret += ' '
            if i>0:
                strHexPret += ' '
            strHexPret += strHex[i*2:i*2+2]
        strChar = ""
        for i,byte in enumerate(line):
            if i>0 and i%4 == 0:
                strChar += ' '
            ch = chr(byte) if byte>31 else "◊"
            # ▯▨▽◊◌
            strChar += ch
        print(strHexPret + "    " + strChar)
    print()

def zeroPadBA(limit, ba=bytearray.fromhex("00")):
    while len(ba) < limit:
        ba.append(0x00)

def hexlify_bytestring(bytestring, delim=""):
    ''' Very simple way to hexlify a byte string using delimiters '''
    retval = ""
    for intval in bytestring:
        retval += ('0123456789ABCDEF'[int(intval / 16)])
        retval += ('0123456789ABCDEF'[int(intval % 16)])
        retval += delim
    return retval
