# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-zeep
pkgver=4.3.2
pkgrel=3
pkgdesc="A fast and modern Python SOAP client"
arch=('any')
license=('MIT')
url="https://docs.python-zeep.org"
depends=('python-attrs' 'python-isodate' 'python-lxml' 'python-platformdirs' 'python-requests'
         'python-requests-toolbelt' 'python-requests-file' 'python-pytz')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-freezegun' 'python-pretend'
              'python-requests-mock' 'python-pytest-httpx' 'python-pytest-asyncio' 'python-aiohttp'
              'python-aioresponses' 'python-xmlsec')
source=("https://github.com/mvantellingen/python-zeep/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('371e3905f849fa9544b749ad2d6f84fcbb1fa1aabed8e6c17d2c17555de4fd0b70ab7c750aa14a01134492e7bfc954207f1c4646f7dcf3a9fa8d574da2909e60')

prepare() {
  cd python-zeep-$pkgver
}

build() {
  cd python-zeep-$pkgver
  python -m build --wheel --no-isolation
} 

check() {
  cd python-zeep-$pkgver
  PYTHONPATH="$PWD"/build/lib pytest
}

package() {
  cd python-zeep-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
