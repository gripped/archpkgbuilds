# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Ilya Zlobintsev <ilya.zl@protonmail.com>

pkgname=('lact' 'lact-libadwaita')
pkgbase=lact
pkgver=0.8.3
pkgrel=1
pkgdesc="Linux GPU Configuration Tool"
arch=('x86_64')
url="https://github.com/ilya-zlobintsev/LACT"
license=('MIT')
depends=(
  hwdata
  gcc-libs
  glibc
  gtk4
  vulkan-tools
  ocl-icd
)
makedepends=(
  cargo
  clang
  libadwaita
  git
)
checkdepends=(
  fuse3
)
install="$pkgbase.install"
source=("git+https://github.com/ilya-zlobintsev/LACT.git#tag=v$pkgver")
sha256sums=('7e70aafb1ddd6cd3290daaa58f35f494c75d96b3e72b6a8667ea721dc6b4d22b')
b2sums=('f1e3374f96ad3fe593a5ddf2c084695c124db1e03a06883777dd6ff98bd1836dc498339d202d950b4909d6621595d8f335d4dc711bc202415821bb359fe30f98')

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
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "LACT"
  CFLAGS+=' -ffat-lto-objects'
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # Libadwaita
  cargo build -p "$pkgbase" --frozen --release --features=adw
  mv "target/release/$pkgbase" "target/release/$pkgbase-adw"

  # Gtk 4
  cargo build -p "$pkgbase" --frozen --release
}

check() {
  cd "LACT"
  CFLAGS+=' -ffat-lto-objects'
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all --all-features --verbose
}

package_lact() {
  cd "LACT"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgbase/"
}

package_lact-libadwaita() {
  pkgdesc+=" (libadwaita edition)"
  provides=("$pkgbase")
  conflicts=("$pkgbase")
  depends+=('libadwaita')

  cd "LACT"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dvm755 "target/release/$pkgbase-adw" "$pkgdir/usr/bin/$pkgbase"
  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgbase/"
}
