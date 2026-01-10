# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Letu Ren <fantasquex at gmail dot com>

_pyname=pypcode
pkgname=python-${_pyname}
pkgver=3.2.1
pkgrel=2
pkgdesc="Python bindings to Ghidra's SLEIGH library for disassembly and lifting to p-code IR"
url='https://github.com/angr/pypcode'
license=('custom')
arch=('x86_64')
depends=('python' 'python-cffi' 'nanobind')
makedepends=('cmake' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('aec0b7ba114d095d511995568a2c1bbe9a400cd01b9e762b3cc9946a8a4c44d73603be938438bd8c0da6f097b55a854e847c92c23402beaba1830ed586deb846')
b2sums=('716065bebdfe6d8a89e73aac9c0064b977eec7fa60eb30daa754a4ef6f50f5aaa2aa5fdb950e57ea8847b966501eab1b4207fc2006a12e8c007dcdda71629e7e')

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
