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

ACLOCAL_AMFLAGS = -I tools/autotools/m4

SUBDIRS =					\
	tools

CLEANFILES =

if GRUB1_SUPPORT
image.iso: Makefile all
	rm -r -f image-fs && \
	mkdir image-fs && \
	( cd image-fs && \
	  $(abs_top_builddir)/tools/scripts/mkiso-grub1 \
		-k $(abs_top_builddir)/kernel/src/kernel \
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
	cp $(abs_top_builddir)/kernel/src/kernel image-fs && \
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

##
## Maintainer related targets
##

MAINTAINERCLEANFILES =

dist-gpg: dist
	gpg --yes -b --use-agent					   \
		-o $(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.gz.sig	   \
		$(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.gz          &&   \
	gpg --verify $(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.gz.sig || { \
		rm -f $(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.gz.sig ;   \
		exit 1 ;						   \
	}
MAINTAINERCLEANFILES += $(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.gz.sig

dist-upload: dist-gpg
	chmod 644 $(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.gz     &&	\
	chmod 644 $(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.gz.sig &&	\
	scp $(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.gz		\
	    $${USER}@dl.sv.nongnu.org:/releases/boad     	   &&	\
	scp $(PACKAGE_TARNAME)-$(PACKAGE_VERSION).tar.gz.sig		\
	    $${USER}@dl.sv.nongnu.org:/releases/boar     	   || {	\
		exit 1 ;						\
	}

site: all
	(cd site && $(MAKE) $(AM_MAKEFLAGS) site)

HOST = "http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob_plain;hb=HEAD;f="

update-download:
	rm -r -f fetch-dir && \
	mkdir fetch-dir && \
	$(FETCH) $(HOST)doc/INSTALL fetch-dir/INSTALL && \
	chmod a+r fetch-dir/INSTALL && \
	chmod u+w fetch-dir/INSTALL && \
	$(FETCH) $(HOST)doc/COPYINGv2 fetch-dir/COPYING && \
	chmod a+r fetch-dir/COPYING && \
	chmod u+w fetch-dir/COPYING && \
	mv -f fetch-dir/* ./ || { \
		rm -r -f fetch-dir ; \
		exit 1 ; \
	} && \
	rm -r -f fetch-dir

update-local: Makefile update-download

maintainer-check-local: Makefile
