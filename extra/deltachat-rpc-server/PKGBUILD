# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

# WARNING: this package needs to be kept in sync with the requirements of deltachat-desktop
_upstream=deltachat-core-rust
_name=core
pkgname=deltachat-rpc-server
pkgver=2.65.0
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
sha512sums=('c4aa8020353630a140ba504b9bcc473a236d58f2cd763907e0769870edf729311ec3154c2a7ce03f65a1ab3e0e4e17695e151da32180318bf1e6854e1f2defb6')
b2sums=('debebb9aec95889744f4af49adf02134f686cb712212e598b0bb09f84168aa6fc2a5b46a8936af785cd1f5829eb520dd8a3f68635bd4b3ff98e18abccb1a6819')

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
