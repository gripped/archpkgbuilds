# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=ruff
pkgname=("$pkgbase" "python-$pkgbase")
pkgver=0.9.1
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
sha512sums=('f4735faa36711f4ff7a2238233cd93ef502d9d0780f74043116e9f2b04b41421c980bceabcec0f8af8777952cc212806b16876c9dd855d92d8d9eba0236b0135')
b2sums=('5785f6b1271fc638a143a987884739578100ee1bd78698ef64da9c50997c04690838bbdeb6f80e59b5bb52b1f9d2729115e05732ca2c7407f22e562acc61d9ca')

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
