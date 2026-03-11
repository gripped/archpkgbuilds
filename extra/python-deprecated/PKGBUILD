# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-deprecated
pkgver=1.3.0
pkgrel=1
pkgdesc="Python @deprecated decorator to deprecate old python classes, functions or methods"
url="https://github.com/tantale/deprecated"
license=('MIT')
arch=('any')
depends=('python' 'python-wrapt')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/tantale/deprecated.git#tag=v$pkgver")
sha512sums=('ff6639b6c8251bfa017154386f382e49b4ae2a799a64a70a28ba9834d8a0abe3fb2b28762d3d1015b5ec3bbf826d385f84bf39e405061c9cb395f58d7d93413f')

build() {
  cd deprecated
  python -m build --wheel --no-isolation
}

check() {
  cd deprecated
  pytest
}

package() {
  cd deprecated
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname/
}
