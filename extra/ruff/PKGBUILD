# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=ruff
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=0.15.13
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
sha512sums=('e5c3f11c56fddf7d29b14b603d1716ccf35a539644d937dfd9f264424874103a936e88d8177f8665c1d5cb20c360236988e528f4b1b91624b740a055acfba026')
b2sums=('522f8a7fb411ee14bae914ff7b972c30aa183ec779ad5dbaccb33fc5284b2b4d19029c80bd6feb02dc062fdefb5b0ec5d4a8d4d925497a9f99220bb60deb7726')

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
