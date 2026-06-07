# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-capstone6pwndbg
# NOTE: this needs to be kept in compatibility sync with pwndbg
# https://github.com/pwndbg/pwndbg/blob/dev/pyproject.toml
pkgver=6.0.0Alpha9
pkgrel=1
pkgdesc='Lightweight multi-platform, multi-architecture disassembly framework (pwndbg only)'
url='https://www.capstone-engine.org/index.html'
arch=(x86_64)
license=(BSD-3-Clause)
makedepends=(
  cmake
  git
  glibc
  python
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  "git+https://github.com/pwndbg/capstone6pwndbg.git#tag=v${pkgver/Alpha/-Alpha}"
  git+https://github.com/capstone-engine/capstone.git
)
sha512sums=('2a7205ee4834e203b11cf1e3916a8440dfe0287392b40f7983443d92cff23e980b670db7cc95b938d2fdc8197715bfd35bda8c9a0392086ef93f3d1a6bc4a362'
            'SKIP')
b2sums=('0ba0b8bcea3ac36614ee62ca9b970122d2c7cbac19138e4e78535a84e3f7ccd72b959249693505fd617575e127d3f6b32fc208e04e85ddac333516840f8224ec'
        'SKIP')

prepare() {
  cd capstone6pwndbg
  git config submodule."capstone".url "${srcdir}/capstone"
  git -c protocol.file.allow=always submodule update --recursive
  git -C capstone apply ../python-rename.patch
}

build() {
  cd capstone6pwndbg/capstone/bindings/python
  python -m build --wheel --no-isolation
}

package_python-capstone6pwndbg() {
  depends=(
    glibc
    python
  )
  cd capstone6pwndbg/capstone/bindings/python
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 ../../LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
