#!/usr/bin/env python3
import os
import time

#fork the current process and save the output into the variable pid
pid = os.fork()
print(f"I'm the process with PID {os.getpid()}, .fork() returns this value {pid} to me")

#test fork's outpu, if it's greater than 1 is a parent process, otherwise it's the child 
if pid > 0:
    print(f"I'm the parent process,my PID is {os.getpid()} my child's PID is: {pid}")
    time.sleep(300)
else:
    print(f"I'm the child, my PID is {os.getpid()} my child's PID is: {pid}, HAHAHHAA, get it? it's 0 because I don't have a child lol")
    os._exit(0)
