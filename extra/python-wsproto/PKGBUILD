# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-wsproto
pkgver=1.3.1
pkgrel=1
pkgdesc="WebSockets state-machine based protocol implementation"
url="https://github.com/python-hyper/wsproto"
license=('MIT')
arch=('any')
depends=('python-h11')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/python-hyper/wsproto.git#tag=$pkgver")
sha512sums=('af4ecf4a2ea2f68104b173ddcbae34146dd5b5ee97358f18eddcb712ffa02402d631661308e7f2b0362a676f0729bd08ed59f683e8e31afc46e48412d3e66485')

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
