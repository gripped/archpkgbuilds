# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Adam Perkowski <adas1per@protonmail.com>

pkgname=hyprpolkitagent
pkgver=0.1.3
pkgrel=4
pkgdesc='Simple polkit authentication agent for Hyprland, written in QT/QML'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         hyprland-qt-support
         hyprutils libhyprutils.so
         polkit-qt6 # libpolkit-qt6-core-1.so libpolkit-qt6-agent-1.so
         qt6-base # libQt6Widgets.so libQt6Gui.so libQt6Qml.so libQt6Core.so
         qt6-declarative) # libQt6QuickControls2.so
makedepends=(cmake)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('a8fa714b92d47331f056b608cb731dd1f5cc3845a9109cb22c6e6eb55b4eac84')

build() {
	cd "$_archive"
	cmake -B build \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_INSTALL_LIBEXECDIR=lib/$pkgname \
		-D CMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}


