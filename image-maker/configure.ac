# Process this file with autoconf to produce a configure script.

#
# configure.ac for Boar
#
# Copyright (C) 2008, 2009 Francesco Salvestrini
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#

AC_INIT([Boar],
        m4_esyscmd([tools/maint/git-version-gen .tarball-version]),
        [salvestrini@gmail.com],
        [boar],
        [http://github.com/salvestrini/boar])

# Check for a recent version of autoconf
AC_PREREQ([2.64])

# Place/find all autotools related files in the following directories
AC_CONFIG_AUX_DIR([tools/autotools])
AC_CONFIG_MACRO_DIR([tools/autotools/m4])

#
# For automake options (AM_INIT_AUTOMAKE options) see Makefile.am
# file, AUTOMAKE_OPTIONS variable
#
#AM_INIT_AUTOMAKE([1.10 foreign no-installman no-installinfo -Wall nostdinc])
AM_INIT_AUTOMAKE([1.10 foreign -Wall color-tests])

#
# Checks for needed programs
#
AC_PROG_GREP
AC_PROG_SED

AX_PATH_MISSING([PERL], [perl])
AX_PATH_MISSING([WGET], [wget])
AX_PATH_MISSING([DNT],  [dnt])

#
# Retrieve version parts
#
AX_SPLIT_VERSION($PACKAGE_VERSION, AX_MAJOR_VERSION, AX_MINOR_VERSION, AX_MICRO_VERSION, AX_EXTRA_VERSION)
#AC_SUBST(AX_PACKAGE_MAJOR,$AX_MAJOR_VERSION)
#AC_SUBST(AX_PACKAGE_MINOR,$AX_MINOR_VERSION)
#AC_SUBST(AX_PACKAGE_MICRO,$AX_MICRO_VERSION)

#
# Image build support (XXX FIXME: TO BE MOVED ELSEWHERE ASAP)
#
AX_PROG_GRUB1([$PATH:/bin:/sbin],[grub1_support=yes],[grub1_support=no])
AM_CONDITIONAL(GRUB1_SUPPORT,[test "$grub1_support" = "yes"])
AX_PROG_GRUB2([$PATH:/bin:/sbin],[grub2_support=yes],[grub2_support=no])
AM_CONDITIONAL(GRUB2_SUPPORT,[test "$grub2_support" = "yes"])
AX_WITH_PROG([MKISOFS],[mkisofs])
AX_WITH_PROG([KERNEL], [kernel])
AX_WITH_PROG([QEMU],   [qemu])

#
# Finally output the configuration
#
AC_CONFIG_FILES([
	Makefile

	tools/Makefile
	tools/maint/Makefile
	tools/libs/Makefile
	tools/libs/awk/Makefile
	tools/libs/perl/Makefile
	tools/libs/sh/Makefile
	tools/scripts/Makefile
	tools/autotools/Makefile
	tools/autotools/m4/Makefile
])

AC_CONFIG_FILES([tools/maint/fetch],               [chmod +x tools/maint/fetch])
AC_CONFIG_FILES([tools/maint/whitespace-detect],   [chmod +x tools/maint/whitespace-detect])
AC_CONFIG_FILES([tools/maint/gitlog-to-committers],[chmod +x tools/maint/gitlog-to-committers])
AC_CONFIG_FILES([tools/maint/gittag-to-date],      [chmod +x tools/maint/gittag-to-date])

#
# XXX FIXME:
#     Build the correct link to the choosen target architecture. This solution
#     is not portable so it should be removed ASAP !
#AC_CONFIG_LINKS(src/arch:src/archs/$architecture)

AC_OUTPUT
