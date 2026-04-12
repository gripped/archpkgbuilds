# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.112.1
pkgrel=1
pkgdesc='A new type of shell'
arch=(x86_64)
url='https://www.nushell.sh'
license=(MIT)
depends=(
  curl
  glibc
  libgcc
  openssl
  zlib
)
makedepends=(rust git)
checkdepends=(procps-ng)
install=nushell.install
source=("git+https://github.com/nushell/nushell.git#tag=$pkgver")
sha512sums=('171bf278ea81518938c45d5a0ec78200d789409e9e4324bac253b73d4646a7cbf95eac31c68e29c4b65e6bdb753131c7942c544cdc757843cde3c78b30fcdd2f')
b2sums=('86548a1627bc5c26778dfd28f41ea6d68e7f07185712da9dd538c7c9a1f37b807a8e5480b3423c3770db0255ae956eb154dcaec2d87481dec6b6efbf35487a50')

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target "$(rustc --print host-tuple)"
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
