# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Storm Dragon <stormdragon2976@gmail.com>

pkgname=python-txtorcon
pkgver=23.11.0
pkgrel=1
pkgdesc='A Twisted-based Python asynchronous controller library for Tor'
arch=('any')
url='https://txtorcon.readthedocs.org/'
license=('MIT')
depends=('python-automat' 'python-twisted' 'python-cryptography')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-cryptography' 'python-pyopenssl' 'lsof')
source=("${pkgname#python-}-${pkgver}.tar.gz::https://github.com/meejah/txtorcon/releases/download/v${pkgver}/txtorcon-${pkgver}.tar.gz"
        "${pkgname#python-}-${pkgver}.tar.gz.asc::https://github.com/meejah/txtorcon/releases/download/v${pkgver}/txtorcon-${pkgver}.tar.gz.asc")
sha512sums=('abc9776ad6e071a09f13e54c7582b5adab17efc752d485ff7a94baa3e71eb9c093983ceebeebd2218c85ed193bfd0b39dcd11a73d54bd2a28f9d9b2b9149ecd6'
            'SKIP')
validpgpkeys=('9D5A2BD5688ECB889DEBCD3FC2602803128069A7')

build() {
	cd "${pkgname#python-}-${pkgver}"
	python setup.py build
}

check() {
	cd "${pkgname#python-}-${pkgver}"
	PYTHONPATH=. trial test
}

package() {
	cd "${pkgname#python-}-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	rm -r "${pkgdir}/usr/share/txtorcon"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
