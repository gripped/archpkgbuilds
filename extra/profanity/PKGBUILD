# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: jason ryan <jasonwryan@gmail.com>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgbase=profanity
pkgname=('profanity' 'profanity-gtk')
pkgver=0.15.1
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
sha256sums=('8cb5104fad69094a3d2991879089b9d30a5650f92e6ba2b19033ee29e9a639b1')
sha512sums=('176d1cf0041bbd779a712afc96d66ba7f8511d1477f32465bb50cbca9db4d5c9af7f7cb5e871b84aaede8cd29b30e5b2729eb14e1409def60cb69627d5ce109a')
b2sums=('a88845d55b0a12d2c37e33fad017d70f0cb10a772945d08aecdf9325ee6bd38848c4440f9143eb92d00eaccaa374d2e4c46886d04934e0997138f98de39aca6d')

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
