# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.115.1
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
sha512sums=('d25ab516544a99fc3fe12987e96181f59a3d22f3ea8eef59df66852edc846893665e74d11c935043338df1ff8ca1b4a018cc4a9e56716b006be66104e9965501')
b2sums=('3ecebe3df3a49ad1c9ff44d218dba78a1045bf9e7b9f42d83b72049355d2e76216f880776f440afa0550359ffd30dd56236f1a4d9bc34c66cfbb6ed56983c8bb')

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
