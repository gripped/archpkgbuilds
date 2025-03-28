# Maintainer: David Runge <dvzrv@archlinux.org>

_name=redis
_upstream=phpredis
pkgbase=php-redis
pkgname=(
  php-redis
  php-legacy-redis
)
pkgver=6.2.0
pkgrel=1
pkgdesc="An API for communicating with the Redis key-value store"
arch=(x86_64)
url="https://github.com/phpredis/phpredis/"
license=(PHP-3.01)
depends=(glibc)
makedepends=(
  liblzf
  zstd
  php-igbinary
  php-legacy-igbinary
)
checkdepends=(
  lsof
  redis
)
optdepends=('redis: use a local redis instance')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('11e0799aaa125b61bcb45dd105990bd0a41ba10bc6e129eaf59a9bc6862eab1f823a263a8dd2a69c6eca9e53d3bcf70df7f8e77d8e68fc84c7adae26a8d94882')
b2sums=('399e635a5af417ad559d5821cadaa04fc3996f1202d4a1b4af403878cd0638603fd561499da3fae21cd2e836106732756ed84f90be0c8abcb68e63ef669f76a9')

prepare() {
  mv -v $_upstream-$pkgver $pkgbase-$pkgver
  # tempfile is non-standard, Debian only
  sed -e 's/tempfile/mktemp/g' -i  $pkgname-$pkgver/tests/mkring.sh
  # the kill after shutdown of redis makes it exit with status code 1
  sed -e '/kill -9/d' -i $pkgname-$pkgver/tests/mkring.sh
  # disable the extension by default
  echo -e "; this extension requires igbinary to be activated as well\n;extension=${_name}" > "$pkgname-$pkgver/${_name}.ini"

  cp -av $pkgbase-$pkgver "${pkgname[1]}-$pkgver"

  (
    cd $pkgbase-$pkgver
    phpize
  )
  (
    cd "${pkgname[1]}-$pkgver"
    phpize-legacy
  )
}

build() {
  local configure_options=(
    --prefix=/usr
    --enable-redis-igbinary
    --enable-redis-zstd
    --enable-redis-lzf
    --with-liblzf=/usr/lib/
    --with-libzstd=/usr/lib/
  )

  (
    cd $pkgname-$pkgver
    ./configure "${configure_options[@]}"
    make
  )
  (
    cd "${pkgname[1]}-$pkgver"
    ./configure "${configure_options[@]}"
    make
  )
}

check() {
  # tests are partly broken:
  # https://github.com/phpredis/phpredis/issues/1593
  (
    export TEST_PHP_EXECUTABLE=/usr/bin/php
    export TEST_PHP_ARGS="-d extension=igbinary -d extension=$srcdir/$pkgbase-$pkgver/modules/redis.so"
    cd "$pkgname-$pkgver"
    tests/mkring.sh start
    $TEST_PHP_EXECUTABLE $TEST_PHP_ARGS tests/TestRedis.php --class Redis
    $TEST_PHP_EXECUTABLE $TEST_PHP_ARGS tests/TestRedis.php --class RedisArray
    tests/mkring.sh stop
  )
  (
    export TEST_PHP_EXECUTABLE=/usr/bin/php-legacy
    export TEST_PHP_ARGS="-d extension=igbinary -d extension=$srcdir/${pkgname[1]}-$pkgver/modules/redis.so"
    cd "${pkgname[1]}-$pkgver"
    tests/mkring.sh start
    $TEST_PHP_EXECUTABLE $TEST_PHP_ARGS tests/TestRedis.php --class Redis
    $TEST_PHP_EXECUTABLE $TEST_PHP_ARGS tests/TestRedis.php --class RedisArray
    tests/mkring.sh stop
  )
}

package_php-redis() {
  depends+=(liblzf.so libzstd.so php-igbinary)
  backup=(etc/php/conf.d/$_name.ini)

  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 $_name.ini -t "$pkgdir/etc/php/conf.d/"
  install -vDm 644 {{CHANGELOG,README,arrays,cluster}.md,CREDITS} -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_php-legacy-redis() {
  depends+=(liblzf.so libzstd.so php-legacy-igbinary)
  backup=(etc/php-legacy/conf.d/$_name.ini)

  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 $_name.ini -t "$pkgdir/etc/php-legacy/conf.d/"
  install -vDm 644 {{CHANGELOG,README,arrays,cluster}.md,CREDITS} -t "$pkgdir/usr/share/doc/$pkgname/"
}
