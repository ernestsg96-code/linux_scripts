#!/usr/bin/env python3

import os
import time

pid = os.fork()
print(f"I'm the process with PID {os.getpid()}, .fork() returns this value {pid} to me")

if pid > 0:
    print(f"I'm the parent process,my PID is {os.getpid()} my child's PID is: {pid}")
    time.sleep(300)
else:
    print(f"I'm the child, my PID is {os.getpid()} my child's PID is: {pid}, HAHAHHAA, get it? it's 0 becuase don't have a child lol")
    os._exit(0)
