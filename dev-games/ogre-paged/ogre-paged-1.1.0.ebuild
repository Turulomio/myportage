# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils git-r3

DESCRIPTION="Paged Geometry, a plugin for OGRE, provides real-time rendering of forests, with trees, bushes, grass, rocks, and other clutter. "
HOMEPAGE="https://github.com/RigsOfRods/ogre-pagedgeometry"
EGIT_REPO_URI="https://github.com/RigsOfRods/ogre-pagedgeometry.git"
EGIT_BRANCH="Ogre-1.8"

LICENSE="zlib"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="~dev-games/ogre-1.8.1"

RDEPEND="${DEPEND}"

src_configure() {
    local mycmakeargs=(
        -DCMAKE_BUILD_TYPE="RelWithDebInfo"
		-DPAGEDGEOMETRY_BUILD_SAMPLES:BOOL="OFF"
    )
    cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	rm -r "${D}"/usr/doc
}
