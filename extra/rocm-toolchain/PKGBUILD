# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
pkgname=rocm-toolchain
pkgver=0.5.0
pkgrel=1
pkgdesc="Scripts for ROCm packaging"
arch=('any')
url="https://gitlab.archlinux.org/tpkessler/rocm-toolchain"
license=('GPL-3.0-or-later')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('d0ee1dcae12210755e80cdb4d8a529049b920a7a738d58bb114bc5dba0147498')

package() {
	cd $pkgname
	install -Dm755 rocm-supported-gfx "$pkgdir"/usr/bin/rocm-supported-gfx
}
