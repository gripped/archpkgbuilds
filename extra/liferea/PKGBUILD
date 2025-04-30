# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=liferea
pkgver=1.14.6
pkgrel=2
pkgdesc="A desktop news aggregator for online news feeds and weblogs"
arch=('x86_64')
url="https://lzone.de/liferea"
license=('GPL-2.0-or-later')
depends=('webkit2gtk' 'libpeas' 'python-gobject')
makedepends=('intltool' 'gobject-introspection')
optdepends=('libsecret: for keyring plugin support'
            'python-cairo: for the tray icon plugin'
            'gst-plugins-base: for media player plugin support'
            'gst-plugins-good: for media player plugin support'
            'gst-plugins-bad: for media player plugin support')
options=('!emptydirs')
source=("https://github.com/lwindolf/liferea/releases/download/v$pkgver/$pkgname-${pkgver}.tar.bz2"
        '0001-src-node_type.h-add-include-libxml-tree.h-for-xmlNod.patch')
sha256sums=('36f28e51d26eebcbd3460c53eb5cb012855a5fc6cce6bca58103dfc06353cc72'
            '87b0a60654465b26e2994a18390005c27da05c6c75791d7d1dc185a8e14b5b1a')

prepare() {
  cd ${pkgname}-${pkgver}

  # Fix build with libxml2 2.14
  patch -Np1 -i ../0001-src-node_type.h-add-include-libxml-tree.h-for-xmlNod.patch
}

build() {
  cd ${pkgname}-${pkgver}

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-schemas-compile
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
