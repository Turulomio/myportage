# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

[[ ${PV} = 9999* ]] && GIT="git-r3"

inherit cmake-utils ${GIT}

DESCRIPTION="Rally game focused on closed rally tracks with possible stunt elements."
HOMEPAGE="http://stuntrally.tuxfamily.org/"

SLOT="0"
LICENSE="GPL-3"
IUSE="dedicated +game editor static-libs"

if [[ ${PV} = 9999* ]]; then
	SRC_URI=""
	KEYWORDS=""
	EGIT_REPO_URI="https://github.com/stuntrally/stuntrally"
	LIVE_PDEPEND="=${CATEGORY}/${PN}-tracks-${PV}"
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tgz"
fi

RDEPEND="
	game? (
		dev-games/ogre[cg,boost,ois,freeimage,opengl,zip,-double-precision]
		dev-games/mygui[ogre]
		media-libs/libsdl2
		media-libs/libvorbis
		media-libs/libogg
		media-libs/openal
		sci-physics/bullet[bullet3,extras]
	)
	dev-libs/boost
	net-libs/enet:1.3
	virtual/libstdc++
"
DEPEND="${RDEPEND}"
PDEPEND="${LIVE_PDEPEND}"

REQUIRED_USE="editor? ( game )"

DOCS=(Readme.txt)

src_configure() {
	local mycmakeargs=(
		-DBUILD_MASTER_SERVER=$(usex dedicated ON OFF)
		-DBUILD_GAME=$(usex game ON OFF)
		-DBUILD_EDITOR=$(usex editor ON OFF)
		-DBUILD_SHARED_LIBS=$(usex !static-libs ON OFF)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
