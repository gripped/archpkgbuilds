# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=ed
pkgver=1.22.3
pkgrel=1
pkgdesc='A POSIX-compliant line-oriented text editor'
arch=(x86_64)
license=(GPL-2.0-only)
url="https://www.gnu.org/software/ed/ed.html"
depends=(glibc
         sh)
options=(!emptydirs)
_archive="$pkgname-$pkgver"
source=("https://ftp.gnu.org/gnu/ed/$_archive.tar.lz"{,.sig})
sha256sums=('47a55ddfc52d4a1ff6f7559fbd00cf948a16b6cf151ec520392761aeae4e97be'
            'SKIP')
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz

build() {
	cd "$_archive"
	./configure \
		--prefix=/\
		--bindir=/usr/bin \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		"CPPFLAGS=$CPPFLAGS" \
		"CFLAGS=$CFLAGS" \
		"LDFLAGS=$LDFLAGS"
	make
}

check() {
	make -C "$_archive" check
}

package() {
	make -C "$_archive" "DESTDIR=$pkgdir" install
}
