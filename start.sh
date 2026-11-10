#!/bin/sh

# SPDX-FileCopyrightText: 2026 Julian Brost <julian@0x4a42.net>
# SPDX-License-Identifier: MIT

if [ $# -ne 1 ]; then
	echo "usage: $0 <path/to/modprobe.sh>" >&2
	exit 1
fi

systemctl is-system-running --wait --quiet
echo '<0>modprobe (no-kmod-autoload) starting' > /dev/kmsg
sysctl -n kernel.modprobe > /run/no-kmod-autoload-previous-cmd
sysctl --quiet --write kernel.modprobe="$1"
