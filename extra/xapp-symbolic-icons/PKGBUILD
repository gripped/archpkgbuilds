# Maintainer:

pkgname=xapp-symbolic-icons
pkgver=1.0.7
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
sha256sums=('a0cd8e79c361b320d97ceaa283e46a58824cfebad54a067a3a72237b7a11d537')

build() {
  meson setup $pkgname build \
    --prefix=/usr
  meson compile -C build
}

package(){
  meson install -C build --destdir="$pkgdir"
}
