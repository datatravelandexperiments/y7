# For use by other packages' login scripts:
#   y7_path[] is split PATH.
#   y7_dirs[] is parent directories of PATH elements, plus y7_pkgd[].

typeset -a y7_path y7_dirs

y7psplit y7_path "$PATH"
for y7_p in "${y7_path[@]}"
do
    if [[ $y7_p == /* ]]
    then
        y7_p="${y7_p%/*}"
        y7arrayadd y7_dirs -d "${y7_p:-/}"
    fi
done
for y7_p in "${y7_pkgs[@]}"
do
    y7arrayadd y7_dirs -d "${y7_pkgd[$y7_p]}"
done
