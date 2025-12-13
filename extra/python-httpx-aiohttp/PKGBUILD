# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-httpx-aiohttp
pkgver=0.1.12
pkgrel=1
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
b2sums=('68421ee8998a5257ad145d5ad02e061435c312aed80272b94f33978d47c85766ed35c59716af81b8536f7783b30b2fdf1778a4fe991cc7fadfaabc4b802948eb')

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
  test-env/bin/python scripts/httpx_test.py \
    -k 'not [trio]' \
    --deselect 'tests/client/test_async_client.py::test_get_invalid_url' \
    --deselect 'tests/client/test_proxies.py::test_proxies_environ' \
    --deselect 'tests/client/test_proxies.py::test_socks_proxy' \
    --deselect 'tests/httpx/tests/client/test_proxies.py::test_async_proxy_close[asyncio]' \
    --deselect 'tests/test_main.py' \
    --deselect 'tests/test_timeouts.py'
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
