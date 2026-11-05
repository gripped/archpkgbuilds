# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=python-mocket
pkgver=3.15.1
pkgrel=1
pkgdesc="Socket Mock Framework - for all kinds of socket animals, web-clients included - with gevent/asyncio/SSL support"
url="https://github.com/mindflayer/python-mocket"
arch=('any')
license=('BSD-3-Clause')
depends=('python-puremagic' 'python-decorator>=4.0.0' 'python-h11' 'python-typing_extensions' 'python-urllib3')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('87e61be25165ea709b0b86f6d4bf4b0b91bc5042008a926fcfe6bf69307f9e5e')

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
