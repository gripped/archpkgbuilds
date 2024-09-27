# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>

pkgname=tmux
pkgver=3.5
pkgrel=1
pkgdesc='Terminal multiplexer'
url='https://github.com/tmux/tmux/wiki'
arch=('x86_64')
license=('BSD')
depends=('libevent' 'libevent_core-2.1.so'
         'libutempter'
         'ncurses' 'libncursesw.so'
         'systemd-libs' 'libsystemd.so')
makedepends=('git' 'systemd')
source=("git+https://github.com/tmux/tmux.git#tag=${pkgver}")
sha256sums=('b838881279beaf795bf4926212c2d3fe0d31188c83e8d9efd68dc6772c559916')

prepare() {
	cd "$pkgname"

	sh autogen.sh
}

build() {
	cd "$pkgname"

	./configure \
		--prefix=/usr \
		--enable-sixel \
		--enable-systemd \
		--enable-utempter
	make
}

package() {
	cd "$pkgname"

	make install DESTDIR="$pkgdir"
	install -D -m0644 COPYING "$pkgdir/usr/share/licenses/tmux/LICENSE"
}
