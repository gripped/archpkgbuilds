# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Paul <pb.orzel@proton.me>
pkgname=amdgpu_top
pkgver=0.11.3
pkgrel=1
pkgdesc="Tool that shows AMD GPU utilization"
arch=('x86_64')
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=("MIT")
depends=("glibc" "libgcc" "libdrm")
makedepends=("rust")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Umio-Yasuno/amdgpu_top/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8fc21b08949d871ae07daa96d79c31ea46b419a7bfd7fa12e06534f299294c0a')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export CARGO_TARGET_DIR=target
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 target/release/amdgpu_top "$pkgdir/usr/bin/amdgpu_top"
	install -Dm644 assets/amdgpu_top.desktop "$pkgdir/usr/share/applications/amdgpu_top.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
