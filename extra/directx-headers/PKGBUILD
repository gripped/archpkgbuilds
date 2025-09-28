# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@archlinux.org>
# Contributor: Cyano Hao <c@cyano.cn>

pkgname=directx-headers
pkgver=1.618.1
pkgrel=1
pkgdesc="DirectX headers for using D3D12"
url="https://github.com/microsoft/DirectX-Headers"
arch=(x86_64)
license=(MIT)
depends=()
makedepends=(
  git
  meson
)
options=(!lto)
source=("directx-headers::git+$url#tag=v$pkgver")
b2sums=('6ee20e1daa323d3f1169b128f5ff83353618eaf16d5db99fc4c2c39a921627d16b107837d3bc0b79c235dd7ace27e0eb6d1004808ceef4c0132f2a53858801db')

build() {
  local meson_options=(
    -D build-test=false
  )

  arch-meson directx-headers build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 directx-headers/LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
