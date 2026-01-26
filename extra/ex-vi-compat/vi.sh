#!/usr/bin/bash
#
# Calls `vim` using its `vi` compatibility mode (`-C`).
# Ignores `vim` configuration files (`-u NONE`) as `vim` specifics are not supported in `vi` anyways.
# Accepts further options.

vim -C -u NONE "$@"
