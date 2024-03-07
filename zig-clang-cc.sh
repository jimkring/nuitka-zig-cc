#!/bin/bash

if [[ -z "$TARGET" ]]; then
  zig cc "$@"
else do
  zig cc -target $TARGET "$@"
fi
