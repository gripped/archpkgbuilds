# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Philipp A. <flying-sheep@web.de>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=resvg
pkgver=0.46.0
pkgrel=1
pkgdesc='SVG rendering library and CLI'
arch=('x86_64')
url="https://github.com/linebender/resvg"
license=('Apache-2.0' 'MIT')
depends=('gdk-pixbuf2')
optdepends=(
	'qt5-base: For the Qt backend'
	'cairo: For the cairo backend'
)
makedepends=(cargo clang qt5-base qt5-tools cairo pango)
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('81a82a8de33da0fcf13fd18532d653bbd0b50b146d82c319dd0ce7294562c7c5')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
	mkdir -p tools/kde-dolphin-thumbnailer/build
}

build() {
	cd "$pkgname-$pkgver"

	cargo build --workspace --frozen --release --all-features

	(
		cd tools/viewsvg
		qmake PREFIX="$pkgdir/usr"
		make
	)

	cargo doc --release --no-deps -p resvg-capi
}

check() {
	cd "$pkgname-$pkgver"

	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 -t "$pkgdir/usr/bin/" target/release/{resvg,usvg} tools/viewsvg/viewsvg
	install -Dm755 -t "$pkgdir/usr/lib/" target/release/libresvg.so
	install -Dm644 -t "$pkgdir/usr/include/" crates/c-api/*.h
	install -d "$pkgdir/usr/share/doc/resvg"
	cp -r target/doc/* "$pkgdir/usr/share/doc/resvg"
}

# vim: ts=2 sw=2 et:
