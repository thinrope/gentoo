# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 readme.gentoo-r1

DESCRIPTION="Access your Google contacts from the command line"
HOMEPAGE="https://gitlab.com/goobook/goobook"
SRC_URI="https://gitlab.com/${PN}/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	>=dev-python/gdata-2.0.18[${PYTHON_USEDEP}]
	>=dev-python/hcs-utils-1.3[${PYTHON_USEDEP}]
	>=dev-python/keyring-0.2[${PYTHON_USEDEP}]
	>=dev-python/simplejson-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.9[${PYTHON_USEDEP}]
	>=dev-python/oauth2client-1.2[${PYTHON_USEDEP}]"

DEPEND="${PYTHON_DEPS}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
To setup initial authentication, execute:

~ $ goobook authenticate

If you want to use goobook from mutt, add this in your .muttrc file:
	set query_command=\"goobook query '%s'\"
to query address book.

You may find more information and advanced configuration tips at
https://pypi.org/project/${PN}/${PV} in \"Configure/Mutt\" section"

src_install() {
	distutils-r1_src_install
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
