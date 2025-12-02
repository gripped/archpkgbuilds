# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: icasdri <icasdri at gmail dot com>
# Contributor: hexchain <i@hexchain.org>

pkgname=mypy
pkgver=1.19.0
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
sha256sums=('afe9fcb2618256a7b0d778b9509e94f6c86309b639f9a8e3492a482db7706d34'
            '4f270a2ab4e20366ae2ebc912c2589edd070f488a224d2a6b3209c731c3a28f9')

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
