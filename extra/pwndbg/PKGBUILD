# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg
pkgver=2025.02.19
pkgrel=1
pkgdesc='Makes debugging with GDB suck less'
url='https://github.com/pwndbg/pwndbg'
arch=(any)
license=(MIT)
depends=(
  debuginfod
  gdb
  python
  python-capstone
  python-psutil
  python-pt
  python-ptrace
  python-pwntools
  python-pycparser
  python-pyelftools
  python-pygments
  python-requests
  python-setuptools
  python-sortedcontainers
  python-tabulate
  python-typing_extensions
  python-unicorn
  which
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-poetry-core
  python-wheel
)
optdepends=(
  'checksec: checksec command support'
  'ropper: ropper command support'
  'ropgadget: ropgadget command support'
  'radare2: radare2 command support'
  'rizin: rizin command support'
  'one_gadget: command to find ROP one_gadget'
)
source=(
  https://github.com/pwndbg/pwndbg/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
)
sha512sums=('18ec21a1b978ef9edefb6f979d1330a6e2f48d6a005b391ebac5aaf7b9e866de7bd497b983bb9eef52e50b4fe82ea901036ca86c308e8962413a17d5733e7efe')
b2sums=('7774c86b9e00186c39db29090c39bbbfa6ce1b0ab565de8a524687afccfdb1ceab829503ac6340f0f32d74ed95020bcd136b1e0e2d3f256a15e5e3ffe17a963b')

prepare() {
  cd ${pkgname}-${pkgver}
  rm -rf caps profiling
}

build() {
  cd ${pkgname}-${pkgver}
  python -m compileall *.py
  python -O -m compileall *.py
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -d "${pkgdir}/usr/share/pwndbg"
  cp -r *.py __pycache__ "${pkgdir}/usr/share/pwndbg"
  touch "${pkgdir}/usr/share/pwndbg/.skip-venv"

  install -Dm 644 README.md FEATURES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
