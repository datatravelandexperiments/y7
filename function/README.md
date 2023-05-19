# Y7 Shell Functions

## Core Array/List Functions

### y7arrayadd

`y7arrayadd` _array:in,out_ _t_ _p_ …

Adds each _p_ to _array_ if it passes `test` _t_ and is not already present.

### y7arrayindex

`y7arrayindex` _array:in_ _t_ _p_

Prints the index in _array_ of the first _p_ that passes `test` _t_.

### y7pjoin

`y7pjoin` _path_ …

Prints its arguments joined by `:`.

### y7psplit

`y7esplit` _array:out_ _pathlist_

## Core Locator Functions

### y7findconfig

`y7findconfig` _file_ [_path_ …]

Finds a [most specific version](#y7findmsv) of a file
under `$XDG_CONFIG_HOME/y7/`, `$XDG_CONFIG_HOME/`, or any _path_.

### y7finddata

`y7finddata` _file_ [_path_ …]

Finds a [most specific version](#y7findmsv) of a _file_
under `$XDG_DATA_HOME`, any _path_, or any directory in `$XDG_DATA_DIRS`.

### y7finddot

`y7finddot` _file_

Returns `$HOME/.`_file_, if it exists.

### y7findmsv

`y7findmsv` [`-d` | _file_] _path_ …

Finds a ‘most specific version’ of a file.

Given a _file_ and one or more _path_ arguments,
prints the first match among the following:

- _path_`/host/${Y7HOST}/`_file_
- _path_`/site/${Y7SITE}/`_file_
- _path_`/platform/${Y7OS}-${Y7OR}-${Y7HW}/`_file_
- _path_`/platform/${Y7OS}-${Y7HW}/`_file_
- _path_`/platform/${Y7OS}-${Y7OR}/`_file_
- _path_`/platform/${Y7OS}/`_file_
- _path_`/platform/${Y7HW}/`_file_
- _path_`/default/`_file_
- _path_/_file_

Given `-d`, prints the first match among:

- _path_`/host/${Y7HOST}`
- _path_`/site/${Y7SITE}`
- _path_`/platform/${Y7OS}-${Y7OR}-${Y7HW}`
- _path_`/platform/${Y7OS}-${Y7HW}`
- _path_`/platform/${Y7OS}-${Y7OR}`
- _path_`/platform/${Y7OS}`
- _path_`/platform/${Y7HW}`
- _path_`/default`
- _path_

Note that in the `-d` case, the match need not be a directory.

### y7findsubconfig

`y7findsubconfig` _pkg_ _file_ [_path_ …]

Finds a [most specific version](#y7findmsv) of a _file_
under `$XDG_CONFIG_HOME/y7/`_pkg_`/`, `$XDG_CONFIG_HOME/`_pkg_`/`,
or any _path_. (Note that a _path_ does **not** have _pkg_ appended.)

If _pkg_ is a path (containing slashes), it is stripped of all but the
last component; this is a convenience since y7 package startup scripts
are invoked with the package directory path as their first argument.

### y7findsubdata

`y7findsubdata` _pkg_ _file_ [_path_ …]

Finds a [most specific version](#y7findmsv) of a _file_
under `$XDG_DATA_HOME/`_pkg_`/`, any _path_,
or any _pkg_ subdirectory under any directory in `$XDG_DATA_DIRS`.

If _pkg_ is a path (containing slashes), it is stripped of all but the
last component; this is a convenience since y7 package startup scripts
are invoked with the package directory path as their first argument.

### y7findsubdot

`y7findsubdot` _pkg_ _file_

Finds a [most specific version](#y7findmsv) of a _file_ under `$HOME/.`_pkg_`/`.

If _pkg_ is a path (containing slashes), it is stripped of all but the
last component; this is a convenience since y7 package startup scripts
are invoked with the package directory path as their first argument.

### y7which

`y7which` _name_

## XXX

### y7use

`y7use` _package_

## Utility Array/List Functions

### y7arrayarrange

`y7arrayarrange` _array:in,out_ [`+`|`-`]_n_`:`_glob_ …

Takes an _array_ and one or of _n_:_glob_ pairs.
Modifies the _array_ so that any entries that match a _glob_ pattern
appear in order of increasing _n_.

### y7ejoin

`y7ejoin` _path_ …

### y7esplit

`y7esplit` _array:out_ _pathlist_

## Utility Directory Functions

### y7cd

`y7cd` …

Changes directory, with indexing or search in `$Y7DIRS`.
(This function is typically used as a building block
for operations that update `$Y7DIRS` when the directory changes.)

If the argument(s) are accepted by builtin `cd`, that is all that is done.

Otherwise, treats the environment variable `$Y7DIRS` as a `:`-separated
list of directories (with escaping; see `y7ejoin`.)

If the argument is `-`_n_, changes to the _n_^th^ directory from the
start of the list (0 based, as `-0` is assumed to be the current directory).

If the argument is `+`_n_, changes to the _n_^th^ directory from the
end of the list (1 based, so `+1` is the last in the list).

Otherwise, searches the list for an entry that contains the
argument as part of its path. If one is found, changes to that directory.
Prefers a match at the end of the path; for example, `y7cd src` will prefer
`/usr/local/src` over `/usr/local/src/y7` regardless of its position
in the list. Otherwise prefers an earlier match.

### y7dirs

`y7dirs` [`-elspv`] [`-A` _array_] [`-S` _var_] [_dir_`:`_dir_`:`…]

Options:
- -e        - use Y6 escaped splitting
- -l        - don't use ~ for $HOME
- -s        - don't number directories
- -p        - use PATH-style splitting
- -v        - number directories (default)
- -A array  - display ${array[@]}
- -S var    - display ${var}

### y7inpath

`y7inpath` [`-ep`] [`-A` _array_] [`-S` _var_] _name_ …

### y7pathclean

`y7pathclean` _array:in,out_

Given an array of names, remove any duplicates
and any entries that are not directories.

### y7popd

`y7popd`

### y7pushd

`y7pushd`

### y7setd

`y7setd`
