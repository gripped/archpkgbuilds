# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-waitress
pkgver=3.0.1
pkgrel=1
pkgdesc="Waitress WSGI server"
arch=('any')
license=('ZPL-2.1')
url="https://github.com/Pylons/waitress"
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/Pylons/waitress.git#tag=v$pkgver")
sha512sums=('04100440db7dab0dcca5f6b09739dd0984f5205134546da1f8abb562ea7689e0e201f6bf7697e76199de50c9c266c3dc37fc829bf009235ac80ab817c518e204')

build() {
  cd waitress
  python -m build --wheel --no-isolation
}

check() {
  cd waitress
  PYTHONPATH="$PWD"/src pytest -o addopts=''
}

package() {
  cd waitress
  python -m installer --destdir="$pkgdir" dist/*.whl
}
