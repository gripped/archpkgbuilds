# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Aaron Blasko <blaskoazzolaaaron [at] gmail.com>

pkgname=hyprlock
pkgver=0.9.7
pkgrel=2
pkgdesc='hyprland’s GPU-accelerated screen locking utility'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(cairo # libcairo.so
         libgcc # libgcc_s.so
         'libstdc++' # libstdc++.so
         glibc # libc.so libm.so
         hyprgraphics libhyprgraphics.so
         hyprlang libhyprlang.so
         hyprutils libhyprutils.so
         libdrm # libdrm.so
         libglvnd libEGL.so
         libxkbcommon libxkbcommon.so
         mesa # libgbm.so
         pam libpam.so
         sdbus-cpp libsdbus-c++.so
         wayland libwayland-client.so libwayland-egl.so
         wayland-protocols)
makedepends=(cmake
             hyprwayland-scanner)
backup=("etc/pam.d/$pkgname")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('01145790570ffabd31e9b528c517bdccae76f36e72d733f00c2696d9c3bf2c88')

build() {
	cd "$_archive"
	cmake -B build \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
