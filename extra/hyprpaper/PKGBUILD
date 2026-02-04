# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: ThatOneCalculator <kainoa@t1c.dev>

pkgname=hyprpaper
pkgver=0.8.3
pkgrel=2
pkgdesc='a blazing fast wayland wallpaper utility with IPC controls'
arch=(x86_64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(cairo libcairo.so
         gcc-libs
         glibc
         hyprgraphics libhyprgraphics.so
         hyprlang libhyprlang.so
         hyprtoolkit libhyprtoolkit.so
         hyprutils libhyprutils.so
         hyprwayland-scanner
         hyprwire libhyprwire.so
         libglvnd
         pango
         wayland) # libwayland-cursor.so libwayland-client.so
makedepends=(cmake
             wayland-protocols
             xorgproto)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('bfede471179adca93ed6d10e0132838c16dae364d828bd44f67819afc1a15594')

build() {
	cd "$_archive"
	cmake -B build \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release
	make protocols
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
