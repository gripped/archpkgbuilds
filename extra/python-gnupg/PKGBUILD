# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Sven Klomp <mail@klomp.eu>

pkgname=python-gnupg
pkgver=0.5.4
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
sha512sums=('4b316ea925ef8892a743e81c907ff0c7f9b639ec2f92e614337765c0ddade80ad6b484ff75e7315bf1b6a71e3bb8e5e384f2b20bec4d27edb246c392ef4e7b94'
            'SKIP')
b2sums=('55d2089e8e7698d3202ca265eff172d35931df8fcfe32932247ecf246a16c7bfb8006ac7711895c4eda95dbcc45f83e89210608a243b3006c7ffeb0f9d99c77d'
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
