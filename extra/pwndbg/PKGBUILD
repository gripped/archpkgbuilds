# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg
pkgver=2024.08.29
pkgrel=3
pkgdesc='Makes debugging with GDB suck less'
url='https://github.com/pwndbg/pwndbg'
arch=('any')
license=('MIT')
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
  python-tabulate
  python-typing_extensions
  python-unicorn
  which
)
makedepends=(
  python-build
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
)
source=(https://github.com/pwndbg/pwndbg/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/pwndbg/pwndbg/commit/b4a1b9a1.patch)
sha512sums=('503924742d4a6d767ec369bb1e37c931afb5ab09f2b4cfa048765ce7a61fb6adcda2576cdda64dd4cf74de27d83b13b4dc09d6e7480e01ae8f646c5394992d43'
            '5ce619a3f3f826c51d52375feaf9347a26776d8d6c82acecfc7dbab26e7ab73da94608579a65e83dbd256ac0984c1741a6c95343d103fa33cb86ff0b5b172855')
b2sums=('5333c318ba3ccbaaac459f9c7b917d3defa1ad712f45555b31eb76774089e55e80720744dc92813ad8234302445e3bed3237c2275c795a49856028dec416dcc2'
        '1d61be97434136b26851aa2e060e2f7c662b095d3a7ffa4a129804e3f725164f19f7ea1b52374b328388021e183bbec0519f8a1433cab5b672dd00a4bf971d6e')

prepare() {
  cd ${pkgname}-${pkgver}
  rm -rf caps profiling
  patch -Rp1 < ../b4a1b9a1.patch # Revert dependency on unreleased pwntools
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
