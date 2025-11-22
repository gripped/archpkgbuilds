# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias [tobias [at] archlinux.org]

pkgname=mutt
pkgver=2.2.16
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
sha512sums=('9453573be9629fbd0025857f27c549200fc6cc9b368429971f1d1f71482a40e3799b59efea523f486fa86e106c0eca52b569d0771756bb13f3f2cb6c8ed79e43')
b2sums=('bffabe13a02386c8cb1eb01304515bc59f4754dd14374987e7ef4f3619d57e530eb43159d3b0f3b0b26664bc4c6ebe9f33ff5b3598d1b57ebd823287db17d37f')
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
