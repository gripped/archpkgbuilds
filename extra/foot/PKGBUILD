# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Eklöf <daniel at ekloef dot se>

pkgbase=foot
pkgdesc='Fast, lightweight, and minimalistic Wayland terminal emulator'
pkgname=($pkgbase $pkgbase-terminfo)
pkgver=1.27.0
pkgrel=2
url="https://codeberg.org/dnkl/$pkgbase"
arch=(x86_64)
license=(MIT)
makedepends=(fcft
             fontconfig
             git
             libutf8proc
             libxkbcommon
             llvm
             meson
             ncurses
             ninja
             pixman
             python
             scdoc
             sway
             tllist
             wayland
             wayland-protocols)
optdepends=('libutempter: utmp logging')
backup=(etc/xdg/foot/foot.ini)
source=("$pkgbase::git+$url.git#tag=$pkgver")
sha256sums=('cce2ba627e49615fb022b6d5ecf85a4cf0bb4d0a3ee1e128d99fa61ac767f547')

build() {
	cd "$pkgbase"
	./pgo/pgo.sh \
		full-headless-sway \
		. build \
		-Dterminfo-base-name=foot-extra \
		--prefix=/usr \
		--wrap-mode=nodownload
}

check() {
	cd "$pkgbase"
	ninja -C build test
}

package_foot() {
	optdepends=('foot-terminfo: extra non-standard features over terminfo included in ncurses'
	            'libnotify: desktop notifications'
	            'xdg-utils: URI launching')
	depends=(fcft
	         fontconfig
	         libfcft.so
	         libutf8proc
	         libxkbcommon
	         ncurses
	         pixman
	         wayland)
	cd "$pkgbase"
	DESTDIR="$pkgdir" ninja -C build install
	rm -r "$pkgdir/usr/share/terminfo/"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_foot-terminfo() {
	pkgdesc="Extra non-standard terminfo files for $pkgbase, a Wayland terminal emulator"
	depends=(ncurses)
	cd "$pkgbase"
	install -Dm0644 -t "$pkgdir/usr/share/terminfo/f/" build/f/foot-extra*
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
