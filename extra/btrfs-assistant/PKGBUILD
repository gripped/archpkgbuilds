# Maintainer: George Hu <integral@archlinux.org>
# Maintainer: DeepChirp <deepchirp@archlinux.org>
# Contributor: dalto <dalto at fastmail.com>

pkgname=btrfs-assistant
pkgver=2.3
pkgrel=2
pkgdesc="An application for managing BTRFS subvolumes and Snapper snapshots"
arch=('x86_64')
url="https://gitlab.com/${pkgname}/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
	'bash'
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
sha256sums=('63e149ffec0bf5091b1eaf60fd6ca3059f8bd9a8ff9dc5fe74d97f98b6cf6e31')

build() {
	cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
