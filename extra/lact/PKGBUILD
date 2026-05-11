# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Ilya Zlobintsev <ilya.zl@protonmail.com>

pkgname=('lact')
pkgbase=lact
pkgver=0.9.0
pkgrel=1
pkgdesc="Linux GPU Configuration Tool"
arch=('x86_64')
url="https://github.com/ilya-zlobintsev/LACT"
license=('MIT')
depends=(
  hwdata
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
sha256sums=('f6ffef87137cea1af76733cd31909b210d677c3b85aae4b137afcee5ffdb20c1')
b2sums=('419c1cd0f15bb1c07418ca68de99ec5e91e06543c0705bf0df182e22ccf96411519b33247ffd62d8715f88ad2ae633a3e64e610278c78758d60dc4dce3cb9a70')

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
