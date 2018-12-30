EAPI=7

inherit git-r3
DESCRIPTION="Find usernames across social networks"
LICENSE="MIT"

IUSE=""
EGIT_REPO_URI="https://github.com/sdushantha/sherlock.git"
HOMEPAGE="https://github.com/sdushantha/sherlock"

SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
"

src_install(){
    dobin sherlock.py
}