# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=tlottie
_commit=758c7cb74444f1c3c9923065c40fdb3aad8b7d60
pkgver=0.1.0.git1.${_commit:0:7}
pkgrel=1
pkgdesc="Rust library for drawing Lottie animations"
arch=('x86_64')
url="https://github.com/dkaraush/tlottie"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('rust' 'git')
source=("git+${url}.git#commit=${_commit}")
sha512sums=('7aaed57277aee0577cbf37768b5f379dccc8211deccc111c121cf456b14edc264bc7e2c968f5c0cef7f2c887bdd74be055efffc60af88930067f83505b4eb33d')

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"

  cargo build --release --frozen --features c-api
}

check() {
  cd "$pkgname"

  cargo test --frozen --features c-api
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/lib" target/release/libtlottie.so
  install -vDm644 -t "$pkgdir/usr/include" include/tlottie.h
}
