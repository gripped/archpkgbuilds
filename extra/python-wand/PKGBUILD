# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-wand
pkgver=0.6.13
pkgrel=1
pkgdesc="Ctypes-based simple MagickWand API binding for Python"
url="https://github.com/emcconville/wand"
license=('MIT')
arch=('any')
depends=('imagemagick' 'libxml2' 'python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-forked' 'python-pytest-xdist'
              'python-psutil' 'ghostscript' 'librsvg')
source=("git+https://github.com/emcconville/wand.git#tag=$pkgver")
sha512sums=('ee4f80ba80ea8390693c7c9dcba9d48a98e553fd8dca22a38020f2fc8d808281db77207d9fe98174d7793d151e188ef7ac6bcd7b1256cad657ae5b7f404b8f51')

build() {
  cd wand
  python setup.py build
}

check() {
  cd wand
  pytest --deselect tests/image_methods_test.py::test_forward_fourier_transform \
         --deselect tests/image_methods_test.py::test_inverse_fourier_transform
}

package() {
  cd wand
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
