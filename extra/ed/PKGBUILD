# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=ed
pkgver=1.22.1
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
sha256sums=('1af541116796d6b9e4b66ef9c45ddce0e15a19ed62bfca362ccd7d472cc1c8fb'
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
