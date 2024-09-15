# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=arch-rebuild-order
pkgver=0.4.4
pkgrel=1
pkgdesc='CLI tool to determine the rebuild order of provided package(s)'
url='https://gitlab.archlinux.org/archlinux/arch-rebuild-order'
arch=('x86_64')
license=('MIT')
depends=('glibc' 'libalpm.so')
makedepends=('cargo' 'mandown' 'git')
groups=('archlinux-tools')
source=(git+https://gitlab.archlinux.org/archlinux/arch-rebuild-order.git#tag=v$pkgver?signed)
sha512sums=('58bd2ad703c3a68b65bc9f6626a4f432c9be8166fb78fbc23d4ee07a4f10b83ecaa9be7445afe2f4869f3022d67987fefad863fd82a96eb0f81844c8ebcfe309')
validpgpkeys=("E499C79F53C96A54E572FEE1C06086337C50773E")

prepare() {
  cd ${pkgname}
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname}
  cargo build --frozen --release --all-features
}

check() {
  cd ${pkgname}
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}
  make install DESTDIR="$pkgdir" PREFIX=/usr

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
