# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=halloy
pkgver=2026.7
pkgrel=2
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
sha512sums=('9c7387b0e946811f7e0566041b37dc19b4c0e46ef5ca22da6b5a115e37e952186ccb0ab6d24f402f8b11dd302dcc276bc86050cef0a619cf579fe44e71104e3e')
b2sums=('c2fb549753310245fe85ec3c2a249ca35c18898448caa28029f352986a5c7dfb991602a9002e1f2527404104c747b1bff4bdae0bc3bbab95459faecfa20d8f2e')

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
