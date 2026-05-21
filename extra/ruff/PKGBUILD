# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=ruff
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=0.15.14
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
options=(!lto)
source=("git+$url.git#tag=$pkgver")
sha512sums=('21b92ab8d64bc106d0ae865c9eea1786ebf629ce8b469d5cb82ae15d3aa20c6631ce224836ba7cefc5eb6ca1245ea1cb5c27d33bcdccd713e19ab56a09311baa')
b2sums=('16546ffc12f333ab7217900a9e571af08eaef88038342674a26fb3d0e6b69c31c61a4f6165be7a3ae72068cb5dd620073895ebb81f061d813e85ab044d013dd6')

prepare() {
  cd $pkgbase
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  local target=$(rustc --print host-tuple)
  local target_binary=target/$target/release/$pkgbase

  # https://github.com/gnzlbg/jemallocator/issues/170
  [[ $CARCH == "aarch64" ]] && export JEMALLOC_SYS_WITH_LG_PAGE=16

  cd $pkgbase
  maturin build --locked --release --all-features --target "$target" --strip

  for completion in bash elvish fish nushell zsh; do
    $target_binary generate-shell-completion $completion > $completion-completions
  done
}

check() {
  cd $pkgbase
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
  install -Dm0644 bash-completions "$pkgdir/usr/share/bash-completion/completions/$pkgbase.bash"
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
