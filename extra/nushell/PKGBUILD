# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.115.0
pkgrel=1
pkgdesc='A new type of shell'
arch=(x86_64)
url='https://www.nushell.sh'
license=(MIT)
depends=(
  curl
  glibc
  libgcc
  libgit2
  libssh2
  openssl
  sqlite3
  zstd
)
makedepends=(cargo git)
checkdepends=(procps-ng)
install=nushell.install
source=("git+https://github.com/nushell/nushell.git#tag=$pkgver")
sha512sums=('eac6f954417e0ad60b9c51c018f9d9504fb0de9ab79db229f6d50f7a6142c539182cb612ba80b9e466774ef4e9b62d56c28e2de1edf161c7e2c2e0ce1c4df63b')
b2sums=('64dc8f637276f8ab887e5e71ce096c80ae7c0f8bc0392b7b07e8508b0b3fab258349d3ea39a70e9a7808ff3337a9db6f9ff52f35ffc8aabf15d01ed2e9599bce')

prepare() {
  cd "$pkgname"

  # https://github.com/nushell/nushell/issues/18578
  cargo update -v --precise 1.5.3 ethnum

  export CARGO_HOME="$srcdir"
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"

  export CARGO_PROFILE_RELEASE_DEBUG=2
  export CARGO_PROFILE_RELEASE_STRIP=false
  export CARGO_HOME="$srcdir"
  export CARGO_PROFILE_RELEASE_LTO=thin
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  export CARGO_PROFILE_RELEASE_OPT_LEVEL=3

  CFLAGS+=' -ffat-lto-objects'

  export LIBGIT2_NO_VENDOR=1
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export ZSTD_SYS_USE_PKG_CONFIG=1

  cargo build --release --frozen --workspace
}

#check() {
#  cd "$pkgname"
#  # Skip tests that pretend they know what the local terminal is going to be
#  local skipped=(
#    plugins::stream::echo_interactivity_on_slow_pipelines
#    plugins::stress_internals::test_exit_before_hello_stdio
#  )
#  cargo test --frozen --workspace -- ${skipped[@]/#/--skip }
#}

package() {
  cd "$pkgname"

  find target/release \
    -maxdepth 1 \
    -executable \
    -type f \
    -name "nu*" \
    -exec install -vDm755 -t "$pkgdir/usr/bin" "{}" +

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
