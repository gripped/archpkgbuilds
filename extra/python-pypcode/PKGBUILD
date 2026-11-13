# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Letu Ren <fantasquex at gmail dot com>

_pyname=pypcode
pkgname=python-${_pyname}
pkgver=4.1.0
pkgrel=1
pkgdesc="Python bindings to Ghidra's SLEIGH library for disassembly and lifting to p-code IR"
url='https://github.com/angr/pypcode'
license=(BSD-2-Clause)
arch=(x86_64)
depends=(
  libgcc
  libstdc++
  glibc
  python
)
makedepends=(
  cmake
  nanobind
  python-build
  python-installer
  python-setuptools
)
checkdepends=(
  python-pytest
  python-pytest-cov
)
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha512sums=('0044ca9c9f80a0c14d9109f4f03f95c64cea80446ae179ebd4985acb55948cab419f6fd092d8f550e5ab38421def04b5db60646a5bb0a3c5e0faa0981ac9b867')
b2sums=('293afad89b3c77e72d3b3160a0731b5369b0eb0e0fc08792c47060889de8f380ab8d3206d739febaaaafebcccba113d222cf484b52322bbc2b9233b7073294e5')

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd ${_pyname}-${pkgver}
  local builddir=("$PWD"/build/lib.*)
  PYTHONPATH="${builddir[0]}" pytest --import-mode=importlib
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
