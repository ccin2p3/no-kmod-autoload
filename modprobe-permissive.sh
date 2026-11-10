#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Julian Brost <julian@0x4a42.net>
# SPDX-License-Identifier: MIT

cmd="$(</run/no-kmod-autoload-previous-cmd)$(printf ' %q' "$@")"
echo "<3>modprobe (no-kmod-autoload): loading module : $cmd" > /dev/kmsg
exec $cmd
