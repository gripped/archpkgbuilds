# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=quickjs-ng
_pkgname=quickjs
pkgver=0.16.0
pkgrel=1
pkgdesc="A mighty JavaScript engine"
url="https://quickjs-ng.github.io/quickjs"
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quickjs-ng/quickjs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c759423f2ad8f37c8f6af7778dc5324779d5274c1a21f4855e9ad948bbdf0718')

build() {
	local cmake_options=(
		-B build
		-S "${_pkgname}-${pkgver}"
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D QJS_BUILD_LIBC=ON
		-D BUILD_SHARED_LIBS=ON
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

check() {
	local excluded_tests=""
	local ctest_flags=(
		--test-dir build
		--output-on-failure
		--parallel $(nproc)
		--exclude-regex "${excluded_tests}"
	)
	ctest "${ctest_flags[@]}"
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm 644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
