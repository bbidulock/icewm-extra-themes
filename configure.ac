
AC_PREREQ(2.69)
AC_INIT([icewm-extra-themes],[0.0],[https://github.com/bbidulock/icewm-extra-themes/issues],[icewm-extra-themes], [https://github.com/bbidulock/icewm-extra-themes])
AC_REVISION([0.0])

AC_CONFIG_SRCDIR([data/Makefile.am])
AC_CONFIG_HEADERS([autoconf.h])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([scripts])

DATE='2017-08-02'
AC_SUBST([DATE])

AM_INIT_AUTOMAKE([gnits 1.14 dist-xz no-dist-gzip std-options -Wall color-tests silent-rules tar-pax])
AM_MAINTAINER_MODE

# Checks for programs.
AC_PROG_AWK
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_MKDIR_P

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

test "x$prefix" = xNONE && prefix="$ac_default_prefix"

sharedir="$datadir"
eval "sharedir=\"$sharedir\""
eval "sharedir=\"$sharedir\""
eval "sharedir=\"$sharedir\""
AC_SUBST([sharedir])

xdgconfdir="$sysconfdir"
eval "xdgconfdir=\"$xdgconfdir\""
eval "xdgconfdir=\"$xdgconfdir\""
eval "xdgconfdir=\"$xdgconfdir\""
AC_SUBST([xdgconfdir])

xdgdatadir="$prefix"
eval "xdgdatadir=\"$xdgdatadir\""
eval "xdgdatadir=\"$xdgdatadir\""
eval "xdgdatadir=\"$xdgdatadir\""
AC_SUBST([xdgdatadir])

xdemoddir='${libdir}/xde/modules'
AC_SUBST([xdemoddir])

xdeincdir='${includedir}/xde'
AC_SUBST([xdeincdir])

AC_CONFIG_FILES([Makefile
		 data/Makefile
		 ])
AC_OUTPUT

# vim: set ft=config:
