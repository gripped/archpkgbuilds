# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-maxminddb
pkgver=2.5.0
_commit=e672eb88d1a25012a322c183aea34714234b7f64
pkgrel=1
pkgdesc="Reader for the MaxMind DB format"
url="https://github.com/maxmind/MaxMind-DB-Reader-python"
license=('Apache')
arch=('x86_64')
depends=('python' 'libmaxminddb')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'python-setuptools-scm')
checkdepends=('python-pytest')
source=("git+https://github.com/maxmind/MaxMind-DB-Reader-python.git#commit=$_commit"
        "git+https://github.com/maxmind/MaxMind-DB.git"
        "git+https://github.com/maxmind/libmaxminddb.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd MaxMind-DB-Reader-python
  git config submodule.tests/data.url "$srcdir"/MaxMind-DB
  git config submodule.extension/libmaxminddb.url "$srcdir"/libmaxminddb
  git -c protocol.file.allow=always submodule update --init
}

build() {
  cd MaxMind-DB-Reader-python
  python -m build -nw
}

check() {
  cd MaxMind-DB-Reader-python
  python -m installer -d tmp_install dist/*.whl
  PYTHONPATH=tmp_install/usr/lib/python3.11/site-packages pytest
}

package() {
  cd MaxMind-DB-Reader-python
  python -m installer -d "$pkgdir" dist/*.whl
}
