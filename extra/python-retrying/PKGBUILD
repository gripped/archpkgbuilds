# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arvedui <arvedui@posteo.de>

pkgname=python-retrying
pkgver=1.4.1
pkgrel=1
pkgdesc="A general-purpose retrying library"
arch=('any')
url="https://github.com/groodt/retrying"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/groodt/retrying.git#tag=v$pkgver")
sha512sums=('c0f47c9ff5f9fde617466e64602cd2272e6558606cf4c9212d1e1980dcf899cd1c7992426303a4b3a07ed7ff8bfd557245fe614394f5c7782425d9aa12e90461')

build() {
  cd retrying
  python -m build --wheel --no-isolation
}

check() {
  cd retrying
  python -m unittest -v
}

package() {
  cd retrying
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
