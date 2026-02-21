# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-capstone6pwndbg
pkgver=6.0.0Alpha6
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
sha512sums=('b32d6bec9ba2b92c3a82eb3212f1d2ccf66c16b04bd0850f9d336dbf369fb02d306d7a06fcf2af3d24ec35224c8377bf0cf6d07e16972038e992f2ee49e65fb0'
            'SKIP')
b2sums=('4c144251e0109aa5c6f4a5951a4938b80af0f3adf9da2ee35cda9fc37a0c12a81a4157ab2e5c59579f82e9d8b893ce844e91e9cf4727637aeb0bf4cd0c3970c9'
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
