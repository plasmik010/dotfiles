#!/usr/bin/env python3
# Open files in NeoVim. Use RPC feature if possible

import os, sys
from pynvim import attach
import getopt
DEBUG = False

def prepare_commands(mode):
    pre_command = None
    cli_prefix = ""
    if mode == "cur":
        cli_prefix = "e"
    elif mode == "last":
        pre_command = "wincmd p"
        cli_prefix = "e"
    elif mode == "newtab":
        cli_prefix = "tabe"
    elif mode == "newtabinsert":
        cli_prefix = "-tabe"
    elif mode == "vert":
        cli_prefix = "vsplit"
    elif mode == "split":
        cli_prefix = "vsplit"
    elif mode == "vdiff":
        cli_prefix = "TabeVdiff"
    else:
        cli_prefix = "e"
    return pre_command, cli_prefix

def get_cli_input():
    global serv,mode,file
    # print("102", sys.argv)
    try:
        opts, plain_args = getopt.getopt(sys.argv[1:], "s:m:")
        # print(103, opts)
        # print(104, args)
        for key, val in opts:
            if key == "-s":
                serv = val
            if key == "-m":
                mode = val
            else:
                print('extra key/val is', key, val)
        if plain_args:
            # Argument not prefixed with key goes here
            file = plain_args[0]
            file = os.path.join( os.getcwd(), file )
        if plain_args and len(plain_args)==2:
            file =  os.path.join( os.getcwd(), plain_args[0] ) + " " + \
                    os.path.join( os.getcwd(), plain_args[1] )
    except getopt.GetoptError:
        print("Usage: MODE=<mode> nvimrpc.py -s /tmp/NVRPCSERVER -m <mode> /etc/file")
        print("Avilable modes: cur last newtab newtabinsert vert split vdiff")

        sys.exit(3)


if __name__ == '__main__':

    # Defaults
    serv = (os.getenv("NVIMSERV")) or ""
    mode = "newtabinsert"
    file = ""
    server_is_present = False

    # Env is low priority
    if (os.getenv("MODE")):
        mode = (os.getenv("MODE"))

    # CLI is high priority
    get_cli_input()

    # Inputs are all obtained by now
    if DEBUG:
        print("_file is", file)
        print("_mode is", mode)
        print("_serv is", serv)

    if not os.path.exists((serv)):
        print("RPC address " + serv + " is not present!")
        print("Will launch Neovim @ ", serv)
        # sys.exit()
        # os.system("sleep .4")
    else:
        server_is_present = True
        # os.system("ror.sh ' - NVIM$' ''")

    if not file and server_is_present:
        print("Gonna create empty buffer in existing Neovim instance ")
        sys.exit()


    pre_command, cli_prefix = prepare_commands(mode)

    open_command = (cli_prefix + " " + file) if file else ""

    if DEBUG:
        print ("finally, prefix="+cli_prefix, "file="+file)

    # Finally call Neovim
    if server_is_present:
        print("attaching to ", serv)
        nvim = attach("socket", path=serv)
        if pre_command:
            nvim.command(pre_command)
        nvim.command(open_command)
    else:
        if mode != "vdiff":
            os.system("NVIMSERV=" + serv + " vinew " + file)

