# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=ruff
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=0.16.3
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
sha512sums=('14494f13d2200fd5dee54ec2503380c3cab3ec56611309a38b3ef72728b0ff286a81b8ae16336e871807ca62beec1afb094d813cfc5b21e82e8a005d23d531e3')
b2sums=('c04928952650971565ec4848126b8238946d0e5928a273494d7b3bc48dcbbc49d64a0a437aada7a1513cb3e62b4b2513e3fec10754ccf961acbae1de97d41d2a')

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
