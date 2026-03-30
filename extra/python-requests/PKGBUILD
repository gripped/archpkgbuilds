# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-requests
pkgver=2.33.0
pkgrel=1
pkgdesc='Python HTTP for Humans'
arch=(any)
url=https://requests.readthedocs.io/
license=(Apache-2.0)
depends=(
  ca-certificates
  python
  python-charset-normalizer
  python-idna
  python-urllib3
  python-certifi
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pysocks
  python-pytest-httpbin
  python-trustme
)
optdepends=(
  'python-chardet: alternative character encoding library'
  'python-pysocks: SOCKS proxy support'
)
source=("$pkgname::git+https://github.com/psf/requests#tag=v$pkgver")
sha512sums=('1faaf80076e9bf466d83a62afaba5163014ddcab292547662ec88b1c6a20f9e2fffbb28e4f8354808868ec272039bb1b40c6bc45b56cf9e0bad8d00a1770f489')
b2sums=('60fc5f91c9110af440a5a643806beec0fe3176835fdbd0da097d46a71a304c1b023e0988a3a97b0a3ac3e41c43a061500cd2bc2bbf3824f032394157ceff4817')
validpgpkeys=(87227E29AD9CFF5CFAC3EA6A44D3FF97B80DC864) # Nathanael Prewitt <nate.prewitt@gmail.com>

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest_options=(
    -v tests
    # test_unicode_header_name hangs
    --deselect tests/test_requests.py::TestRequests::test_unicode_header_name
    # [Errno 111] Connection refused
    --deselect 'tests/test_requests.py::TestTimeout::test_connect_timeout[timeout0]'
    --deselect 'tests/test_requests.py::TestTimeout::test_connect_timeout[timeout1]'
    --deselect 'tests/test_requests.py::TestTimeout::test_total_timeout_connect[timeout0]'
    --deselect 'tests/test_requests.py::TestTimeout::test_total_timeout_connect[timeout1]'
  )
  PYTHONPATH="$PWD/src" pytest "${pytest_options[@]}"
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
