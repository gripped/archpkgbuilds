# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=msmtp
pkgname=('msmtp' 'msmtp-mta')
pkgver=1.8.29
pkgrel=1
pkgdesc="A mini SMTP client"
arch=('x86_64')
url="https://marlam.de/msmtp/"
license=('GPL-3.0-or-later')
makedepends=('git' 'libsecret' 'gsasl' 'texlive-plaingeneric')
optdepends=('libnotify: for msmtpq notifications'
            'netcat: for included msmtpq script')
#source=("git+https://git.marlam.de/git/msmtp.git?signed#tag=${pkgname}-${pkgver}")
source=("git+https://github.com/marlam/msmtp.git?signed#tag=${pkgname}-${pkgver}")
sha512sums=('a2afbb2066d05efcff7987109adfd719078c52c2dcde18e9bdc119665d52b100a9df913b99eb9ebd8cca4b8896e75d366e404c4da24766bd5d503bcba729d79e')
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
