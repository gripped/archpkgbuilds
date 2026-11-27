# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

# WARNING: this package needs to be kept in sync with the requirements of deltachat-desktop
_upstream=deltachat-core-rust
_name=core
pkgname=deltachat-rpc-server
pkgver=2.69.0
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
sha512sums=('99e24b4b35e50dd7902f103a62e32f026b2e25d82e4657760ba97c1d8c495c5638a2b67c3d510b5f18a1ae1af076fcc0f2444c1be5c4eff7ddf7c9e55113d683')
b2sums=('42426c96b4cd2ecff4b247ffee4b7959ac901e96dc0598fcb3b31b8ea8782e71a6ea216f2f11b0c8ab2ea869d9e98144e4b2125378d6fed5df3356e9dac29e95')

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
