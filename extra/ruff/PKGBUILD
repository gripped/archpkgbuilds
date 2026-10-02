# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=ruff
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=0.16.10
pkgrel=1
pkgdesc='An extremely fast Python linter, written in Rust'
arch=(x86_64)
url=https://github.com/astral-sh/$pkgbase
license=(MIT)
depends=(
  glibc
  libgcc
)
makedepends=(
  cargo
  git
  maturin
  python-installer
)
source=("git+$url.git#tag=$pkgver")
sha512sums=('6959e225d7e556863323fa6c32a0e86531f4d741bee033751fdd12ededa702161b23e6b0df00d9d46b15b014d14e82fa8e4f8f6723ae5da0dab65e761ddfda8b')
b2sums=('4ed01dc28a335242990c315fe93003be248f14def0121ece357f587b528c82fd805b47e663f3921b2e1ec5bff8050983e046d537797986105e483f1e8a609682')

_srcenv() {
  cd "$pkgbase"
  export CARGO_HOME="$srcdir"
  export CARGO_PROFILE_RELEASE_DEBUG=2
  export CARGO_PROFILE_RELEASE_STRIP=false
  export CARGO_PROFILE_RELEASE_LTO=thin
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
  CFLAGS+=' -ffat-lto-objects'
}

prepare() {
  cd $pkgbase
  cargo fetch --locked --target host-tuple
}

build() {
  local target=$(rustc --print host-tuple)
  local target_binary=target/$target/release/$pkgbase

  # https://github.com/gnzlbg/jemallocator/issues/170
  [[ $CARCH == "aarch64" ]] && export JEMALLOC_SYS_WITH_LG_PAGE=16

  _srcenv
  maturin build --locked --release --all-features --target "$target" --strip

  for completion in bash elvish fish nushell zsh; do
    $target_binary generate-shell-completion $completion > $completion-completions
  done
}

check() {
  _srcenv
  cargo test -p ruff --frozen --all-features -- --skip display_default_settings
}

_package_common() {
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ruff() {
  cd $pkgbase
  _package_common
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/$(rustc --print host-tuple)/release/ruff"
  install -Dm0644 bash-completions "$pkgdir/usr/share/bash-completion/completions/$pkgbase"
  install -Dm0644 elvish-completions "$pkgdir/usr/share/elvish/lib/$pkgbase.elv"
  install -Dm0644 fish-completions "$pkgdir/usr/share/fish/vendor_completions.d/$pkgbase.fish"
  install -Dm0644 nushell-completions "$pkgdir/usr/share/nushell/vendor/autoload/$pkgbase.nu"
  install -Dm0644 zsh-completions "$pkgdir/usr/share/zsh/site-functions/_$pkgbase"
}

package_python-ruff() {
  depends=(python "$pkgbase")

  cd $pkgbase
  _package_common
  python -m installer -d "$pkgdir" target/wheels/*.whl

  cd "$pkgdir"
  rm -r usr/bin
}
