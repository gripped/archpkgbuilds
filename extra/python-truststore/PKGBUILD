# Maintainer: David Runge <dvzrv@archlinux.org>

_name=truststore
pkgname=python-truststore
pkgver=0.10.0
pkgrel=3
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
sha512sums=('eb1b16f093f32ff8be29bb696e92843823a8ffe2e7428ea989ee987d94d7328b5c40d6d8e5aa25eb223ca348ca30b29018decaec11d6106221753fd4525aa5b0')
b2sums=('cf83a6936e361bb08f399ea5f6739acbe254dab380b06cf4befab8e1084e01d0757afd02eb0b9718963b4249280e2fa629b079eea143a7d3c5bda3767d4e0611')

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
