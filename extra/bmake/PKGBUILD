# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Ivy Foster <iff@archlinux.org>
# Contributor: Alex Szczuczko <alex at szc dot ca>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Imanol Celaya <ilcra1989@gmail.com>

pkgname=bmake
pkgver=20240921
pkgrel=1
pkgdesc='Portable version of the NetBSD make build tool'
arch=(x86_64)
url='https://www.crufty.net/help/sjg/bmake.html'
license=(BSD-3-Clause)
makedepends=(bc)
optdepends=('python: for meta2deps.py script')
#source=("https://ftp.netbsd.org/pub/NetBSD/misc/sjg/bmake-$pkgver.tar.gz"{,.asc})
source=("https://www.crufty.net/ftp/pub/sjg/bmake-$pkgver.tar.gz"{,.asc})
sha256sums=('b346579e82d296d1a4da29dea8594e3ee596130b20786dec0f3899a3e11275c2'
            'SKIP')
validpgpkeys=(7E228507C26D8DC164F531BFBA54C8AF755A2A99)

build() {
	cd bmake
	./boot-strap --prefix=/usr op=build
}

package() {
	cd bmake
	./boot-strap --install-destdir="$pkgdir" --prefix=/usr op=install
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
