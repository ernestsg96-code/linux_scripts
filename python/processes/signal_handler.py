#!/usr/bin/env python3

import signal
import time

#handle sigterm catches and end the process cleanly, saving and closing everything due.
def sigterm_handler(signum, frame):
    print(f"SIGTERM caught, terminating gently... ")
    exit(0)

#handle SIGHUP catches, and reloads the configuration without ending the process
def sighup_handler(signum, frame):
    print(f"SIGHUP caught, reloading configuration... ")

#there can't be sigkill_handler because SIGKILL cant be caught, it's handled directly by the kernel

signal.signal(signal.SIGTERM, sigterm_handler)
signal.signal(signal.SIGHUP, sighup_handler)

while True:
    time.sleep(1)


    
