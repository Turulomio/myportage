# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games eutils

DESCRIPTION="BlockOut II is an adaptation of the original Blockout DOS game edited by California Dreams(1989).  BL II has the same features than the original game. Score calculation is also nearly similar to the original."
HOMEPAGE="http://www.blockout.net/blockout2/"
SRC_URI="mirror://sourceforge/project/blockout/blockout/BlockOut%202.5/bl25-src.tar.gz"
#https://sourceforge.net/projects/blockout/files/blockout/BlockOut%202.5/bl25-src.tar.gz/download
#https://vorboss.dl.sourceforge.net/project/blockout/blockout/BlockOut%202.5/bl25-src.tar.gz
LICENSE="Creative commons"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

#S=${MYP}_lin_src/BlockOut


src_compile(){
	cd ${S}
	cd ../ImageLib/src
	emake
	cd ../../BlockOut
        sed -i -e "s:/users/pons/test/opengl/SDL:/usr:" Makefile
        sed -i -e "s:../ImageLib:../ImageLib/src:" Makefile
	emake
}

src_install() {
	cd ${S}
        cp ${FILESDIR}/blockout.sh blockout.sh
        cp ${FILESDIR}/blockout.jpg blockout.jpg
        dogamesbin blockout.sh
        exeinto /usr/share/games/blockout/; doexe blockout
        insinto /usr/share/games/blockout/images; doins images/*; doins blockout.jpg
        insinto /usr/share/games/blockout/sounds; doins sounds/*
        make_desktop_entry blockout.sh "Blockout" /usr/share/games/blockout/images/blockout.jpg

}
