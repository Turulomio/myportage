EAPI=6
inherit cmake-utils
DESCRIPTION="A C++ JSON Parser/Generator Implemented with Boost Spirit"
HOMEPAGE="http://www.codeproject.com/Articles/20027/JSON-Spirit-A-C-JSON-Parser-Generator-Implemented"
SRC_URI="https://github.com/png85/json_spirit/archive/json_spirit-${PV}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc x86 ~x86-fbsd"
IUSE=""
DEPEND="
dev-util/cmake
dev-libs/boost"
RDEPEND="dev-libs/boost"

#S="${WORKDIR}"

S="${WORKDIR}/json_spirit-json_spirit-${PV}"
