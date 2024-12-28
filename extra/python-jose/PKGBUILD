# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jose
pkgver=3.3.0
pkgrel=9
pkgdesc="A JOSE implementation in Python"
arch=('any')
license=('MIT')
url="https://github.com/mpdavis/python-jose"
depends=('python-rsa' 'python-ecdsa')
optdepends=('python-cryptography: one option for better performance'
            'python-pycryptodome: one option for better performance')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-cryptography' 'python-pycryptodome' 'python-pytest')
source=("https://github.com/mpdavis/python-jose/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "fix-test-ec-compat.patch")
sha512sums=('de7147cc6e12406d6e459c32829acae46395acba727c53e65bc05f4794ee3050eecd355e3ae2e87f4ebdbd871f53822eea08a10f25d7ca6088fc6128dc7d9637'
            '32e57e1d403aac51c7d3044592ff5aaa2e611227d0cc93c270d08a201c4df7e98d3ae4e581b93d865e448d75d8cf78cff9896a8bd1ba4c2f622026e9b7a407b4')

prepare() {
  cd python-jose-$pkgver
  patch -Np1 < ../fix-test-ec-compat.patch
}

build() {
  cd python-jose-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd python-jose-$pkgver
  pytest
}

package() {
  cd python-jose-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
