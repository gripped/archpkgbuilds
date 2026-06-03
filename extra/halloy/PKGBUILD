# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=halloy
pkgver=2026.7.1
pkgrel=1
pkgdesc='An open-source IRC client'
arch=(x86_64)
url='https://halloy.chat'
license=(GPL-3.0-or-later)
depends=(
  alsa-lib
  libgcc
  glibc
  hicolor-icon-theme
  openssl
  libxcb
  sqlite
)
makedepends=(
  git
  rust
)
options=(!lto)
source=("$pkgname::git+https://github.com/squidowl/halloy#tag=$pkgver")
sha512sums=('4eb32791d0c8cb7f3d04012d94b1e82f6a0e37e9080ee4b3f89cf0badaaa7d4f91b0dc16dd903a8b4122772b49d918e5f7809e8dbc41a523ebbd875b076b4759')
b2sums=('11a9fa9174ddb28b54f7782838ab4a832d2d16a609cb95760fc06037e9a4000421dd8a8ed9c20a69938bea91ff0f9ceb1737d391075065fdf98b2d5ed8313253')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname"

  LIBSQLITE3_SYS_USE_PKG_CONFIG=1 cargo build --locked --profile packaging --all-features
}

check() {
  cd "$pkgname"

  LIBSQLITE3_SYS_USE_PKG_CONFIG=1 cargo test --locked --profile packaging --all-features
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/packaging/halloy

  # desktop files
  pushd assets/linux
  install -vDm644 -t "$pkgdir/usr/share/metainfo" org.squidowl.halloy.appdata.xml
  install -vDm644 -t "$pkgdir/usr/share/applications" org.squidowl.halloy.desktop
  cp -vr icons "$pkgdir/usr/share"
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
