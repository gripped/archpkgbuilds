# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=LibCST
pkgname=python-libcst
pkgver=1.5.1
pkgrel=2
pkgdesc="A concrete syntax tree parser and serializer library for Python that preserves many aspects of Python's abstract syntax tree"
arch=('x86_64')
url='https://github.com/Instagram/LibCST'
license=('MIT')
depends=('glibc' 'gcc-libs' 'python' 'python-pyyaml')
makedepends=('python-build' 'python-installer'
             'python-setuptools-rust' 'python-setuptools-scm' 'python-wheel')
#checkdepends=('python-hypothesis' 'python-hypothesmith')
#source=("https://pypi.io/packages/source/l/libcst/libcst-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cd400126ad2c1d4d41866ea9306de153790391c589bd1f07acb326be728b7a9fa0a545e2b2b8c19c33c8a59375003f92030ce07b04bee7dc201632ffd1c34cd3')

#prepare() {
#  cd $_pkgname-$pkgver
#
#  sed -i '/pyre.*start/d' scripts/regenerate-fixtures.py
#  python scripts/regenerate-fixtures.py
#}

build() {
  cd $_pkgname-$pkgver

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

#check() {
#  cd $_pkgname-$pkgver
#
#  python -m venv --system-site-packages testenv
#  python -m installer --prefix=testenv dist/*.whl
#
#  testenv/bin/python -m libcst.tests
#}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # remove tests
  rm -rfv "$pkgdir"/usr/lib/python*/site-packages/libcst/tests/
  rm -rfv "$pkgdir"/usr/lib/python*/site-packages/libcst/**/tests/
}

# vim:set ts=2 sw=2 et:
