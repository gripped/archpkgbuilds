# Maintainer: George Hu <integral@archlinux.org>
# Maintainer: DeepChirp <deepchirp@archlinux.org>
# Contributor: dalto <dalto at fastmail.com>

pkgname=btrfs-assistant
pkgver=3.1.0
pkgrel=1
pkgdesc="An application for managing BTRFS subvolumes and Snapper snapshots"
arch=('x86_64')
url="https://gitlab.com/${pkgname}/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
	'btrfs-progs'
	'diffutils'
	'glibc'
	'hicolor-icon-theme'
	'libgcc'
	'libstdc++'
	'polkit'
	'qt6-base'
	'util-linux'
)
optdepends=('snapper: Snapper support'
            'btrfsmaintenance: Btrfs maintenance support')
makedepends=('cmake' 'qt6-declarative' 'qt6-tools')
backup=("etc/${pkgname}.conf")
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8723febbebe3910b439ab70ac534ea0bec76f889880f3bd3a03b676354e2ecc9')

build() {
	cmake -B build \
		-S "${pkgname}-${pkgver}" \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=None \
		-D BTRFS_ASSISTANT_TESTS=ON

	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
