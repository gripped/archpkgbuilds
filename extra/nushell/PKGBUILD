# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.94.2
pkgrel=1
pkgdesc='A new type of shell'
arch=('x86_64')
url='https://www.nushell.sh'
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
  'libcrypto.so'
  'libssl.so'
  'zlib'
)
makedepends=('cargo' 'git')
install=nushell.install
source=("git+https://github.com/nushell/nushell.git#tag=$pkgver")
sha256sums=('d2f30971004cc7420762f364536e95df769580400992e8a286ad19b3f7ce6578')

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"

  CFLAGS+=' -ffat-lto-objects'

  cargo build --release --frozen --workspace
}

check() {
  cd "$pkgname"
  # Skip tests that pretend they know what the local terminal is going to be
  local skipped=(
    plugins::stream::echo_interactivity_on_slow_pipelines
    plugins::stress_internals::test_exit_before_hello_stdio
  )
  cargo test --frozen --workspace -- ${skipped[@]/#/--skip }
}

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
