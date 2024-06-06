# Maintainer:
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=hypothesis
_alt_name=$_name-python
pkgname=python-hypothesis
pkgver=6.103.1
_version=$_alt_name-$pkgver
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
source=($_name-$_version.tar.gz::$_url/archive/$_version.tar.gz)
sha512sums=('19e3bd48380ab8a4ce931437e68b224f77441b8c7da99832a18ec1cdeca9609675b8ba19110df33db45ff5c06a1065d21807436e86afe89366510ea36e7f548d')
b2sums=('7c7df97ff5702103c3e02d664732cdb2beb32acc51a385b086cd64763822ef8938a75feb522d62335b3392517f8756f60c73d5c681d3cbdf814659a27c94746c')

build() {
  cd $_name-$_version/$_alt_name
  python -m build -nw
}

check() {
  local pytest_options=(
    -vv
    # disable failing tests: https://github.com/HypothesisWorks/hypothesis/issues/3704
    # for some reason --deselect does not work, so ignoring whole file
    --ignore tests/patching/test_patching.py
    --ignore tests/ghostwriter/test_expected_output.py
    --ignore tests/cover/test_error_in_draw.py
    --ignore tests/redis/test_redis_exampledatabase.py
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$_version/$_alt_name
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  export PATH="$PWD/test_dir/usr/bin:$PATH"
  pytest "${pytest_options[@]}" tests/
}

package() {
  cd $_name-$_version/$_alt_name
  python -m installer -d "$pkgdir" dist/*.whl
}
