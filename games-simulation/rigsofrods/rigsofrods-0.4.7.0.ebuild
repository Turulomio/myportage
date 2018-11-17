# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils

DESCRIPTION="Rigs of Rods - soft body physics simulator"
HOMEPAGE="https://rigsofrods.org/"
SRC_URI="https://github.com/RigsOfRods/rigs-of-rods/archive/${PV}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
    >=dev-games/mygui-3.2.2[ogre,-opengl]
    >=dev-libs/angelscript-2.31.2
    <dev-games/ogre-1.10[cg,ois,zip]
    dev-games/ogre-caelum
    dev-games/ogre-paged
    >=dev-libs/boost-1.50
    net-misc/curl[ssl]
    dev-libs/openssl
    x11-libs/gtk+
    >=media-libs/openal-1.17.0
    >=x11-libs/wxGTK-2.6
    "

RDEPEND="${DEPEND}"

PATCHES=(
    "${FILESDIR}/${PV}-ogre-includes.patch"
)

ROR_INSTALL_TARGET="/usr/share/rigsofrods/"

src_configure() {
    local mycmakeargs=(
	-DCMAKE_BUILD_TYPE="RelWithDebInfo"
    )
    cmake-utils_src_configure
}

src_install() {
    dodir "${ROR_INSTALL_TARGET}"/bin/
    cp -ar "${CMAKE_BUILD_DIR}"/bin/* "${D}/${ROR_INSTALL_TARGET}"/bin/

    # TODO: The path to OGRE plugins folder should ideally be somehow detected.
    sed -i 's|^PluginFolder=/usr/local/lib/OGRE/$|PluginFolder=/usr/lib/OGRE/|' "${D}/usr/share/rigsofrods/bin/plugins.cfg"

    # Append a script for downloading the content pack.
    wget -O "${D}/usr/share/rigsofrods/bin/content.sh" https://raw.githubusercontent.com/RigsOfRods/ror-linux-buildscripts/master/content.sh
    chmod +x "${D}/usr/share/rigsofrods/bin/content.sh"
}

pkg_postinst() {
    elog "Rigs of Rods binaries have been installed to ${ROR_INSTALL_TARGET}/bin/"
    elog "They should stay together with the other files such as plugins.cfg."
    elog "If you never ran Rigs of Rods before you need to run RoRConfig at least once before RoR."
    elog "RoRConfig sets up the directory for configuration and other files."
    elog "Run content.sh to download data packs such as maps or vehicles."
}