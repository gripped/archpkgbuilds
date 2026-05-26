# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-brotlicffi
pkgver=1.2.0.1
pkgrel=3
pkgdesc='Python bindings to the Brotli compression library'
arch=(x86_64)
url=https://github.com/python-hyper/brotlicffi
license=(MIT)
depends=(
  brotli
  python
  python-cffi
)
makedepends=(
  git
  python-setuptools
)
_tag=3fd4d205e1a356c9b02faccfbe449e774537ddf2
source=(git+https://github.com/python-hyper/brotlicffi.git#tag=${_tag})
b2sums=('a4a0d4b15ca550c8737cde99e28cdb9b5e4c86aaab5e718b54b0658b5b4e76ea5fa62adf22dea0aea2cc8efe27d2cb34ef2c250d26b85fdb487d6e7a757ed8ee')

pkgver() {
  cd brotlicffi
  git describe --tags | sed 's/^v//'
}

build() {
  cd brotlicffi
  USE_SHARED_BROTLI=1 python setup.py build
}

package() {
  cd brotlicffi
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-brotlicffi
}

# vim: ts=2 sw=2 et:
