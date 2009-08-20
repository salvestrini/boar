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

all-local: lib.sh

sh_libs_SRCS =					\
	libtrace.sh.in				\
	libmisc.sh.in				\
	libcore.sh.in

lib.sh: Makefile $(sh_libs_SRCS)
	{ rm -f lib.sh &&						\
	  touch lib.sh &&						\
	  for i in $(sh_libs_SRCS) ; do					\
		cat $(srcdir)/$$i | $(SED) -e '1,/^$$/d' >> lib.sh ;	\
	  done ; } || { rm -f lib.sh ; exit 1 ; }
CLEANFILES += lib.sh

EXTRA_DIST =					\
	$(sh_libs_SRCS)

##
## Maintainer related targets
##
update-local: Makefile

maintainer-check-whitespaces: Makefile
	$(WHITESPACE_DETECT) $(sh_libs_SRCS)

maintainer-check-local: Makefile maintainer-check-whitespaces
