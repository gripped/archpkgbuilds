# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Dian M Fay <dian.m.fay@gmail.com>

pkgname=python-magic-wormhole-mailbox-server
pkgver=0.6.0
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
sha512sums=('5ffa59f44db27b0b0fa619b85ff7e8f8123e8664a959934bebcb233ed94d67fa89c8765003fcb7a3fdf7e6e4af8df674f97ae5c4dc18fb91afa42159548a1e5c')
b2sums=('796930b52d1d2d2f34473e4bb22077b4d16cda0307b46066bbe1a22f002ed5a091521a6cbe5c5c37dcbdd0d3a707b5409c1a0f388ae5125373714ef79d608bd4')

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
