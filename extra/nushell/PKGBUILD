# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.104.0
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
checkdepends=('procps-ng')
install=nushell.install
source=("git+https://github.com/nushell/nushell.git#tag=$pkgver")
sha512sums=('07f08aa67d4f0eb34d21a2b8d38c64fef759490e2210009d30b06b1ecbd5fa1f83cda2109fa9e006f3d91ef701ede24771ad9e4ae6a1c0341d6d72df1c196958')
b2sums=('1c974331003d1e2183951fe836d787ec95c2f317c8dfe6fe7d787b05b7f8e8f3dec11aa820a3e03a433c1b27cb7123f0ebe132f207437f8f9d98175e17548293')

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
