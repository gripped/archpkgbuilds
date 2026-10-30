# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Peter Jung <ptr1337@archlinux.org>

pkgbase=ghostty
pkgname=(ghostty ghostty-shell-integration ghostty-terminfo ghostty-nautilus)
pkgver=1.4.0
pkgrel=1
pkgdesc='Fast, native, feature-rich terminal emulator pushing modern features'
arch=(x86_64 aarch64 i686)
url="https://github.com/ghostty-org/$pkgbase"
license=(MIT)
depends=(bzip2
         fontconfig libfontconfig.so
         freetype2 libfreetype.so
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
             zig)
optdepends=()
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('2e2a2516f9bea89a4991ad7c9401b77682eed366387a5b1d7c629472b5d11a43')

prepare() {
	local zigdir="$srcdir/zig-global-cache" f d n
	cd "$_archive"
	ZIG_GLOBAL_CACHE_DIR="$zigdir/" ./nix/build-support/fetch-zig-cache.sh
	for f in "$zigdir"/p/*.tar.gz; do
		d="${f%.tar.gz}"
		mkdir -- "$d"
		case ${d##*/} in
			N-V-__8AAIC5lwAVPJJzxnCAahSvZTIlG-HhtOvnM1uh-66x) n=1 ;;
			N-V-__8AAMVLTABmYkLqhZPLXnMl-KyN38R8UVYqGrxqO26s) n=1 ;;
			N-V-__8AANT61wB--nJ95Gj_ctmzAtcjloZ__hRqNw5lC1Kr) n=1 ;;
			aro-* | zigimg-*) n=1 ;;
			*) n=2 ;;
		esac
		bsdtar -C "$d" -xf "$f" --strip-components=$n
	done
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
		-Dversion-string="$pkgver-arch$pkgrel" \
		--build-id=sha1
}

package_ghostty() {
	depends+=(ghostty-shell-integration
	          ghostty-terminfo)
	optdepends+=("ghostty-nautilus: Open in Ghostty context menu in GNOME Files")
	cd "$_archive"
	cp -a build/* "$pkgdir/"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	rm -r "$pkgdir"/usr/share/terminfo
	rm -r "$pkgdir"/usr/share/ghostty/shell-integration
	rm -r "$pkgdir"/usr/share/nautilus-python/
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
	cp -r build/usr/share/terminfo/x "$pkgdir/usr/share/terminfo/"
}

package_ghostty-nautilus() {
	pkgdesc='Open in Ghostty for GNOME Files'
	depends=(ghostty nautilus-python)
	# Unlike the rest of ghostty, the nautilus extension is GPL-2.0-or-later
	# because nautilus-python itself is GPL-2 as well.
	license=('GPL-2.0-or-later')
	cd "$_archive"
	mkdir -p "$pkgdir"/usr/share/nautilus-python/
	cp -r build/usr/share/nautilus-python/* "$pkgdir"/usr/share/nautilus-python/
}
