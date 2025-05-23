# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=btop
pkgver=1.4.3
pkgrel=2
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache-2.0)
depends=(gcc-libs
         glibc)
makedepends=(lowdown
             rocm-smi-lib)
optdepends=('rocm-smi-lib: AMD GPU support')
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('81b133e59699a7fd89c5c54806e16452232f6452be9c14b3a634122e3ebed592')

build() {
	cd "$_archive"
	make all
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

