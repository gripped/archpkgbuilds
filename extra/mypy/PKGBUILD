# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: icasdri <icasdri at gmail dot com>
# Contributor: hexchain <i@hexchain.org>

pkgname=mypy
pkgver=1.20.2
pkgrel=1
pkgdesc='Optional static typing for Python (PEP484)'
arch=('any')
url="http://www.mypy-lang.org/"
license=('MIT')
depends=(
  'python'
  'python-librt'
  'python-mypy_extensions'
  'python-orjson'
  'python-pathspec'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-attrs'
  'python-filelock'
  'python-psutil'
  'python-pytest'
  'python-pytest-xdist'
  'python-tests'
)
optdepends=(
  'python-lxml: for reports'
  'python-pip: for installing missing types'
  'python-psutil: for dmypy'
  'python-setuptools: for mypyc'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/python/mypy/archive/v$pkgver.tar.gz"
  "$pkgname-exclude-tests.patch"
)
b2sums=('cc28ad8a145d27dd4f6f395496e44ed80859df634e89fe7d584975107534cf063db97817b5b94665e2b7629ca1fa67c75c0ed2978237f10d68606c33bc6e79d3'
        '83b6d12dac919b917ba13c6a5b6da6e4cd6dc517f85b4f8e81d793d9c0e871af5a48708c4a5a54c45c7be89c5ed394b2f77007be89420fea4a1f3ca1efb04c0d')

prepare() {
  cd "$pkgname-$pkgver"
  # -Werror, not even once
  sed -e '/Werror/d' -i mypyc/build.py
  patch -Np1 < ../$pkgname-exclude-tests.patch
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$pkgname-$pkgver"
  # CFLAGS being set interferes with the following tests somehow, regardless
  # what it's set to:
  #   mypyc/test/test_run.py::TestRun::run-bools.test::testBoolOps
  #   mypyc/test/test_run.py::TestRun::run-i64.test::testI64GlueMethodsAndInheritance
  #   mypyc/test/test_run.py::TestRun::run-i64.test::testI64BasicOps
  #   mypyc/test/test_run.py::TestRun::run-i64.test::testI64DefaultArgValues
  #   mypyc/test/test_run.py::TestRun::run-i64.test::testI64ErrorValuesAndUndefined
  unset CFLAGS
  pytest -vv
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
