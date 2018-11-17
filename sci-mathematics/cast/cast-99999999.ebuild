# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=7

PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1 git-r3

LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/wxpython
dev-python/pysal
dev-python/yapsy
sci-libs/Shapely
"

DESCRIPTION="Software for Exploratory Space-Time Analytics"
LICENSE="GPL-3"

IUSE=""

EGIT_REPO_URI="https://github.com/Turulomio/CAST.git"
HOMEPAGE="https://geodacenter.github.io/CAST/"

