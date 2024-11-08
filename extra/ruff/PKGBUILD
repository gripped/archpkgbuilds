# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=ruff
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=0.7.3
pkgrel=1
pkgdesc='An extremely fast Python linter, written in Rust'
arch=(x86_64)
url=https://github.com/astral-sh/$pkgbase
license=(MIT)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cargo
  git
  maturin
  python-installer
)
options=(!lto)
source=("git+$url.git#tag=$pkgver")
sha512sums=('07de15e1e4b96c3627106f089e5e3ad77c629f68c055cca2cfb56b4cdc4a9af1fefed32f1e2fad3aca51d0bfc377a12ab2de632495d983894ecc0ab4e757fb1d')
b2sums=('b867786fef660cfeb070d104774f653025168a7fc80412fd865208e6cb3e107b21015994443eb9bfa7bd211f3f71b5f0afd04c88b3c99634549516648900f07f')

prepare() {
  cd $pkgbase
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgbase
  maturin build --locked --release --all-features --target "$(rustc -vV | sed -n 's/host: //p')" --strip
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
  local _target="target/$(rustc -vV | sed -n 's/host: //p')/release/ruff"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$_target"
  $_target generate-shell-completion bash   | install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgbase.bash"
  $_target generate-shell-completion elvish | install -Dm0644 /dev/stdin "$pkgdir/usr/share/elvish/lib/$pkgbase.elv"
  $_target generate-shell-completion fish   | install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgbase.fish"
  $_target generate-shell-completion zsh    | install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgbase"
}

package_python-ruff() {
  depends=(python "$pkgbase")

  cd $pkgbase
  _package_common
  python -m installer -d "$pkgdir" target/wheels/*.whl

  cd "$pkgdir"
  rm -rf usr/bin
}
