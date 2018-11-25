# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit games

MY_PN=MegaMario

DESCRIPTION="Mario remake"
HOMEPAGE="http://mmario.sourceforge.net/"
SRC_URI="mirror://sourceforge/mmario/Mega%20Mario%20Full%20Game/Mega%20Mario%20v1.7%20%28Full%20Game%2C%20high%20Quality%20music%29/MegaMario_v1.7_full.zip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="media-libs/libsdl
	media-libs/mesa
	media-libs/sdl-ttf
	media-libs/sdl-image
	media-libs/sdl-mixer"
DEPEND="${RDEPEND}"

#src_prepare(){
#	epatch "${FILESDIR}"/${PV}-gcc43.patch
#	epatch "${FILESDIR}"/${PV}-hqmusic.patch
#	epatch "${FILESDIR}"/${PV}-logpath.patch
#        sed -s \
#           -e 's/\/home\/opt/${GAMES_DATADIR}/g' -i Makefile \
#           -e 's/\/share//g' -i Makefile \
#		|| die "sed failed"
#}

src_install() {
	local datadir="${GAMES_DATADIR}"/${PN}
	dogamesbin ${PN}
	chmod 755 ${WORKDIR}/data/gfx/tiles/pipes/left
	for i in `find ${WORKDIR}/data -name "*.PNG"`; do \
		mv $i `echo $i|sed s/PNG/png/`; \
	done
	for i in `find ${WORKDIR}/data -name "*.JPG"`; do \
		mv $i `echo $i|sed s/JPG/jpg/`; \
	done
	insinto "${datadir}"
	doins -r data/* mp3music  || die "data install failed"
	doicon ${PN}.png
	domenu ${PN}.desktop
}
