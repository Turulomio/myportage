# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

inherit autotools desktop

DESCRIPTION="Pushover is a fun puzzle game originally published by Ocean in 1992."
HOMEPAGE="https://github.com/pushover/pushover.github.io"
SRC_URI="https://github.com/pushover/pushover.github.io/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE=""

DEPEND="dev-lang/lua
	media-libs/sdl-mixer
	media-libs/sdl-ttf"
RDEPEND="${DEPEND}"

S=${WORKDIR}/pushover.github.io-0.0.5/

src_compile() {
        eautoconf
        eautomake
        emake DESTDIR="${D}"|| die "einstall failed"

}

src_install() {
        emake DESTDIR="${D}" install || die "einstall failed"
#        doicon pushover.ico
        make_desktop_entry /usr/games/bin/pushover pushover generated/pushover_64x64.png

}
