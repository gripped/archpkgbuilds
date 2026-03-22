# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-google-auth-httplib2
pkgver=0.3.0
pkgrel=1
pkgdesc="Google Authentication Library: httplib2 transport"
url="https://github.com/googleapis/google-auth-library-python-httplib2"
license=('Apache-2.0')
arch=('any')
depends=('python-google-auth' 'python-httplib2')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-flask' 'python-pytest-localserver')
source=("git+https://github.com/googleapis/google-auth-library-python-httplib2.git#tag=v$pkgver")
sha512sums=('2679392b877a67edcdd45e970f3ef0a08d0674314f04912dde4f62a2400d1e0d3edcc87ead2ff13df5704afabad9f295032f2517d7a89e7a24883b67b23fdf2d')

build() {
  cd google-auth-library-python-httplib2
  python -m build --wheel --no-isolation
}

check() {
  cd google-auth-library-python-httplib2
  pytest
}

package() {
  cd google-auth-library-python-httplib2
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
