# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

# WARNING: this package needs to be kept in sync with the requirements of deltachat-desktop
_upstream=deltachat-core-rust
_name=core
pkgname=deltachat-rpc-server
pkgver=2.59.0
pkgrel=1
pkgdesc="A JSON-RPC 2.0 interface to DeltaChat over standard I/O"
arch=(x86_64)
url="https://github.com/deltachat/deltachat-core-rust/tree/main/deltachat-rpc-server"
_url="https://github.com/deltachat/deltachat-core-rust"
license=(MPL-2.0)
depends=(
  glibc
  libgcc
  openssl
  sqlcipher
)
makedepends=(
  rust
)
source=("$_url/archive/v$pkgver/$_upstream-$pkgver.tar.gz")
sha512sums=('cdf820b6d9fe5d3fa779acc75ad3e32fc367dd0f3dde8d197c7cf1ae6ddcd10ff607f4926a8ce00171ea76f1145f9f9663883bb681e54529bd5756802d1ed304')
b2sums=('9dbc48c4569c325c812fa2f70f9e304da95f7136be333b3e0b0ad417dbab573aa5c74d30c120a9fb44c1051ab81a82bb9d8ed2989cfd0f938d40d84aea041ca9')

prepare() {
  cd $_name-$pkgver
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $_name-$pkgver
  export CFLAGS+=" -ffat-lto-objects"
  export OPENSSL_NO_VENDOR=1
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release --package $pkgname
}

check() {
  cd $_name-$pkgver
  export CFLAGS+=" -ffat-lto-objects"
  export OPENSSL_NO_VENDOR=1
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo test --frozen --package $pkgname
}

package() {
  cd $_name-$pkgver
  install -vDm 755 target/release/$pkgname -t "$pkgdir/usr/bin/"
  install -vDm 644 $pkgname/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
