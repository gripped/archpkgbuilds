# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias [tobias [at] archlinux.org]

pkgname=mutt
pkgver=2.3.2
pkgrel=1
pkgdesc="Small but very powerful text-based mail client"
arch=(x86_64)
url="http://www.mutt.org/"
license=(GPL-2.0-or-later)
depends=(
  glibc
  libgpg-error
  mime-types
  sqlite
  zlib
)
makedepends=(
  docbook-xml
  docbook-xsl
  elinks
  gdbm
  git
  gpgme
  krb5
  libidn2
  libsasl
  libxslt
  lynx
  ncurses
  openssl
)
optdepends=(
  'perl: for smime_keys'
  'python: for experimental mutt_oath2.py'
  'smtp-forwarder: to send mail'
)
backup=(etc/$pkgname/Muttrc)
source=("git+https://gitlab.com/muttmua/mutt.git#tag=mutt-${pkgver//./-}-rel?signed")
sha512sums=('058c13c7f39f7cb74fc2352ba5b058c8d4ce890c2064c82a6df6913b81a68a1bcb43ceb1e3f4bfebe6119739c2e38ac4a141f51cb6d5ab0d1453132c0c75d813')
b2sums=('d984ecd17c7a2ff46efd06a4af390ed322c2ee2870db8bd93f0bc3389508abe9017fa521ff604b0b92e1d0713566d0637797d4115dc81e86a01502f2d62e9365')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA') # Kevin J. McCarthy <kevin@8t8.us>

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc/$pkgname
    --enable-autocrypt
    --enable-compressed
    --enable-debug
    --enable-gpgme
    --enable-hcache
    --enable-imap
    --enable-pop
    --enable-sidebar
    --enable-smtp
    --with-curses=/usr
    --with-gdbm
    --with-gss=/usr
    --with-idn2
    --with-sasl
    --with-sqlite3
    --with-ssl=/usr
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  make
}

package() {
  depends+=(
    gdbm libgdbm.so
    gpgme libgpgme.so
    krb5 libgssapi_krb5.so
    libidn2 libidn2.so
    libsasl libsasl2.so
    ncurses libncursesw.so
    openssl libssl.so
  )

  make DESTDIR="$pkgdir" install -C $pkgname
  # we backup /etc/mutt/Muttrc and don't need another copy
  rm -v "$pkgdir/etc/$pkgname/Muttrc.dist"
  # a more comprehensive list of mime types is provided by mailcap in /etc/mime.types
  rm -v "$pkgdir/etc/$pkgname/mime.types"{,.dist}
  ln -sv ../mime.types "$pkgdir/etc/$pkgname/mime.types"
}
