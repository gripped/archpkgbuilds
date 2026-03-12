# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-wsproto
pkgver=1.3.0
pkgrel=1
pkgdesc="WebSockets state-machine based protocol implementation"
url="https://github.com/python-hyper/wsproto"
license=('MIT')
arch=('any')
depends=('python-h11')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/python-hyper/wsproto.git#tag=$pkgver")
sha512sums=('61898257468a29c556ea00181b54f04edce0a8524af22b4f7cf93fda74063dbb2cffe66f780ae725d351a34e984e3325c60601fcd63ce1cd3f441fcdb913a4c6')

build() {
  cd wsproto
  python -m build --wheel --no-isolation
}

check() {
  cd wsproto
  PYTHONPATH="$PWD"/src pytest
}

package() {
  cd wsproto
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
