# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-maxminddb
pkgver=2.6.0
pkgrel=1
pkgdesc="Reader for the MaxMind DB format"
url="https://github.com/maxmind/MaxMind-DB-Reader-python"
license=('Apache')
arch=('x86_64')
depends=('python' 'libmaxminddb')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'python-setuptools-scm')
checkdepends=('python-pytest')
source=("git+https://github.com/maxmind/MaxMind-DB-Reader-python.git#tag=v$pkgver"
        "git+https://github.com/maxmind/MaxMind-DB.git"
        "git+https://github.com/maxmind/libmaxminddb.git")
sha512sums=('3c52d1ee2ef95a27e507a422f093a7ea865e4c08ed3b02cec7be6ca5e12f131badd3739a293860e71a47fb8d9366e8b5fcd3c8de0af823d7cb768a9fb24b4958'
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
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH=tmp_install/usr/lib/python${python_version}/site-packages pytest
}

package() {
  cd MaxMind-DB-Reader-python
  python -m installer -d "$pkgdir" dist/*.whl
}
