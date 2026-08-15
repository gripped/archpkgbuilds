# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Ilya Zlobintsev <ilya.zl@protonmail.com>

pkgname=('lact')
pkgbase=lact
pkgver=0.10.0
pkgrel=1
pkgdesc="Linux GPU Configuration Tool"
arch=('x86_64')
url="https://github.com/ilya-zlobintsev/LACT"
license=('MIT')
depends=(
  hwdata
  libdisplay-info
  libgcc
  libstdc++
  glibc
  gtk4
  libadwaita
  vulkan-tools
  ocl-icd
)
makedepends=(
  cargo
  clang
  git
)
checkdepends=(
  fuse3
)
install="$pkgbase.install"
source=("git+https://github.com/ilya-zlobintsev/LACT.git#tag=v$pkgver")
sha256sums=('2c2a7f6385a87eb1244b444b5aa1b17d21a0063c0466baf6374da04928dfa051')
b2sums=('84ac3588a3f9fb3509eb564c89c0858dd81b58465c9419229c5dd31527dfb72015d7f85bcab6e27076a56735cd1f9b642713e85618da1591b77863d6e5b5f0fa')

_backports=(
)

_reverts=(
)

prepare() {
  cd "LACT"
  local _c
  for _c in "${_backports[@]}"; do
    if [[ $_c == *..* ]]; then
      git log --oneline --reverse "${_c}"
    else
      git log --oneline -1 "${_c}"
    fi
    git cherry-pick -n -m1 "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    git log --oneline -1 "${_c}"
    git revert -n "${_c}"
  done
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "LACT"
  CFLAGS+=' -ffat-lto-objects'

  cargo build -p "$pkgbase" --frozen --release
}

check() {
  cd "LACT"
  CFLAGS+=' -ffat-lto-objects'
  cargo test --frozen --workspace --verbose
}

package_lact() {
  provides=('lact-libadwaita')
  conflicts=('lact-libadwaita')
  replaces=('lact-libadwaita')

  cd "LACT"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgbase/"
}
