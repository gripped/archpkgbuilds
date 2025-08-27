# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
pkgname=rocm-toolchain
pkgver=0.3.0
pkgrel=1
pkgdesc="Scripts for ROCm packaging"
arch=('any')
url="https://gitlab.archlinux.org/tpkessler/rocm-toolchain"
license=('GPL-3.0-or-later')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('811ab092ea921c8d49fa90d3cf5268cd84cc2acf32ed18db035710f5765206b7')

package() {
	cd $pkgname
	install -Dm755 rocm-supported-gfx "$pkgdir"/usr/bin/rocm-supported-gfx
}
