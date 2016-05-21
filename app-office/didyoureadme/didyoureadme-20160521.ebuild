# Copyright 1999-2010 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit autotools eutils

SRC_URI="mirror://sourceforge/project/didyoureadme/didyoureadme/didyoureadme-${PV}/didyoureadme-src-linux-${PV}.tar.gz"

IUSE=""
DESCRIPTION="Sistema de reparto de documentación con acuse de recibo"
HOMEPAGE=""
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
>=dev-lang/python-3.0.0[sqlite]
dev-python/PyQt5
dev-python/psycopg
dev-python/pytz
"

RDEPEND="${DEPEND}"


src_compile(){
        emake compile || die "Error compiling"
}

src_install(){
        emake DESTDIR="${D}/usr" install || die "Install failed"
}
