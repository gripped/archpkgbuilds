# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>

pkgname=tmux
pkgver=3.4
pkgrel=5
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
sha256sums=('71387cf05585836da88d9b481f98e89be5bc8f09a203600187b22aa0e00c52b0')

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
