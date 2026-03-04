# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cython-test-exception-raiser
pkgver=25.11.1
pkgrel=1
pkgdesc="A trivial extension that just raises an exception"
url="https://github.com/twisted/cython-test-exception-raiser"
license=('MIT')
arch=('x86_64')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'cython')
source=("git+https://github.com/twisted/cython-test-exception-raiser.git#tag=$pkgver")
sha512sums=('342fb9adad0d770a034dba2c695aae33f13a4a704a211e735dcac31a519e8ad339682223c965be50d18b2528883559ebcb08d0b2cdd62675e477862374ad4ede')

build() {
  cd cython-test-exception-raiser
  python -m build --wheel --no-isolation
}

package() {
  cd cython-test-exception-raiser
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
