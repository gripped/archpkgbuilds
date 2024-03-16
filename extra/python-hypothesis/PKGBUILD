# Maintainer:
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=hypothesis
_alt_name=$_name-python
pkgname=python-hypothesis
pkgver=6.99.6
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
sha512sums=('d78c9086a6e5de8b80ec544047d70436053934a3f2b822f8389881e3679b1b7c6a26f653723f97ecf4c462b91183c35f07ffa79e6126e03926507981a6893e19')
b2sums=('ea518d35aa62eb23b6859965ee5acadb12e1e6eec1e5c04b98aef5fec6f4b4e97f3c98f7c16bd07cc1e74d41040a9eabb6091c24c7132cefc2f02a94d3fe9df4')

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
