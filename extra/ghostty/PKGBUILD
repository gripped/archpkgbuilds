# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Peter Jung <ptr1337@archlinux.org>

pkgbase=ghostty
pkgname=(ghostty ghostty-shell-integration ghostty-terminfo)
pkgver=1.2.3
pkgrel=2
pkgdesc='Fast, native, feature-rich terminal emulator pushing modern features'
arch=(x86_64 aarch64 i686)
url="https://github.com/ghostty-org/$pkgbase"
license=(MIT)
depends=(bzip2
         fontconfig libfontconfig.so
         freetype2 libfreetype.so
         gcc-libs # ld-linux-x86-64.so
         glibc # libc.so libm.so
         glib2 libglib-2.0.so libgio-2.0.so libgobject-2.0.so
         gtk4 libgtk-4.so
         gtk4-layer-shell
         libx11 # libX11.so
         harfbuzz libharfbuzz.so
         libadwaita libadwaita-1.so
         libpng
         oniguruma # libonig.so
         pixman
         wayland libwayland-client.so
         zlib)
makedepends=(blueprint-compiler
             pandoc-cli
             zig0.14)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e17d39482fc70fba3d72f5f25c12e9d9a72b87dd45a61a854d9928e98b69edd8')

prepare() {
	cd "$_archive"

	ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache/" ./nix/build-support/fetch-zig-cache.sh
}

build() {
	cd "$_archive"
	DESTDIR=build zig build \
		--summary all \
		--prefix "/usr" \
		--system "$srcdir/zig-global-cache/p" \
		-Doptimize=ReleaseFast \
		-Dgtk-x11=true \
		-Dcpu=baseline \
		-Dpie=true \
		-Demit-docs \
		-Dversion-string="$pkgver-arch$pkgrel"
}

package_ghostty() {
	depends+=(ghostty-shell-integration
	          ghostty-terminfo)
	cd "$_archive"
	cp -a build/* "$pkgdir/"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	rm -r "$pkgdir"/usr/share/terminfo
	rm -r "$pkgdir"/usr/share/ghostty/shell-integration
}

package_ghostty-shell-integration() {
	pkgdesc='Shell integration scripts for ghostty'
	depends=()
	cd "$_archive"
	mkdir -p "$pkgdir/usr/share/ghostty/shell-integration"
	cp -r build/usr/share/ghostty/shell-integration/* "$pkgdir/usr/share/ghostty/shell-integration/"
}

package_ghostty-terminfo() {
	pkgdesc='Terminfo for ghostty'
	depends=()
	cd "$_archive"
	mkdir -p "$pkgdir/usr/share/terminfo"
	cp -r build/usr/share/terminfo/* "$pkgdir/usr/share/terminfo/"
}
