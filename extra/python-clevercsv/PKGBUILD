# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-clevercsv
pkgver=0.8.3
pkgrel=2
pkgdesc="A Python package for handling messy CSV files"
url="https://github.com/alan-turing-institute/CleverCSV"
license=('MIT')
arch=('x86_64')
depends=('python-chardet' 'python-regex' 'python-packaging')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-pandas' 'python-tabview' 'python-wilderness' 'python-cchardet')
checkdepends=('python-pytest' 'python-pandas' 'python-tabview' 'python-wilderness'
              'python-faust-cchardet' 'python-termcolor')
source=("git+https://github.com/alan-turing-institute/CleverCSV.git#tag=v$pkgver")
sha512sums=('eeaf9fddf0f8d2924f22bbf616747f920a208ece49ba5c233d4789d0871e5aa17cf6b6d54790e35a686a4c1bcafc0f7e2719958599fa338bdfc6f1c2f75831ee')

build() {
  cd CleverCSV
  python -m build --wheel --no-isolation
}

check() {
  cd CleverCSV
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="build/lib.linux-x86_64-cpython-${python_version}" pytest
}

package() {
  cd CleverCSV
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir "$pkgdir"/usr/share
  mv "$pkgdir"/usr/man "$pkgdir"/usr/share/man 

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
