# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-h2
pkgver=4.4.0
pkgrel=1
pkgdesc="HTTP/2 State-Machine based protocol implementation"
arch=('any')
license=('MIT')
url="https://hyper.rtfd.org"
depends=('python-hpack' 'python-hyperframe')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-hypothesis')
source=("git+https://github.com/python-hyper/h2.git#tag=v$pkgver")
sha512sums=('8f91735ab8773698013b99748c9b08d8fb0e7f850d1bc2751224819b3bf4c79b62236a970b3dc60edcc1e223c2a86406c7cfbef65cdc017b2ba8c669173276c8')

build() {
  cd h2
  python -m build --wheel --no-isolation
}

check() {
  cd h2
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd h2
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
