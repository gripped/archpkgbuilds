# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-wand
pkgver=0.6.12
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
sha512sums=('8badf7240d5173a7990f9388a9d1460cb4844aad5f9e42a4a7e00c639f987a75affd3691de63ae30e718be194b9348ad87c9034920ce030cbad13b30025b6751')

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
