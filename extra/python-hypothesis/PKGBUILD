# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-hypothesis
pkgver=6.138.16
pkgrel=1
pkgdesc="Advanced Quickcheck style testing library for Python"
arch=(any)
license=(MPL-2.0)
url="https://hypothesis.readthedocs.org"
_url="https://github.com/HypothesisWorks/hypothesis"
depends=(
  python
  python-attrs
  python-sortedcontainers
)
makedepends=(
  git
  python-build
  python-installer
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
source=("$pkgname::git+$_url#tag=hypothesis-python-$pkgver")
sha512sums=('ced2b36b30e319bf0098111202dffe6ffb4a697c119b801651ecf7750e57f9d9ee17ef2b6fd38aa507cff888a5d2b7bc566ed4e6362dc3c2635002a755b9f9bc')
b2sums=('03ff4f08bdbd49db67e2f04686deea9c23434ad38bc2b8ab0fd9887133ec10436268a6c52524a23bcd8a9dec29e58e194f160b1c3f59a2e69f102bb6db715d50')

prepare() {
  cd $pkgname/hypothesis-python
  # Fix test failing due to trailing space diff
  sed -i 's/def      /def/' tests/cover/test_reflection.py
}

build() {
  cd $pkgname/hypothesis-python
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname/hypothesis-python
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  local pytest_options=(
    -vv
    # Run tests in parallel, takes forever otherwise
    -n auto
    # Depends on python-hypothesis-crosshair which is not packaged,
    # for some reason --deselect does not work, so ignoring whole file
    --ignore=tests/crosshair/test_crosshair.py
    # Fails with AssertionError for some reason
    --ignore=tests/nocover/test_scrutineer.py

    # Fails for some reason
    --ignore=tests/pytest/test_capture.py # ::test_healthcheck_traceback_is_hidden
    --ignore=tests/pytest/test_fixtures.py # ::test_given_fails_if_already_decorated_with_fixture

    -W=ignore::DeprecationWarning
  )
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest \
    "${pytest_options[@]}" tests/
}

package() {
  cd $pkgname/hypothesis-python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
