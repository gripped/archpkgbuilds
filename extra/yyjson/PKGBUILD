# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=yyjson
pkgver=0.11.1
pkgrel=1
pkgdesc="A high performance JSON library written in ANSI C"
arch=('x86_64')
url="https://ibireme.github.io/yyjson"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libyyjson.so')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibireme/yyjson/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('610a38a5e59192063f5f581ce0c3c1869971c458ea11b58dfe00d1c8269e255d')

build() {
	cmake -B build -S "${pkgname}-${pkgver}" \
	  -DCMAKE_BUILD_TYPE='None' \
	  -DCMAKE_INSTALL_PREFIX='/usr' \
	  -DBUILD_SHARED_LIBS='ON' \
	  -DYYJSON_BUILD_TESTS='ON' \
	  -Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="${pkgdir}" cmake --install build

	cd "${pkgname}-${pkgver}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm 644 doc/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
