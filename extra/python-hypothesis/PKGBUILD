# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-hypothesis
_name=${pkgname#python-}
pkgver=6.157.0
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
sha512sums=('cc6c06df8424464b53a31f3e64b5b43fe5eb5129c2c11ce1fe6b4608ab70cd85b8137e54114cf3ddd05e7517deea7e91f267b5f5eee6e9d9690662d0d52372a9')
b2sums=('ee60e14e4a86af44278dbefc1f1b8f8e833ab8f0b2be1a4bc766e940b0dc5af27b50ae368f642cc20ca42dcbddc665b36ae967ebc99933c0454421f099ef59ec')

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
