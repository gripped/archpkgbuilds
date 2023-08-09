# Maintainer:
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=hypothesis
_alt_name="${_name}-python"
pkgname=python-hypothesis
pkgver=6.82.3
_version="${_alt_name}-${pkgver}"
pkgrel=1
pkgdesc="Advanced Quickcheck style testing library for Python"
arch=(any)
license=(MPL)
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
source=("$_name-$_version.tar.gz::$_url/archive/$_version.tar.gz")
sha512sums=('02b649116630dc6be3cbd659a00c9c55d68c85a9cbf029558fc1c065909a1cadd2fb120615fa3bf7fe4a11f51d26d264cf6730ac4d3165798668d38e62c5d955')
b2sums=('bb73131f9982e8df71e24a5f329a2f34b7e895ffa231d55724f84a3d692608e59a4494a820ea5ee449db4c40f2521548b2dece2f1bcfa9fbd4f0ddbc4dbb9756')

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
