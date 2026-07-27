# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=halloy
pkgver=2026.8
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
  zstd
)
makedepends=(
  git
  rust
)
options=(!lto)
source=("$pkgname::git+https://github.com/squidowl/halloy#tag=$pkgver")
sha512sums=('7a85ac0b3547e93b16034541b1fee851ece9cd28cf4a39910031e00fa5d35b1891fc53ad659343e3581fc8e4af14a4e810fc0cdac87ce75f47151d277d9fe7dc')
b2sums=('5fbeb567a4eacff934617b5a129d0814547a56c1d8d9ab072185c808d5fddd85242fcdbda8500f337861c1d02d430e27a243b01f6b64670e7830eba972d5a7e6')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname"

  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo build --locked --profile packaging --all-features
}

check() {
  cd "$pkgname"

  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo test --locked --profile packaging --all-features
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
