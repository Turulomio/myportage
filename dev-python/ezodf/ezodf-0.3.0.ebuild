# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/odfpy/odfpy-0.9.6-r1.ebuild,v 1.1 2013/07/01 09:32:51 dev-zero Exp $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Python API and tools to manipulate OpenDocument files"
HOMEPAGE="https://pypi.python.org/pypi/ezodf"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0 GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
dev-python/lxml"
RDEPEND=""

python_test() {
	local exit_status=0 test
	for test in tests/test*.py; do
		einfo "Running ${test} ..."
		"${PYTHON}" "${test}"
		[[ $? -ne 0 ]] && exit_status=1
	done
	return ${exit_status}
}