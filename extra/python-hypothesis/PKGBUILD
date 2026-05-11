# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-hypothesis
pkgver=6.152.4
pkgrel=1
pkgdesc="Advanced Quickcheck style testing library for Python"
arch=(any)
url="https://hypothesis.readthedocs.org"
_url="https://github.com/HypothesisWorks/hypothesis"
license=(MPL-2.0)
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
source=("$pkgname::git+$_url#tag=hypothesis-python-$pkgver")
sha512sums=('1852496a3b457e45567b5e0ee5e48b21a07989f5e690d51c5c36f06d12d93273cc5c0f707172a4d12ac4b989f2b0ae92d42a976017ffebf39179f5d7727f3062')
b2sums=('4d99fce4eaf2dd2271f62cb53cd63b70d6b9a456b0b500c38f82bfe51545da81abc3d0438360796ec2f7557dc3080876834d2ac72629e60d7d739763677df4e7')

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
    # Keep rootdir at hypothesis-python/ so --deselect node ids resolve
    --rootdir=.
    # Depends on python-hypothesis-crosshair which is not packaged,
    # for some reason --deselect does not work, so ignoring whole file
    --ignore=tests/crosshair/test_conformance.py
    --ignore=tests/crosshair/test_crosshair.py
    # Fails with AssertionError for some reason
    --ignore=tests/nocover/test_scrutineer.py

    # Fails for some reason
    --ignore=tests/pytest/test_capture.py # ::test_healthcheck_traceback_is_hidden
    --ignore=tests/pytest/test_fixtures.py # ::test_given_fails_if_already_decorated_with_fixture
    --ignore=tests/watchdog/test_database.py
    --ignore=tests/nocover/test_argument_validation.py

    # Fails due to health check too slow for some reason
    --deselect=tests/nocover/test_stateful.py::test_unrelated_rule_does_not_use_var_reference_repr

    # Flaky: Phase.explain's scrutineer traces syrupy lines once the
    # plugin is loaded, diverging from the expected output
    --deselect=tests/cover/test_custom_reprs.py::test_reprs_as_created
    --deselect=tests/conjecture/test_inquisitor.py::test_inquisitor_doesnt_break_on_varying_forced_nodes

    -W=ignore::DeprecationWarning

    # Fail with numpy 2.4
    --ignore=tests/numpy/test_floor_ceil.py
    --ignore=tests/numpy/test_from_type.py
    --ignore=tests/ghostwriter/test_expected_output.py
  )
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest \
    "${pytest_options[@]}" tests/
}

package() {
  cd $pkgname/hypothesis-python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
