# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>

pkgname=('php-memcached' 'php-legacy-memcached')
pkgver=3.3.0
pkgrel=3
pkgdesc="PHP extension for interfacing with memcached via libmemcached library"
arch=('x86_64')
url="https://github.com/php-memcached-dev/php-memcached"
license=('PHP')
depends=('libmemcached' 'zstd')
makedepends=('php' 'php-legacy' 'git' 'php-igbinary' 'php-legacy-igbinary')
source=("git+https://github.com/php-memcached-dev/php-memcached.git#tag=v$pkgver")
sha256sums=('1a85bf72ca4a2dbe74e031ac5abd5ca2ad483d921f5feabf4991f9cb972f339d')

prepare() {
  cp -a $pkgbase{,-php-legacy}
}

build() {
  cd $pkgbase
  phpize
  ./configure --prefix=/usr --with-zstd --enable-memcached-igbinary
  make

  cd ../$pkgbase-php-legacy
  phpize-legacy
  ./configure --prefix=/usr --with-zstd --enable-memcached-igbinary
  make
}

package_php-memcached() {
  depends+=('php' 'php-igbinary')
  backup=('etc/php/conf.d/memcached.ini')

  cd $pkgbase

  make INSTALL_ROOT="$pkgdir" install
  install -d "$pkgdir/etc/php/conf.d"
  echo -e '; this extension requires igbinary to be activated as well\n;extension=memcached.so' >"$pkgdir/etc/php/conf.d/memcached.ini"
}

package_php-legacy-memcached() {
  pkgdesc=${pkgdesc/PHP/PHP Legacy}
  depends+=('php-legacy' 'php-legacy-igbinary')
  backup=('etc/php-legacy/conf.d/memcached.ini')

  cd $pkgbase-php-legacy

  make INSTALL_ROOT="$pkgdir" install
  install -d "$pkgdir/etc/php-legacy/conf.d"
  echo -e '; this extension requires igbinary to be activated as well\n;extension=memcached.so' >"$pkgdir/etc/php-legacy/conf.d/memcached.ini"
}

# vim:set ts=2 sw=2 et:
