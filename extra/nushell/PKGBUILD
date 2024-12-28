# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.101.0
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
sha512sums=('c4741ed0b458b6cd943f85ba8ba922560268fe6e579d1f67441da397549160ac9026431916cd9b11cda411ec7283417709878cc1689c8b7a4cf65d2841d6ebf4')
b2sums=('d2e177b563b2f9e1119e678d75df068c09d651eaf9112b605f3600118980449bb0c7cf52e066ccd785767d2f4f9d4e1470839f90ca35234807af37599ea321ff')

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
