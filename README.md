# nuitka-zig-cc

This is a small test project to see how to use zig as a backend C compiler with Nuitka.

There is an official Nuitka issue for tracking this (https://github.com/Nuitka/Nuitka/issues/2741) which also references some Zig issues.

The current approach that this test project takes is:

- Use a shell script named `zig-clang-cc.sh` that calls `zig cc` and passes it all command line arguments (this "fools" Nuitka into thinking that zig cc is clang).
- Pass the `--clang` option to the zig command.

Current status:

- We discovered [a bug in zig’s handling of some linker flags](https://github.com/ziglang/zig/pull/19176) that is resulting in an error. This was an easy fix and should be merged into Zig master soon.
- At a higher level, it seems that [Zig does not yet support _Atomic](https://github.com/ziglang/zig/pull/19176) in C11. This appears to be on the roadmap for [zig 0.15.0](https://github.com/ziglang/zig/milestone/14).
