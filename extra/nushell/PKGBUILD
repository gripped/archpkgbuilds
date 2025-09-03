# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.107.0
pkgrel=1
pkgdesc='A new type of shell'
arch=(x86_64)
url='https://www.nushell.sh'
license=(MIT)
depends=(
  curl
  glibc
  gcc-libs
  libcrypto.so
  libssl.so
  zlib
)
makedepends=(rust git)
checkdepends=(procps-ng)
install=nushell.install
source=("git+https://github.com/nushell/nushell.git#tag=$pkgver")
sha512sums=('0727d7275ca99ea8bfe29de021a0abfe54662462cce50a307ae7ee7f6fe460a16eeb68e052e77a20d55cee50e52375909e719b2c02f76894188bd5a3ca9b3b35')
b2sums=('736f623df514449db7cf35a5f6e39ade6b8af53a6b06f1889c377f895b9ce5a95350523fc1a37043bbddd3454f62a4aeb895376a3f05de0f31a166ff414122e0')

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"

  CFLAGS+=' -ffat-lto-objects'

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
