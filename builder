#!/bin/sh

# -*- sh-mode -*-

JHBUILD_ROOT=`pwd`/build
JHBUILD_BIN=${JHBUILD_ROOT}/.local/bin/jhbuild
JHBUILD_DATA=./build-aux
JHBUILD="$JHBUILD_BIN -f $JHBUILD_DATA/jhbuildrc.anonymous -m $JHBUILD_DATA/boar.modules"

if test -e "$JHBUILD_BIN" ; then
    echo "Environment already bootstrapped ..."
else
    echo "Bootstrapping environment ..."
    git submodule update --init build-aux/jhbuild || exit 1
    HOME=$JHBUILD_ROOT && (cd build-aux/jhbuild && make DISABLE_GETTEXT="yes" -f Makefile.plain install 2>&1 > /dev/null) || exit 1
fi

$JHBUILD $@ || exit 1

exit 0
