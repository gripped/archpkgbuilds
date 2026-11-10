# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.117.0
pkgrel=2
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
sha512sums=('67f08d1470ec38b40def61a4c07f2a45092d7123875e55093c058f1e9c0a743f622ff3b07e62cfd0b03a50784373581de88cdac01cc6262dd5a34f31110f8847')
b2sums=('51ebdc349f6e80bc3c9c6f53d25d92982a772d459f6c1943b34feb69396bdf0967ce10afdcb1f547a2c83b240dcfc060fb7df9d11b0097b27df109131336c4b1')

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
