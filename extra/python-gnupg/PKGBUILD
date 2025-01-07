# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Sven Klomp <mail@klomp.eu>

pkgname=python-gnupg
pkgver=0.5.4
pkgrel=1
pkgdesc="A wrapper for the Gnu Privacy Guard (GPG or GnuPG)"
url="https://docs.red-dove.com/python-gnupg"
arch=('any')
license=('BSD-3-Clause')
depends=('gnupg' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/vsajip/python-gnupg/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('7136c423d388f0b7e77c55272be4b80a273468e02b576753183ae93ebe82182143662ee92c264982c3ad62d8465da49800706af76c400af578341d2b8bc0008f'
            'SKIP')
b2sums=('bbafc21296e0b16043e470cbee28832ceb403519bdfa3be0c887c2e0fd4ec702ab1ce6ec8e870f5aa25c87191ff8dbccdcfdae129d1aa7a6ea40ae3275699c07'
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
