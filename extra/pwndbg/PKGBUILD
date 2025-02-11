# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg
pkgver=2025.01.20
pkgrel=2
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
  pwndbg-gdb-16.patch::https://github.com/pwndbg/pwndbg/commit/8b2952ef1bcecb686317cc63a4d92268b4632be7.patch
)
sha512sums=('b619b8b3727a4a23a3146f2bb0f3475ad788e82712cb669d233d88ce546546f114882162df6e5d0b357e9fa143a6829f7387132ee2a7f922dc4e669a215d8d51'
            '27c1c3e63975c75f1faaa62b20f7ee5861cae6f9482569f2763d708f73fa8cc66fa2a21a4be9820d92f4a534e263bac8a64ab86bbb3df154d9a8cdd7ab17049c')
b2sums=('58c2c6139d8d96c939c602f694519167d4722f7ed05a92a5c38e55e0a894ffd930813d583e07bc70d0114abdcf8e34e7e859ceeb1113fc0cd00dd4af513f213b'
        '83d4b3aa308c07225df524fe693809cfc6ac4928a783c765ebbe56a245026084492ac4153b6b2d3d68679c612170240b5e191ba95c0cb719c8d2efb50bda9d75')

prepare() {
  cd ${pkgname}-${pkgver}
  rm -rf caps profiling
  patch -Np1 < ../pwndbg-gdb-16.patch
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
