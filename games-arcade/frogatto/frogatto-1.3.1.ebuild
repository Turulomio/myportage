# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils games

DESCRIPTION="a frog, and a platform game"
HOMEPAGE="http://frogatto.com/"
SRC_URI="http://github.com/frogatto/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3 free-noncomm"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="extras"

DEPEND="dev-libs/boost
	media-libs/glew
	media-libs/libpng:0
	media-libs/libsdl[X,joystick,opengl,sound,video]
	media-libs/sdl-image[png]
	media-libs/sdl-mixer[vorbis]
	media-libs/sdl-ttf
	sys-libs/zlib
	virtual/opengl
	virtual/glu"
RDEPEND="${DEPEND}"

src_prepare() {
	# drop some CXXFLAGS
	sed -i \
		-e '/BASE_CXXFLAGS/s/-Werror //' \
		-e '/BASE_CXXFLAGS/s/-g //' \
		Makefile || die 'sed on Makefile failed'

	epatch_user
}

src_compile() {
	emake USE_CCACHE="no" OPTIMIZE="no"
}

src_install() {
	insinto "${GAMES_DATADIR}/${PN}"
	newgamesbin game "${PN}.orig"
	doins -r data images music *.ttf

	if use extras; then
		# Install all modules
		doins -r modules
	else
		# Install only frogatto module by default
		insinto "${GAMES_DATADIR}/${PN}/modules"
		doins -r modules/frogatto
	fi

	newicon images/window-icon.png "${PN}.png"

	games_make_wrapper "${PN}" "${GAMES_BINDIR}/${PN}.orig" "${GAMES_DATADIR}/${PN}"
	make_desktop_entry "${PN}" "Frogatto and Friends"

	prepgamesdirs
}
