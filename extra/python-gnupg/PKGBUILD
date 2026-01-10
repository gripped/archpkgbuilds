# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Sven Klomp <mail@klomp.eu>

pkgname=python-gnupg
pkgver=0.5.6
pkgrel=2
pkgdesc="A wrapper for the Gnu Privacy Guard (GPG or GnuPG)"
url="https://docs.red-dove.com/python-gnupg"
arch=('any')
license=('BSD-3-Clause')
depends=('gnupg' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vsajip/python-gnupg/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/vsajip/python-gnupg/releases/download/${pkgver}/source-${pkgver}.tar.gz.asc")
sha512sums=('910e1cd94e566f0f7b2335ed3ba1f21528c66a2f3390fd348233b721327874cd9a12b5de671b8e5bcd9ae6976bd3d4f7f89e379b305363640de78f03ff9d763e'
            'SKIP')
b2sums=('f5bbf0cd21242f64077bc6894825447f0df9dc01390a7bc89ae8ed6ef144fa560c13781082fb4525e2d958faab940f4bfbc3a51a8134057fad8983ce3b7401f2'
        'SKIP')
validpgpkeys=('CA749061914EAC138E66EADB9147B477339A9B86') # Vinay Sajip (CODE SIGNING KEY) <vinay_sajip@yahoo.co.uk>

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname}-${pkgver}"
	export NO_EXTERNAL_TESTS='true'
	pytest
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
