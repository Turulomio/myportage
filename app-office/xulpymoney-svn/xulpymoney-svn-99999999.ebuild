# Copyright 1999-2010 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion autotools eutils

ESVN_REPO_URI="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/pyqt"



IUSE=""
DESCRIPTION="Accounting system with xulpymoney-qt support"
HOMEPAGE="http://xulpymoney.sourceforge.net"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
dev-db/postgresql-server
dev-python/psycopg
dev-python/matplotlib
dev-python/PyQt4
dev-python/pytz
"

RDEPEND="${DEPEND}"


src_compile(){
        emake compile || die "Error compiling"
}

src_install(){
        emake DESTDIR="${D}" install || die "Install failed"
}