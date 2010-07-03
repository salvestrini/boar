##
## Input file for automake
##
## Copyright (C) 2008, 2009 Francesco Salvestrini
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License along
## with this program; if not, write to the Free Software Foundation, Inc.,
## 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
##

include $(top_srcdir)/Makefile.sub
include $(top_srcdir)/tools/scripts/Makefile.sub

scripts =					\
	bootcheck				\
	grub1-config				\
	grub2-config				\
	mkiso-grub1				\
	mkiso-grub2

noinst_SCRIPTS = $(scripts)

awk_scripts_SRCS =

sh_scripts_SRCS =				\
	bootcheck.sh.in				\
	grub1-config.sh.in			\
	grub2-config.sh.in			\
	mkiso-grub1.sh.in			\
	mkiso-grub2.sh.in

pl_scripts_SRCS =

CLEANFILES =
EXTRA_DIST =

EXTRA_DIST +=					\
	$(awk_scripts_SRCS)			\
	$(sh_scripts_SRCS)			\
	$(pl_scripts_SRCS)

bootcheck.sh: Makefile $(sh_lib_SRC) bootcheck.sh.in
	INFILE=bootcheck.sh.in ;		\
	OUTFILE=bootcheck.sh ;			\
	$(transform_sh_in_2_sh) ||		\
	{ rm -f $$OUTFILE ; exit 1 ; }
CLEANFILES += bootcheck.sh

bootcheck: Makefile bootcheck.sh
	INFILE=bootcheck.sh ;			\
	OUTFILE=bootcheck ;			\
	$(transform_sh_2_script) ||		\
	{ rm -f $$OUTFILE ; exit 1 ; }
CLEANFILES += bootcheck

grub1-config.sh: Makefile $(sh_lib_SRC) grub1-config.sh.in
	INFILE=grub1-config.sh.in ;		\
	OUTFILE=grub1-config.sh ;		\
	$(transform_sh_in_2_sh) ||		\
	{ rm -f $$OUTFILE ; exit 1 ; }
CLEANFILES += grub1-config.sh

grub1-config: Makefile grub1-config.sh
	INFILE=grub1-config.sh ;		\
	OUTFILE=grub1-config ;			\
	$(transform_sh_2_script) ||		\
	{ rm -f $$OUTFILE ; exit 1 ; }
CLEANFILES += grub1-config

grub2-config.sh: Makefile $(sh_lib_SRC) grub2-config.sh.in
	INFILE=grub2-config.sh.in ;		\
	OUTFILE=grub2-config.sh ;		\
	$(transform_sh_in_2_sh) ||		\
	{ rm -f $$OUTFILE ; exit 1 ; }
CLEANFILES += grub2-config.sh

grub2-config: Makefile grub2-config.sh
	INFILE=grub2-config.sh ;		\
	OUTFILE=grub2-config ;			\
	$(transform_sh_2_script) ||		\
	{ rm -f $$OUTFILE ; exit 1 ; }
CLEANFILES += grub2-config

mkiso-grub1.sh: Makefile $(sh_lib_SRC) mkiso-grub1.sh.in
	INFILE=mkiso-grub1.sh.in ;		\
	OUTFILE=mkiso-grub1.sh ;		\
	$(transform_sh_in_2_sh) ||		\
	{ rm -f $$OUTFILE ; exit 1 ; }
CLEANFILES += mkiso-grub1.sh

mkiso-grub1: Makefile mkiso-grub1.sh
	INFILE=mkiso-grub1.sh ;			\
	OUTFILE=mkiso-grub1 ;			\
	$(transform_sh_2_script) ||		\
	{ rm -f $$OUTFILE ; exit 1 ; }
CLEANFILES += mkiso-grub1

mkiso-grub2.sh: Makefile $(sh_lib_SRC) mkiso-grub2.sh.in
	INFILE=mkiso-grub2.sh.in ;		\
	OUTFILE=mkiso-grub2.sh ;		\
	$(transform_sh_in_2_sh) ||		\
	{ rm -f $$OUTFILE ; exit 1 ; }
CLEANFILES += mkiso-grub2.sh

mkiso-grub2: Makefile mkiso-grub2.sh
	INFILE=mkiso-grub2.sh ;			\
	OUTFILE=mkiso-grub2 ;			\
	$(transform_sh_2_script) ||		\
	{ rm -f $$OUTFILE ; exit 1 ; }
CLEANFILES += mkiso-grub2


##
## Checks
##
check_PASS_SCRPTS =

check_FAIL_SCRPTS =

check_SCRIPTS =					\
	$(check_PASS_SCRPTS)			\
	$(check_FAIL_SCRPTS)

XFAIL_TESTS = $(check_FAIL_SCRPTS)
TESTS	    = $(check_PROGRAMS) $(check_SCRIPTS)

EXTRA_DIST += $(TESTS)

##
## Maintainer related targets
##
update-local: Makefile

maintainer-check-local: Makefile
