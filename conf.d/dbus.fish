[ -e /proc ] && \
if grep -qEi '(microsoft|wsl)' /proc/version
	pgrep dbus-daemon > /dev/null
	if test $status -eq 1
		dbus-launch --sh-syntax | read --line bus_address ignored bus_pid bus_windowid

		set -Ux DBUS_SESSION_BUS_ADDRESS (string match -r "'(.*)'" $bus_address)[2]
		set -Ux DBUS_SESSION_BUS_ID (string match -r "=(.*);" $bus_pid)[2]
		set -Ux DBUS_SESSION_BUS_WINDOWID (string match -r "=(.*);" $bus_windowid)[2]
	end
end
