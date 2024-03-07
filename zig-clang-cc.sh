#!/bin/bash

if [[ -z "$TARGET" ]]; then
  zig cc "$@"
else
  zig cc -target $TARGET "$@"
fi

