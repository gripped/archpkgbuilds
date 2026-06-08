# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=halloy
pkgver=2026.7.2
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
sha512sums=('7806b4382d9667a9af019f4805b70676b173b9fe54f9d949bc157c2a0f676b2fa9940a69e488602c3dad4b96e7f7f56aab9a4d90487a8db81c9dc25d06cf52c0')
b2sums=('194b46c796ab97482db1e0ade18123b904b782b3cf12f5e0c7b0263b1f6ec81c77a6274e6ddef73e1e22c911d6b3c7337ed68dd90ad75569c8ceb91dd501aa25')

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
