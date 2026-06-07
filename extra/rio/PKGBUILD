# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Raphael Amorim <rapha850@gmail.com>

pkgname=rio
pkgver=0.4.6
pkgrel=1
pkgdesc="A hardware-accelerated GPU terminal emulator powered by WebGPU"
arch=('x86_64')
url="https://github.com/raphamorim/rio"
license=('MIT')
# https://raphamorim.io/rio/install/#arch-linux
options=('!lto')
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libstdc++'
  'oniguruma'
  'vulkan-driver'
)
makedepends=(
  'cargo'
  'cmake'
  'libxcb'
  'libxkbcommon'
  'python'
  'glslang'
  'scdoc'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('298a802234e800a3d8a08fe38b57f90167b813a201f3d58367b15e0401c5c69c8db0d55bbfa659b1f5b48c0c81d0dd2d21f161a6c1e5f20bbf3881ab2bd55b20')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${pkgname}-${pkgver}"
  RUSTONIG_DYNAMIC_LIBONIG=1 cargo build --frozen --release --all-features
  make -C extra/man
}

check() {
  cd "${pkgname}-${pkgver}"
  RUSTONIG_DYNAMIC_LIBONIG=1 cargo test --frozen --workspace
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
  install -vDm 644 "misc/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -vDm 644 "misc/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -vDm 644 "misc/com.rioterm.Rio.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -vDm 644 extra/man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 extra/man/*.5 -t "$pkgdir/usr/share/man/man5/"
}

# vim: ts=2 sw=2 et:
