# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-capstone6pwndbg
pkgver=6.0.0Alpha7
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
sha512sums=('9c9c03605addd0c0f33a010411c7a41598f53a8d4300f2d8e3a85ab90d34b2bf6ac31e6a0eaf2f464567a49c2ebfa6ab7c7cd1525efb0b4f86386894f97a1912'
            'SKIP')
b2sums=('c898e0f0a2afd63cde02ccba55e621cbf494887e1963a0619d03c65e7023ac923f573193e810796504d4a1d17d68b4bfb5a770d75f2cdfa4a0b1f497af3f3a23'
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
