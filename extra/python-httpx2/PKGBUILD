# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgbase=python-httpx2
pkgname=(
  python-httpx2
  python-httpcore2
)
pkgver=2.12.0
pkgrel=1
pkgdesc="A next generation HTTP client for Python"
arch=(any)
url="https://github.com/pydantic/httpx2"
license=(BSD-3-Clause)
makedepends=(
  git
  python-build
  python-hatch-fancy-pypi-readme
  python-hatchling
  python-installer
  python-uv-dynamic-versioning
)
checkdepends=(
  python-anyio
  python-brotli
  python-brotlicffi
  python-chardet
  python-click
  python-cryptography
  python-h11
  python-h2
  python-idna
  python-pygments
  python-pytest
  python-pytest-httpbin
  python-pytest-trio
  python-rich
  python-socksio
  python-starlette
  python-trio
  python-trustme
  python-truststore
  python-websockets
  python-werkzeug
  python-wsproto
  python-zstandard
  uvicorn
)
source=("$pkgbase::git+$url#tag=v$pkgver")
sha512sums=('125af9ef14e03a252215b6e7e9bca1bb953378f177583e5a42ee9390a281742a7e6ec9900a692fe172d957eacbc7164a8aba780d5c6973ecb9feb66b1f5ce843')
b2sums=('eb6b85b0d3673cc1066d9aa70f4d1744a627e270acd322b947da77aee4120dc01b5ca4869c27015ca433db9e0b3d9dd7a31da6788a26bd368d146458586c9278')

build() {
  cd $pkgbase
  python -m build --wheel --no-isolation --outdir dist src/httpcore2
  python -m build --wheel --no-isolation --outdir dist src/httpx2
}

check() {
  local pytest_args=(
    -m "not network and not benchmark"
    # These autodetect/charset tests assert the exact result returned by
    # chardet's heuristics, which varies between chardet releases.
    --deselect tests/httpx2/client/test_client.py::test_client_decode_text_using_autodetect
    --deselect tests/httpx2/client/test_client.py::test_client_decode_text_using_explicit_encoding
    --deselect tests/httpx2/models/test_responses.py::test_response_decode_text_using_autodetect
    --deselect tests/httpx2/models/test_responses.py::test_response_no_charset_with_cp_1252_content
    --deselect tests/httpx2/test_decoders.py::test_text_decoder_with_autodetect
    # DeprecationWarning: 'isolated_filesystem' is deprecated and will be removed in Click 9.0. 
    -W ignore::DeprecationWarning
  )

  cd $pkgbase
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_args[@]}"
}

package_python-httpx2() {
  depends=(
    python
    python-httpcore2
    python-idna
    python-truststore
  )
  optdepends=(
    'python-brotli: for brotli response decompression'
    'python-brotlicffi: for brotli response decompression'
    'python-click: command line client support'
    'python-h2: HTTP/2 support'
    'python-pygments: command line client support'
    'python-rich: command line client support'
    'python-socksio: SOCKS proxy support'
    'python-trio: alternative async library'
    'python-wsproto: WebSocket support'
    'python-zstandard: for zstd response decompression'
  )

  cd $pkgbase
  python -m installer --destdir="$pkgdir" dist/httpx2-*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}

package_python-httpcore2() {
  pkgdesc="A minimal low-level HTTP client for Python"
  depends=(
    python
    python-h11
    python-truststore
  )
  optdepends=(
    'python-anyio: asyncio support'
    'python-h2: HTTP/2 support'
    'python-socksio: SOCKS proxy support'
    'python-trio: trio async support'
  )

  cd $pkgbase
  python -m installer --destdir="$pkgdir" dist/httpcore2-*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
