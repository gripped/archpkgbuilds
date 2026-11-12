# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg
pkgver=2026.10.28
pkgrel=1
pkgdesc='Makes debugging with GDB suck less'
url='https://github.com/pwndbg/pwndbg'
arch=(any)
license=(MIT)
depends=(
  debuginfod
  gdb
  ipython
  python
  python-capstone
  python-capstone6pwndbg
  python-niche-elf
  python-psutil
  python-pt
  python-ptrace
  python-pwntools
  python-pycparser
  python-pyelftools
  python-pygments
  python-requests
  python-rich
  python-setuptools
  python-sortedcontainers
  python-tabulate
  python-typing_extensions
  python-unicorn
  # TODO:
  # decomp2dbg
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
sha512sums=('804acd9c76dd7f2bca0fb567514448179df4a85734551b659b0eb5f82ee6ed7a97f8eb34950031c3e9cfc34aba74f4ad39f292411da8222584a532e62430295b')
b2sums=('298d9f9c74cd14d3928c38cdfb51dc4965d4a7190c316d977828e4826ce913cfd5793d83a3b24e10bc4c0b638feb6a0bf388417aa7bf75e9ba56a3894b11631c')

prepare() {
  cd ${pkgname}-${pkgver}
  rm -rf profiling
}

build() {
  cd ${pkgname}-${pkgver}
  python -m compileall ./*.py
  python -O -m compileall ./*.py
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vd "${pkgdir}/usr/share/pwndbg"
  cp -r ./*.py __pycache__ "${pkgdir}/usr/share/pwndbg"

  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
