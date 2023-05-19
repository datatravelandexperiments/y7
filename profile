y7arrayadd y7_path -d /bin /usr/bin /usr/local/bin
y7arrayadd y7_path -d /usr/X11/bin /usr/X11R6/bin
y7arrayadd y7_path -d /opt/*/bin
y7arrayadd y7_path -d ~/bin ~/opt/*/bin ~/.local/bin
PATH=$(y7pjoin "${y7_path[@]}")

return 0
