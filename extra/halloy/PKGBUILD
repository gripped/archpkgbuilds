# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=halloy
pkgver=2026.10
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
sha512sums=('591eed6b422ee5bc6fcc80f1f85437d82cb074c1ffcd646279f02223855d503fe143e4f21a7af410c14e76fe2700737a5df6a67a93778cdb48698d9794542196')
b2sums=('0da59bdb4ae21370eee96e6d1ca783c67c60dccaea2eb78bfc1c0888950272167a088cb48fbcbfadddcbe7cc62b762878611b3a5b339ba4e16afedf92ad058b3')

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
