# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: 謝致邦 <Yeking@Red54.com>
# Contributor: Alucryd <alucryd at gmail dot com>

pkgname=android-tools
pkgver=36.0.1
_tag=${pkgver} # https://github.com/nmeum/android-tools sometimes carries extra patch version on top of the upstream versioning
pkgrel=2
pkgdesc='Android platform tools'
arch=(x86_64)
url='https://developer.android.com/tools'
license=('Apache-2.0 AND BSD-3-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later AND MIT AND libselinux-1.0')
depends=(abseil-cpp brotli fmt glibc libgcc libstdc++ libudev.so libusb lz4 pcre2 protobuf zlib zstd)
makedepends=(cmake git go gtest ninja)
optdepends=('python: {mk,unpack_,repack_}bootimg and mkdtboimg support'
	    'android-udev: optional additional device udev rules')
source=(https://github.com/nmeum/android-tools/releases/download/$_tag/android-tools-$_tag.tar.xz)
sha256sums=('38e8a84b739480141de0836bf6d581b3339ac7d53d0f7ce8c044a3368c8c2f8f')

build() {
	cd "android-tools-${_tag}"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
		-DCMAKE_C_FLAGS="$CFLAGS" \
		-G Ninja -S . -B build
	cmake --build build
}

package() {
	cd "android-tools-${_tag}"

	DESTDIR="$pkgdir" ninja -C build install

	install -Dm644 vendor/selinux/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/libselinux.txt"
	install -Dm644 vendor/fmtlib/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/MIT.txt"
	install -Dm644 vendor/avb/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/BSD-3-Clause.txt"
}
