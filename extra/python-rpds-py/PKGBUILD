# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-rpds-py
pkgver=0.29.0
pkgrel=1
pkgdesc='Python bindings to the Rust rpds crate for persistent data structures'
arch=(x86_64)
url='https://github.com/crate-py/rpds'
license=(MIT)
depends=(
  glibc
  gcc-libs
  python
)
makedepends=(
  git
  python-build
  python-maturin
  python-installer
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('fc97edd67afe980a29f256c8f42f40aa26c9a27710a64c0c3ddd40dd8ab28b8ea754838a091ce55e3350bf44db701731554c05d68051e2428d1c133e6981f506')
b2sums=('f2af9db91a8bac142820a80104fcb74ad23009a9afa2eb12fd43d78b8c3b5539f0caf31a2c1a096eb713fe73c175ae296f20b8438c40532fb7642ff1109f2e23')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
