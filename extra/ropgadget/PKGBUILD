# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: s1gma <s1gma@mindslicer.com>

pkgname=ropgadget
_pkgname=ROPgadget
pkgver=7.6
pkgrel=2
pkgdesc='Search gadgets in binaries to facilitate ROP exploitation for several file formats and architectures'
url='https://github.com/JonathanSalwan/ROPgadget'
arch=(any)
license=(BSD-3-Clause)
depends=(
  python
  python-capstone
)
makedepends=(
  python-setuptools
  python-build
  python-installer
  python-wheel
)
source=(https://github.com/JonathanSalwan/${_pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('1eae4021e40e805c3a8e41a5dbca54a8cf0712d72ba189fc18f8f02ddc855c0828d0efe86e07d1c2faafc639dc10a78d5d2fadd3fb8510d50f8ea06c0d89c1d2')
b2sums=('237b0cee0b2496959648862543611078a75fae65f6e2b163f213299745b11688cae72d5390960d41a390a060533969c987e10976c4a896e10e8c792e85175138')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed 's|python2|python|g' -i ropgadget/**/*.py ropgadget/*/*/*.py
}

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}
  ./ROPgadget.py --binary ./test-suite-binaries/elf-Linux-x86 --string "main"
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE_BSD.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
