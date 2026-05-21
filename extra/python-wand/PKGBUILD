# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-wand
pkgver=0.7.1
pkgrel=1
pkgdesc="Ctypes-based simple MagickWand API binding for Python"
url="https://github.com/emcconville/wand"
license=('MIT')
arch=('any')
depends=('imagemagick' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('libjpeg-turbo' 'python-pytest')
source=("git+https://github.com/emcconville/wand.git#tag=$pkgver")
sha512sums=('08178ed9e7fac2d8f8e71d85ea8db0a0fc807c549e70fb2cba76f1275ca5186425a19926f4d0a6e63f46bea5f0fe0139eeb3b78feedd7457b978b32f74cec37e')

build() {
  cd wand
  PYTHONPATH="$PWD" python -m build --wheel --no-isolation
}

check() {
  cd wand
  pytest
}

package() {
  cd wand
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
