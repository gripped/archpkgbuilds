# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg
pkgver=2026.02.18
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
sha512sums=('aab6bf6df2954aa8c78c8990df1ce34627fed70811ee06bf87d98897a381cfed5d0a9375cd1713d4d77575fe96a05255fedfbb2e3b742726b6860fe5c6efdef6')
b2sums=('c153e833fee3c96b21fb11c83e3c09cb8ecad730f6a7145a7674ed8d1c04cb3888d6541c5009f1169b4dcefa836028970270f63216dcfa9c767ca86c622e0cb2')

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

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
