# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=msmtp
pkgname=('msmtp' 'msmtp-mta')
pkgver=1.8.32
pkgrel=1
pkgdesc="A mini SMTP client"
arch=('x86_64')
url="https://marlam.de/msmtp/"
license=('GPL-3.0-or-later')
makedepends=('git' 'libsecret' 'gsasl' 'texlive-plaingeneric')
optdepends=('libnotify: for msmtpq notifications'
            'netcat: for included msmtpq script')
source=("git+https://github.com/marlam/msmtp.git?signed#tag=${pkgname}-${pkgver}")
sha512sums=('06cc1fbe8da5bb0b7caa0878cea7fa0da9d7fd2f90417863e3c945a4c48790784ec0aaa3eeea78bd647979db57ad23f2609945cbe6193ff85792ed386383f4b1')
validpgpkeys=('2F61B4828BBA779AECB3F32703A2A4AB1E32FD34')  # Martin Lambers

prepare() {
  cd $pkgbase
  autoreconf -vfi
}

build() {
  cd $pkgbase
  ./configure --prefix=/usr --sysconfdir=/etc --with-libgsasl
  make
  make -C doc html pdf
}

package_msmtp() {
  pkgdesc="A mini smtp client"
  depends=('libsecret' 'gsasl')

  cd $pkgbase
  make DESTDIR="$pkgdir" install 
  make DESTDIR="$pkgdir" -C doc install-html install-pdf

  # Installing example configs and scripts to /usr/share/doc/msmtp
  # as they are not installed by default (Debian and Gentoo do it this way)
  install -d "$pkgdir"/usr/share/doc/msmtp
  cp -r scripts/{find_alias,msmtpqueue,msmtpq,set_sendmail} "$pkgdir"/usr/share/doc/msmtp/
  install -D -m644 doc/*.example "$pkgdir"/usr/share/doc/msmtp/

  install -D -m644 scripts/vim/syntax/msmtp.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/msmtp.vim

  chmod 755 "$pkgdir"/usr/share/doc/msmtp/{find_alias,msmtpqueue,set_sendmail}/*.sh
  chmod 755 "$pkgdir"/usr/share/doc/msmtp/msmtpq/msmtp*
}

package_msmtp-mta() {
  pkgdesc="A mini SMTP client - the regular MTA"
  depends=('msmtp')
  provides=('smtp-forwarder')
  conflicts=('smtp-forwarder')

  install -d "$pkgdir"/usr/bin
  ln -s msmtp "$pkgdir"/usr/bin/sendmail
}
