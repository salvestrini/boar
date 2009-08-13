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
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License along
## with this program; if not, write to the Free Software Foundation, Inc.,
## 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
##

include $(top_srcdir)/Makefile.sub

CLEANFILES =

all-local: lib.awk

awk_libs_SRCS =					\
	libmisc.awk.in				\
	libmath.awk.in				\
	libgetopt.awk.in			\
	libfile.awk.in				\
	libtest.awk.in				\
	libtext.awk.in				\
	libtrace.awk.in				\
	libdebug.awk.in				\
	libord.awk.in				\
	libstring.awk.in			\
	libsort.awk.in				\
	libcore.awk.in

lib.awk: Makefile $(awk_libs_SRCS)
	{ rm -f lib.awk &&						\
	  touch lib.awk &&						\
	  for i in $(awk_libs_SRCS) ; do				\
		cat $(srcdir)/$$i | $(SED) -e '1,/^$$/d' >> lib.awk ;	\
	  done ; } || { rm -f lib.awk ; exit 1 ; }
CLEANFILES += lib.awk

EXTRA_DIST =					\
	$(awk_libs_SRCS)

##
## Maintainer related targets
##

##
## XXX FIXME:
##     Don't leave white spaces before the parentheses in user functions
##     calls; GNU awk will reject it. Add a check in order to detect such
##     condition
##
maintainer-check-whitespaces: Makefile $(awk_libs_SRCS)
	$(WHITESPACE_DETECT) $(awk_libs_SRCS)

##
## NOTE:
##     Don't use unsupported functions (portability problems)
##
maintainer-check-unallowed-function: Makefile $(awk_libs_SRCS)
	FUNCTIONS="asort asorti" ; \
	for l in $(awk_libs_SRCS) ; do \
		echo @ECHO_N@ "Checking $$l for unallowed functions: " ; \
		for f in $$FUNCTIONS ; do \
			echo @ECHO_N@ "$$f " ; \
			if test `$(GREP) -c "$$f[ \t]+(" $(srcdir)/$$l` != 0 ; then \
				echo "... @ECHO_T@no" ; \
				exit 1 ; \
			fi ; \
		done ; \
		echo "...  @ECHO_T@ok" ; \
	done

##
## NOTE: 
##     All libraries must provide a _<library>_init and a _<library>_fini
##     function
##
maintainer-check-init-fini-functions: Makefile $(awk_libs_SRCS)
	for l in $(awk_libs_SRCS) ; do \
		name=`echo $$l | $(SED) -e 's,^.*lib,,' -e 's,\\..*$$,,'` ; \
		if test "x$$name" = "xcore" ; then \
			continue ; \
		fi ; \
		echo @ECHO_N@ "Checking if $$l provides only one _$${name}_init()... " ; \
		CNT=`$(GREP) -c _$${name}_init\(\) $(srcdir)/$$l` ; \
		if test "x$$CNT" = "x1" ; then \
			echo "@ECHO_T@ok" ; \
		else \
			echo "@ECHO_T@no" ; \
			exit 1 ; \
		fi ; \
		echo @ECHO_N@ "Checking if $$l provides only one _$${name}_fini()... " ; \
		CNT=`$(GREP) -c _$${name}_fini\(\) $(srcdir)/$$l` ; \
		if test "x$$CNT" = "x1" ; then \
			echo "@ECHO_T@ok" ; \
		else \
			echo "@ECHO_T@no" ; \
			exit 1 ; \
		fi ; \
	done

maintainer-check-local: maintainer-check-whitespaces maintainer-check-init-fini-functions maintainer-check-unallowed-function

##
## Maintainer related targets
##
update-local: Makefile

maintainer-check-local: Makefile
