# Maintainer: David Runge <dvzrv@archlinux.org>

_name=truststore
pkgname=python-truststore
pkgver=0.10.3
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
sha512sums=('64db26581aab8a010382f99b7609b46f4b6508b89430c75398d5f7c3f07b8bf666b12d7f82ff407aa163fbd614eaf309a00c8aac55eae0f7c031a4f66c9822de')
b2sums=('b7731c471d749c2e685a84964d64afda93161d55fe74316da465ded4dabba01656b4e51e95b41cd0ce9e2745472f2835c5b2ad2cd4e393fa3891ee83bba54fa3')

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
