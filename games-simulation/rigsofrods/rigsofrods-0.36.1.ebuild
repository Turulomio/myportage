# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games cmake-utils eutils

DESCRIPTION="Rigs of Rods is a 3D simulator game where you can drive, fly and sail various vehicles using an accurate and unique soft-body physics engine. "
HOMEPAGE="http://rigsofrods.blogspot.com/"
SRC_URI="mirror://sourceforge/rigsofrods/${PN}-source-${PV}.tar.gz
mirror://sourceforge/rigsofrods/${PN}-contents-${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
dev-util/cmake
media-libs/freeimage
"

RDEPEND="${DEPEND}"

S=${WORKDIR}/${PV}/build
