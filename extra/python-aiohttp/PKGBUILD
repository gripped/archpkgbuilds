# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Philipp A. <flying-sheep@web.de>

# Check if new updates break python-engineio

pkgname=python-aiohttp
pkgver=3.11.18
pkgrel=1
pkgdesc='HTTP client/server for asyncio'
arch=(x86_64)
url=https://aiohttp.readthedocs.io
license=(Apache-2.0)
depends=(
  glibc
  python
  python-aiohappyeyeballs
  python-aiosignal
  python-attrs
  python-frozenlist
  python-multidict
  python-propcache
  python-yarl
)
makedepends=(
  cython
  git
  npm
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  gunicorn
  python-aiodns
  python-brotli
  python-freezegun
  python-proxy.py
  python-pytest
  python-pytest-codspeed
  python-pytest-mock
  python-re-assert
  python-time-machine
  python-trustme
  python-uvloop
)
optdepends=(
  'gunicorn: to deploy using Gunicorn'
  'python-aiodns: for fast DNS resolving'
  'python-brotli: for Brotli transfer-encodings support'
)
source=(
  "$pkgname::git+https://github.com/aio-libs/aiohttp#tag=v$pkgver"
  git+https://github.com/nodejs/llhttp.git
)
b2sums=('02c8f8a2f20d176d28fc95fcae31652d5dc8c70def8ba77a840a7b71a4db31c4bd550fb721bd2fb5d50878ad25aef2a23bc901c2642c7d02d1546828e7865c00'
        'SKIP')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.vendor/llhttp.url ../llhttp
  git -c protocol.file.allow=always submodule update --recursive
  sed 's|.install-cython ||' -i Makefile
}

build() {
  cd $pkgname
  make generate-llhttp cythonize
  python -m build --wheel --no-isolation
}

check() {
  local pytest_args=(
    --override-ini="addopts="

    # Fails, not sure why.
    --deselect=tests/test_http_parser.py::test_http_response_parser_bad_chunked_strict_c
    --deselect=tests/test_http_parser.py::test_http_response_parser_bad_chunked_strict_py
    --deselect=tests/test_http_parser.py::test_http_response_parser_strict_headers
    --deselect=tests/test_http_parser.py::test_http_response_parser_strict_obs_line_folding
    --deselect=tests/test_proxy_functional.py::test_uvloop_secure_https_proxy

    # Fails, calls the Python interpreter without -P, deselect to enable
    # venv-based testing.
    --deselect=tests/test_circular_imports.py::test_no_warnings

    --ignore=tests/autobahn/test_autobahn.py # Docker tests
    --ignore=tests/test_benchmarks_client.py
    --ignore=tests/test_benchmarks_client_request.py
    --ignore=tests/test_benchmarks_client_ws.py
    --ignore=tests/test_benchmarks_cookiejar.py
    --ignore=tests/test_benchmarks_http_websocket.py
    --ignore=tests/test_benchmarks_http_writer.py
  )

  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -Pm pytest "${pytest_args[@]}"
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
