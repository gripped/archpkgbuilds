# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-httpx-aiohttp
pkgver=0.1.6
pkgrel=2
pkgdesc='aiohttp-powered httpx client'
arch=(any)
url=https://github.com/karpetrosyan/httpx-aiohttp
license=(BSD-3-Clause)
depends=(
  python
  python-aiohttp
  python-httpx
)
makedepends=(
  git
  python-build
  python-hatch-fancy-pypi-readme
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-brotli
  python-brotlicffi
  python-chardet
  python-h2
  python-pytest
  python-trio
  python-trustme
  python-zstandard
  uvicorn
)
source=("git+$url.git#tag=$pkgver")
b2sums=('42abf64362a8d0e19b9e7e25ad873143b44ed2d422fa70c5695929818b323d3ff0d00d258a45b9d2eb9348aeb44e015a10ad0aafd3b7cf3f19bfb542ac0ad1f4')

prepare() {
  cd "$srcdir/${pkgname#python-}"
  rm -vr tests/httpx/
  ln -vs /usr/share/python-httpx tests/httpx
}

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python scripts/run_tests.py \
    -k 'not [trio]' \
    --deselect tests/client/test_async_client.py::test_get_invalid_url \
    --deselect tests/client/test_proxies.py::test_proxies_environ \
    --deselect tests/client/test_proxies.py::test_socks_proxy \
    --deselect tests/test_main.py \
    --deselect tests/test_timeouts.py
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
