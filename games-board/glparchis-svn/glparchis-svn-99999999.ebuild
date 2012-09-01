inherit subversion autotools eutils
DESCRIPTION="OpenGL Parchis"
HOMEPAGE="http://glparchis.sourceforge.net"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="https://glparchis.svn.sourceforge.net/svnroot/glparchis/pyglParchis"

DEPEND="
dev-python/PyQt4
dev-python/pyopengl
"
RDEPEND=${DEPEND}

src_compile(){
        emake compile || die "Error compiling"
}

src_install(){
        emake DESTDIR="${D}" install || die "Install failed"
}
