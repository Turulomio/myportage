EAPI=7

inherit meson

DESCRIPTION="Listen to internet radio"
HOMEPAGE="https://gitlab.gnome.org/World/Shortwave"
SRC_URI="https://gitlab.gnome.org/World/Shortwave/-/archive/${PV}/Shortwave-${PV}.tar.gz"
S="${WORKDIR}/Shortwave-${PV}"

LICENSE="GPL-3"
SLOT="0"
#.0/0" # It may or may not break ABI in future versions at this point; if new
# SLOT happens, it'll likely file conflict on gtk-doc and glade library and catalog
KEYWORDS="~amd64 ~arm64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"

#IUSE="examples glade gtk-doc +introspection test +vala"
#REQUIRED_USE="vala? ( introspection )"
#RESTRICT="!test? ( test )"

RDEPEND="
gui-libs/libhandy
"
DEPEND="${RDEPEND}"

