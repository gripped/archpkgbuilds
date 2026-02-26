# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cython-test-exception-raiser
pkgver=25.11.0
pkgrel=1
pkgdesc="A trivial extension that just raises an exception"
url="https://github.com/twisted/cython-test-exception-raiser"
license=('MIT')
arch=('x86_64')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'cython')
source=("git+https://github.com/twisted/cython-test-exception-raiser.git#tag=$pkgver")
sha512sums=('c493a5ff8ec372dff83facf16cdf92c220993f95c5fd6dc9aa107e3e2848c089a66c7355497222757f3f23308a1d1f6a04fa1e600dc2c91212b25fc3d0386d91')

build() {
  cd cython-test-exception-raiser
  python -m build --wheel --no-isolation
}

package() {
  cd cython-test-exception-raiser
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
