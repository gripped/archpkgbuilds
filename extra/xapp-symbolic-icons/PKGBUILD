# Maintainer:

pkgname=xapp-symbolic-icons
pkgver=1.0.6
pkgrel=1
pkgdesc="A set of symbolic icons for Gtk applications and projects"
arch=(any)
url="https://github.com/xapp-project/xapp-symbolic-icons"
license=(LGPL-3.0-only
         GPL-3.0-only)
depends=()
makedepends=(git
             meson)
source=(git+https://github.com/xapp-project/xapp-symbolic-icons#tag=$pkgver)
sha256sums=('8c1eec8216f9de641de52499940635a8b7fa136410098f83e2d0f1a6b8a96257')

build() {
  meson setup $pkgname build \
    --prefix=/usr
  meson compile -C build
}

package(){
  meson install -C build --destdir="$pkgdir"
}
