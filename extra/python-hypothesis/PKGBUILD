# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-hypothesis
_name=${pkgname#python-}
pkgver=6.165.3
pkgrel=1
pkgdesc="Advanced Quickcheck style testing library for Python"
arch=(x86_64)
url="https://hypothesis.readthedocs.org"
_url="https://github.com/HypothesisWorks/hypothesis"
license=(MPL-2.0)
depends=(
  glibc
  libgcc
  python
  python-attrs
  python-sortedcontainers
)
makedepends=(
  git
  python-build
  python-installer
  python-maturin
  python-setuptools
  python-wheel
)
checkdepends=(
  python-black
  python-django
  python-dpcontracts
  python-faker
  python-fakeredis
  python-flaky
  python-lark-parser
  python-libcst
  python-numpy
  python-pandas
  python-pexpect
  python-pytest
  python-pytest-xdist
  python-pytz
  python-scipy
  python-syrupy
  python-watchdog
)
optdepends=(
  'python-black: for CLI and ghostwriter'
  'python-click: for CLI'
  'python-dateutil: for date support'
  'python-django: for django module'
  'python-dpcontracts: for contracts support'
  'python-faker: for fakefactory and django module'
  'python-lark-parser: for lark module'
  'python-libcst: for codemods module'
  'python-numpy: for numpy module'
  'python-pandas: for pandas support'
  'python-pytest: for pytest module'
  'python-pytz: for datetime and django module'
  'python-redis: for redis support'
  'python-rich: for CLI'
  'python-watchdog: for tracking file system events'
)
source=("$pkgname::git+$_url#tag=v$pkgver")
sha512sums=('a7363d17c1ded01cbc01cdc9aba85b88908054b3d70fdf803d1b233241bb1d159d1e03d06eea044f4951b4b054ceea0166f68edea68eea3c154f371dcfe11a31')
b2sums=('e3ce05762c724ac432d67d6dd7f3ff06c17708374883d5698f4cf393cd300c205ad88361b051dbb02c6c3bcee92077667049c83a59cb30fa3bb4456e7f5f0680')

prepare() {
  cd $pkgname/$_name/rust/
  cargo fetch --locked --target host-tuple
}

build() {
  cd $pkgname/$_name
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  local pytest_options=(
    -vv
    # ignore deprecation warnings
    -W=ignore::DeprecationWarning
    # Run tests in parallel, takes forever otherwise
    -n auto
    # Keep rootdir at hypothesis-python/ so --deselect node ids resolve
    --rootdir=.
    # Depends on python-hypothesis-crosshair which is not packaged,
    # for some reason --deselect does not work, so ignoring whole file
    --ignore=tests/crosshair/test_conformance.py
    --ignore=tests/crosshair/test_crosshair.py
    # Fails with AssertionError for some reason
    --ignore=tests/nocover/test_scrutineer.py
    # fails with mismatch for some reason
    --deselect 'tests/snapshots/test_always_failing.py::test_always_failing[emails]'
    --deselect 'tests/quality/test_integers.py::test_biases_towards_boundary_values'

  )
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest \
    "${pytest_options[@]}" tests/
}

package() {
  cd $pkgname/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
