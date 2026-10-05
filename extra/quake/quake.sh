#!/bin/sh
for engine in $QUAKE_ENGINE ironwail vkquake; do
  if [ -x "/usr/bin/$engine" ]; then
    exec "/usr/bin/$engine" "$@"
  fi
done
echo 'quake: no supported Quake 1 engine found, please install ironwail or vkquake' >&2
exit 1
