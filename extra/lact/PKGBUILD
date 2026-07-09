# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Ilya Zlobintsev <ilya.zl@protonmail.com>

pkgname=('lact')
pkgbase=lact
pkgver=0.9.1
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
sha256sums=('01fe273182c2569921983107f6540cd31af09dab19cc7b4b0f9216e918adfb98')
b2sums=('be9b395f64198d10d4f195cfc1881ebac28954cb9c41057cfe752a0da372bbd4d4f22288e08286dc8eb9bbc97958033d3636899d6fc084894b5bce329b855833')

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
