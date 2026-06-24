#!/bin/bash

echo "These are the user that can login"
grep -E "/bin/bash|/bin/sh" /etc/passwd | cut -f1 -d:
