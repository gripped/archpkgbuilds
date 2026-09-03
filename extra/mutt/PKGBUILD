# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias [tobias [at] archlinux.org]

pkgname=mutt
pkgver=2.4.2
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
sha512sums=('c01a80430a97cde6ff0fa5680fdddb8ee1563b95b6c26812d002653efb0eb4f7d794da9bf246bb443c8882d3b8189fd8cd75461da6199387eccba2debb2a391b')
b2sums=('22b083a899d0cc3ede6e061cc3dd0a21ddf581e061d840086be5ce1480f593c5453027f17ab885fa59fbf347b49d7eee4fae4c677be7e4adabd6d730617721d6')
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
