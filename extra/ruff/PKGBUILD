# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=ruff
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=0.15.15
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
sha512sums=('1b6992138e4878e67486a9ad4880568b08f94f2b920b4a869088c4190013b61030ae02690801d44f8e0c3bdefcb24f7f3776dd0f1dccfc0ed7875bc5dd1e6196')
b2sums=('6d558f9946e55e2c044f5d99c9afb531cf9ed94e56d1865ba0542b72f864b40245ed79d7cc8476f02ecf10ecd2c3480451496a7498aead050e3bd56f8c2e20c5')

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
