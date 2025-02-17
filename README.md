# nuitka-zig-cc

> Status Update: It appears to be working OK for Python 3.10 and older in the latest nightly build of zig!

This is a small test project to see how to use zig as a backend C compiler with Nuitka.

There is an official Nuitka issue for tracking this (https://github.com/Nuitka/Nuitka/issues/2741) which also references some [Zig issues](https://github.com/Nuitka/Nuitka/issues/2742) impacting Nuitka's use of zig as a backend C compiler.

# How it works

The current approach that this test project takes is:

- Use a shell script named `zig-clang-cc.sh` that calls `zig cc` and passes it all command line arguments. The script is simple and badically just does this -> `zig cc "$@"`.  This "fools" Nuitka into thinking that zig cc is clang.
- Also, be sure to pass the `--clang` option to the zig command.
- You can use Nuitka's `--standalone` option

# What's not working

 - the `--onefile` option (for single-file executables) is not yet working with zig (but it's probably something Nuitka team can fix soon)
 - cross-compiling with zig doesn't work. The `zig-clang-cc.sh` script does look for a `TARGET` environt variable and will pass this to `zig cc` as `-target $TARGET` but it won't really work because the Python libraries are already built and cannot be cross-compiled by zig, nor can zig link nuikta's output to those libraries. 

# Trying it yourself

To give it a try, get the latest nightly build of zig (version 0.12.0-dev.3161+377ecc6af or newer).

Download the [zig-clang-cc.sh](https://github.com/jimkring/nuitka-zig-cc/blob/main/zig-clang-cc.sh) file and then configure the CC environment variable to be the absolute path to that script. Then you can call nuitka (and be sure to pass the `--clang` option) as shown below:

```bash
# make the script executable
chmod ugo+x ./zig-clang-cc.sh

# set the CC environment variable to the absolute path of the script
export CC="$(pwd)/zig-clang-cc.sh"

# call nuikta and be sure to pass the `--clang` option
python -m nuitka --clang --standalone hello.py
```



