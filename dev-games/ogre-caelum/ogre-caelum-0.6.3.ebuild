# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils git-r3

DESCRIPTION="Caelum is an open-source sky rendering library for OGRE"
HOMEPAGE="http://www.ogre3d.org/forums/viewtopic.php?t=24961"
EGIT_REPO_URI="https://github.com/RigsOfRods/ogre-caelum.git"
EGIT_COMMIT="v${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-games/ogre-1.8.0"

RDEPEND="${DEPEND}"

src_install() {
	cmake-utils_src_install
	dosym ../libCaelum.so /usr/lib64/OGRE/libCaelum.so
	rm -r "${D}"/usr/doc
}
