# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Sven Klomp <mail@klomp.eu>

pkgname=python-gnupg
pkgver=0.5.5
pkgrel=1
pkgdesc="A wrapper for the Gnu Privacy Guard (GPG or GnuPG)"
url="https://docs.red-dove.com/python-gnupg"
arch=('any')
license=('BSD-3-Clause')
depends=('gnupg' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vsajip/python-gnupg/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/vsajip/python-gnupg/releases/download/${pkgver}/source-${pkgver}.tar.gz.asc")
sha512sums=('0483cc4faac5fa1244e621fa56c2d4b0c4a0f74168fbd7e68e820f40b4ff2d79bf19866fb1020ee62290087b41c55d5257e3e78a68eb63276a5a586b28ce4f7c'
            'SKIP')
b2sums=('e67aa5a74d44bb05025ec89ad412ab7ded982f3ce5cf0d7cbee880afb61fd08409e9732c8280a7deffedb008c2682dfd7639e04e8c2d9769a31ccf5d1db61180'
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
