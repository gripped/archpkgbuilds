# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.108.0
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
sha512sums=('e0ba4294808e78d59be488335d038ad82e7b848f519f53acfb1a88ef673484ae53345e065c5c1a798e62145fdbe47d16da0dbbaa9bc092493638bd9f3fbb5ef6')
b2sums=('8dd093bea682be1dafcc11f97bcb1e30e4018c29974333eb52e897e7c86a6af566d58bbda674673d7004ec2f79288a90d86331c7b1a8b8ae0859aadd248788b1')

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
