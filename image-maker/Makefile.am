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

EXTRA_DIST =
BUILT_SOURCES =
CLEANFILES =
MAINTAINERCLEANFILES =

include $(top_srcdir)/Makefile.top

ACLOCAL_AMFLAGS = -I tools/autotools/m4 --install

SUBDIRS =					\
	tools

##
## NOTE:
##     Options listed in AUTOMAKE_OPTIONS variable are applied on a
##     per-`Makefile' basis.
##
AUTOMAKE_OPTIONS = check-news

##
## NOTE:
##     Makefile.am included files are automatically distributed by automake
##     rules
##
EXTRA_DIST +=					\
	README COPYING INSTALL THANKS		\
	bootstrap .bootstrap

if GRUB1_SUPPORT
image.iso: Makefile all
	rm -r -f image-fs && \
	mkdir image-fs && \
	( cd image-fs && \
	  $(abs_top_builddir)/tools/scripts/mkiso-grub1 \
		-k @KERNEL@ \
		-o $(abs_top_builddir)/image.iso ) || { \
		rm -r -f image-fs ; \
		exit 1 ; \
	} && \
	rm -r -f image-fs

CLEANFILES += image.iso
else
image.iso: all Makefile
endif

if GRUB2_SUPPORT
image.iso: Makefile all
	rm -r -f image-fs && \
	mkdir image-fs && \
	cp @KERNEL@ image-fs && \
	( cd image-fs &&	\
	  $(abs_top_builddir)/tools/scripts/mkiso-grub2 \
		-b kernel \
		-o $(abs_top_builddir)/image.iso ) || { \
		rm -r -f image-fs ; \
		exit 1 ; \
	} && \
	rm -r -f image-fs

CLEANFILES += image.iso
else
image.iso: all Makefile
endif

test-image: Makefile image.iso
	@QEMU@ -cdrom image.iso

##
## help related target
##
help:
	@echo ""
	@echo "  Targets:"
	@echo ""
	@echo "    image.iso  -- Build an ISO image"
	@echo "    test-image -- Run qemu with image.iso"
	@echo ""

##
## Maintainer related targets
##

URL_BU = "http://github.com/salvestrini/build-utils/raw/master/maint"

EXTERNAL =                                      \
        $(URL_BU)/bootstrap

update-local: Makefile
	rm -r -f fetch-dir && \
	mkdir fetch-dir && \
	for i in $(EXTERNAL) ; do \
	        URL="$$i" ; \
	        NAME=`echo "$$i" | $(SED) -e 's,^.*/,,'` ; \
	        $(FETCH) $$URL?raw=true fetch-dir/$$NAME && \
	        mv fetch-dir/$$NAME $$NAME || { \
	                rm -f fetch-dir/$$NAME ; \
	                exit 1 ; \
	        } \
	done && \
	rm -r -f fetch-dir
	chmod a+x bootstrap || { exit 1 ; }

maintainer-check-local: Makefile
