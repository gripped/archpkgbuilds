# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=pahole
pkgname=(
  pahole
  ostra-cg
)
pkgver=1.30
pkgrel=1
epoch=1
pkgdesc="Pahole and other DWARF utils"
url="https://git.kernel.org/pub/scm/devel/pahole/pahole.git"
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  bash
  cmake
  git
  glibc
  libelf
  ninja
  python
  python-matplotlib
  zlib
)
source=(
  "git+https://github.com/acmel/dwarves?signed#tag=v$pkgver"
  0001-CMakeLists.txt-Install-ostra.py-into-Python3_SITELIB.patch
)
b2sums=('69bdc8cbc211a239f5f8e50ad63a8106cc58936ebd9c4c440dbaee7c22190189fa132147e0dd2f5fb81e0f07ca1a1c7e9a0691fe985eef12aeb43ea7d94cf4b4'
        'f299bb705066a05f5390e07475cec5ab4184aa6d5e1e290c0fb73d50a6e60d5e4729eba59748c1ead388338e2010220a3054db737415f7b2e4bdf7362f4a4745')
validpgpkeys=(
  2DBF5BAA46FB4DED338A335BD65016F35352AA40  # Arnaldo Carvalho de Melo <acme@kernel.org>
)

prepare() {
  cd dwarves

  # https://bugs.archlinux.org/task/70013
  git apply -3 ../0001-CMakeLists.txt-Install-ostra.py-into-Python3_SITELIB.patch
}

build() {
  local cmake_options=(
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -D __LIB=lib
  )

  cmake -S dwarves -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure -j$(nproc)
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_pahole() {
  depends=(
    bash
    glibc
    libelf
    zlib
  )
  optdepends=('ostra-cg: Generate call graphs from encoded traces')
  provides=(libdwarves{,_emit,_reorganize}.so)

  DESTDIR="$pkgdir" cmake --install build

  _pick ostra "$pkgdir"/usr/{bin/ostra-cg,lib/python*}
}

package_ostra-cg() {
  pkgdesc="Generate call graphs from encoded traces"
  depends=(
    pahole
    python
    python-matplotlib
  )

  mv ostra/* "$pkgdir"

  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}

# vim:set sw=2 sts=-1 et:
