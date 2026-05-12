# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-requests
pkgver=2.34.0
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
sha512sums=('4258ffedf293dd5be413ed651774cad42eae7ebb868de0cbe952ffc7fcdab782292d5def61dc0608c2da5bda292f9fcb0cd5740272b770af35786f0f48b56e45')
b2sums=('109761e78e7d115ac46db92effada19b90bd78a2feb5538fb4a2c6b1473aa257ca79c2a970cc1ebf3ef9b27eb9c3a2253eb32b2d7b52fd4700b5a6e213a819dd')
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
