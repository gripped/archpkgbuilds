# Maintainer:

pkgdesc='Client-side decorations library for Wayland clients'
pkgname=lib32-libdecor
pkgver=0.2.2
pkgrel=1
url="https://gitlab.gnome.org/jadahl/libdecor"
license=(MIT)
arch=(x86_64)
depends=(libdecor lib32-wayland lib32-pango lib32-dbus lib32-gtk3)
makedepends=(cmake ninja meson wayland-protocols)
source=("https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/${pkgver}/libdecor-${pkgver}.tar.gz")
sha512sums=('ddaaa75f1dc983e6d59e168896f8044cf6ac761675db6af410c6d2186bdc66942c98f36eb7a6e2836ce02dbb98189a80db30b7cef3dbaf49c7aae47c3eee22cc')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  meson -Ddemo=false build libdecor-$pkgver \
    --prefix=/usr --libdir=/usr/lib32
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -fr "$pkgdir"/usr/include
  install -Dm644 libdecor-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
