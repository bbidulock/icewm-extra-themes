
AC_PREREQ(2.69)
AC_INIT([icewm-extra-themes],[1.0],[https://github.com/bbidulock/icewm-extra-themes/issues],[icewm-extra-themes], [https://github.com/bbidulock/icewm-extra-themes])
AC_REVISION([1.0])

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

AC_ARG_VAR([MARKDOWN],[markdown command. @<:@default=markdown@:>@])
AC_CHECK_PROGS([MARKDOWN],[markdown],[${am_missing_run}markdown],[$PATH])

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

icewmdir='$(datadir)/icewm'
AC_SUBST([icewmdir])
icewmthemesdir='$(icewmdir)/themes'
AC_SUBST([icewmthemesdir])

AC_CONFIG_FILES([Makefile
		 data/Makefile
		 ])
AC_OUTPUT

# vim: set ft=config:
