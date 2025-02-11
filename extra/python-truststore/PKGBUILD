# Maintainer: David Runge <dvzrv@archlinux.org>

_name=truststore
pkgname=python-truststore
pkgver=0.10.1
pkgrel=1
pkgdesc="Verify certificates using OS trust stores"
arch=(any)
url="https://github.com/sethmlarson/truststore"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-flit-core
  python-installer
  python-wheel
)
checkdepends=(
  python-aiohttp
  python-flaky
  python-httpx
  python-pyopenssl
  python-pytest
  python-pytest-asyncio
  python-pytest-httpserver
  python-requests
  python-trustme
  python-urllib3
)
optdepends=('python-urllib3: when injecting into SSLContext via urllib3')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('8a1c1269d44c0c33444c67d4302484eddcd3223b3e792b133efcf547ed1292cdca0ebc15447f68e7078928ea01d5c2108692dffb703d6bbdad0b9f1c23eeebe9')
b2sums=('2efb72b04f3e6fd5365d0d4f8fda12fcaa6fd2008cb17fdc76a679b4bff965040d30465cf78dc0a2cec2e02430100b5e6cc1f4ec4102326805a6d9bd52c38b10')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable failing test: https://github.com/sethmlarson/truststore/issues/124
    --deselect tests/test_api.py::test_trustme_cert_loaded_via_capath
    # do not run tests that require network access
    # NOTE: not available in 0.8.0 yet
    # -m 'not internet'
  )
  cd $_name-$pkgver
  PYTHONPATH=src pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
