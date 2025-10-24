# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-gtk
pkgver=5.1.4
pkgrel=2
pkgdesc="Fcitx5 gtk im module and glib based dbus client library"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-gtk"
license=('GPL')
groups=('fcitx5-im')
depends=('glib2')
makedepends=('git' 'extra-cmake-modules' 'glib2-devel' 'gobject-introspection' 'gtk3' 'gtk4' 'ninja' 'vulkan-headers')
source=("git+https://github.com/fcitx/fcitx5-gtk.git#tag=$pkgver?signed")
sha512sums=('df69f1c9cd9b466191358e7ff34335e5cb1437a36883b1803b7a40be90eaba5efa4d6e197cfe3545f61f236ec834e88ba8c8203867b571f105b0b8fa0f6c6244')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build(){
  cd $pkgname
  cmake -GNinja . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_GTK2_IM_MODULE=OFF
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
