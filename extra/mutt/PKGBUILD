# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias [tobias [at] archlinux.org]

pkgname=mutt
pkgver=2.4
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
sha512sums=('fffa71aa8c1bcc7e00258062eed73f8b5c781c51cb55cd7f49381794b3122b374aef051b0a3eda313ae822cecc27fab75639bddad44789df302a32bafd45400f')
b2sums=('3d7a33e0c9c21f37b67322b095c682dd91c29ea922a66cec037d39f5906a7adc0b72763446b8c5cdcaaa51d2e4782c4431343e9fb53ce5b4319dc7e928d27301')
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
