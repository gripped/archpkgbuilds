# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=python-faust-cchardet
pkgver=3.1.0
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
  "git+https://gitlab.freedesktop.org/uchardet/uchardet.git"
)
b2sums=('1b6c871fabe39812a3799504418521bed46c1f7dac34956b7838df5b705a12bc01bc595e3152d3a797d6d75e60279d64a5ebbf4125e89bde33b144b2872586f5'
        'SKIP')

prepare() {
  cd faust-cchardet

  git submodule init
  git submodule set-url src/ext/uchardet "$srcdir/uchardet"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  python -m build --wheel --no-isolation faust-cchardet
}

package() {
  python -m installer --destdir="$pkgdir" faust-cchardet/dist/*.whl
}

# vim:set sw=2 sts=-1 et:
