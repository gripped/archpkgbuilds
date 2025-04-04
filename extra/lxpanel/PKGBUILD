# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=lxpanel
pkgver=0.11.0
pkgrel=1
pkgdesc='Lightweight X11 desktop panel for LXDE'
arch=('x86_64')
license=('GPL2')
url='https://lxde.org/'
groups=('lxde')
depends=('alsa-lib' 'curl' 'menu-cache' 'lxmenu-data' 'libwnck' 'libfm-gtk2' 'libkeybinder2')
makedepends=('git' 'intltool' 'docbook-xml' 'docbook-xsl' 'wireless_tools')
optdepends=('wireless_tools: netstat plugin')
source=(git+https://github.com/lxde/lxpanel.git#tag=${pkgver})
sha256sums=('a92ea26e08083e1db249db60595ab36b80d79962741028a299300a9c72d73139')

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --sysconfdir=/etc \
    --prefix=/usr

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
