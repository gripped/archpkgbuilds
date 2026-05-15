# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Dian M Fay <dian.m.fay@gmail.com>

pkgname=python-magic-wormhole-mailbox-server
pkgver=0.7.0
pkgrel=1
pkgdesc="the rendezvous/mailbox server for magic-wormhole clients "
arch=(any)
url="https://github.com/magic-wormhole/magic-wormhole-mailbox-server"
license=(MIT)
depends=(python-autobahn
         python-twisted)
makedepends=(python-{build,installer,wheel}
             python-setuptools
             python-versioneer)
checkdepends=(python-pytest
              python-treq)
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('064ea622ccdb35e1a6bcb0efbbcd5bda30f4b87f865277c192fbf697ee33baf653cbc3ef51fad169a5ea8f7867dd76b62b5a94887f1a2798858cbb093ffa9f71')
b2sums=('4b56c88c0eca3d74a1f61022d826b04307ffe810d5fffda413e200815db04ab979f240b09acc978dd7a6c1b0d6dd5d405b54b850966513de2c775d6f5e8e440f')

prepare() {
	cd "${pkgname#python-}-$pkgver"
	# vendored versioneer is too old for Python 3.12
	rm -f versioneer.py
}

build() {
	cd "${pkgname#python-}-$pkgver"
	python -m build -wn
}

check() {
	cd "${pkgname#python-}-$pkgver"
	export PYTHONPATH='src'
	pytest
}

package() {
	cd "${pkgname#python-}-$pkgver"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*.md
}
