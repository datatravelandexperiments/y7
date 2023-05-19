# y7

`y7` is a shell initialization kit.

It works with `ksh93`, `bash`, and `zsh`,
though the last is currently not thoroughly exercised.

The central idea is that shell configuration for some particular tool
or use case goes into a selectable ‘package’.
A package can contain files that are loaded by the shell —
- `profile`, on initialization;
- `login`, when a login shell starts;
- `terminal`, for the first interactive shell in a particular terminal;
- `interactive`, for any interactive (sub-)shell.

Some packages are very simple, merely setting some environment variables
if an appropriate program or configuration file exists.

`y7` itself is the core `y7` package. Some others are:

- `y7-cd`, a directory stack.
- `y7-go`, for setting `$GOPATH`.
- `y7-less`, for the `less(1)` pager.
- `y7-manpath`, for setting `$MANPATH`.
- `y7-prompt`, an opinionated shell prompt.
- `y7-ripgrep`, for `ripgrep`.
- `y7-sbin`, for adding `sbin/` directories to paths.
- `y7-stty`, for terminal initialization via `stty(1)`.
- `y7-terminfo`, for setting `$TERMINFO`.

**It is acknowledged that `y7` is not yet well documented.**
