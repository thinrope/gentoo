# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

if [[ ${CATEGORY}/${PN} == app-arch/xz-utils
   && ${EBUILD_PHASE} == setup
   && ${CPPFLAGS} == *-isystem*
]]; then
	# During bootstrap-prefix.sh we set CPPFLAGS="-isystem $EPREFIX/usr/include",
	# but on Cygwin xz-utils eventually does use the windres compiler,
	# which fails to understand -isystem.
	# As xz-utils has no need for -isystem here, we can use -I instead.
	CPPFLAGS=${CPPFLAGS//-isystem /-I}
fi

post_pkg_preinst() {
	cygwin-post_pkg_preinst
}

pre_pkg_postinst() {
	cygwin-pre_pkg_postinst
}

post_pkg_prerm() {
	cygwin-post_pkg_prerm
}

cygwin-post_pkg_preinst() {
	:
}

cygwin-pre_pkg_postinst() {
	:
}

cygwin-post_pkg_prerm() {
	:
}
