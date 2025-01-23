# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=ruff
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=0.9.3
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
sha512sums=('d22db8799ef28b039d7b6acf3c67a1755b6d864a05cac8892facfc3ac6be40c8159176293fb7c40befe141ef17e56cfa1b4c855cdcb45a8e2e93de87f318a76d')
b2sums=('5a5ecebc2c6b2814457332ea9342845e5a5add035946a413d456f2ce326a43f9119bf2e161482c1c7d295f91012d73623e56fb56ffee5704d713bae11e5b6a30')

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
