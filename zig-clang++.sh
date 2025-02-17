#!/bin/bash

# zig c++ "$@"
# zig c++ --target=native-native-none "$@"
zig c++ -target native "$@"
