# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=python-faust-cchardet
pkgver=2.2.1
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
  python-wheel
)
provides=("python-cchardet=$pkgver")
conflicts=(python-cchardet)
source=(
  "faust-cchardet::git+$url#tag=v$pkgver"
  "pyyoshi-uchardet::git+https://github.com/PyYoshi/uchardet"
)
b2sums=('f4eb3481a9776f8e11d61bad7754aa9cee30dc5fdecf4a4419424ca2b85ab405e932e770d7afc2bd7ed34ffe1c87284483a82273add4d3c88393895c4a9f176e'
        'SKIP')

prepare() {
  cd faust-cchardet

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
