# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.102.0
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
sha512sums=('b34e08a99721ebb13a7d54aa5a48ed16a7bf9cc20a436eac18b4d597e3bfa135f79a2c9de79320bdab6b3288895bd47174c9c5273d9ed0555fda7e1d7b361878')
b2sums=('631a8d22cc5547cc737800bb6ce99b901fdd6011a36cc82a3069ca00bfaa8a12fd1f89b77dd2d68266cf780c89e38cf422ee335bb3f0accce986fc48f904a733')

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
