# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-google-auth-httplib2
pkgver=0.4.1
pkgrel=1
pkgdesc="Google Authentication Library: httplib2 transport"
url="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-auth-httplib2"
license=('Apache-2.0')
arch=('any')
depends=('python-google-auth' 'python-httplib2')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-flask' 'python-pytest-localserver')
source=("git+https://github.com/googleapis/google-cloud-python.git#tag=google-auth-httplib2-v$pkgver")
sha512sums=('ee49bec6a197bc3f376d8d8128cc8913b2adcc74f9cf695be2a3341391eaa9ee4a76317d9a502b89b8eb8955ffa696442cb2d2d6e9e8c9d8bb0ce141fe04f38a')

build() {
  cd google-cloud-python/packages/google-auth-httplib2
  python -m build --wheel --no-isolation
}

check() {
  cd google-cloud-python/packages/google-auth-httplib2
  pytest
}

package() {
  cd google-cloud-python/packages/google-auth-httplib2
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
