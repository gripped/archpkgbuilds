# Maintainer:
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=hypothesis
_alt_name=$_name-python
pkgname=python-hypothesis
pkgver=6.113.0
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
sha512sums=('c8e4711b3496811fd67a20545aa4abfa5b38289befbffa3eab7d9daf155b899124e62a2771b772b009a373308a32967e8804c99a70507ee7996ab3adf92d41e0')
b2sums=('e5a87d042d409757451db19bf8b7433e78140cbc6bc9ab6dab4a02cdf2b311734fa37c03aa3b3d51a652b823a3fa554205d4f0188c2e5f2e439609132b4e17d9')

build() {
  cd $_name-$_version/$_alt_name
  python -m build -nw
}

check() {
  local pytest_options=(
    -vv
    # disable failing tests: https://github.com/HypothesisWorks/hypothesis/issues/3704
    # for some reason --deselect does not work, so ignoring whole file
    --ignore tests/conjecture/test_ir.py
    --ignore tests/ghostwriter/test_ghostwriter.py
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
