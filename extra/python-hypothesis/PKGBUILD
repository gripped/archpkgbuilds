# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-hypothesis
pkgver=6.125.2
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
  python-dpcontracts
  python-django
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
)
source=("$pkgname::git+$_url#tag=hypothesis-python-$pkgver")
sha512sums=('13d09f623d33eab3446c5804b2e6f687999ac52aed326abf2cc968f69328d882cd186f468eff129b323eec215780ab0bc32fa4ee6ab0f6698c85a471622eab21')
b2sums=('70543e237eb885475822d50e8b0e6b768087f13467259eeac600b7e717e00174abd916a136707dee94d6cab99098448fc5e0a61a9b2fc0c7a4b23bb079017cf2')

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
  local pytest_options=(
    -vv
    # Depends on python-hypothesis-crosshair which is not packaged,
    # for some reason --deselect does not work, so ignoring whole file
    --ignore tests/crosshair/test_crosshair.py
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname/hypothesis-python
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages"
  export PATH="$PWD/test_dir/usr/bin:$PATH"
  pytest "${pytest_options[@]}" tests/
}

package() {
  cd $pkgname/hypothesis-python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
