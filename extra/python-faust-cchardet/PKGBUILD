# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=python-faust-cchardet
pkgver=2.1.20
pkgrel=1
pkgdesc="Fork of the original cChardet"
url="https://github.com/faust-streaming/cChardet"
arch=(x86_64)
license=('GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1')
depends=(
  glibc
  libgcc
  libstdc++
  python
)
makedepends=(
  cython
  git
  meson-python
  python-build
  python-installer
  python-pkgconfig
  python-wheel
)
provides=("python-cchardet=$pkgver")
conflicts=(python-cchardet)
source=(
  "faust-cchardet::git+$url#tag=v$pkgver"
  "pyyoshi-uchardet::git+https://github.com/PyYoshi/uchardet"
)
b2sums=('5f4928bae718828c5a21c5ebb79918232c3ba0e90c286c8838590f6ea9dae558acd3f4ba45a7a18628a4a7e4c0f08a3cf9dcc5859cb904f516eb1a16e79dc816'
        'SKIP')

prepare() {
  cd faust-cchardet

  # Fix build
  git cherry-pick -n 5075cad8c7eb5cc8f2c139ada92e7222a309f657

  git submodule init
  git submodule set-url src/ext/uchardet "$srcdir/pyyoshi-uchardet"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  python -m build --wheel --no-isolation faust-cchardet
}

package() {
  python -m installer --destdir="$pkgdir" faust-cchardet/dist/*.whl
}

# vim:set sw=2 sts=-1 et:
