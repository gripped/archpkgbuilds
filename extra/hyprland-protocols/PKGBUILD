# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: l0gic <l0gic@invalid.invalid>

pkgname=hyprland-protocols
pkgver=0.7.1
pkgrel=1
pkgdesc='Wayland protocol extensions for Hyprland'
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
makedepends=(cmake)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('178fa406a1c76e94efeed5d1488abd6029427865f6fd4caf296c71ffaf0d069e')

build() {
	cmake \
		-B build \
		-S "${pkgname}-${pkgver}" \
		-W no-author \
		-D CMAKE_BUILD_TYPE=None \
		-D CMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "${pkgname}-${pkgver}/LICENSE"
}
