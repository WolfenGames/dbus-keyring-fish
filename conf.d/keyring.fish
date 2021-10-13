[ -e /proc ] && \
if grep -qEi '(microsoft|wsl)' /proc/version
	pgrep gnome-keyring-d > /dev/null
	if test $status -eq 1
		gnome-keyring-daemon | read --line gnome_keyring_control ssh_auth_sock

		set -Ux GNOME_KEYRING_CONTROL (string split -m 1 = $gnome_keyring_control)[2]
		set -Ux SSH_AUTH_SOCK (string split -m 1 = $ssh_auth_sock)[2]
	end
end
