#!/bin/sh

cd "$(dirname "$0")"

PACKAGE=$(grep AC_INIT configure.ac|head -1|sed -r 's,AC_INIT[(][[],,;s,[]].*,,')

GTVERSION=$(gettext --version|head -1|awk '{print$NF}'|sed -r 's,(^[^\.]*\.[^\.]*)\.[^\.]*$,\1,;s,(^[^\.]*\.[^\.]*\.[^\.]*)\.[^\.]*$,\1,')

if [ -x "`which git 2>/dev/null`" -a -d .git ]; then
	VERSION=$(git describe --tags|sed 's,[-_],.,g;s,\.g.*$,,')
	DATE=$(git show -s --format=%ci HEAD^{commit}|awk '{print$1}')
	MDOCDATE=$(perl -MDate::Format -MDate::Parse -E 'print time2str("%B %e, %Y", str2time("'"$DATE"'"))'|sed 's,  , ,')
	BRANCH=$(git tag --sort=-creatordate|head -1)
	GNITS="gnits "
	if [ "$VERSION" != "$BRANCH" ]; then
		BRANCH="master"
		GNITS=""
	fi
	sed -i.bak -r \
		-e "s:AC_INIT\([[]$PACKAGE[]],[[][^]]*[]]:AC_INIT([$PACKAGE],[$VERSION]:
		    s:AC_REVISION\([[][^]]*[]]\):AC_REVISION([$VERSION]):
		    s:^DATE=.*$:DATE='$DATE':
		    s:^MDOCDATE=.*$:MDOCDATE='$MDOCDATE':
		    s:^BRANCH=.*$:BRANCH='$BRANCH':
		    s:^AM_GNU_GETTEXT_VERSION.*:AM_GNU_GETTEXT_VERSION([$GTVERSION]):
		    s:^AM_INIT_AUTOMAKE\([[](gnits )?:AM_INIT_AUTOMAKE([$GNITS:" \
		configure.ac
	subst="s:%%PACKAGE%%:$PACKAGE:g
	       s:%%VERSION%%:$VERSION:g
	       s:%%DATE%%:$DATE:g
	       s:%%MDOCDATE%%:$MDOCDATE:g
	       s:%%BRANCH%%:$BRANCH:g"
else
	sed -i.bak configure.ac -r \
		-e "s:^AM_GNU_GETTEXT_VERSION.*:AM_GNU_GETTEXT_VERSION([$GTVERSION]):"
fi

mkdir m4 2>/dev/null

autoreconf -iv
