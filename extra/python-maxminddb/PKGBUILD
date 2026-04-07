# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-maxminddb
pkgver=2.8.2
pkgrel=1
pkgdesc="Reader for the MaxMind DB format"
url="https://github.com/maxmind/MaxMind-DB-Reader-python"
license=('Apache-2.0')
arch=('x86_64')
depends=('python' 'libmaxminddb')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'python-setuptools-scm')
checkdepends=('python-pytest')
source=("git+https://github.com/maxmind/MaxMind-DB-Reader-python.git#tag=v$pkgver"
        "git+https://github.com/maxmind/MaxMind-DB.git"
        "git+https://github.com/maxmind/libmaxminddb.git")
sha512sums=('c297aa47d2f94a7daa89398e8299a7a1e3d2fe0760e64784265a752c9e8b8436dc4c860d3cb9976efedb9cae00abc912aee8fcd331a212df6dc128671784011e'
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
