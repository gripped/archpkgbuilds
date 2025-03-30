# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: jason ryan <jasonwryan@gmail.com>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgbase=profanity
pkgname=('profanity' 'profanity-gtk')
pkgver=0.15.0
pkgrel=1
epoch=1
pkgdesc='Console based XMPP client'
url='http://www.profanity.im'
arch=('x86_64')
license=('GPL3')
_clidepends=(
  'libcurl.so' 'libncursesw.so' 'expat' 'glib2' 'libotr'
  'libnotify.so' 'libgpgme.so' 'python' 'libgcrypt' 'libsignal-protocol-c'
  'glibc' 'libreadline.so' 'libassuan' 'libgpg-error' 'libstrophe.so'
  )
_gtkdepends=(
  'libgtk-3.so' 'libxss' 'libx11' 'gdk-pixbuf2' 'cairo'
  )
makedepends=(
  ${_clidepends[@]} ${_gtkdepends[@]} 'autoconf-archive'
  )
checkdepends=('cmocka')
source=(https://github.com/profanity-im/profanity/archive/${pkgver}/${pkgbase}-${pkgver}.tar.gz)
sha256sums=('a18aed3ce35e2581e120551991be11b853c42b0f748b9bff7f8e0304abb0fdcc')
sha512sums=('ad197a90d3a729c05167559b9c202886983c5fac56f6986cbd78a89e7457dbbe784a8252ce08fb947262c013371e562d81a5a4e2d94354c6ed04be053d187fe2')
b2sums=('c9a649fc316ae647fa4939f261931d43c328c355523f3a18e8559947ef7b69a671098415e3553039d43e9022f2045d754ccffcd043e120292d8d62f27ec5c552')

prepare() {
  cd ${pkgname}-${pkgver}

  mkdir -p m4
  autoreconf -fiv
  cp -a "${srcdir}"/${pkgname}-${pkgver}{,-gtk}
}

build() {
  echo "Building non-gtk variant..."
  (cd ${pkgname}-${pkgver}
    ./configure \
      --prefix=/usr \
      --disable-icons-and-clipboard \
      --without-xscreensaver \
      --enable-notifications \
      --enable-python-plugins \
      --enable-c-plugins \
      --enable-plugins \
      --enable-otr \
      --enable-omemo \
      --enable-pgp
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
  )
  echo "Building gtk variant..."
  (cd ${pkgname}-${pkgver}-gtk
    ./configure \
      --prefix=/usr \
      --enable-icons-and-clipboard \
      --with-xscreensaver \
      --enable-notifications \
      --enable-python-plugins \
      --enable-c-plugins \
      --enable-plugins \
      --enable-otr \
      --enable-omemo \
      --enable-pgp
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
  )
}

package_profanity() {
  depends=(
    ${_clidepends[@]}
  )
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

package_profanity-gtk() {
  pkgdesc+=' (gtk support)'
  depends=(
    ${_clidepends[@]} ${_gtkdepends[@]}
  )
  provides=('profanity')
  conflicts=('profanity')
  cd ${pkgbase}-${pkgver}-gtk
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
