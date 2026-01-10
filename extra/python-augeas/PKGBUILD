# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-augeas
pkgver=1.1.0
pkgrel=11
pkgdesc="Python bindings for Augeas"
arch=('any')
license=('LGPL-2.1-or-later')
url="https://augeas.net"
depends=('augeas' 'python-cffi')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/python-augeas/python-augeas-$pkgver.tar.gz")
sha512sums=('34e4e98219b9146ef843d94c2e854e951a9b7e81409e603e77e7defdbb8765c013a2c869a4f5db2244352ca35656e18667a0210dd24099cb3e4552a04b23aef8')

build() {
  cd python-augeas-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd python-augeas-$pkgver
  python -m unittest discover -v
}

package() {
  cd python-augeas-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
