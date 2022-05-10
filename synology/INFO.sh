#!/bin/bash
# Copyright (c) 2000-2020 Synology Inc. All rights reserved.

source /pkgscripts/include/pkg_util.sh

package="SlimPerl"
version="5.28.3-0001"
displayname="SlimPerl Package"
os_min_ver="7.0-40000"
startable="no"
maintainer="xrad"
arch="$(pkg_get_platform)"
description="Perl suitable for Logitech Media Server (aka Slimserver)"
[ "$(caller)" != "0 NULL" ] && return 0
pkg_dump_info
