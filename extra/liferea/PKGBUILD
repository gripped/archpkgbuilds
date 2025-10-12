# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=liferea
pkgver=1.16.5
pkgrel=1
pkgdesc="A desktop news aggregator for online news feeds and weblogs"
arch=('x86_64')
url="https://lzone.de/liferea"
license=('GPL-2.0-or-later')
depends=('webkit2gtk-4.1' 'libpeas-2' 'python-gobject' 'gtk3' 'glib2' 'pango'
         'libxml2' 'libxslt' 'sqlite' 'libsoup3' 'json-glib' 'python-requests'
         'gsettings-desktop-schemas' 'fribidi' 'glibc' 'gdk-pixbuf2' 'cairo'
         'bash' 'hicolor-icon-theme' 'dconf' 'zlib' 'python' 'at-spi2-core'
         'gcc-libs' 'python-cairo' 'harfbuzz' 'libnotify')
makedepends=('intltool' 'gobject-introspection')
optdepends=('libsecret: for keyring plugin support'
            'gst-plugins-base: for media player plugin support'
            'gst-plugins-good: for media player plugin support'
            'gst-plugins-bad: for media player plugin support'
            'gst-libav: for media player plugin support')
source=("https://github.com/lwindolf/liferea/releases/download/v$pkgver/$pkgname-${pkgver}.tar.bz2"
        '0001-Backport-fixes-from-1459.patch')
sha256sums=('b07e10da62f42f18d1539e204037d32cb63b433bc68a2f8836c25bbd1098e0a5'
            'ab5058fd81ba2c8f234b6155d4219f8200772412249c2cb71826c25e9a403ef3')

prepare() {
  cd ${pkgname}-${pkgver}

  # GI fix
  patch -Np1 -i ../0001-Backport-fixes-from-1459.patch
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
